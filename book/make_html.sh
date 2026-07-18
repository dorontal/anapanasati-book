#!/bin/bash

# exit on any error
set -e

cat `cat book.md |sed 's/@import//' | sed 's/"//g'` | \
    pandoc -o book_cat.md

echo "$toc$" > toc-template.txt

pandoc book_cat.md --toc --standalone -o toc.md

/bin/rm book_cat.md toc-template.txt

# cat `cat book.md |sed 's/@import//' | sed 's/"//g'` | \
#     pandoc -o book.html
