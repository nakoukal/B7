#!/bin/bash
##########################################################################################
# B7 log script 
# Autor : Radek Nakoukal
# 20.5.2015
#
# This UNIX shell script FTPs all the files in the input directory to a remote directory
###########################################################################################

FILE=$(/home/pi/b7/get_setting.sh file)
STNO=$(/home/pi/b7/get_setting.sh stanoviste)
DSTDIR=$(/home/pi/b7/get_setting.sh dstdir)
DATUM=$(date +%y%m%d-%H%M%S)

SRCFILE=${FILE##*/} #cut file name from path
SRCDIR=${FILE%/*} #cut path from pathwith filename

FLASHDIR="/media/KINGSTON";
TOSENDDIR="$SRCDIR/tosend";
BACKUPDIR="$SRCDIR/backup";


#test if file log exist
if [ ! -f $FILE ]
then
	echo "soubor $FILE neexistuje!" >> /home/pi/b7/program_log/backup.log
	exit 0 
fi

FILEFTP="$STNO-$DATUM-$SRCFILE"
#echo $FILEFTP
#echo ${#STNO}
#echo $SERV
#echo $LOGIN
#echo $PASSW


#presun a prejmenovani souboru do adresare pro odeslani a do backupu
mv $FILE "$BACKUPDIR/$FILEFTP" #move to backup folder
cp "$BACKUPDIR/$FILEFTP" $TOSENDDIR #copu to ftpsend folder
cp "$BACKUPDIR/$FILEFTP" "$FLASHDIR/$FILEFTP" #copy to flashdisk folder

exit 0
