#!/bin/bash

#set -x

APP="omnibus.self.monitoring"
MYHOST=$(hostname -f)
AGENT="omni_profiler_stats2idb.sh"
PROFILER_LOG="profiler2idb_stats.log"
TESTLOG="TEST.log"
#>$TESTLOG
>$PROFILER_LOG
#{
#INFILE="saved_NCOMS_profiler_report.log1"
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


n=0
tail -n0 --pid=$$ -F /opt/IBM/tivoli/netcool/omnibus/log/AGG_P_profiler_report.log1 | \
while IFS='' read -r line
do
        if [[ "$line" =~ Total ]]
        then
                DATEPPART1=$(echo "$line"|cut -d" " -f1)
                DATEPPART2=$(echo "$line"|cut -d" " -f2)
                DATEPPART3=$(echo "$line"|cut -d" " -f3)
                DATEPPART4=$(echo "$line"|cut -d" " -f4|cut -d":" -f1,2)
                DATEPPART5=$(echo "$line"|cut -d" " -f5|cut -d":" -f1)

                LOGDATE=$(echo "${DATEPPART1} ${DATEPPART2} ${DATEPPART3} ${DATEPPART4} ${DATEPPART5}")
                DATE_CONVERTED=$(date --date="${LOGDATE}" '+%s')
                TOTAL_PERIOD=`echo "$line"|cut -d" " -f12|cut -d")" -f1|cut -d"(" -f2|cut -d"s" -f1`
                PERIOD_VALUE=`echo "$line"|cut -d" " -f13|cut -d")" -f1|cut -d"(" -f2|cut -d"s" -f1`
                METRIC1="omnibus.objsrv.total.apptime.period"
                METRIC2="omnibus.objsrv.total.apptime.value"
                MESSAGE1="put $METRIC1 $DATE_CONVERTED $TOTAL_PERIOD app=$APP agent=${AGENT}"
                MESSAGE2="put $METRIC2 $DATE_CONVERTED $PERIOD_VALUE app=$APP agent=${AGENT}"

                exec 3>/dev/tcp/${OPENTSDB}/4242
                echo -e "${MESSAGE1}\n" >&3
                exec 3>&-
                echo "$MESSAGE1" >> $TESTLOG

                exec 3>/dev/tcp/${OPENTSDB}/4242
                echo -e "${MESSAGE2}\n" >&3
                exec 3>&-
                echo "$MESSAGE2" >> $TESTLOG
                n=0

        elif [[ "$line" =~ Execution ]]
        then
                DATEPPART1=$(echo "$line"|cut -d" " -f1)
                DATEPPART2=$(echo "$line"|cut -d" " -f2)
                DATEPPART3=$(echo "$line"|cut -d" " -f3)
                DATEPPART4=$(echo "$line"|cut -d" " -f4|cut -d":" -f1,2)
                DATEPPART5=$(echo "$line"|cut -d" " -f5|cut -d":" -f1)

                LOGDATE=$(echo "${DATEPPART1} ${DATEPPART2} ${DATEPPART3} ${DATEPPART4} ${DATEPPART5}")
                DATE_CONVERTED=$(date --date="$LOGDATE" '+%s')
                APP_NAME=$(echo "$line"|cut -d"'" -f2)
                METRIC="omnibus.objsrv.apptime.group.${APP_NAME,,}"
                APP_VALUE=$(echo "$line"|cut -d" " -f16|cut -d"s" -f1)
                MESSAGE="put $METRIC $DATE_CONVERTED $APP_VALUE app=$APP agent=${AGENT}"
                APP_VALUE=$(echo "$line"|cut -d" " -f16|cut -d"s" -f1)

                exec 3>/dev/tcp/${OPENTSDB}/4242
                echo -e "${MESSAGE}\n" >&3
                exec 3>&-
                echo "$MESSAGE" >> $TESTLOG

        elif [[ "$line" =~ uid ]]
        then
                if [[ ! "$line" =~ OSLC && ! "$line" =~ WEBTOP ]]
                then
                        DATEPPART1=$(echo "$line"|cut -d" " -f1)
                        DATEPPART2=$(echo "$line"|cut -d" " -f2)
                        DATEPPART3=$(echo "$line"|cut -d" " -f3)
                        DATEPPART4=$(echo "$line"|cut -d" " -f4|cut -d":" -f1,2)
                        DATEPPART5=$(echo "$line"|cut -d" " -f5|cut -d":" -f1)

                        LOGDATE=$(echo "${DATEPPART1} ${DATEPPART2} ${DATEPPART3} ${DATEPPART4} ${DATEPPART5}")
                        DATE_CONVERTED=$(date --date="$LOGDATE" '+%s')
                        APP_NAME=$(echo "$line"|cut -d"'" -f2)
                        APP_HOST=$(echo "$line"|cut -d" " -f12|cut -d":" -f1|cut -d"." -f1|sed 's/omnibus-//')
                        METRIC="omnibus.objsrv.apptime"
                        APP_VALUE=$(echo "$line"|cut -d" " -f13|cut -d"s" -f1)
                        MESSAGE="put $METRIC $DATE_CONVERTED $APP_VALUE app=$APP app_name=$APP_NAME app_host_name=$APP_HOST agent=${AGENT}"

                        exec 3>/dev/tcp/${OPENTSDB}/4242
                        echo -e "${MESSAGE}\n" >&3
                        exec 3>&-
                        echo "$MESSAGE" >> $TESTLOG

                elif [[ "$line" =~ OSLC ]]
                then
                        DATEPPART1=$(echo "$line"|cut -d" " -f1)
                        DATEPPART2=$(echo "$line"|cut -d" " -f2)
                        DATEPPART3=$(echo "$line"|cut -d" " -f3)
                        DATEPPART4=$(echo "$line"|cut -d" " -f4|cut -d":" -f1,2)
                        DATEPPART5=$(echo "$line"|cut -d" " -f5|cut -d":" -f1)

                        LOGDATE=$(echo "${DATEPPART1} ${DATEPPART2} ${DATEPPART3} ${DATEPPART4} ${DATEPPART5}")
                        DATE_CONVERTED=$(date --date="$LOGDATE" '+%s')
                        APP_NAME=$(echo "$line"|cut -d"'" -f2)
                        APP_HOST=$(echo "$line"|cut -d" " -f13|cut -d":" -f1|cut -d"." -f1|sed 's/omnibus-//')
                        METRIC="omnibus.objsrv.apptime"
                        APP_VALUE=$(echo "$line"|cut -d" " -f14|cut -d"s" -f1)
                        MESSAGE="put $METRIC $DATE_CONVERTED $APP_VALUE app=$APP app_name=$APP_NAME app_host_name=$APP_HOST agent=${AGENT}"

                        exec 3>/dev/tcp/${OPENTSDB}/4242
                        echo -e "${MESSAGE}\n" >&3
                        exec 3>&-
                        echo "$MESSAGE" >> $TESTLOG

                elif [[ "$line" =~ webgui ]]
                then
                        DATEPPART1=$(echo "$line"|cut -d" " -f1)
                        DATEPPART2=$(echo "$line"|cut -d" " -f2)
                        DATEPPART3=$(echo "$line"|cut -d" " -f3)
                        DATEPPART4=$(echo "$line"|cut -d" " -f4|cut -d":" -f1,2)
                        DATEPPART5=$(echo "$line"|cut -d" " -f5|cut -d":" -f1)

                        LOGDATE=$(echo "${DATEPPART1} ${DATEPPART2} ${DATEPPART3} ${DATEPPART4} ${DATEPPART5}")
                        DATE_CONVERTED=$(date --date="$LOGDATE" '+%s')
                        APP_NAME=$(echo "$line"|cut -d"'" -f2)
                        n=$((n+1))
                        PRE_APP_HOST=$(echo "$line"|cut -d" " -f12|cut -d":" -f1|cut -d"." -f1|sed 's/omnibus-//')
                        APP_HOST=${PRE_APP_HOST}${n}

                        METRIC="omnibus.objsrv.apptime"
                        APP_VALUE=$(echo "$line"|cut -d" " -f13|cut -d"s" -f1)
                        MESSAGE="put $METRIC $DATE_CONVERTED $APP_VALUE app=$APP app_name=$APP_NAME app_host_name=$APP_HOST agent=${AGENT}"

                        exec 3>/dev/tcp/${OPENTSDB}/4242
                        echo -e "${MESSAGE}\n" >&3
                        exec 3>&-
                        echo "$MESSAGE" >> $TESTLOG
                fi
        fi
done
#done < "$INFILE"
#} 2>&1 | tee -a $PROFILER_LOG
