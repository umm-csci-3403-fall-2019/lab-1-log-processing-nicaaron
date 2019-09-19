#!/usr/bin/env bash

#Establish working directory
work_dir=$(pwd)

#Establish input directory
dir=$1

#Enter input directory
cd "$dir" || exit

#Put other distribution files together and generate failed login summary
cat ./*_dist.html > failed_login_summary.txt

#Enter working directory
cd "$work_dir" || exit

#Wrap contents
./bin/wrap_contents.sh "$dir"/failed_login_summary.txt html_components/summary_plots "$dir"/failed_login_summary.html
