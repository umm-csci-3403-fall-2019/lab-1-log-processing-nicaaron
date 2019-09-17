#!/usr/bin/env bash

work_dir=$(pwd)

dir=$1

cd "$dir"

cat ./*_dist.html > failed_login_summary.txt

cd "$work_dir"

./bin/wrap_contents.sh "$dir"/failed_login_summary.txt html_components/summary_plots "$dir"/failed_login_summary.html
