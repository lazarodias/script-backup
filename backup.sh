#!/bin/bash

# Script for creating backups
#Author: Lázaro Vicente Dias de Faria
#Date: november, 17th, 2017

#============= HELP VARIABLES =============
DATA=`/bin/date +%Y-%m-%d-`
HORA=`/bin/date +%H-%M`
EXT=".tar.gz"
ME=$(whoami)
LIST=$(cat /home/${ME}/Documentos/ScriptBackup/nomes.txt)
LOG="/home/${ME}/curupira/log/"
#============= DIRECTORIES ACTION =============
DIR_DEST="/home/${ME}/curupira/backups/"

if [ ! -d "${DIR_DEST}" ]; then
	mkdir $DIR_DEST
fi

if [ ! -d "${LOG}" ]; then
	mkdir $LOG
fi
#============= LOADING NOMES.TXT - EXECUTING BACKUP - GENERATE LOG=============
for line in $LIST; do
  NAME="${line}-";

  tar -czpf ${DIR_DEST}${NAME////_}${DATA}${HORA}${EXT} ${line}
  echo "${NAME////_}${DATA}${HORA}${EXT}" >> "$LOG/backup.log"

done

exit 0
