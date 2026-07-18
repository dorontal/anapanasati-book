#!/bin/bash

# exit on any error
set -e

cat `cat book.md |sed 's/@import//' | sed 's/"//g'` | \
    pandoc -o book_cat.md

pandoc book_cat.md --toc -o toc.md

# cat `cat book.md |sed 's/@import//' | sed 's/"//g'` | \
#     pandoc -o book.html
