#!/bin/bash

logfile=~/provision.log
if [ ! -e $logfile ];then
	touch $logfile
else
	echo "" >$logfile
fi

inspect () {
if [ $? -eq 0 ];then
	echo -e "`date +"%Y/%m/%d %H:%M:%S"`\n$1 installation successed\n" >> $logfile
else
	echo -e "`date +"%Y/%m/%d %H:%M:%S"`\n$1 installation failed\n" >> $logfile
	exit 99
fi
}

sudo apt-get -y install python-pip
inspect "python-pip"
sudo pip install ansible
inspect "ansible"
sudo apt-get -y install git
inspect "git"