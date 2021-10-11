#!/bin/bash

set -x
MYDATE=`date +"%m%d%Y_%H_%M"`
#MYPROC=`ps -ef | grep "watch_for_auth_elb_changes.sh" | grep -v grep | awk '{print $2}'`
#NEWPROC=`echo $MYPROC|cut -d" " -f1`
PIDFILE="/opt/pidme"
if [ -f $PIDFILE ]; then
        echo "Process already running...Exiting"
        exit
else
        dig auth.us-or.viasat.io | grep "IN A" | awk '{print $5}' | sort > /opt/current_auth_elb_members
        chmod 777 /opt/current_auth_elb_members
        if [ -f /opt/previous_auth_elb_members ];
        then
                AUTH_ELB_DIFF=`diff /opt/previous_auth_elb_members /opt/current_auth_elb_members | wc -l`
                if [ "$AUTH_ELB_DIFF" = "0" ]; then
                        #echo "auth elb members are unchanged" | logger -i
                else
                        #echo "auth elb members changed... waiting 30 seconds and checking again" | logger -i
                        sleep 30
                        dig auth.us-or.viasat.io | grep "IN A" | awk '{print $5}' | sort > /opt/current_auth_elb_members
                        chmod 777 /opt/current_auth_elb_members
                        AUTH_ELB_DIFF=`diff /opt/previous_auth_elb_members /opt/current_auth_elb_members | wc -l`
                        if [ "$AUTH_ELB_DIFF" != "0" ]; then
                                echo "PROBLEM: auth elb members still different after 30 seconds... restarting sssd & webgui to clear stale dns entries" >> $LOGFILE
                                touch /opt/pidme
                                /usr/bin/systemctl restart sssd
                                sleep 10
                                /bin/docker exec -i webgui bash -l -c /opt/viasat/omnibus/configs/webgui/restart_webgui.sh
                                rm -f /opt/pidme
                        fi
                fi
        else
        dig auth.us-or.viasat.io | grep "IN A" | awk '{print $5}' | sort > /opt/previous_auth_elb_members
        chmod 777 /opt/previous_auth_elb_members
        fi
fi
