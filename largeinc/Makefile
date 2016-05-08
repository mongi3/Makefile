
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

#TODO: how do different architectures fit into this?
#TODO: add in fancy color stuff "instead of raw make outputs"
#TODO: make verbosity settings?

# Contains bulk of generic non-recursive make structure
include boiler.mk


# Add target below to all to notify of makefile changes.
# This won't cover all cases, but should cover most for those
# who build default "all" target.
.Makefile.changedetect: Makefile $(shell find -name \*.mk)
#	@echo "checking for makefile changes: $^"
	@touch $@
	@echo $(call color_text, RED, "===================================")
	@echo $(call color_text, RED, " WARNING: MAKEFILE CHANGE DETECTED ")
	@echo $(call color_text, RED, "===================================")
	@echo $(call color_text, RED, "modified file(s): $?")
	@echo $(call color_text, RED, "...you should probably 'make clean'")
# add as "all" target
all: .Makefile.changedetect


