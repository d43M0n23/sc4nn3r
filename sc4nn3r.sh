#!/bin/bash

######################################################################
# sc4nn3r.sh
# simple scanner-script www + mysql
######################################################################

######################################################################
# last modify: 11.09.2017
# bug or anything: d43M0n23@3xpl0it.com
######################################################################
# TODO EXAMPLE:
# create a *.bk4 file in the directory 4 backup-job
# like /home/dave/index.bk4 /home/mike/index.bk4
# the script make only a backup from directorys with bk4 files include
######################################################################
#
######################################################################
# Bash sTyl3!
clear='\033[0m'			#alle Attribute zurücksetzen
#red='\e[31m'
bold='\033[1m'			#Fettschrift
underline='\033[4m'		#Unterstreichen
blinken='\033[5m'		#Blinken
invers='\033[7m'		#inverse Darstellung
black='\033[30m'		#Schriftfarbe schwarz
red='\033[31m'			#Schriftfarbe rot
green='\033[32m'		#Schriftfarbe grün
yell='\033[33m'			#Schriftfarbe gelb
blue='\033[34m'			#Schriftfarbe blau
mag='\033[35m'			#Schriftfarbe magenta
turk='\033[36m'			#Schriftfarbe türkis
white='\033[37m'		#Schriftfarbe weiß
#######################################################################

##Variablen
DATE=$(date +%F)
version=1.0
vdate=11.09.2017

# Local Destination
#DESTINATION=/home/bk4/

# Logfile
#LOG="bk4.log"

# Tools install
#if ! hash exiftool 2>/dev/null; then sudo apt-get update && apt-get upgrade -y; sudo apt-get install --yes exiftool ; fi

# Log & bka-dir check
#if [ ! -f $LOG ]; then touch $LOG; fi
#if [ ! -d $DESTINATION ]; then mkdir $DESTINATION; fi

#HELPS
#wpscan --url http://bieradvent.bernyboi.com/ -enumerate
#do_something 2>&1 | tee -a some_file
#&>filename (only log)
#bash your_script.sh 1>file.log 2>&1

TOPDIR=`pwd`

#################
clear
#################
echo '+-------------------------------------------------+'
echo "|   Version ${version} (c)opyright 2017 by               |"
echo '|   DaemoN d43M0n23@3xpl0it.com                   |'
echo '+-------------------------------------------------+'
echo '|   This Script is subject to the GPL License!    |'
echo '|   You can copy and change it!                   |'
echo '+-------------------------------------------------+'
echo "| to continue press Return       Date: ${vdate} |"
echo '+-------------------------------------------------+'
#read -e TASTE
sleep 2
while [ "$attacker" != "q" ]
#clear
echo '+-------------------------------------------------+'
echo '| Own-Scripts, Aux & Scanner-Frames               |'
echo '+-------------------------------------------------+'
echo '| 1.Wpscan.                                       |'
echo '| 2.CMSmap.                                       |'
echo '| 3.D-TECT.                                       |'
echo '| 4.WPSeku.                                       |'
echo '| 5.Nikto.                                        |'
echo '| 6.Reverse IP Lookup.                            |'
echo '| x.Quit.                                         |'
echo '+-------------------------------------------------+'
read -p "Attacker Nr (1-x)? " attacker


#PS3="Attacker Nr. - Ihre Wahl : "
#attacker=("1" "2" "D-TECT" "quit")
#select auswahl in Punkt1 Punkt2 Punkt3 Punkt4 Ende
#select auswahl in "${attacker[@]}"
	do
case $attacker in
#case $auswahl in
        1)
		echo "Wpscan selected"
		read -p "domain (e.g. google.com)? " wp_domain
		if [ $wp_domain ]; then
		wpscan --url $wp_domain --enumerate 2>&1 | tee -a wpscan.log
		echo -e "${yell}Logfile is saved as wpscan.log${clear}"
		else
        echo "
Please enter a domain!
"
	fi
            	;;
        2)
		echo "CMSmap selected"
		read -p "domain (e.g. google.com)? " cms_domain
		python /root/c0r3/09-cms/CMSmap/cmsmap.py -t $cms_domain -o cmsscan.log
		echo -e "${yell}Logfile is saved as cmsscan.log${clear}"
            	;;
        3)
		echo "D-TECT selected"
		python /root/c0r3/09-cms/D-TECT/d-tect.py
		;;
        4)
		echo "WPSeku selected"
		read -p "domain (e.g. google.com)? " wpseku_domain
		python /root/c0r3/09-cms/WPSeku/wpseku.py -t $wpseku_domain 2>&1 | tee -a wpseku.log
            	;;
        5)
                echo "Nikto selected"
                read -p "domain (e.g. google.com)? " nikto_domain
                nikto -host http://$nikto_domain 2>&1 | tee -a nikto.log
                ;;
        6)
                echo "Reverse IP"
               # read -p "domain (e.g. google.com)? " nikto_domain
                php /root/c0r3/01-frames/rivip-php/rivip.php 2>&1 | tee -a reverse.log
                ;;
        7)
                echo "Joomlavs selected"
                read -p "domain (e.g. google.com)? " joomla_domain
		ruby /c0r3/09-cms/joomlavs/joomlavs.rb -u $joomla_domain --scan-all 2>&1 | tee -a joomla.log
                ;;


	x)
		break
		;;
        *)

		echo $"Usage: $0 {start|stop|restart|condrestart|status}"
		exit 1
	esac
done
