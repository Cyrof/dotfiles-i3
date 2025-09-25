package main

import (
	"bytes"
	"flag"
	"fmt"
	"os"
	"os/exec"
	"slices"
	"strings"
	"time"
)

func run(cwd string, check bool, args ...string) (string, error) {
	cmd := exec.Command(args[0], args[1:]...)
	if cwd != "" {
		cmd.Dir = cwd
	}
	var out bytes.Buffer
	cmd.Stdout = &out
	cmd.Stderr = &out
	err := cmd.Run()
	if check && err != nil {
		return out.String(), fmt.Errorf("%v: %s", err, out.String())
	}
	return out.String(), err
}

func git(cwd string, check bool, args ...string) (string, error) {
	all := append([]string{"git"}, args...)
	return run(cwd, check, all...)
}

func insideGit() bool {
	_, err := git("", false, "rev-parse", "--is-inside-work-tree")
	return err == nil
}

func repoRoot() (string, error) {
	o, err := git("", true, "rev-parse", "--show-toplevel")
	return strings.TrimSpace(o), err
}

func remoteExists(name string) bool {
	o, _ := run("", false, "git", "remote")
	remotes := strings.Fields(o)
	return slices.Contains(remotes, name)
}

func hasChanges(paths []string) bool {
	diffArgs := append([]string{"diff", "--"}, paths...)
	o1, _ := run("", false, diffArgs...)

	cachedArgs := append([]string{"diff", "--cached", "--"}, paths...)
	o2, _ := run("", false, cachedArgs...)

	return strings.TrimSpace(o1) != "" || strings.TrimSpace(o2) != ""
}

func stagedAny(paths []string) bool {
	args := append([]string{"diff", "--cached", "--"}, paths...)
	o, _ := git("", false, args...)
	return strings.TrimSpace(o) != ""
}

func main() {
	var (
		scope   = flag.String("scope", envOr("SCOPE", "nvim"), "Commit scope")
		remote  = flag.String("remote", envOr("REMOTE", "origin"), "Git remote")
		noPush  = flag.Bool("no-push", false, "Skip pushing")
		dryRun  = flag.Bool("dry-run", false, "Preview without committing")
		targets = flag.String("targets", ".config/nvim", "Space-seperated paths to include")
	)
	flag.Parse()
	extra := strings.TrimSpace(strings.Join(flag.Args(), " "))

	root, err := repoRoot()
	must(err)
	err = os.Chdir(root)
	must(err)

	if !insideGit() {
		fmt.Fprintln(os.Stderr, "Not inside a git repository.")
		os.Exit(1)
	}

	if !remoteExists(*remote) {
		o, _ := git("", false, "remote")
		fmt.Fprintf(os.Stderr, "Remote '%s' not found. Available: %s\n", *remote, strings.TrimSpace(o))
		os.Exit(1)
	}

	paths := strings.Fields(*targets)
	if !hasChanges(paths) {
		fmt.Printf("No changes in %s. Nothing to commit.\n", strings.Join(paths, " "))
		return
	}

	fmt.Printf("Staging: %s\n", strings.Join(paths, " "))
	addArgs := append([]string{"add", "--"}, paths...)
	_, err = git(root, true, addArgs...)
	must(err)

	if !stagedAny(paths) {
		fmt.Println("Nothing new staged. Exiting.")
		return
	}

	dateUTC := time.Now().UTC().Format("2006-01-02")
	msg := fmt.Sprintf("chore(%s): update plugins %s", *scope, dateUTC)
	if extra != "" {
		msg += " - " + extra
	}

	branch, _ := git(root, false, "rev-parse", "--abbrev-ref", "HEAD")

	if *dryRun {
		diffArgs := append([]string{"diff", "--cached", "--"}, paths...)
		diff, _ := git(root, false, diffArgs...)
		fmt.Println("DRY RUN - staged diff:")
		fmt.Println(diff)
		fmt.Printf("Would commit: %s\n", msg)
		if !*noPush {
			fmt.Printf("Would push: git push -u %s %s\n", *remote, strings.TrimSpace(branch))
		}
		return
	}

	_, err = git(root, true, "commit", "-m", msg)
	must(err)

	if !*noPush {
		fmt.Printf("Pushing to %s/%s...\n", *remote, strings.TrimSpace(branch))
		_, err = git(root, true, "push", "-u", *remote, strings.TrimSpace(branch))
		must(err)
	}

	fmt.Println("Done.")
}

func envOr(k, def string) string {
	if v := os.Getenv(k); v != "" {
		return v
	}
	return def
}

func must(err error) {
	if err != nil {
		fmt.Fprintln(os.Stderr, "X", err)
		os.Exit(1)
	}
}
