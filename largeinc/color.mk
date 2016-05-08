COLOR_STATE ?= ON


COLOR_TERMINAL_NONE         = "\\033[0m"
COLOR_TERMINAL_BLACK        = "\\033[0;30m"
COLOR_TERMINAL_GRAY         = "\\033[1;30m"
COLOR_TERMINAL_RED          = "\\033[0;31m"
COLOR_TERMINAL_LIGHT_RED    = "\\033[1;31m"
COLOR_TERMINAL_GREEN        = "\\033[0;32m"
COLOR_TERMINAL_LIGHT_GREEN  = "\\033[1;32m"
COLOR_TERMINAL_YELLOW       = "\\033[0;33m"
COLOR_TERMINAL_LIGHT_YELLOW = "\\033[1;33m"
COLOR_TERMINAL_BLUE         = "\\033[0;34m"
COLOR_TERMINAL_LIGTH_BLUE   = "\\033[1;34m"
COLOR_TERMINAL_PURPLE       = "\\033[0;35m"
COLOR_TERMINAL_LIGHT_PURPLE = "\\033[1;35m"
COLOR_TERMINAL_CYAN         = "\\033[0;36m"
COLOR_TERMINAL_LIGHT_CYAN   = "\\033[1;36m"
COLOR_TERMINAL_WHITE        = "\\033[1;37m"
COLOR_TERMINAL_LIGHT_GRAY   = "\\033[0;37m"


color_text     = $(call COLOR_TEXT_$(COLOR_STATE),$(1),$(2))
color_text     = $(call COLOR_TEXT_$(COLOR_STATE),$(1),$(2))
COLOR_TEXT_ON  = $(COLOR_TERMINAL_$(strip $(1)))$(strip $(2))$(COLOR_TERMINAL_NONE)
COLOR_TEXT_OFF = $(2)

GREEN_OK         = $(call color_text, GREEN, OK)
RED_ERROR        = $(call color_text, RED, ERROR)
section_title    = $(call color_text, BLUE, $(1))
subsection_title = $(call color_text, CYAN, "  $(1)")


toInt           = $(shell echo "$(1)" | awk -F. '{print $$1+0}')
getPercentColor = $(call color_text, $(call GOOD_COLOR_TEST, $(call toInt,$(1))), $(call toInt, $(1)))

GOOD_COLOR_TEST  = $(shell if [ $(1) -ge 95 ]; then echo "GREEN"; else if [ $(1) -ge 75 ]; then echo "YELLOW"; else if [ $(1) -ge 50 ]; then echo "PURPLE"; else echo "RED"; fi fi fi)
GOOD_COLOR_TEST1 = if [ $(1) -ge 95 ]; then echo "GREEN"; else if [ $(1) -ge 75 ]; then echo "YELLOW"; else if [ $(1) -ge 50 ]; then echo "PURPLE"; else echo "RED"; fi fi fi

