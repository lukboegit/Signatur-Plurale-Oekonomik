#!/bin/bash

# Set the directory containing your JSON files
JSON_DIR="./logs" # Change to your actual folder
# Set the path to your output CSV file
CSV_FILE="./clicks.csv"

# Temporary file for safely processing new entries
TMP_FILE=$(mktemp)

# Ensure CSV file has header if it doesn't exist
if [ ! -f "$CSV_FILE" ]; then
    echo "mail address,time,url clicked" >"$CSV_FILE"
fi

# Loop through all JSON files in the directory
for file in "$JSON_DIR"/*.json; do
    # Use jq to extract click data
    jq -r '
  .[] |
  . as $root |
  .clicks_detail[]? |
  [$root.email, ($root["@timestamp"] | sub("\\..*Z$"; "")), .url] |
  @csv
' "$file" >>"$TMP_FILE"

done

# Combine and remove duplicates
tail -n +2 "$CSV_FILE" >>"$TMP_FILE" # Skip header
(
    echo "mail address,time,url clicked"
    sort -u "$TMP_FILE"
) >"${CSV_FILE}.tmp"

# Replace the original CSV with the deduplicated version
mv "${CSV_FILE}.tmp" "$CSV_FILE"

# Clean up temp file
rm "$TMP_FILE"

echo "Done. Click data appended and deduplicated in $CSV_FILE"
