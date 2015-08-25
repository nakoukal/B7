#!/bin/bash
##########################################################################################
# B7 log script
# Autor : Radek Nakoukal
# 20.5.2015
#
# This UNIX shell script FTPs all the files in the input directory to a remote directory
###########################################################################################


INIFILEPATH="/home/pi/b7/setting.ini";

#test if ini file exists
if [ ! -f $INIFILEPATH ]
then
        echo "soubor $FILE neexistuje!"
        exit
fi

SERV=$(/home/pi/b7/get_setting.sh ftpserver)
LOGIN=$(/home/pi/b7/get_setting.sh ftpuser)
PASSW=$(/home/pi/b7/get_setting.sh ftppassword)
SRCDIR=$(/home/pi/b7/get_setting.sh file)
STNO=$(/home/pi/b7/get_setting.sh stanoviste)
DSTDIR=$(/home/pi/b7/get_setting.sh dstdir)
DATUM=$(date +%y%m%d-%H%M%S)

FLASHDIR="/media/KINGSTON";
TOSENDDIR="$SRCDIR/tosend";
BACKUPDIR="$SRCDIR/backup";
BACKUPFTPDIR="$FLASHDIR/backup_ftp";
LOGDIR="$SRCDIR/program_log"

#Test if host is available
ping -c3  $SERV 2>/dev/null 1>/dev/null
if [ "$?" = 1 ]
then
        echo "$DATUM no internet conection to  $SERV host" >> $LOGDIR/ftp.log
        exit 0
fi


cd $TOSENDDIR

#Test if any file to send

NUMFILES=$(ls -1 /home/pi/b7/tosend | wc -l)
#echo $NUMFILES
if [ $NUMFILES -eq 0 ]; then
        echo "$DATUM No file to send" >> $LOGDIR/ftp.log
        exit 0
fi

#echo "$SERV $LOGIN $PASSW $DSTDIR $SRCDIR"
#exit 

/usr/bin/ftp -pinv $SERV > $LOGDIR/transfer.log 2>&1 <<END_SCRIPT
quote user $LOGIN
quote pass $PASSW
cd $DSTDIR
mput *.log
bye
END_SCRIPT

#check if all files was transfered ok if yes then will be deleted
cat $LOGDIR/transfer.log | sed -n '/^150 Data connection accepted/,/^226 File received ok./p' | grep '150 Data connection accepted' | cut -d'/' -f3 | while read log
do
        if [ -f $log ]
        then
#               echo $log
                echo "$DATUM SEND $log COMPLETE" >> $LOGDIR/ftp.log
                #rm -f $log
		mkdir -p $BACKUPFTPDIR
		mv -f $log $BACKUPFTPDIR/
        else

#               echo "$log error"
                echo "$DATUM SEND $log FAILED" >> $LOGDIR/ftp.log
        fi

done

exit 0
