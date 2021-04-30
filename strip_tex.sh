#!/bin/sh

# This is a one-off script to strip the latex formatting from
# my resume. An input is required as the first argument. It
# should be a .tex file

IFS=+

detex $* |\
sed 's/^\t*//' |\
sed 's/\*//' |\
sed 's/&//' |\
sed 's/^ *//' |\
grep -v '\[' |\
grep -v ^[0-9]\\. |\
grep -v ^[0-9]pt |\
grep -v ^@ 
