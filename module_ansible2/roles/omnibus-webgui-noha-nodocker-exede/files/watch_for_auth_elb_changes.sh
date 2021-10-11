#!/bin/bash

MYDATE=`date +"%m%d%Y_%H_%M"`
MYDATE2=`date`
LOGFILE="/opt/watch_for_auth_elb_changes.log"
#PIDFILE="/opt/watch_for_auth_elb_changes.pid"
{
if [ -e $LOGFILE ]
then
	nothing="nothing"
else
        >$LOGFILE
fi

if [ -f $PIDFILE ]
then
        PID=$(cat $PIDFILE)
        ps -p $PID > /dev/null 2>&1
        if [ $? -eq 0 ]
        then
                echo "Process already running" >> $LOGFILE
                exit 1
        else
                dig auth.us-or.viasat.io | grep "IN A" | awk '{print $5}' | sort > /tmp/current_auth_elb_members
                chmod 777 /tmp/current_auth_elb_members
                if [ -f /tmp/previous_auth_elb_members ];
                then
                        AUTH_ELB_DIFF=`diff /tmp/previous_auth_elb_members /tmp/current_auth_elb_members | wc -l`
                        if [ "$AUTH_ELB_DIFF" = "0" ]; then
                                echo "auth elb members are unchanged" >> $LOGFILE
                        else
				echo "=============================================================" >> $LOGFILE
                                echo "$MYDATE2 - Problem: auth elb members changed... waiting 10 seconds and checking again" >> $LOGFILE
                                sleep 10
                                dig auth.us-or.viasat.io | grep "IN A" | awk '{print $5}' | sort > /tmp/current_auth_elb_members
                                chmod 777 /tmp/current_auth_elb_members
                                AUTH_ELB_DIFF=`diff /tmp/previous_auth_elb_members /tmp/current_auth_elb_members | wc -l`
                                if [ "$AUTH_ELB_DIFF" != "0" ]; then
                                        PIDFILE="/opt/watch_for_auth_elb_changes.pid"
                                        PREV1=`head -1 /tmp/previous_auth_elb_members`
                                        PREV2=`tail -1 /tmp/previous_auth_elb_members`
                                        CURR1=`head -1 /tmp/current_auth_elb_members`
                                        CURR2=`tail -1 /tmp/current_auth_elb_members`
                                        echo "PROBLEM: ELB has changed. Previous ($PREV1, $PREV2)- Current ($CURR1,$CURR2). SSSD service and WebGUI server will be restarted."
                                        echo "auth elb members still different after 10 seconds... restarting sssd & webgui to clear stale dns entries" >> $LOGFILE
                                        echo "Restarting sssd...." >> $LOGFILE
                                        /usr/bin/systemctl restart sssd
                                        echo "Restarting the webgui server...." >> $LOGFILE
                                       	/opt/IBM/JazzSM/profile/bin/stopServer.sh server1 -username smadmin -password smadmin 
                                       	/opt/IBM/JazzSM/profile/bin/startServer.sh server1 -username smadmin -password smadmin 
                                        echo "=============================================================" >> $LOGFILE
                                        rm -f $PIDFILE
                                fi
                        fi
                fi
                dig auth.us-or.viasat.io | grep "IN A" | awk '{print $5}' | sort > /tmp/previous_auth_elb_members
                chmod 777 /tmp/previous_auth_elb_members
                if [ $? -ne 0 ]
                then
                        echo "Could not create PID file" >> $LOGFILE
                        echo "Script is exiting....." >> $LOGFILE
                        exit 1
                fi
        fi
else
        echo $$ > $PIDFILE >> $LOGFILE
        if [ $? -ne 0 ]
        then
                echo "Could not create PID file" >> $LOGFILE
                echo "Script is exiting....." >> $LOGFILE
                exit 1
        fi
fi
} 2>&1 | tee -a $LOGFILE
