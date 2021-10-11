#!/bin/bash

set -x

#Wed Jun 28 01:44:05 2017: InsertCounts: Last 5 mins: alerts.status (inserts/deduplications): 395, alerts.journal (inserts): 10, alerts.details (inserts): 0
#Wed Jun 28 01:44:05 2017: DBStatus: ALERT: event count (alerts.status) is high: 118289
#Wed Jun 28 01:44:05 2017: DBStatus: ALERT: details count (alerts.details) is high: 3667
#Wed Jun 28 01:44:05 2017: RowCounts: alerts.status: 118289, alerts.journal: 13871, alerts.details: 3667
#Wed Jun 28 01:44:29 2017: WebGUI Status: ALERT:JVM memory usage is 699 MB of capacity 768 MB: 91%
#Wed Jun 28 01:44:29 2017: WebGUI Status: ALERT: Web GUI NCOMS data source VMM sync maximum response time: 15,694.578 secs
#Wed Jun 28 01:45:29 2017: WebGUI Status: ALERT: Web GUI NCOMS data source EVENTLIST cache size is 3, hit rate: 3%
#Wed Jun 28 01:45:29 2017: WebGUI Status: ALERT: Web GUI Security Repository maximum response time: 16.101 secs

APP="omnibus.self.monitoring"
AGENT="omni_alarms2idb.sh"
MYHOST=$(hostname -f)
#OPENTSDB="adapter-opentsdb.idb.viasat.io"
#OPENTSDB="adapter-opentsdb.preprod.idb.viasat.io"
OPENTSDB="adapter-opentsdb.dev.idb.viasat.io"
#TRIGGER_LOG="Trigger2idb_stats.log"
#TESTLOG="TEST.log"
#>$TRIGGER_LOG
#>$TESTLOG
#{
#INFILE="saved_NCOMS_trigger_stats.log1"
tail -Fn0 NCOMS_trigger_stats.log1 | \
#while IFS='' read -r line || [[ -n "$line" ]]
while IFS='' read -r line
do
        if [[ "$line" =~ ALERT: ]]
        then
                if [[ "$line" =~ DBStatus && "$line" =~ event ]]
                then
                        LOGDATE=`echo "$line"|cut -d" " -f1,2,3,4,5|cut -d":" -f1,2,3`
                        DATE_CONVERTED=$(date --date="${LOGDATE}" '+%s')
                        ALERT_MESSAGE=$(echo "$line"|cut -d" " -f6,7,8,9,10,11,12)
                        ALERT_VALUE=$(echo "$line"|cut -d" " -f13)
                        ALERT_METRIC="omnibus.objsrv.alarms2idb"
                        ALARM_NAME=$(echo "$line"|cut -d"(" -f2|cut -d")" -f1)
                        MESSAGE="put $ALERT_METRIC $DATE_CONVERTED $ALERT_VALUE app=${APP} alert_message=$ALERT_MESSAGE alarm_name=$ALARM_NAME"

                        exec 3>/dev/tcp/${OPENTSDB}/4242
                        echo -e "${MESSAGE}\n" >&3
                        exec 3>&-
                        #echo "$MESSAGE" >> $TESTLOG

                elif [[ "$line" =~ "WebGUI Status" ]]
                then
                        LOGDATE=$(echo "$line"|cut -d" " -f1,2,3,4,5|cut -d":" -f1,2,3)
                        DATE_CONVERTED=$(date --date="$LOGDATE" '+%s')
                        ALERT_MESSAGE=$(echo "$line"|cut -d" " -f6,7,8,9,10,11,12)
                        ALERT_VALUE=$(echo "$line"|cut -d" " -f13)
                        ALERT_METRIC="omnibus.objsrv.alarms2idb"
                        ALARM_NAME=$(echo "$line"|cut -d"(" -f2|cut -d")" -f1)
                        MESSAGE="put $ALERT_METRIC $DATE_CONVERTED $ALERT_VALUE app=${APP} alert_message=$ALERT_MESSAGE alarm_name=$ALARM_NAME"

                        exec 3>/dev/tcp/${OPENTSDB}/4242
                        echo -e "${MESSAGE}\n" >&3
                        exec 3>&-
                        #echo "$MESSAGE" >> $TESTLOG
                fi
        fi
done
#} 2>&1 | tee -a $TRIGGER_LOG
#done < "$INFILE"
#} 2>&1 | tee -a $TESTLOG
