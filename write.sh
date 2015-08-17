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

while :
do
       	DATUM=$(date +%y%m%d-%H%M%S)
       	lsof_out=`lsof -f | grep /home/pi/b7/vysledky.log | awk '{ print $4 }'`
        if [[ "$lsof_out" =~ ^.u|w|W|r$ ]];then
                echo "$DATUM Do vysledky.log je zapisovano cekam " #>> $LOGDIR/running.log                
		sleep 5
        else 
		echo "$DATUM Kopiruji soubor"
		exit 1
	fi
done

