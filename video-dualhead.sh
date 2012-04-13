#!/bin/bash
# video-dualhead.sh - Script to enable and disable a dual monitor setup.
#
# Usage: ./video-dualhead [off]
#
# Script to start and stop the Dual-Head setup.
# Right Monitor = DVI (Sony Bravia @ 1920x1080)
# Left Monitor = VGA (Samsung LCDtv @ 1280x1024)
#
# Note: 2011/07/10 - This script has not been used or tested since 2009. AWC.
#
# Authors: AWC - Andy W. Cummings <cydonian.monk@gmail.com>
# Revision History: 
#      2012/04/12 AWC Initial github share.
# 1.03 2008-08-31 AWC Moved VGA to left.
# 1.02 2008-05-25 AWC Corrected "off" support.
# 1.01 2008-05-24 AWC Added "off" support.
# 1.00 2008-05-24 AWC Initial Add. 

if [ "$1" = "off" ]; then
   xrandr --output DVI-0 --off
   xrandr --output VGA-0 --pos 0x0
   exit
fi
if [[ -n "$(xrandr | grep 'DVI-0 connected')" ]]; then
   xrandr --output DVI-0 --auto
   xrandr --output DVI-0 --mode 2048x1152
   xrandr --output DVI-0 --pos 0x0
   xrandr --output VGA-0 --pos 2030x0
#   xrandr --output DVI-0 --pos 2048x0
#   xrandr --output VGA-0 --pos 0x0
fi

