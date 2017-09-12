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
## B4ckgr0unD
bgblack='\033[40m'		#Hintergrund schwarz
bgred='\033[41m'		#Hintergrund rot
bggreen='\033[42m'		#Hintergrund grün
bgyell='\033[43m'		#Hintergrund gelb
bgblue='\033[44m'		#Hintergrund blau
bgmag='\033[45m'		#Hintergrund magenta
bgturk='\033[46m'		#Hintergrund türkis
bgwhite='\033[47m'		#Hintergrund weiß
#######################################################################

##Variablen
DATE=$(date +%F)

# Local Destination
DESTINATION=/home/bk4/

# Database Backup User
DATABASE_USER='root'
DATABASE_PASSWORD=''
DATABASE_HOST='localhost'

# Logfile
LOG="bk4.log"

# Tools install
#if ! hash exiftool 2>/dev/null; then sudo apt-get update && apt-get upgrade -y; sudo apt-get install --yes exiftool ; fi

# Log & bka-dir check
if [ ! -f $LOG ]; then touch $LOG; fi
if [ ! -d $DESTINATION ]; then mkdir $DESTINATION; fi

