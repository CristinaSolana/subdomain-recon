#!/bin/sh
#usage: ./subdomain-recon.sh somedomain.com path/to/output/dir

if test -z "$1" 
then
    echo "need a url..."
    exit 1
fi

echo "Creating program..."
mkdir $2 -p
cd $2
echo "Finding subdomains..."
subfinder -d $1 -nW > subfinder.txt
echo -n "Probing HTTP..."
cat subfinder.txt | httprobe > urls.txt

echo -n "Creating screenshots..."
mkdir screenshots
cd screenshots
gowitness file -s ../urls.txt

exit 0
