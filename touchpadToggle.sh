#!/bin/sh

device=`xinput | grep TouchPad | grep -o id=[0-9]* | grep -o [0-9]*`
state=`xinput list-props $device | grep "Device Enabled" | grep -o ":.*" | grep -o "[01]"`
# echo $state
if [ $state -eq "1" ]
then
	xinput --disable $device
else
	xinput --enable $device
fi