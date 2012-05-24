#!/bin/bash
#
# import.sh - Grab a screenshot using Import.
#
# Script to take a screenshot with a date/timestamp. If cm_share is not mounted
# or the symlink is broken, screenshot will be placed in user's screenshot 
# fodler in their home directory. If ~/screenshot doesn't exist, screenshot 
# will be saved to ~/.
#
# Requires: import (in media-gfx/imagemagick on Gentoo)
#
# Contributor(s): AWC - Andy W. Cummings <cydonian.monk@gmail.com>
# Revision History:
#  01.00 2012/04/15 AWC Initial Creation.
#

DATE=$(date +%Y%m%d)
TIME=$(date +%H%M%S)
TAIL="_screenshot_$TIME.jpg"
FILENAME="$DATE$TAIL"
BASEPATH=""
USERHOME=$(echo ~)

#If Dropbox is connected, save there.
if [ -e /dropbox/Screenshots ] ; then
{
    BASEPATH="/dropbox/Screenshots/"
}
elif [ -e /photo/screenshots ] ; then
{
    BASEPATH="/photo/screenshots/"
}
elif [ -e $USERHOME/screenshots ] ; then
{
    BASEPATH="$USERHOME/screenshots/"
}
else
{
    BASEPATH="$USERHOME/"
}
fi

FILEPATH="$BASEPATH$FILENAME"
if [ -e $FILEPATH ] ; then 
{
    FILEPATH="$FILEPATH-01"
}
fi

/usr/bin/import $FILEPATH


