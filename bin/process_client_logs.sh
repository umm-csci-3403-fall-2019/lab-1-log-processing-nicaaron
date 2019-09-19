#!/usr/bin/env bash

#Establish input directory, which contains the log files
logDir=$1

#Enter input directory
cd "$logDir" || exit

#Create failed login data file by searching through the secure files for regex matches
cat var/log/secure* | sed -E -n 's/(^[a-zA-Z]*)[ ]*([0-9]*) ([0-9]*):[0-9]*:[0-9a-zA-Z _-]*sshd[^:]*: Failed password for (invalid user )?([A-Za-z0-9 _-]*) from ([0-9.]*) port [0-9]* ssh2/\1 \2 \3 \5 \6 /p' > failed_login_data.txt



