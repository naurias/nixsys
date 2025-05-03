#!/run/current-system/sw/bin/bash
# Ensure a file is provided as an argument
if [[ -z "$1" ]]; then
    echo "Usage: $0 <path-to-archive>"
    exit 1
fi

# Get the full path of the archive
archive="$1"

# Check if the file exists
if [[ ! -f "$archive" ]]; then
    echo "Error: File '$archive' does not exist."
    exit 1
fi

# Get the directory and filename without extension
dir=$(dirname "$archive")
filename=$(basename "$archive")
name_without_ext="${filename%.*}"  # Removes last extension (handles multi-dot extensions)

# Create extraction directory
extract_dir="$dir/$name_without_ext"
mkdir -p "$extract_dir"

# Extract using 7z
7zz x "$archive" -o"$extract_dir"

# Check for errors
if [[ $? -eq 0 ]]; then
    echo "Extraction successful: $extract_dir"
else
    echo "Extraction failed!"
    exit 1
fi
