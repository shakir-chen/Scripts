#!/bin/bash


# FILENAME=oe-20-3-2507.pdf

FILENAME=$1

pdf2txt $FILENAME > $FILENAME.txt

# http://stackoverflow.com/questions/9605232/how-to-merge-every-two-lines-into-one-from-the-command-line
# sed 'N;...' at man sed /n N : read and join
# http://stackoverflow.com/questions/24643240/what-does-a-number-do-after-curly-braces
# awk 'NR%2{printf "%s ",$0;next;}1' yourFile

# head -2 oe-20-3-2507.txt | awk 'NR%2{printf "%s ",$0;next;}1'

NEWNAME=$(head -2 $FILENAME.txt | sed 'N;s/\n//g' | sed 's/\s/_/g' | sed 's/_$//g')
NEWNAME=$(echo $NEWNAME | sed 's/\//-/g' ) # change / to \/, otherwise, directory sep symbol "/"

echo $NEWNAME

rm $FILENAME.txt
mv "$FILENAME" "$NEWNAME.pdf"
