export ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
export TARGET_DIR:=$(HOME)

ponga:
	$(MAKE) -C $@

tmux:
	$(MAKE) -C $@

.PHONY: ponga tmux
