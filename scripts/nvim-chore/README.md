# nvim-chore

`nvim-chore` is a small Go helper for maintaining this repo.

It automatically stages, commits, and (optionally) pushes only the `.config/nvim` changes with a conventional `chore(nvim)` commit message.

This is a **maintainer utility**. You don't need it just to use the dotfiles &mdash; only if you're contributing or maintaining them.

---

## Build

The repo root contains a `Makefile` for convenience.

```bash
# From repo root
make nvim-chore
```

This will compile binary into `./bin/nvim-chore`.

---

## Usage

```bash
# Run after building
./bin/nvim-chore
```

**Examples:**

```bash
./bin/nvim/nvim-chore               # commit + push ./config/nvim changes
./bin/nvim-chore "bump plugins"     # commit with extra message
./bin/nvim-chore -dry-run           # preview staged diff & commit message
./bin/nvim-chore -no-push           # commit only, skip pushing
./bin/nvim-chore -targets ".config/nvim/lazy-lock.json" # lockfile only
```

---

## Clean up

Remove the built binary:

```bash
make clean
```

---

## Notes

- This tool ensures the main `README.md` stays user-focused.
- It's just for workflow automation, not required by people cloning the dotfiles.
- Default remote is `origin`.
