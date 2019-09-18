#!/usr/bin/env bash

work_dir=$(pwd)

mkdir /tmp/scratch

for i in "$@"
do
	computerName=$(basename "$i" .tgz)
	mkdir -p /tmp/scratch/"$computerName"
	tar -zxf "$i" --directory /tmp/scratch/"$computerName"
	./bin/process_client_logs.sh /tmp/scratch/"$computerName"
done
./bin/create_username_dist.sh /tmp/scratch/
./bin/create_hours_dist.sh /tmp/scratch/
./bin/create_country_dist.sh /tmp/scratch/
./bin/assemble_report.sh /tmp/scratch/

mv /tmp/scratch/failed_login_summary.html "$work_dir"

rm -rf /tmp/scratch
