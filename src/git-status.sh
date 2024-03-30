#!/usr/bin/env bash
#<-------------------------Git, branch name & pull indicator for ARTITMUX-------------------------------------->
cd "$1" || exit 1

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo " "
    exit 0
fi

SYNC_STATUS=$(git fetch --atomic origin --negotiation-tip=HEAD & git status -uno)
BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

if [[ $SYNC_STATUS =~ "Your branch is up to date" ]]; then
    echo " #[fg=#44dfaf,bg=#090909,bold]󱍸  $BRANCH"

elif [[ $SYNC_STATUS =~ "Your branch is ahead of" ]]; then
    echo " #[fg=#e0af68,bg=#090909,bold]󰵵  $BRANCH"

elif [[ $SYNC_STATUS =~ "Your branch is behind" ]]; then
    echo " #[fg=#f7768e,bg=#090909,bold]󰁭  $BRANCH"

else
    echo " #[fg=#8a8cab,bg=#090909,bold]󰕚  $BRANCH"
fi

sleep 900
INTERVAL="$(tmux show -g | grep status-interval | cut -d" " -f2 | bc)"
if [[ $INTERVAL < 60 ]]; then
    sleep 900
fi
