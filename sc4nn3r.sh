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

#wpscan --url http://bieradvent.bernyboi.com/ -enumerate

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
read -e TASTE
clear
echo '+-------------------------------------------------+'
echo '| Own-Scripts, Aux & Scanner-Frames               |'
echo '+-------------------------------------------------+'
echo '| 1.Arachni.                                      |'
echo '| 2.Nessus.                                       |'
echo '| 3.Getsploit.                                    |'
echo '+-------------------------------------------------+'
read -p "Attacker Nr (1-4)? " attacker
##
## Schleife
##
if [ $debupdate = y ]; then
        apt-get update && apt-get upgrade -y
        apt-get dist-upgrade -y
        apt autoremove -y
        apt-get clean
        echo "thx 4 update"
else
        echo "
install without update!
"
fi
#exit


#case "$1" in
case "$attacker" in
        1)
		echo "Arachni selected"
            ;;
        2)
		echo "Nessus selected"
            ;;
        3)
		echo "Getsploit selected"
            ;;
        4)
            if test "x`pidof anacron`" != x; then
                stop
                start
            fi
            ;;
        *)

	echo $"Usage: $0 {start|stop|restart|condrestart|status}"
	exit 1
esac
