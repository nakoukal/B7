#!/bin/bash
#
#####################################################
# b7_mysql.sh
#
# 29.8.2014
# Radek Nakoukal
#
# Script to send b7 log data to mysql database
# Script require - 3 parameter 1-rfid 2-time 3-number of control station
# if is less then 3 parameter then do nothing
#####################################################
dbHostName=$(/home/pi/b7/get_setting.sh dbserver)
dbPort=$(/home/pi/b7/get_setting.sh dbport)
dbName=$(/home/pi/b7/get_setting.sh dbname)
dbUserName=$(/home/pi/b7/get_setting.sh dbuser)
dbPasswd=$(/home/pi/b7/get_setting.sh dbpassword)
dbTableName=$(/home/pi/b7/get_setting.sh dbtablename)

if [ "$#" -eq  3 ]; then
	rfid=$1
	cas=$2
	control=$3
	mysql -h$dbHostName -P$dbPort -u$dbUserName -p$dbPasswd << EOF
	use $dbName;
	INSERT IGNORE INTO $dbTableName (RFID,CAS,KONTROLA) VALUES ('$rfid','$cas',$control);
EOF
fi
