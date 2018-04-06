#!/bin/bash

# Script for creating backups
#Author: Lázaro Vicente Dias de Faria
#Date: november, 17th, 2017

#============= USER VARIABLE =============
ME=$(whoami)

#============= DIRECTORIES VARIABLES =============
DIR_ORIG="/home/${ME}"
DIR_RAIZ="/home/${ME}/curupira/"
ARCHIVE_NAME="${DIR_ORIG}/Documentos/ScriptBackup/nomes.txt"
DIR_CRON="/home/${ME}/curupira/configCron/"
CRON="/home/${ME}/curupira/configCron/cron"

if [ ! -d "${DIR_RAIZ}" ]; then
	mkdir $DIR_RAIZ
fi

if [ ! -d "${DIR_CRON}" ]; then
	mkdir $DIR_CRON
fi

#============= Menu  =============
Menu(){
  echo "------------------------------------------"
   echo "    Menu Backup          "
   echo "------------------------------------------"
   echo
   echo "[ 1 ] Adicionar Arquivo/Diretório"
   echo "[ 2 ] Agendar"
   echo "[ 3 ] Visualizar Arquivos Selecionados"
   echo "[ 4 ] Sair"
   echo
   echo -n "Qual a opcao desejada ? "
   read opcao
   case $opcao in
      1) Adicionar ;;
      2) Agendar ;;
      3) Visualizar ;;
      4) exit ;;
      *) "Opcao desconhecida." ; echo ; Principal ;;
   esac
}

#============= DEFINING FILES or DIRECTORIES =============
Adicionar() {
  echo "Defina o diretorio ou arquivo para realizar backup: Use . para parar de adicionar arquivos"
  echo -n "${DIR_ORIG}/"
  read BKP

  if [ $BKP != . ]; then
    NAME="${DIR_ORIG}/${BKP}"
    echo "${NAME}" >> $ARCHIVE_NAME
    cat $ARCHIVE_NAME
  fi
  while [ $BKP != . ]; do
    echo "Defina o diretorio ou arquivo para realizar backup: Use . para parar de adicionar arquivos"
    echo -n "${DIR_ORIG}/"
    read BKP

    if [ $BKP != . ]; then
      NAME="${DIR_ORIG}/${BKP}"
      echo "${NAME}" >> $ARCHIVE_NAME
      cat $ARCHIVE_NAME
    fi
  done
  Menu
}
#============= DEFINING DATAS FOR CONFIGURING CRONTAB =============
Visualizar() {
  cat nomes.txt
  Menu
}
#============= DEFINING DATAS FOR CONFIGURING CRONTAB =============
Agendar() {
  echo "Selecione a frequência do backup: 1- Diário, 2-Semanal, 3-Mensal"
  read FREQUENCY

case $FREQUENCY in
  1) echo "Digite o horário em que deseja realizar backup: 0 - 23 "
    read HORA
    echo "Digite os minutos: 0 - 59 "
    read MIN
    DEF_CRONTAB="${MIN} ${HORA} * * * ${DIR_ORIG}/Documentos/ScriptBackup/backup.sh"
    echo "${DEF_CRONTAB}" > $CRON
    crontab < $CRON
    echo "Script agendado.";;

  2) echo "Semanal"
  echo "Digite o horário em que deseja realizar backup: 0 - 23 "
  read HORA
  echo "Digite os minutos: 0 - 59 "
  read MIN
  echo "Digite o dia da semana: 1-Seg ... 7-Domingo"
  read DAY_WEEK
  DEF_CRONTAB="${MIN} ${HORA} * * ${DAY_WEEK}  ${DIR_ORIG}/Documentos/ScriptBackup/backup.sh"
  echo "${DEF_CRONTAB}" > $CRON
  crontab < $CRON
  echo "Script agendado.";;

  3) echo "Mensal"
  echo "Digite o horário em que deseja realizar backup: 0 - 23 "
  read HORA
  echo "Digite os minutos: 0 - 59 "
  read MIN
  echo "Digite o dia do mês: 1-31"
  read DAY
  echo "Digite o mês: 1-Janeiro ... 12-Dezembro"
  read MONTH
  DEF_CRONTAB="${MIN} ${HORA} ${DAY} ${MONTH} *  ${DIR_ORIG}/Documentos/ScriptBackup/backup.sh"
  echo "${DEF_CRONTAB}" > $CRON
  crontab < $CRON
  echo "Script agendado.";;

  *) echo "Opção inválida" ;;
esac

Menu
}
Menu
exit 0
