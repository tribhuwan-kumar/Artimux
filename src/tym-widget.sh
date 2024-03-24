#!/usr/bin/env bash
#<------------------------------TYM widget for TMUX------------------------------------>
MPV_SOCKET_PATH="/tmp/mpvsocket"
CURRENT_COMMAND=$(tmux display-message -p '#{pane_current_command}')

if [ "$CURRENT_COMMAND" == "tym" ]; then
    tmux rename-window "$CURRENT_COMMAND"
fi

mpv_socket_active() {
    nc -U -z -w1 "$MPV_SOCKET_PATH" >/dev/null 2>&1
    return $?
}

echo_info() {
    if mpv_socket_active; then
        MEDIA_TITLE=$(echo '{ "command": ["get_property", "media-title"] }' | socat - /tmp/mpvsocket | jq -r '.data')
        PLAY_STATE=$(echo '{ "command": ["get_property", "pause"] }' | socat - /tmp/mpvsocket | jq -r '.data')
    else
        exit 0
    fi
}

echo_info

WIN_WIDTH=$(tmux display -p '#{window_width}')

if [ "$WIN_WIDTH" -lt 115 ]; then
    echo -ne ""
else
    if [ "$PLAY_STATE" == "false" ]; then
        echo -e "❬ 󰽰 $(echo "$MEDIA_TITLE" | sed 's/[^a-zA-Z0-9 ]//g' | awk '{print $1,$2,$3}')"
    else
        echo -e "❬ 󰏤 $(echo "$MEDIA_TITLE" | sed 's/[^a-zA-Z0-9 ]//g' | awk '{print $1,$2,$3}')"
    fi
fi

