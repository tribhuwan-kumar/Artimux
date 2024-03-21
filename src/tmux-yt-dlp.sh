#!/usr/bin/env bash

# Print usage
function print_usage {
    cat <<EOF
See the github page https://github.com/tribhuwan-kumar/Artimux for usage.
EOF
exit
}

# Define  parse
HELP=false
NEXT=false
REPEAT=false
SHUFFLE=false

QUERY=""
NUM_RESULTS=1
MUSIC_DIR="$HOME/Music/tmux-yt-dlp"

# Parse arguments
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -h|--help)
            HELP=true
            shift
            ;;
        -n)
            NEXT=true
            shift
            ;;
        -r)
            REPEAT=true
            shift
            ;;
        -s)
            SHUFFLE=true
            shift
            ;;
        --)
            shift
            break
            ;;
        -*|--*=)
            echo "Unknown option: $1"
            ;;
        *)
            QUERY="$QUERY $1"
            shift
            ;;
    esac
done

# Handle empty query
if [ -z "$QUERY" ]; then
    print_usage
fi

if [ ! -d "$MUSIC_DIR" ]; then
    mkdir -p "$MUSIC_DIR"
fi

function play() {
    mpv --no-video --msg-level=all=no "$1"
}

function play_loop() {
    mpv --no-video --msg-level=all=no --loop "$1"
}

# EXISTING_SONG=$(find "$MUSIC_DIR" -type f -iname "*$QUERY*" | head -n 1)

# Remove leading whitespace, and trailing
REMOVE_WHITESPACE="${QUERY#"${QUERY%%[![:space:]]*}"}"
TRAILED_QUERY="${REMOVE_WHITESPACE%"${REMOVE_WHITESPACE##*[![:space:]]}"}"

EXISTING_SONG=$(find "$MUSIC_DIR" -type f | grep -i -E ".*$TRAILED_QUERY.*" | head -n 1)

if [ -n "$EXISTING_SONG" ]; then
    SONG_TITLE=$(basename "$EXISTING_SONG")
    echo "󰽰$SONG_TITLE"

    if [ "$REPEAT" = true ]; then
        play_loop "$EXISTING_SONG"
        exit 0
    fi
    play "$EXISTING_SONG"
    exit 0
else
    echo "Searching: 󰥖 ${QUERY:1}"
    # Fetch results
    RESULTS=$(yt-dlp --default-search "ytsearch" -j "ytsearch$NUM_RESULTS:${QUERY:1}" --match-filters "duration>80")
    URLS=$(echo "$RESULTS" | jq -r '.webpage_url')
    TITLES=$(echo "$RESULTS" | jq -r '.fulltitle')

    play "$URLS"

    # Download
    echo "󰦗 ${QUERY:1}"
    yt-dlp -o "$MUSIC_DIR/${QUERY:1}.%(ext)s" --extract-audio --audio-format mp3 --audio-quality 320K "$URLS" >/dev/null 2>&1
    DOWNLOADING_PID=$!
    wait $DOWNLOADING_PID

    if [ -f "$MUSIC_DIR/${QUERY:1}.mp3" ]; then
        echo "󱑤 ${QUERY:1}"
    else
        echo " ${QUERY:1}"
        exit 1
    fi
    SONG_PATH="$MUSIC_DIR/${QUERY:1}.mp3"
    if [ "$REPEAT" = true ]; then
        play_loop "$SONG_PATH"
        exit 0
    fi
    play "$SONG_PATH"
fi
