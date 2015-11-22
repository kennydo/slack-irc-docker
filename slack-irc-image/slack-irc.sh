#!/bin/sh
exec /sbin/setuser slackirc /usr/bin/slack-irc --config /slack-irc/config.json 2>&1
