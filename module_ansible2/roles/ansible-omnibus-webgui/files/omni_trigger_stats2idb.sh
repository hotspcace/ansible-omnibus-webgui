#!/bin/bash

#set -x

APP="omnibus.self.monitoring"
AGENT="omni_trigger_stats2idb.sh"
MYHOST=$(hostname -f)
#OPENTSDB="adapter-opentsdb.idb.viasat.io"
#OPENTSDB="adapter-opentsdb.preprod.idb.viasat.io"
#OPENTSDB="adapter-opentsdb.dev.idb.viasat.io"
#TRIGGER_LOG="Trigger2idb_stats.log"
#TESTLOG="TEST.log"
#>$TRIGGER_LOG
#>$TESTLOG
#{
#INFILE="saved_NCOMS_trigger_stats.log1"
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

tail -n0 --pid=$$ -F /opt/IBM/tivoli/netcool/omnibus/log/AGG_P_trigger_stats.log1 | \
while IFS='' read -r line
do
        if [[ "$line" =~ (60s) ]]
        then
                DATEPPART1=$(echo "$line"|cut -d" " -f1)
                DATEPPART2=$(echo "$line"|cut -d" " -f2)
                DATEPPART3=$(echo "$line"|cut -d" " -f3)
                DATEPPART4=$(echo "$line"|cut -d" " -f4|cut -d":" -f1,2)
                DATEPPART5=$(echo "$line"|cut -d" " -f5|cut -d":" -f1)

                LOGDATE=$(echo "${DATEPPART1} ${DATEPPART2} ${DATEPPART3} ${DATEPPART4} ${DATEPPART5}")
                DATE_CONVERTED=$(date --date="${LOGDATE}" '+%s')
                TOTAL_TTIME=`echo "$line"|cut -d" " -f14|cut -d"s" -f1`
                TOTAL_PTIME=`grep Total NCOMS_profiler_report.log1|tail -1|cut -d" " -f13|cut -d")" -f1|cut -d"(" -f2|cut -d"s" -f1`
                TOTAL_VALUE=$(echo "scale=2; ${TOTAL_TTIME} + ${TOTAL_PTIME}"|bc)

                METRIC="omnibus.objsrv.total.trigger.time"
                METRIC2="omnibus.objsrv.total.combo.time"
                MESSAGE="put $METRIC $DATE_CONVERTED $TOTAL_TTIME app=${APP} agent=${AGENT}"
                MESSAGE2="put $METRIC2 $DATE_CONVERTED $TOTAL_VALUE app=${APP} agent=${AGENT}"

                exec 3>/dev/tcp/${OPENTSDB}/4242
                echo -e "${MESSAGE}\n" >&3
                exec 3>&-
                #echo "$MESSAGE" >> $TESTLOG

                exec 3>/dev/tcp/${OPENTSDB}/4242
                echo -e "${MESSAGE2}\n" >&3
                exec 3>&-
                #echo "$MESSAGE" >> $TESTLOG


        elif [[ "$line" =~ "Trigger time" ]]
        then
                DATEPPART1=$(echo "$line"|cut -d" " -f1)
                DATEPPART2=$(echo "$line"|cut -d" " -f2)
                DATEPPART3=$(echo "$line"|cut -d" " -f3)
                DATEPPART4=$(echo "$line"|cut -d" " -f4|cut -d":" -f1,2)
                DATEPPART5=$(echo "$line"|cut -d" " -f5|cut -d":" -f1)

                LOGDATE=$(echo "${DATEPPART1} ${DATEPPART2} ${DATEPPART3} ${DATEPPART4} ${DATEPPART5}")
                DATE_CONVERTED=$(date --date="$LOGDATE" '+%s')
                APP_NAME=$(echo "$line"|cut -d"'" -f2)
                APP_VALUE=$(echo "$line"|cut -d" " -f14|cut -d"s" -f1)
                METRIC="omnibus.objsrv.trigger.time"
                MESSAGE="put $METRIC $DATE_CONVERTED $APP_VALUE app=${APP} trigger_name=${APP_NAME} agent=${AGENT}"

                if [[ "$line" =~ "0.000000" ]]
                then
                        Nothing="nada"
                else
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
