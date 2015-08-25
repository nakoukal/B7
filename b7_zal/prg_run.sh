#!/bin/bash
##########################################################################################
# B7 check running script
# Autor : Radek Nakoukal
# 18.6.2015
#
# This UNIX shell script FTPs all the files in the input directory to a remote directory
###########################################################################################
###########################################################################################
# script with parameters
# 1 - script name
###########################################################################################
SRCDIR=$(/home/pi/b7/get_setting.sh file)
LOGDIR="$SRCDIR/program_log"
if [ "$#" -ne 1 ]; then
        echo "Illegal number of parameters"
        exit;
fi


while :
do
        DATUM=$(date +%y%m%d-%H%M%S)
        ps_out=`ps -ef | grep $1 | grep -v 'grep' | grep -v $0`
	result=$(echo $ps_out | grep "$1")
        if [[ "$result" == "" ]];then
                echo "$DATUM $1 Not Running starting..." >> $LOGDIR/running.log
               	$1 >> $LOGDIR/b7_bin.log
        fi
        sleep 5
done

