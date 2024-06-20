#!/bin/bash
#
# backup.sh - cuimhne backup script
#
#       Author - Andrew Cummings (cydonian.monk@gmail.com)
#
#       2018-12-24 - 1.0 - Initial Creation
#
#
#       We generate backup tarballs on the share partition, as
#       the OS partition is much too small to hold them. With the
#       backups pre-generated, we can once a month (or whenever) 
#       insert a backup disk and copy the relevant ones over.
#       Alternatively, we can check to see if the backup disk is
#       mounted, and if so, just copy the backups to it once the
#       process has completed (if space allows).
#
# TODO  
#       1 - Need to be able to detect and delete older backups
#       2 - Detect if backup disk is mounted.
#       3 - Determine if we have enough space on the backup disk.
#               a - If not, delete older backups.
#       4 - Need some way to determine if the most recent backups
#           for each location are up to date. 

BACKUP_PATH=/share/cm_media/backup/cuimhne/
DATE=`date +%Y%m%d`
REQFOUND=0

echo "Backup requested for cuimhne."
echo "Today's date: $DATE"
if [ $2 ]; then
        echo "Backup requested for $1/$2"
        BMAIN=$1
        BSUB=$2
        BPATH=/share/cm_media/$BMAIN/
        BARC=$BMAIN-$BSUB
elif [ $1 ]; then
        echo "Backup requested for $1"
        BMAIN=$1
        BSUB=$1
        BPATH=/share/cm_media/
        BARC=$BMAIN
else
        echo "Usage: $MY_NAME <cm_media Folder to Backup> [Sub Folder]"
        exit 1
fi

# Start with the photos, since those are the most likely to 
# change on a regular basis.

cd $BPATH
for dtar in * ; do
        if [ $BSUB == $dtar ] ; then
                REQFOUND=1
        elif [ $BSUB ] ; then
                continue
        fi
        if [[ -d $dtar ]] ; then
                echo "Creating archive of $dtar"
                tar -cjpf $BACKUP_PATH$DATE-cm_share-$BARC.tar.bz2 $dtar
        fi
done

if [ $REQFOUND != 1 ] ; then
        echo "Requested backup target not found."
        exit 1
fi

echo "Backup of $BMAIN $BSUB completed."


