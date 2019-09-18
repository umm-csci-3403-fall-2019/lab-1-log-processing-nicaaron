#!/usr/bin/env bash

#Establish our working directory
work_dir=$(pwd)

#Establish the directory with the failed login data
hoursDir=$1

#Enter our directory
cd "$hoursDir" || exit

#Get hours data and put it into hours_dist.txt
cat */failed_login_data.txt | sed -E -n 's/[a-zA-Z]* [0-9]* ([0-9]*) [a-zA-Z0-9_-]* [0-9.]*/\1/p' | sort | uniq -c | sed -E -n "s/[ ]*([0-9]*) ([0-9]*)/data.addRow(['\2', \1]);/p" > hours_dist.txt

#Enter working directory
cd "$work_dir" || exit

#Wrap contents
./bin/wrap_contents.sh "$hoursDir"/hours_dist.txt html_components/hours_dist "$hoursDir"/hours_dist.html
