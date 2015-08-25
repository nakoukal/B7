#!/bin/bash
##########################################################################################
# B7  get init script
# Autor : Radek Nakoukal
# 13.8.2015
#
# This UNIX shell script  get data from setting ini file
###########################################################################################

SETTING_PATH='/home/pi/b7/setting.ini'

if [ "$#" -eq 1 ]; then
        case "$1" in
        "ftpserver")
                OUT=$(/bin/sed -n 's/.*ftpserver *= "*\([^ ]*.*\)"/\1/p' < $SETTING_PATH)
		echo ${OUT:0:-1}
                ;;
        "ftpuser")
                OUT=$(/bin/sed -n 's/.*ftpuser *= "*\([^ ]*.*\)"/\1/p' < $SETTING_PATH)
		echo ${OUT:0:-1}
                ;;
        "ftppassword")
                OUT=$(/bin/sed -n 's/.*ftppassword *= "*\([^ ]*.*\)"/\1/p' < $SETTING_PATH)
		echo ${OUT:0:-1}
		;;
        "file")
                OUT=$(/bin/sed -n 's/.*path *= "*\([^ ]*.*\)"/\1/p' < $SETTING_PATH)
		echo ${OUT:0:-1}
                ;;
        "stanoviste")
                OUT=$(/bin/sed -n 's/.*stanoviste *= *\([^ ]*.*\)/\1/p' < $SETTING_PATH)
		echo ${OUT:0:-1}
                ;;
        "dstdir")
                OUT=$(/bin/sed -n 's/.*dstdir *= "*\([^ ]*.*\)"/\1/p' < $SETTING_PATH)
		echo ${OUT:0:-1}
                ;;
        "dbserver")
                OUT=$(/bin/sed -n 's/.*dbserver *= "*\([^ ]*.*\)"/\1/p' < $SETTING_PATH)
		echo ${OUT:0:-1}
                ;;
        "dbport")
                OUT=$(/bin/sed -n 's/.*dbport *= *\([^ ]*.*\)/\1/p' <  $SETTING_PATH)
		echo ${OUT:0:-1}
                ;;
        "dbname")
                OUT=$(/bin/sed -n 's/.*dbname *= "*\([^ ]*.*\)"/\1/p' < $SETTING_PATH)
		echo ${OUT:0:-1}
                ;;
        "dbuser")
                OUT=$(/bin/sed -n 's/.*dbuser *= "*\([^ ]*.*\)"/\1/p' < $SETTING_PATH)
		echo ${OUT:0:-1}
                ;;
        "dbpassword")
                OUT=$(/bin/sed -n 's/.*dbpassword *= "*\([^ ]*.*\)"/\1/p' < $SETTING_PATH)
		echo ${OUT:0:-1}
                ;;
        "dbtablename")
                /bin/sed -n 's/.*dbtablename *= "*\([^ ]*.*\)"/\1/p' < $SETTING_PATH
                ;;
        esac
fi
