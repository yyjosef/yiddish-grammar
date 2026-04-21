#!/bin/bash

# This script converts a single document into multiple chunked Markdown files.
# It uses pandoc to split the input at level 1 headers, then converts each
# chunk from HTML to Markdown format.
#
# Use this when you want to:
# - Split a large document into separate markdown files (one per chapter/section)
# - Convert HTML documentation into clean Markdown files
# - Break up a monolithic document for better organization or processing
#
# Usage: ./convert.sh <input-file>
# Example: ./convert.sh my-book.md
# Output: Creates markdown files in ./docs/ directory

set -ex
ORIG_FILE="$1"
SUBDIR="docs"
DIRECTORY="./$SUBDIR"
OLD_TEXT="html"
NEW_TEXT="md"

pandoc -t chunkedhtml \
    --split-level=1 \
    -o "$SUBDIR" \
    "$ORIG_FILE"

for FILE in "$DIRECTORY"/*.html; do
    if [ -f "$FILE" ]; then
        NEW_FILE="${FILE//$OLD_TEXT/$NEW_TEXT}"
        pandoc "$FILE" \
            --verbose \
            --wrap=none \
            --toc=false \
            --strip-comments=true \
            -t markdown_strict \
            -o "$NEW_FILE"
        rm "$FILE"
        echo "Converted $FILE"
    fi
done

for FILE in "$DIRECTORY"/*.md; do
    if [ -f "$FILE" ]; then
        sed -i '' "s/<[^>]*>.*<\/[^>]*>//g" "$FILE"
        echo "Processed $FILE"
    fi
done
rm "./docs/index.md"
rm "./docs/sitemap.json"
