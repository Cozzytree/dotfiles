
#!/usr/bin/env bash
set -euo pipefail

WALLPAPER_DIR="$HOME/Pictures/wallpapers"
CACHE_DIR="$HOME/.cache/wallpaper-thumbs"
ROFI_THEME="$HOME/.config/rofi/WallSelect.rasi"
ROFI_CMD="rofi -dmenu -i -theme "~/.config/rofi/WallSelect.rasi" -p Select"

mkdir -p "$CACHE_DIR"

# remove any old webp thumbnails (they confuse GTK/rofi)
rm -f "${CACHE_DIR}"/*.webp 2>/dev/null || true

# gather files (null-separated to be safe with spaces/newlines)
mapfile -d '' -t files < <(find "$WALLPAPER_DIR" -type f -iregex '.*\.\(jpg\|jpeg\|png\|webp\)' -print0)

# build a temporary table "basename<TAB>fullpath", sorted by basename
tmpfile="$(mktemp)"
trap 'rm -f "$tmpfile"' EXIT

for f in "${files[@]}"; do
    base="$(basename "$f")"
    printf '%s\t%s\n' "$base" "$f" >> "$tmpfile"
done

# sort case-insensitively by basename
LC_ALL=C sort -f "$tmpfile" -o "$tmpfile"

# create PNG thumbnails (270x270) using magick if missing or outdated
while IFS=$'\t' read -r base fullpath; do
    name="${base%.*}"
    thumb="$CACHE_DIR/${name}.png"
    # generate if missing or source is newer than thumb
    if [ ! -f "$thumb" ] || [ "$fullpath" -nt "$thumb" ]; then
        # use magick (ImageMagick v7+)
        magick "$fullpath" -resize 270x270^ -gravity center -extent 270x270 "$thumb"
    fi
done < "$tmpfile"

# build rofi input: "label\0icon\x1f/path/to/icon\n"
rofi_input="$(mktemp)"
trap 'rm -f "$tmpfile" "$rofi_input"' EXIT

while IFS=$'\t' read -r base fullpath; do
    name="${base%.*}"
    thumb="$CACHE_DIR/${name}.png"
    # print label (basename) and icon token (rofi expects: label\0icon\x1ficonpath\n)
    printf '%s\0icon\x1f%s\n' "$base" "$thumb" >> "$rofi_input"
done < "$tmpfile"

# show rofi and capture the selected basename
selected="$(cat "$rofi_input" | $ROFI_CMD | tr -d '\r')"

# if something was chosen, find its full path and apply with feh
if [ -n "${selected:-}" ]; then
    # find first matching basename (if duplicates exist, first match wins)
    chosen_fullpath="$(awk -F '\t' -v s="$selected" '$1 == s { print $2; exit }' "$tmpfile")"
    if [ -n "$chosen_fullpath" ]; then
        feh --no-fehbg --bg-fill "$chosen_fullpath"
        echo "$chosen_fullpath" > ~/.dwm/current_wallpaper
    else
        echo "Selected wallpaper not found." >&2
        exit 1
    fi
fi

