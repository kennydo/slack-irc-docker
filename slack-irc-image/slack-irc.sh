#!/bin/sh
exec /sbin/setuser slackirc /usr/bin/node /home/slackirc/slack-irc/dist/index.js --config /slack-irc/config.json 2>&1
