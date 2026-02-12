#!/bin/bash

BASE_URL="https://raw.githubusercontent.com/remelarp/spurgeon-366-morning-devotional-server/refs/heads/main"

for file in ??-*/????.md; do

  # Extract the ID (filename without extension)
  id=$(basename "$file" .md)

  # --- IMPROVED TITLE EXTRACTION ---
  
  # 1. Try YAML Frontmatter (matches "title: Some Title")
  #    Removes "title:", trims whitespace, and strips surrounding quotes.
  title=$(grep -m 1 "^title:" "$file" | sed -E 's/^title:[[:space:]]*//;s/^"//;s/"$//')

  # 2. If not found, try Markdown Header (matches "# Some Title")
  if [[ -z "$title" ]]; then
    title=$(grep -m 1 "^# " "$file" | sed 's/^# //')
  fi

  # 3. If still not found, grab the very first non-empty line of text
  if [[ -z "$title" ]]; then
    title=$(awk 'NF {print; exit}' "$file" | sed 's/^# *//')
  fi
  
  # 4. Fallback if the file is completely empty
  if [[ -z "$title" ]]; then title="Devotion for $id"; fi

  # ---------------------------------

  url="$BASE_URL/$file"

  # Generate the JSON object
  jq -n \
    --arg id "$id" \
    --arg title "$title" \
    --arg url "$url" \
    '{id: $id, title: $title, url: $url}'

done | jq -s '.' > spurgeon-366-morning-devotional.json