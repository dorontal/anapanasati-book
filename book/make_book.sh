#!/bin/bash

# exit on any error
set -e

echo "## Table of Contents" > toc.md
cat `cat book.md | sed 's/@import//' | sed 's/"//g'` \
    > book_cat.md

echo "## Table of Contents
\$toc\$
" > toc-template.txt

# pandoc book_cat.md --toc --standalone --template=toc-template.txt -o toc.md
pandoc book_cat.md \
    --toc --template=toc-template.txt --css=book.css \
    -o toc.md
echo "" >> toc.md

perl -pi -e 's/ -- / – /g' toc.md

cat `cat book.md | sed 's/@import//' | sed 's/"//g'` \
    | pandoc --css=book.css --standalone \
    --metadata title="Anapanasati Book" \
    -o book.html

/bin/rm book_cat.md toc-template.txt
# /bin/rm book_cat.md toc.md toc-template.txt
