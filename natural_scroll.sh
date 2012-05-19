#!/bin/bash

# Natural Scrolling - Script to enable "OS-X"-like Natural Scrolling.
#
# Contributor(s): AWC - Andy W. Cummings <cydonian.monk@gmail.com>
# Revision History:
#  01.00 2012/05/19 awc Initial Creation
#
# Script developed using information gathered from:
#     http://n00bsys0p.wordpress.com/2011/07/26/reverse-xorg-scrolling-in-linux-natural-scrolling/

POINTER_ID=$(xinput list | egrep "slave.*pointer" | egrep "SynPS/2" | grep -v XTEST | sed -e 's/^.*id=//' -e 's/\s.*$//')
POINTER_BUTTON_MAP=$(xinput get-button-map $POINTER_ID | sed -e 's/4 5/5 4/')
xinput set-button-map $POINTER_ID $POINTER_BUTTON_MAP

# Handle other pointer devices..... (Not complete)
#... (input pointer list into array) =$(xinput list | egrep "slave.*pointer" | egrep -v "SynPS/2" | grep -v XTEST | sed -e 's/^.*id=//' -e 's/\s.*$//')
# while (pointer array in bounds; i++)
# {
#    POINTER_ID=$pointer_array[i]
#    POINTER_BUTTON_MAP=$(xinput get-button-map $POINTER_ID | sed -e 's/4 5/5 4/')
#    xinput set-button-map $POINTER_ID $POINTER_BUTTON_MAP
# }

