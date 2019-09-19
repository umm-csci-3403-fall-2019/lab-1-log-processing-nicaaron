#!/usr/bin/env bash

#Working directory
work_dir=$(pwd)

#First input directory
countryDir=$1

#Enter input directory
cd "$countryDir" || exit

#Match failed login data and sort it (took the IP address). Join piped data with country IP map. Pull country data from joined file, sorts it and finds unique entries. Adds data to country_dist.txt in a spreadsheet.
cat ./*/failed_login_data.txt \
	| sed -E -n 's/[A-Za-z]*[ ]*[0-9]* [0-9]* [A-Za-z0-9_-]* ([0-9.]*)/\1/p' \
        | sort \
	| join - "$work_dir"/etc/country_IP_map.txt \
	| sed -E -n 's/[0-9.]* ([A-Z]*)/\1/p' \
	| sort \
        | uniq -c \
        | sed -E -n "s/[ ]*([0-9]*) ([A-Z]*)/data.addRow(['\2', \1]);/p" \
        > country_dist.txt

#Enter working directory and wrap contents.
cd "$work_dir" || exit

./bin/wrap_contents.sh "$countryDir"/country_dist.txt html_components/country_dist "$countryDir"/country_dist.html

#Remove text file.
rm "$countryDir"/country_dist.txt
