#!/bin/bash
function ALARMA {
#    notify-send "Battery low" "Battery level is ${battery_level}%!"
    paplay /usr/share/sounds/LinuxMint/stereo/phone-incoming-call.ogg
    xmessage -center "Battery low" "Battery level is ${battery_level}%!"
}

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
export DISPLAY=:0.0

battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
charging=`acpi -b | grep -P -o Charging`
bs=${#charging}

if [ $bs -eq 0 ]
then 
	if [ $battery_level -le 10 ]
	then
		ALARMA
	fi
	if [ $battery_level -le 20 ]
	then
		if [ $battery_level -ge 18 ]
		then
			ALARMA
		fi
	fi
	if [ $battery_level -le 30 ] 
	then
		if [ $battery_level -ge 28 ]
		then
			ALARMA
		fi
	fi
fi