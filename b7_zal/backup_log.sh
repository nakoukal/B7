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
if (( $(find $SRCDIR -maxdepth 1 -name "*vysledky.log" | wc -l) == 0 )); then
	echo "soubory s logy neexistuje!" >> "$SRCDIR/program_log/backup.log"
	/usr/bin/pgrep sendftp.sh > /dev/null || /home/pi/b7/sendftp.sh > /dev/null
	exit 0
fi


# find all logs and cut text into one file into tosend folder
# move all cuted logs into backup folded 
# copy all cuted logs into flash dir
find $SRCDIR -maxdepth 1 -name "*vysledky.log" -not -size 0 | while read log
do
        if [ -f $log ]
        then
#               echo $log
	        cat $log >> "$TOSENDDIR/$STNO-$DATUM-vysledky.log"
		mv $log $BACKUPDIR
		cp "$BACKUPDIR$log" $FLASHDIR
        else

#               echo "$log error"
                echo "$DATUM backup $log FAILED" >> $LOGDIR/backup.log
        fi

done


#echo $FILEFTP
#echo ${#STNO}
#echo $SERV
#echo $LOGIN
#echo $PASSW
/usr/bin/pgrep sendftp.sh > /dev/null || /home/pi/b7/sendftp.sh > /dev/null
exit 0
