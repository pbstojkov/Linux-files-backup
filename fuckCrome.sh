#!/bin/bash
function ALARMA {
#    notify-send "Battery low" "Battery level is ${battery_level}%!"
    paplay /usr/share/sounds/LinuxMint/stereo/phone-incoming-call.ogg
    xmessage -center "Fuck Chrome. Ram usage is too high!"
}

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
export DISPLAY=:0.0

if free | awk 'FNR == 2 {exit $7/$2 <= 0.15 ? 0 : 1}'
then
	ALARMA
fi