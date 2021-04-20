#!/bin/sh

IFS=+
DATE=$(date +"%y%m%d")
BASE_FILENAME=${DATE}-$1
CMP_PROCD=$(printf %s "$1" | sed -e "s/ /_/g" | sed -e "s/\.//g")
COMPANY_DIR=./applications/${CMP_PROCD}/
FILEPATH=${COMPANY_DIR}/${BASE_FILENAME}

#printf "%s" $1
if [ ! -d ./$1 ]; then
	{ mkdir ${COMPANY_DIR}; }
fi

sed -e "s/YOURCOMPANY/$(printf %s $1)/g" resume_GENERIC.tex |\
sed -e "s/THEROLE/$(printf %s $2)/g" >  ${FILEPATH}.tex
xelatex -output-directory=${COMPANY_DIR} ${FILEPATH}.tex
