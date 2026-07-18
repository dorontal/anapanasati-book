#!/bin/bash

# exit on any error
set -e

echo '' > toc.md

cat `cat book.md |sed 's/@import//' | sed 's/"//g'` | \
    pandoc -o book_cat.md

echo "\$toc\$" > toc-template.txt

pandoc book_cat.md --toc --standalone --template=toc-template.txt -o toc.md

perl -pi -e 's/ -- / – /g' toc.md

/bin/rm book_cat.md toc-template.txt

# cat `cat book.md |sed 's/@import//' | sed 's/"//g'` | \
#     pandoc -o book.html
