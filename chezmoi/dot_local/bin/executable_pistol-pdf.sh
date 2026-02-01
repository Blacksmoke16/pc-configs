#!/usr/bin/env sh

# 1. Set up the cache directory conforming to XDG standards
CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/pistol/pdf"
mkdir -p "$CACHE_DIR"

# 2. Identify the input file
FILE_PATH="$1"

# 2. Capture the geometry passed by pistol (defaults to 80x40 if missing)
WIDTH="${2:-80}"
HEIGHT="${3:-40}"

if [ -z "$FILE_PATH" ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# 3. Generate a unique hash for the file
FILE_HASH=$(md5sum "$FILE_PATH" | cut -d ' ' -f 1)
CACHE_FILE="$CACHE_DIR/${FILE_HASH}.jpg"

# 4. If cache doesn't exist, generate the image
if [ ! -f "$CACHE_FILE" ]; then
    # -singlefile writes exactly to the specified filename (plus extension)
    pdftoppm -f 1 -l 1 -jpeg -singlefile "$FILE_PATH" "$CACHE_DIR/$FILE_HASH" 2>/dev/null
fi

# 5. Output the image to the terminal
chafa -f sixel -s "${WIDTH}x${HEIGHT}" --animate off --polite off "$CACHE_FILE"
