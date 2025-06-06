#!/bin/bash

CSV_FILE="./clicks.csv"
HTML_FILE="./click_report.html"

# Extract URLs and count them
# Skip header, get 3rd column, sort and count
counts=$(tail -n +2 "$CSV_FILE" | cut -d',' -f3- | sort | uniq -c | sort -nr)

# Begin HTML
cat <<EOF > "$HTML_FILE"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Click Report</title>
  <style>
    body { font-family: sans-serif; margin: 2em; }
    table { border-collapse: collapse; width: 100%; }
    th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
    th { background-color: #f0f0f0; }
  </style>
</head>
<body>
  <h1>Click Report</h1>
  <table>
    <tr>
      <th>Link</th>
      <th>Clicks</th>
    </tr>
EOF

# Append rows from the count data
while read -r line; do
  count=$(echo "$line" | awk '{print $1}')
  url=$(echo "$line" | cut -d' ' -f2-)
  echo "    <tr><td><a href=\"$url\" target=\"_blank\">$url</a></td><td>$count</td></tr>" >> "$HTML_FILE"
done <<< "$counts"

# Finish HTML
cat <<EOF >> "$HTML_FILE"
  </table>
</body>
</html>
EOF

echo "Done. HTML report written to $HTML_FILE"
