#	- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#	Default target and vars

default: build test

ifndef VERBOSE
.SILENT:
endif

BUILD_DIR_BASE := build
PROJECTS_ROOT := ./projects
PROJECTS := $(wildcard $(PROJECTS_ROOT)/*/)


#	- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#	Targets

build: $(PROJECTS)

$(PROJECTS):
	echo "Building project \"$@\""
	$(MAKE) -C "$@" BUILD_DIR_BASE="$(BUILD_DIR_BASE)"

test:
	echo "Running tests"
	BUILD_DIR_BASE="$(BUILD_DIR_BASE)" pytest "$(PROJECTS_ROOT)"


#	- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#	Phony targets specification

.PHONY: build test $(PROJECTS)
