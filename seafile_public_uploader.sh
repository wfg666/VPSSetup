#!/bin/bash

# upload file to a public seafile repo


# Parse parameters
if [ $# -lt 3 ] ; then 
	echo "USAGE: $0 repo_id token file [filename]" 
	echo " e.g.: $0 12345678-1234-1234-1234-123456789abc 12345678901234567890 ./foo.bar" 
	echo "     : $0 12345678-1234-1234-1234-123456789abc 12345678901234567890 ./foo.bar another.name" 
	exit 1; 
fi 
repo_id=$1
token=$2
file=$3
if [ $# -gt 3 ] ; then 
	filename=$4
else
	filename=${file##*/}
fi
echo "repo_id  = $repo_id"
echo "token    = $token"
echo "file     = $file"
echo "filename = $filename"


# Request upload link
echo "Requesting upload link ..."
upload_link=`curl 'https://cloud.tsinghua.edu.cn/ajax/u/d/'$token'/upload/?r='$repo_id -H 'X-Requested-With: XMLHttpRequest'`
echo Get $upload_link
upload_link=${upload_link%\"*}
upload_link=${upload_link##*\"}
if [[ ! $upload_link =~ http ]] ; then
	echo -e "\033[31mBad response. \033[0m"
	exit 2;
fi


# Upload
echo "Uploading ..."
#echo curl $upload_link -F file=@"$filename" -F filename=$filename -F parent_dir="/"
result=`curl $upload_link -F file=@$file -F filename=$filename -F parent_dir="/"`
echo $result
if [[ $result =~ name ]] && [[ $result =~ id ]] && [[ $result =~ size ]] ; then
	echo -e "\033[32mFinished. \033[0m"
	exit 0;
else
	echo -e "\033[31mUpload failed. \033[0m"
	exit 3;
fi
