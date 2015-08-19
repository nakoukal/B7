#!/bin/bash
##########################################################################################
# B7 log script 
# Autor : Radek Nakoukal
# 20.5.2015
#
# This UNIX shell script FTPs all the files in the input directory to a remote directory
###########################################################################################

SRCDIR=$(/home/pi/b7/get_setting.sh file)
STNO=$(/home/pi/b7/get_setting.sh stanoviste)
DSTDIR=$(/home/pi/b7/get_setting.sh dstdir)
DATUM=$(date +%y%m%d-%H%M%S)

FLASHDIR="/media/KINGSTON";
TOSENDDIR="$SRCDIR/tosend";
BACKUPDIR="$SRCDIR/backup";


#test if file log exist
if (( $(find . -maxdepth 1 -name "*.log" | wc -l) == 0 )); then
	echo "soubory s logy neexistuje!" >> /home/pi/b7/program_log/backup.log
	exit 0 
fi

#echo $FILEFTP
#echo ${#STNO}
#echo $SERV
#echo $LOGIN
#echo $PASSW

#presun a prejmenovani souboru do adresare pro odeslani a do backupu
mv "${SRCDIR}"/*.log "${BACKUPDIR}/" #move to backup folder
cp "${BACKUPDIR}"/*.log "${TOSENDDIR}/" #copu to ftpsend folder
cp "${BACKUPDIR}"/*.log "${FLASHDIR}/" #copy to flashdisk folder

exit 0
