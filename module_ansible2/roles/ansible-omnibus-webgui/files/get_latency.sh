#!/bin/bash

set -x

APP="latency.monitoring"
AGENT="get_latency.sh"
MYHOST=$(hostname -f)

#OPENTSDB="adapter-opentsdb.idb.viasat.io"
#OPENTSDB="adapter-opentsdb.preprod.idb.viasat.io"
#OPENTSDB="adapter-opentsdb.dev.idb.viasat.io"

#################################
MYDATE=$(date '+%d/%m/%Y:%H:%M:%S')
FB_DUMP="/opt/viasat/omnibus/data/gateway-ff/filebeat_dump"
FB_ENTRY1="/opt/viasat/omnibus/data/gateway-ff/filebeat_entry1"
FB_ENTRY="/opt/viasat/omnibus/data/gateway-ff/filebeat_entry"
LATENCYLOG="/opt/viasat/omnibus/data/gateway-ff/LATENCY.log"
LAST_OMNIBUS_TIME=$(cat /opt/viasat/omnibus/data/gateway-ff/last_omnibus_time)
GETHOST=$(hostname -f|cut -d"." -f2)
MYENVIRONMENT=${GETHOST^^}
################################################
# Check environment to choose open tsdb adapter
################################################
if [ "$MYENVIRONMENT" = 'DEV' ]
then
        OPENTSDB="adapter-opentsdb.dev.idb.viasat.io"
elif [ "$MYENVIRONMENT" = 'PREPROD' ]
then
        OPENTSDB="adapter-opentsdb.preprod.idb.viasat.io"
elif [ "$MYENVIRONMENT" = 'NMS' ]
then
        OPENTSDB="adapter-opentsdb.idb.viasat.io"
else
        echo "No Environment found. This script will now exit" >> ${OMNISM_LOG}
        exit
fi

