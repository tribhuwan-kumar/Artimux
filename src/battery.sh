#!/usr/bin/env bash

SHOW_BATTERY=$(tmux show-option -gv @Artimux_show_battery)
if [ "$SHOW_BATTERY" != "true" ]; then
    exit 0
fi

linux_get_bat () {
    echo $(( "$BAT_TOTAL" / "$BAT_COUNT" ))
}

battery_status() {
    BATTERIES=$(ls /sys/class/power_supply | grep BAT)
    BAT_COUNT=$(ls /sys/class/power_supply | grep BAT | wc -l)
    for BATTERY in $BATTERIES; do
        BAT_PATH=/sys/class/power_supply/$BATTERY
        STATUS=$BAT_PATH/status
        [ "$1" = `cat $STATUS` ] || [ "$1" = "" ] || return 0
        if [ -f "$BAT_PATH/energy_full" ]; then
            naming="energy"
        elif [ -f "$BAT_PATH/charge_full" ]; then
            naming="charge"
        elif [ -f "$BAT_PATH/capacity" ]; then
            cat "$BAT_PATH/capacity"
            return 0
        fi
        BAT_PERCENT=$(( 100 * $(cat $BAT_PATH/${naming}_now) / $(cat $BAT_PATH/${naming}_full) ))
        BAT_TOTAL=$(( ${BAT_TOTAL-0} + $BAT_PERCENT ))
    done
    linux_get_bat
}

BATTERY_STATUS=`battery_status $1`
[ -z "$BATTERY_STATUS" ] && exit

WIN_WIDTH=$(tmux display -p '#{window_width}')
if [ "$WIN_WIDTH" -lt 115 ]; then
    echo -ne ""
else
    echo "❬ ${BATTERY_STATUS}% "
fi

