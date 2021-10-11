#!/bin/sh
# This script creates monthly backups of the bash history file. Make sure you have
# HISTSIZE set to large number (more than number of commands you can type in every
# month). It keeps up to the last 10000 commands when it "rotates" history file every month.
#
#Copy this script to your users home directory
#and put the below 2 lines in your users .bash_profile or ~/.bashrc
#
# HISTSIZE=10000 - (sets the history file line limit to 10,000)
# ~/bkp_hist.sh - (This is the name and path of this script)
#
#

KEEP=10000
BASH_HIST=~/.bash_history
BACKUP=$BASH_HIST.$(date +%y%m)

if [ -s "$BASH_HIST" -a "$BASH_HIST" -nt "$BACKUP" ]; then
  # history file is newer then backup
  if [[ -f $BACKUP ]]; then
    # there is already a backup
    cp -f $BASH_HIST $BACKUP
  else
    # create new backup, leave last few commands and reinitialize
    mv -f $BASH_HIST $BACKUP
    tail -n$KEEP $BACKUP > $BASH_HIST
    history -r
  fi
fi
