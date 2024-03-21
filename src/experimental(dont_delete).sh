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












#<------------------------------------------ # searching commands------------------------------->
# MUSIC_DIR="$HOME/Music/tmux-yt-dlp"

# QUERY="Butterflies"
# read -ra SEARCH_QUERY <<< "$QUERY"

# # Now, search_query is an array where each element is a word from the original query
# # Accessing elements:
# # echo "${SEARCH_QUERY[0]}" # Outputs: hello
# # echo "${SEARCH_QUERY[1]}" # Outputs: world
# # echo "${SEARCH_QUERY[2]}" # Outputs: this
# # echo "${SEARCH_QUERY[3]}" # Outputs: is
# # echo "${SEARCH_QUERY[4]}" # Outputs: a
# echo -ne "${SEARCH_QUERY[5]}" # Outputs: test
# # ... and so on

# # To access all elements in the array:
# # for WORD in "${SEARCH_QUERY[@]}"; do
# #     echo "$WORD"
# # done

# # echo "Search query: $WORD"

# # find ~/Music/tmux-yt-dlp -type f | grep -i ".*ed.*sheeran.*perfect.*"

# # echo ".*${SEARCH_QUERY[0]}.*${SEARCH_QUERY[1]}.*${SEARCH_QUERY[2]}.*"

# EXISTING_SONG=$(find "$MUSIC_DIR" -type f | grep -i -E ".*${SEARCH_QUERY[0]}.*${SEARCH_QUERY[1]}.*${SEARCH_QUERY[2]}.*${SEARCH_QUERY[3]}.*${SEARCH_QUERY[4]}.*" | head -n 1)

# # EXISTING_SONG=$(find "$MUSIC_DIR" -type f | grep -i "*.${SEARCH_QUERY[0]}.*${SEARCH_QUERY[1]}.*${SEARCH_QUERY[3]}.*" | head -n 1)

# echo "Existing song: $EXISTING_SONG"


















# <---------------------------------------------------factoring algorithms----------------------------------------->
# this shit is working
# Directory containing the files
# DIR="$HOME/Music/tmux-yt-dlp"

# # Your query
# QUERY="you_i"

# # Initialize variables
# max_matches=0
# matching_file=""

# # Loop through each file in the directory
# for file in "$DIR"/*; do
#     # Extract the filename without the path
#     filename=$(basename "$file")

#     # Split the filename and the query into words
#     IFS=' ' read -ra filename_words <<< "$filename"
#     IFS=' ' read -ra query_words <<< "$QUERY"

#     # Initialize a counter for matches
#     matches=0

#     # Loop through each word in the filename
#     for word in "${filename_words[@]}"; do
#         # Loop through each word in the query
#         for query_word in "${query_words[@]}"; do
#             # Compare the word from the filename with the word from the query
#             if [ "$word" == "$query_word" ]; then
#                 # If they match, increment the matches counter
#                 matches=$((matches + 1))
#             fi
#         done
#     done

#     # If this file has more matches than the current max, update the max and the matching file
#     if [ "$matches" -gt "$max_matches" ]; then
#         max_matches="$matches"
#         matching_file="$file"
#     fi
# done

# # If a matching file was found, print its path
# if [ -n "$matching_file" ]; then
#     echo "The file with the most matches is: $matching_file"
# else
#     echo "No matching files found."
# fi
