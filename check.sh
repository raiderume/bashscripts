#!/bin/bash

workdir=/home/anton/nginxtestscript

cd $workdir
dirs=($(sudo find . -type d -name "ep-user*" | tr -s './\n  ' ' '))
#echo ${dirs[@]}

for user in ${dirs[@]}
do
	if [ -d $workdir/$user/nginx/conf ]
	then
		sudo find $workdir/$user/nginx/conf -type f -name "*.conf*" -exec cp -r -a --parents {} $workdir/olduserconfs/ \;
	fi
done
