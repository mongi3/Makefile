
#
# Basic block for building.
# ?= define if not set on command line (ie make BUILD=release ...).
#ROOT    ?= $(shell dirname `pwd`)
BUILD   ?= debug

# Verify BUILD setting is valid
VALID_BUILDS := release debug
BAD_BUILD := $(strip $(filter-out ${VALID_BUILDS},${BUILD}))
ifneq "${BAD_BUILD}" ""
  $(error Unsupported BUILD setting [${BAD_BUILD}])
endif

# Setup overall build parameters
CFLAGS   += ${CFLAGS_${BUILD}} -Wall
CFLAGS_debug    = -g
CFLAGS_release  = -O3

# Location of intermediates (objects, deps, etc.)
BUILD_DIR = build/${BUILD}

# Location of final executable products
TARGET_DIR = ${BUILD}

#TODO: add in fancy color stuff "instead of raw make outputs"
#TODO: make verbosity settings?
# By default verbose is not defined and .SILENT is effective.
# If verbose defined to anything, then .SILENT goes away and all
# prints are observed.
${VERBOSE}.SILENT:

# Contains bulk of generic non-recursive make structure
include boiler.mk
.PHONEY: pre normal post myclean
pre: .Makefile.changedetect .depsexpand

normal: pre
	@$(MAKE) all --no-print-directory

post: normal

.depsexpand: test.tgz
	echo "shell commands to expand tgz's here"
#	mkdir -p tmp
#	tar -zxvf $^ -C tmp
#	sleep 5
	touch $@
myclean:
	rm -f .depsexpand
	rm -rf tmp

distclean: myclean

# Add target below to all to notify of makefile changes.
# This won't cover all cases, but should cover most for those
# who build default "all" target.
.Makefile.changedetect: Makefile $(shell find -name \*.mk)
#	@echo "checking for makefile changes: $^"
	@touch $@
	@echo -e $(call color_text, RED, "===================================")
	@echo -e $(call color_text, RED, " WARNING: MAKEFILE CHANGE DETECTED ")
	@echo -e $(call color_text, RED, "===================================")
	@echo -e $(call color_text, RED, "modified file(s): $?")
	@echo -e $(call color_text, RED, "...you should probably 'make clean'")
# add as "all" target
#all: .Makefile.changedetect

.DEFAULT_GOAL := post

