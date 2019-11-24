#!/bin/bash
scrot -q 50 ~/.cache/screenshot.jpg
convert -scale 10% -blur 0x5 -resize 1000% ~/.cache/screenshot.jpg ~/.cache/screenshot-blurred.png

rofi_command="rofi -config solarized-fullscreen.rofi"

### Options ###
power_off="Shutdown"
reboot="Reboot"
lock="Lock"
suspend="Suspend"
log_out="Logout"
# Variable passed to rofi
options="$power_off\n$reboot\n$lock\n$suspend\n$log_out"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"
case $chosen in
    $power_off)
    	 systemctl poweroff
        ;;
    $reboot)
         systemctl reboot
        ;;
    $lock)
        $HOME/.config/lock_bar.sh
        ;;
    $suspend)
        $HOME/.config/lock_bar.sh && systemctl suspend
        ;;
    $log_out)
        i3-msg exit
        ;;
esac

