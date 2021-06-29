#!/bin/sh

IFS=+
DATE=$(date +"%y%m%d")
BASE_FILENAME=${DATE}-$1
CMP_PROCD=$(printf %s "$1" | sed -e "s/ /_/g" | sed -e "s/\.//g")
COMPANY_DIR=./applications/${CMP_PROCD}/
FILEPATH=${COMPANY_DIR}/${BASE_FILENAME}_resume
LETTERPATH=${COMPANY_DIR}/${BASE_FILENAME}_letter


printf "YOURCOMPANY THEROLE WHATIHAVE DOTHETHING"
#printf "%s" $1
if [ ! -d ./$1 ]; then
	{ mkdir ${COMPANY_DIR}; }
fi

sed -e "s/YOURCOMPANY/$(printf %s $1)/g" resume_GENERIC.tex |\
sed -e "s/WHATIHAVE/$(printf %s $3)/g" |\
sed -e "s/DOTHETHING/$(printf %s $4)/g" |\
sed -e "s/THEROLE/$(printf %s $2)/g" >  ${FILEPATH}.tex
xelatex -output-directory=${COMPANY_DIR} ${FILEPATH}.tex


sed -e "s/YOURCOMPANY/$(printf %s $1)/g" letter_GENERIC.tex |\
sed -e "s/WHATIHAVE/$(printf %s $3)/g" |\
sed -e "s/DOTHETHING/$(printf %s $4)/g" |\
sed -e "s/THEROLE/$(printf %s $2)/g" >  ${LETTERPATH}.tex
xelatex -output-directory=${COMPANY_DIR} ${LETTERPATH}.tex

rm -f ${COMPANY_DIR}/*.log
rm -f ${COMPANY_DIR}/*.aux

./strip_tex.sh ${LETTERPATH}.tex | fmt > ${LETTERPATH}.txt
./mkasciiresume.sh ${FILEPATH}.tex > ${FILEPATH}.txt

sed -n '25,$p' ${LETTERPATH}.txt

