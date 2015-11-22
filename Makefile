# The directory that will hold the slack-irc data directory
SLACK_IRC_DATA_DIR = /var/slack-irc

##############################################################################

SHELL = /bin/bash
CURRENT_DATE = $(shell date +"%Y-%m-%d")
USER_ID = $(shell id -u)
GROUP_ID = $(shell id -g)

build: build-slack-irc-image

start: start-slack-irc-image

build-%-image: %-image
	docker build --rm -t kennydo/$(<:-image=) ./$<

start-slack-irc-image:
	if [[ $$(docker ps -a | grep -E '\bslack-irc\s*$$' | wc -l) = "1" ]]; \
	then \
		echo "Starting existing slack-irc container"; \
		docker start slack-irc; \
	else \
		echo "Starting new slack-irc container"; \
		docker run -d -v $(SLACK_IRC_DATA_DIR):/slack-irc --name slack-irc kennydo/slack-irc; \
	fi

stop:
	docker stop slack-irc

shell:
	docker run --rm -i -t -v $(SLACK_IRC_DATA_DIR):/slack-irc  kennydo/slack-irc /bin/bash

