# Script-backup in shell
Script developed in function of the activity of evaluation of the Matter of Programming for Networks.

Developed by:
Name: Lázaro Vicente Dias de Faria
Registration: UC16210316

Information:
- The script has the functionality to back up the desired file, as long as it is in the directory "/ home / USER / ...".
- It also has the functionality to choose the periodicity in which it can work, there are 3 options: Daily, Weekly and Monthly.
- Log Generation, informing which files were backed up.

Instructions:
Entering the directory: cd / home / $ {whoami} / Documents / ScriptBackup
Granting Execution Permission:
sudo chmod + x backup.sh
sudo chmog + x definition.sh
Running: ./definition.sh

After the execution command, there will be a menu assisting the instruction.
Option 1: Include directories or files to be backed up. Note: Include and finalize the inclusion with ".".
Option 2: Sets the frequency with which the backup will be performed.
Option 3: Provides the option to check the directories selected for backup;
Option 4: Exit the menu

Log Check:
-Open the backup.log file, which is in the folder where the script is executed or execute:
cat /home/$(whoami)/Documents/ScriptBackup/backup.log
