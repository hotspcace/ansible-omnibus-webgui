#!/bin/sh
#	Cold-StandBy Gateway Failover Script
#	It works by bringing up a cold-standby backup Gateway when it detects
#	that the primary is down and shuts down the backup when the primary
#	comes back up again.
#
#   Needs to be configured under PA control (not PA aware) on the host machine where the backup gateway will run.

# ObjectServer Gateway names
PRIMARY_GATEWAY='FLAT_FILE_GATE_PRIMARY'
SECONDARY_GATEWAY='FLAT_FILE_GATE_BACKUP'
PA_NAME=''
BACKUP_GATEWAY_PROCESS_NAME='BackupGateway'
NCO_USER='ncouser'
NCO_PASS='netcool'

# Set this for number of retries before entering failure mode
RETRIES="5"

# Set this for number of failback retries 
FAILBACKRETRIES="5"

# Set this for poll period
POLL="5"

# Set this for failback poll period
FAILBACKPOLL="60"

# Location of nco_ping
NCO_PING=$OMNIHOME/bin/nco_ping


# Environment
if [ -z "$OMNIHOME" ]; then
    logger -p daemon.notice -t FAILOVERMONITOR "OMNIHOME environment variable not set, using /opt/netcool/omnibus."
    OMNIHOME=/opt/netcool/omnibus 
    export OMNIHOME
fi
############################ subroutines
normal_poll() {
    COUNT="0"
    while [ "$COUNT" -lt "$RETRIES" ]  
    do
        # Is the Primary responding?
        $NCO_PING $PRIMARY_GATEWAY >/dev/null 2>&1
        if [ "$?" -ne 0 ]; then
            COUNT=`expr $COUNT + 1` 
            logger -p daemon.notice -t FAILOVERMONITOR "$PRIMARY_GATEWAY failed to respond.  Count is $COUNT."
        else 
            COUNT="0"   
        fi
        sleep $POLL
    done
    logger -p daemon.notice -t FAILOVERMONITOR "$PRIMARY_GATEWAY failed to repond $RETRIES times."
}
############################ End normal_poll
failed_poll() {
    UNAVAILABLE="1"
    while [ "$UNAVAILABLE" -eq "1" ]
    do
    # Is the Primary responding?
                $NCO_PING $PRIMARY_GATEWAY >/dev/null 2>&1
                if [ "$?" -eq 0 ]; then 
            UNAVAILABLE="0"
        else    
            sleep $POLL
        fi
    done    
}
############################ End failed_poll
start_backup() {
$OMNIHOME/bin/nco_pa_start -server $PA_NAME -user $NCO_USER -password $NCO_PASS -process $BACKUP_GATEWAY_PROCESS_NAME
}
############################ End send_down
confirm_failover() {
  COUNT="0"
  FAILEDOVER="0"
  while [ "$FAILEDOVER" -eq "0" ]
    do
      if [ "$COUNT" -lt "$FAILBACKRETRIES" ]; then
        logger -p daemon.notice -t FAILOVERMONITOR "Starting backup Gateway..."
        start_backup
        if [ "$?" -eq 0 ]; then
          FAILEDOVER="1"
          logger -p daemon.notice -t FAILOVERMONITOR "Backup Gateway started."
        else 
          FAILEDOVER="0"  
          COUNT=`expr $COUNT + 1` 
          logger -p daemon.notice -t FAILOVERMONITOR "$SECONDARY_GATEWAY failed to start.  Count is $COUNT."
          sleep $FAILBACKPOLL
        fi
      fi
    done
    if [ "$FAILEDOVER" -eq "0" ]; then
      logger -p daemon.notice -t FAILOVERMONITOR "Neither $PRIMARY_GATEWAY nor $SECONDARY_GATEWAY are running!  Please correct manually."
    fi  
}
############################ End confirm_failover
shutdown_backup() {
$OMNIHOME/bin/nco_pa_stop -server $PA_NAME -user $NCO_USER -password $NCO_PASS -process $BACKUP_GATEWAY_PROCESS_NAME
}
############################ End send_up
confirm_failback() {
  COUNT="0"
  FAILEDBACK="0"
  while [ "$FAILEDBACK" -eq "0" ]
    do
      if [ "$COUNT" -lt "$FAILBACKRETRIES" ]; then
        logger -p daemon.notice -t FAILOVERMONITOR "Shutting down backup Gateway..."
        shutdown_backup
        if [ "$?" -eq 0 ]; then
          FAILEDBACK="1"
          logger -p daemon.notice -t FAILOVERMONITOR "Backup Gateway shut down."
        else 
          FAILEDBACK="0"  
          COUNT=`expr $COUNT + 1` 
          logger -p daemon.notice -t FAILOVERMONITOR "$SECONDARY_GATEWAY failed to respond.  Count is $COUNT."
          sleep $FAILBACKPOLL
        fi
      fi
    done
    if [ "$FAILEDBACK" -eq "0" ]; then
      logger -p daemon.notice -t FAILOVERMONITOR "Both $PRIMARY_GATEWAY and $SECONDARY_GATEWAY are running!  Please correct manually."
    fi  
}
############################ End confirm_failback
# Script starts here
while [ "1" -eq "1" ] 
do
    logger -p daemon.notice -t FAILOVERMONITOR "Entering normal polling cycle."
    normal_poll

    logger -p daemon.notice -t FAILOVERMONITOR "Bringing up backup Gateway."
    confirm_failover

    logger -p daemon.notice -t FAILOVERMONITOR "Entering failure-mode polling cycle."
    failed_poll
    
    logger -p daemon.notice -t FAILOVERMONITOR "Shutting down backup Gateway."
    confirm_failback
done

