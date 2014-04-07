current_directory := $(shell pwd)
files := $(wildcard *.symlink)

update:
	git submodule init
	git submodule update

install: update
	for file in $(patsubst %.symlink,%,$(files)); do \
		ln -s $(current_directory)/$$file.symlink ~/.$$file; \
	done

uninstall:
	for file in $(patsubst %.symlink,%,$(files)); do \
		rm -ir ~/.$$file; \
	done