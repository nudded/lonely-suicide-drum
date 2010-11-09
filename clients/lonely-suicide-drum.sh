#!/bin/bash
echo "$#"

if [[ $# -lt 2 ]]; then
    echo "Usage: $0 host:port file1 [file2 file3 ...]"
    exit 1
fi

# Save destination
DESTINATION="$1"
shift

# For all files...
while [[ $# -gt 0 ]]; do
    echo "Uploading $1..."
    curl -F "data=@$1" "$DESTINATION/songs"
    shift
done
