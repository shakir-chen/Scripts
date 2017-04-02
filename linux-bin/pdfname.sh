#!/bin/bash

# pdffile=$(ls */*.pdf)

# pdffile=$(find -name *.pdf)
# echo $pdffile

# for pdf in $(find -name *.pdf)        # not work, echo word by word
find -name *.pdf | while read line
do
    echo "$line"
    FILENAME=$line
    pdf2txt "$FILENAME" > "$FILENAME".txt
    NEWNAME=$(head -2 "$FILENAME".txt | sed 'N;s/\n//g' | sed 's/\s/_/g' | sed 's/_$//g')
    NEWNAME=$(echo "$NEWNAME" | sed 's/\//-/g' ) # change / to \/, otherwise, directory sep symbol "/"

    echo $NEWNAME
    rm "$FILENAME".txt
    # exit
done
