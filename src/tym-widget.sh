#!/usr/bin/env bash
#<------------------------------TYM widget for TMUX------------------------------------>
MPV_SOCKET_PATH="/tmp/mpvsocket"
CURRENT_PANE_PID=$(tmux display-message -p '#{pane_pid}')
TYM_PID=$(ps aux | grep "/usr/local/bin/tym" | grep -v grep | awk '{print $2}')
CURRNET_PANE_TYMID=$(pgrep -P $CURRENT_PANE_PID | xargs -n 1 pstree -p | grep -oP 'bash\(\K\d+(?=\))' | tail -n 1)

if [ "$CURRNET_PANE_TYMID" == "$TYM_PID" ]; then
    tmux rename-window " ƬƳ𐒄 ℓινє.."
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

