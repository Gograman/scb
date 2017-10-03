#!/bin/bash

DIR_TO_CHECK='/home/ubuntu/statistics/scb'

OLD_STAT_FILE='/home/ubuntu/statistics/old_stat.txt'

if [ -e $OLD_STAT_FILE ]
then
        OLD_STAT=`cat $OLD_STAT_FILE`
else
        OLD_STAT="nothing"
fi

NEW_STAT=`stat -t $DIR_TO_CHECK`

if [ "$OLD_STAT" != "$NEW_STAT" ]
then
        cd /home/ubuntu/statistics/scb
	git pull origin master
        git add -A
        git commit -am "Backup of `date`"
        git push https://statistics101:needajob1@github.com/statistics101/scb.git master
        # update the OLD_STAT_FILE
        echo $NEW_STAT > $OLD_STAT_FILE
fi

