#!/bin/bash

# Natural Scrolling - Script to enable "OS-X"-like Natural Scrolling.
#
# Contributor(s): AWC - Andy W. Cummings <cydonian.monk@gmail.com>
# Revision History:
#  01.01 2012/05/23 AWC Support all pointer devices.
#  01.00 2012/05/19 awc Initial Creation
#
# Script developed using information gathered from:
#     http://n00bsys0p.wordpress.com/2011/07/26/reverse-xorg-scrolling-in-linux-natural-scrolling/

# Reverse the scrolling direction of all pointer devices.
# Pointers must not be XTEST devices.
POINT_DEVS=$(xinput list | egrep "slave.*pointer" | grep -v XTEST | sed -e 's/^.*id=//' -e 's/\s.*$//')
set -- $POINT_DEVS
for POINTER_ID in "$@"
do
  POINTER_MAP=$(xinput get-button-map $POINTER_ID | sed -e 's/4 5/5 4/')
  xinput set-button-map $POINTER_ID $POINTER_MAP
done

