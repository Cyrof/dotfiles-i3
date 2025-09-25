all: nvim-chore

nvim-chore:
	cd scripts/nvim-chore && go build -o ../../bin/nvim-chore .

clean:
	rm -f bin/nvim-chore
