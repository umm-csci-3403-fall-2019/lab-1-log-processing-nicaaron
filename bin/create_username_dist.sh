#!/usr/bin/env bash

#Establish working directory
work_dir=$(pwd)

#Establish input directory
userDir=$1

#Enter input directory
cd "$userDir" || exit

#Look through failed login data to create a username "spreadsheet"
cat */failed_login_data.txt | sed -E -n 's/[a-zA-Z]* [0-9]* [0-9]* ([a-zA-Z0-9_-]*) [0-9.]*/\1/p' | sort | uniq -c | sed -E -n "s/[ ]*([0-9]*) ([a-zA-Z0-9_-]*)/data.addRow(['\2', \1]);/p" > username_dist.txt

#Return to working directory
cd "$work_dir" || exit

#Wrap contents
./bin/wrap_contents.sh "$userDir"/username_dist.txt html_components/username_dist "$userDir"/username_dist.html
