#!/usr/bin/env bash

work_dir=$(pwd)

countryDir=$1

cd $countryDir

cat */failed_login_data.txt | sed -E -n 's/[a-zA-Z]* [0-9]* [0-9]* [a-zA-Z0-9_-]* ([0-9.]*)/\1/p' | sort | uniq -c | sed -E -n "s/[ ]*([0-9]*) ([0-9]*)/data.addRow(['\2', \1]);/p" > country_dist.txt

cd $work_dir

./bin/wrap_contents.sh $countryDir/country_dist.txt html_components/country_dist $countryDir/country_dist.html
