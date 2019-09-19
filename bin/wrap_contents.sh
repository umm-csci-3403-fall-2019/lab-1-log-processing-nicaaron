#!/usr/bin/env bash
# taken from pre-lab-1. Make a html files by taking a header and footer and putting contents between them

contents=$1
headFoot=$2
tgt=$3

cat "${headFoot}_header.html" "${contents}" "${headFoot}_footer.html" > "${tgt}"
