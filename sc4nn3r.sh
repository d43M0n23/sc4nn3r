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
vdate=13.09.2017

# Local Destination
#DESTINATION=/home/bk4/

# Logfile
#LOG="bk4.log"

# Email
email=alex@xcoorp.com
# Tools install
#if ! hash exiftool 2>/dev/null; then sudo apt-get update && apt-get upgrade -y; sudo apt-get install --yes exiftool ; fi

# Log & bka-dir check
#if [ ! -f $LOG ]; then touch $LOG; fi
#if [ ! -d $DESTINATION ]; then mkdir $DESTINATION; fi

# DELETE OLD LOGS?
# 1=yes/0=no
kill_logs=0
if [ $kill_logs = 1 ]; then rm *.log; fi

#WORKING DIR
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
echo "|                                Date: ${vdate} |"
echo '+-------------------------------------------------+'
sleep 2
while [ "$attacker" != "q" ]
#clear
echo '+-------------------------------------------------+'
echo '| Own-Scripts, Aux & Scanner-Frames               |'
echo '+-------------------------------------------------+'
echo '| 1.Wpscan. | Wordpress                           |'
echo '| 2.CMSmap. | Wordpress - Joomla - Durpal         |'
echo '| 3.D-TECT. | Wordpress                           |'
echo '| 4.WPSeku. | Wordpress                           |'
echo '| 5.Nikto.  | All                                 |'
echo '| 6.Reverse IP Lookup. | All                      |'
echo '| 7.Joomlavs. | Joomla                            |'
#echo '| 8.Joomscan. | Joomla                            |'
echo '| a.All.                                          |'
echo '| x.Quit.                                         |'
echo '+-------------------------------------------------+'
read -p "Attacker Nr (1-x)? " attacker
if [ $attacker = a ]; then
read -p "Wordpress or Joomla (w/j)? " cms_system
fi
do
case $attacker in
        1)
		echo "Wpscan selected"
		read -p "domain (e.g. google.com)? " wp_domain
		if [ $wp_domain ]; then
		wpscan --url $wp_domain --enumerate 2>&1 | tee -a wpscan_${wp_domain}.log
		echo -e "\n${yell}Logfile is saved as wpscan_${wp_domain}.log${clear}\n"
		mail -s "sc4nn3r: wpscan_${wp_domain}" $email < wpscan_${wp_domain}.log -aFrom:sc4nn3r@3xpl0it.com
		else
        	echo -e "\nPlease enter a domain!\n"
		fi
            	;;
        2)
		echo "CMSmap selected"
		read -p "domain (e.g. google.com)? " cms_domain
		python /root/c0r3/09-cms/CMSmap/cmsmap.py -t $cms_domain -o cmsscan_${cms_domain}.log
		echo -e "\n${yell}Logfile is saved as cmsscan_${cms_domain}.log${clear}\n"
            	;;
        3)
		echo "D-TECT selected"
		python /root/c0r3/09-cms/D-TECT/d-tect.py
		;;
        4)
		echo "WPSeku selected"
		read -p "domain (e.g. google.com)? " wpseku_domain
		python /root/c0r3/09-cms/WPSeku/wpseku.py -t $wpseku_domain 2>&1 | tee -a wpseku_${wpseku_domain}.log
		echo -e "\n${yell}Logfile is saved as wpseku_${wpseku_domain}.log${clear}\n"
            	;;
        5)
                echo "Nikto selected"
                read -p "domain (e.g. google.com)? " nikto_domain
                nikto -host http://$nikto_domain 2>&1 | tee -a nikto_${nikto_domain}.log
		echo -e "\n${yell}Logfile is saved as nikto_${nikto_domain}.log${clear}\n"
                ;;
        6)
                echo "IP Lookup selected"
		read -p "domain or ip (e.g. google.com)? " rev_domain
                php rev3r531p.php $rev_domain 2>&1 | tee -a reverse_${rev_domain}.log
		echo -e "\n${yell}Logfile is saved as reverse_${rev_domain}.log${clear}\n"
                ;;
        7)
                echo "Joomlavs selected"
                read -p "domain (e.g. google.com)? " joomla_domain
		ruby /root/c0r3/09-cms/joomlavs/joomlavs.rb -u $joomla_domain --scan-all 2>&1 | tee -a joomla_${joomla_domain}.log
		echo -e "\n${yell}Logfile is saved as joomla_${joomla_domain}.log${clear}\n"
                ;;
#        8) - OUTDATE !!
#                echo "Joomscann selected"
#                read -p "domain (e.g. google.com)? " joomscann_domain
#                joomscan -u $joomscan_domain 2>&1 | tee -a joomscan_${joomscan_domain}.log
#                echo -e "\n${yell}Logfile is saved as joomscan_${joomscan_domain}.log${clear}\n"
#                ;;

        a)
                echo "All selected"
                read -p "domain (e.g. google.com)? " all_domain
                if [ $all_domain ]; then
		if [ $cms_system = w ]; then
                wpscan --url $all_domain --enumerate 2>&1 | tee -a all_${all_domain}.log
#		python /root/c0r3/09-cms/CMSmap/cmsmap.py -t $cms_domain -o cmsscan_${cms_domain}.log
#		python /root/c0r3/09-cms/D-TECT/d-tect.py
		python /root/c0r3/09-cms/WPSeku/wpseku.py -t $all_domain 2>&1 | tee -a all_${all_domain}.log
		nikto -host http://$all_domain 2>&1 | tee -a all_${all_domain}.log
		php rev3r531p.php 2>&1 | tee -a reverse_${all_domain}.log && echo -e "${all_domain}\n"
		echo -e "\n${yell}Logfile is saved as all_${all_domain}.log${clear}\n"
		else
		nikto -host http://$all_domain 2>&1 | tee -a all_${all_domain}.log
                php rev3r531p.php 2>&1 | tee -a reverse_${all_domain}.log && echo -e "${all_domain}\n"
		ruby /root/c0r3/09-cms/joomlavs/joomlavs.rb -u $all_domain --scan-all 2>&1 | tee -a all_${all_domain}.log
                echo -e "\n${yell}Logfile is saved as all_${all_domain}.log${clear}\n"
		fi
                else
                echo -e "\nPlease enter a domain!\n"
                fi
                ;;


	x)
		break
		;;
        *)

		echo $"Usage: $0 {1-7|a|x}"
		exit 1
	esac
done