{
echo "===$MYDATE=========================================="
docker logs --tail=6000 filebeat-gateway-ff-journal &> $FB_DUMP
grep -B9 Reader $FB_DUMP | grep -v ALERT | tail -10 &> $FB_ENTRY

FILE_ENTRY=$(grep 'Gateway Reader connected' $FB_ENTRY|cut -d" " -f10,11,12)

if [ "$FILE_ENTRY" != 'Gateway Reader connected' ]
then
        >$FB_DUMP
        >$FB_ENTRY
        sleep 20
        docker logs --tail=6000 filebeat-gateway-ff-journal &> $FB_DUMP
        grep -B9 Reader $FB_DUMP | grep -v ALERT | tail -10 &> $FB_ENTRY
else

        PRE_FILEBEAT_PUBLISHED_TIME=$(head -1 $FB_ENTRY | cut -d"." -f1)
        PRE_FILEBEAT_RECEIVED_TIME=$(grep '@timestamp' $FB_ENTRY |cut -d'"' -f4|cut -d"." -f1)
        SYNTH_EVENT=$(grep Reader $FB_ENTRY|grep gateway-ff-journal)
        #SYNTH_EVENT=$(grep Reader $FB_ENTRY|grep gateway-ff-journal)
        #SYNTH_EVENT=$(grep 'Event count (alerts.status)' $FB_ENTRY)
        echo "PRE_FILEBEAT_PUBLISHED_TIME: $PRE_FILEBEAT_PUBLISHED_TIME"
        echo "PRE_FILEBEAT_RECEIVED_TIME: $PRE_FILEBEAT_RECEIVED_TIME"

        while IFS='^' read OMNISM_STATUS OMNISM_IDENTIFIER OMNISM_SERIAL OMNISM_NODE OMNISM_NODEALIAS OMNISM_MANAGER OMNISM_AGENT OMNISM_ALERTGROUP OMNISM_ALERTKEY OMNISM_SEVERITY OMNISM_SUMMARY OMNISM_STATECHANGE OMNISM_FIRSTOCCURRENCE OMNISM_LASTOCCURRENCE OMNISM_INTERNALLAST OMNISM_POLL OMNISM_TYPE OMNISM_TALLY OMNISM_CLASS OMNISM_GRADE
                do

                        OMNISM_STATUS=$(echo "$OMNISM_STATUS"|cut -d":" -f1|cut -d'"' -f4)
                        OMNISM_IDENTIFIER=$(echo "$OMNISM_IDENTIFIER"|cut -d"\`" -f2)
                        OMNISM_SERIAL=$(echo "$OMNISM_SERIAL"|cut -d"\`" -f2)
                        OMNISM_NODE=$(echo "$OMNISM_NODE"|cut -d"\`" -f2)
                        OMNISM_NODEALIAS=$(echo "$OMNISM_NODEALIAS"|cut -d"\`" -f2)
                        OMNISM_MANAGER=$(echo "$OMNISM_MANAGER"|cut -d"\`" -f2)
                        OMNISM_AGENT=$(echo "$OMNISM_AGENT"|cut -d"\`" -f2)
                        OMNISM_ALERTGROUP=$(echo "$OMNISM_ALERTGROUP"|cut -d"\`" -f2)
                        OMNISM_ALERTKEY=$(echo "$OMNISM_ALERTKEY"|cut -d"\`" -f2)
                        OMNISM_SEVERITY=$(echo "$OMNISM_SEVERITY"|cut -d"\`" -f2)
                        OMNISM_SUMMARY=$(echo "$OMNISM_SUMMARY"|cut -d"\`" -f2)
                        OMNISM_STATECHANGE=$(echo "$OMNISM_STATECHANGE"|cut -d"\`" -f2)
                        OMNISM_FIRSTOCCURRENCE=$(echo "$OMNISM_FIRSTOCCURRENCE"|cut -d"\`" -f2)
                        OMNISM_LASTOCCURRENCE=$(echo "$OMNISM_LASTOCCURRENCE"|cut -d"\`" -f2)
                        OMNISM_INTERNALLAST=$(echo "$OMNISM_INTERNALLAST"|cut -d"\`" -f2)
                        OMNISM_POLL=$(echo "$OMNISM_POLL"|cut -d"\`" -f2)
                        OMNISM_TYPE=$(echo "$OMNISM_TYPE"|cut -d"\`" -f2)
                        OMNISM_TALLY=$(echo "$OMNISM_TYPE"|cut -d"\`" -f2)
                        OMNISM_CLASS=$(echo "$OMNISM_TYPE"|cut -d"\`" -f2)
                        OMNISM_GRADE=$(echo "$OMNISM_TYPE"|cut -d"\`" -f2)
                        LOGDATE=$(echo "$OMNISM_STATECHANGE")
                        LOGDATE2=$(echo "$LOGDATE"|sed 's/ /_/')
                        OMNISM_METRIC="omni2idb.latency"
                        OMNIBUS_TIME=$(date --date="$LOGDATE" '+%s')
                        FILEBEAT_PUBLISHED_TIME=$(date --date="$PRE_FILEBEAT_PUBLISHED_TIME" '+%s')
                        FILEBEAT_RECEIVED_TIME=$(date --date="$PRE_FILEBEAT_RECEIVED_TIME" '+%s')
                        OBJSRV_2_FILEBEAT_LATENCY=$(echo "$FILEBEAT_RECEIVED_TIME - $OMNIBUS_TIME"|bc)
                        FILEBEAT_2_LOGSTASH_LATENCY=$(echo "$FILEBEAT_PUBLISHED_TIME - $FILEBEAT_RECEIVED_TIME"|bc)
                        CURRENT_TIME=$(date '+%s')
                        echo "Current Time: $MYDATE  $CURRENT_TIME" >> $LATENCYLOG
                        echo "Previous Omnibus StateChange Time: $LAST_OMNIBUS_TIME" >> $LATENCYLOG
                        echo "Omnibus StateChange Time: $LOGDATE  $OMNIBUS_TIME" >> $LATENCYLOG
                        echo "Filebeat Received Time: $PRE_FILEBEAT_RECEIVED_TIME  $FILEBEAT_RECEIVED_TIME" >> $LATENCYLOG
                        echo "Filebeat Published Time: $PRE_FILEBEAT_PUBLISHED_TIME  $FILEBEAT_PUBLISHED_TIME" >> $LATENCYLOG
                        MESSAGE1="put $OMNISM_METRIC $CURRENT_TIME $OBJSRV_2_FILEBEAT_LATENCY app=${APP} metric_name=OBJSRV_2_FILEBEAT_LATENCY omnibus_statechange_date=$LOGDATE2 fb_received_time=$FILEBEAT_RECEIVED_TIME omnibus_time=$OMNIBUS_TIME agent=$AGENT metric_unit=seconds"
                        MESSAGE2="put $OMNISM_METRIC $CURRENT_TIME $FILEBEAT_2_LOGSTASH_LATENCY app=${APP} metric_name=FILEBEAT_2_LOGSTASH_LATENCY omnibus_statechange_date=$LOGDATE2 fb_published_time=$FILEBEAT_PUBLISHED_TIME fb_received_time=$FILEBEAT_RECEIVED_TIME agent=${AGENT} metric_unit=seconds"

                        exec 3>/dev/tcp/${OPENTSDB}/4242
                        echo -e "${MESSAGE1}\n" >&3
                        exec 3>&-
                        echo "$MESSAGE1" >> $LATENCYLOG

                        exec 3>/dev/tcp/${OPENTSDB}/4242
                        echo -e "${MESSAGE2}\n" >&3
                        exec 3>&-
                        echo "$MESSAGE2" >> $LATENCYLOG
                        echo "$OMNIBUS_TIME" > /opt/viasat/omnibus/data/gateway-ff-journal/last_omnibus_time
        #               fi
                done <<< "$SYNTH_EVENT"
fi
        echo "##############################################"
        } 2>&1 | tee -a $LATENCYLOG
        echo " " >> $LATENCYLOG
