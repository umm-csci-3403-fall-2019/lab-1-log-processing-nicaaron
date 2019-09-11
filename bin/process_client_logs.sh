#!/usr/bin/env bash

logDir=$1

#start_directory=$(pwd)

#cd $logDir || exit
cd $logDir

#tar xf *.tgz

cat var/log/secure* | sed -E -n 's/([a-zA-Z]+)(\s)(\d+)(\s)([0-9][0-9]):[0-9][0-9]:[0-9][0-9] computer_name sshd\[[0-9]{5}\]: Failed password for (invalid user )?([a-zA-Z0-9 _-]*) from ([0-9.]*) port [0-9]* ssh2/\1 \3 \5 \7 \8/p' > failed_login_data.txt
