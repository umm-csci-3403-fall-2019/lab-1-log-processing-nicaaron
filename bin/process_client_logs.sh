logDir=$1

#start_directory=$(pwd)

cd logDir

tar xf *.tgz
#cat



for file in $1
do
    sed -E -n 's/\* ([a-zA-Z]+)(\s)(\d+)(\s)([0-9][0-9]):[0-9][0-9]:[0-9][0-9] computer_name sshd\[[0-9]{5}\]: Failed password for (invalid user )?([a-zA-Z]+) from ([0-9]{1,3}[\.][0-9]{1,3}[\.][0-9]{1,3}[\.][0-9]{1,3})' < "$file"  > failed_login_data.txt
done

