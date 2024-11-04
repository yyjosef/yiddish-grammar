#!/bin/bash

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
