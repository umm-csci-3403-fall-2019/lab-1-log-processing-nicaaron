logDir=$1

start_directory=$(pwd)

tar xf $start_directory/logDir/*.tar

sed -E -n 's/\* ([a-zA-Z]+)(\s)(\d+)(\s)(\d+) ([a-zA-Z]+)(\s)([0-9]{1,3}[\.]){3}[0-9]{1,3}'
