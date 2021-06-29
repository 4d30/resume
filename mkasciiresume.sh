#!/bin/sh

# This is a one-off script to strip the latex formatting from
# my resume. An input is required as the first argument. It
# should be a .tex file

IFS=+

detex $* |\
sed '1,11d' |\
sed 's/^\t*//' |\
sed 's/\*//' |\
sed 's/&//' |\
sed 's/^ *//' |\
sed '1,15 {/^$/d}' |\
grep -v '\[' |\
grep -v ^[0-9]\\. |\
grep -v ^[0-9]pt |\
grep -v ^@ |\
sed '/Present$/N;s/\n//' |\
sed '/[0-9]$/N;s/\n//' |\
awk '{if (NR >=18 && NR<=61) ORS=", "; else ORS="\n"; print}' |\
sed 's/, ,/,/g' |\
sed 's/, ,/,/g' |\
sed '12,15d' |\
sed '15,16d' |\
sed '54d' |\
sed '59,62d' |\
sed '59a\
Education
' |\
sed '65d' |\
sed '70d' |\
sed 's/\t//g'
