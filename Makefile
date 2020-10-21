# Default params
sleep ?= 600

test: # [sleep=<seconds|600>] Run continuous testing w/ output to results.txt
	@SLEEP=$(sleep) ./test.sh

install-speedtest: # Install speedtest.net official CLI (macOS) -> https://www.speedtest.net/apps/cli
	brew tap teamookla/speedtest
	brew update
	brew install speedtest --force

logs: # Tails speedtest logs
	tail -f results.txt

cleanup: # Rm results & create new file
	rm results.txt
	touch results.txt

print-downloads:
	cat results.txt | grep Download


# -----------------------------------------------------------
# CAUTION: If you have a file with the same name as make
# command, you need to add it to .PHONY below, otherwise it
# won't work. E.g. `make run` wouldn't work if you have
# `run` file in pwd.
.PHONY: help

# -----------------------------------------------------------
# -----       (Makefile helpers and decoration)      --------
# -----------------------------------------------------------

.DEFAULT_GOAL := help
# check https://stackoverflow.com/questions/4842424/list-of-ansi-color-escape-sequences
RESET = \033[0m
PRIMARY = \033[94;1m
DIM1 = \033[38;5;239;1m
DIM2 = \033[90;2m
TAB = 20 # Increase if you have long commands

help:
	@printf '$(DIM2)Available make commands:$(RESET)\n'
	@grep -E '^[a-zA-Z_-]+:.+#.+$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = "[: ]+#[ ]+"}; \
		{printf " $(DIM1)> make $(RESET)$(PRIMARY)%-$(TAB)s $(RESET)$(DIM2)# %s$(RESET)\n", \
			$$1, $$2}'
	@grep -E '^[a-zA-Z_-]+:$$' $(MAKEFILE_LIST) \
		| grep -v help \
		| awk 'BEGIN {FS = ":"}; \
		{printf " $(DIM1)> make $(RESET)$(PRIMARY)%-$(TAB)s$(RESET)\n", \
			$$1}'

