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
                /bin/sed -n 's/.*ftpserver *= "*\([^ ]*.*\)"/\1/p' < $SETTING_PATH
                ;;
        "ftpuser")
                /bin/sed -n 's/.*ftpuser *= "*\([^ ]*.*\)"/\1/p' < $SETTING_PATH
                ;;
        "ftppassword")
                /bin/sed -n 's/.*ftppassword *= "*\([^ ]*.*\)"/\1/p' < $SETTING_PATH
		;;
        "file")
                /bin/sed -n 's/.*file *= "*\([^ ]*.*\)"/\1/p' < $SETTING_PATH
                ;;
        "stanoviste")
                /bin/sed -n 's/.*stanoviste *= *\([^ ]*.*\)/\1/p' < $SETTING_PATH
                ;;
        "dstdir")
                /bin/sed -n 's/.*dstdir *= "*\([^ ]*.*\)"/\1/p' < $SETTING_PATH
                ;;
        "dbserver")
                /bin/sed -n 's/.*dbserver *= "*\([^ ]*.*\)"/\1/p' < $SETTING_PATH
                ;;
        "dbport")
                /bin/sed -n 's/.*dbport *= *\([^ ]*.*\)/\1/p' <  $SETTING_PATH
                ;;
        "dbname")
                /bin/sed -n 's/.*dbname *= "*\([^ ]*.*\)"/\1/p' < $SETTING_PATH
                ;;
        "dbuser")
                /bin/sed -n 's/.*dbuser *= "*\([^ ]*.*\)"/\1/p' < $SETTING_PATH
                ;;
        "dbpassword")
                /bin/sed -n 's/.*dbpassword *= "*\([^ ]*.*\)"/\1/p' < $SETTING_PATH
                ;;
        "dbtablename")
                /bin/sed -n 's/.*dbtablename *= "*\([^ ]*.*\)"/\1/p' < $SETTING_PATH
                ;;
        esac
fi
