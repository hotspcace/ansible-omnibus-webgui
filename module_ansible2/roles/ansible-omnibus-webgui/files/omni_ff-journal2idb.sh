#!/bin/bash

#set -x

OPENTSDB="adapter-opentsdb.dev.idb.viasat.io"
APP="omnibus.self.monitoring"
AGENT="omni_ff-journal2idb.sh"
MYHOST=$(hostname -f)
OMNISM_LOG="/opt/viasat/omnibus/data/gateway-ff-journal/omni_ff-journal2idb.log"
DATE=$(date +%m/%d/%Y" "%H:%M)
>$OMNISM_LOG
#{
echo "##############################################" >> $OMNISM_LOG
echo "Last Started on ${DATE}" >> $OMNISM_LOG
tail -Fn0 gateway-ff-journal.log | \
while read -r line
do
        if [[ "$line" =~ SelfMonitoring ]] && [[ ! "$line" =~ ALERT ]]
        then
                while IFS='^' read OMNISM_STATUS OMNISM_IDENTIFIER OMNISM_SERIAL OMNISM_NODE OMNISM_NODEALIAS OMNISM_MANAGER OMNISM_AGENT OMNISM_ALERTGROUP OMNISM_ALERTKEY OMNISM_SEVERITY OMNISM_SUMMARY OMNISM_STATECHANGE OMNISM_FIRSTOCCURRENCE OMNISM_LASTOCCURRENCE OMNISM_INTERNALLAST OMNISM_POLL OMNISM_TYPE OMNISM_TALLY OMNISM_CLASS OMNISM_GRADE
                do
                        echo "===============================" >> $OMNISM_LOG
                        echo "${DATE} - Messages Sent - START" >> $OMNISM_LOG
                        echo "===============================" >> $OMNISM_LOG
                        OMNISM_STATUS=$(echo "$OMNISM_STATUS"|sed 's/://')

                        if [[ "$OMNISM_STATUS" == 'UPDATE' ]]
                        then
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
                                OMNISM_LASTOCCURRENCE=$(echo "$OMNISM_LASTOCCURRENCE"|cut -d"\`" -f2|cut -d":" -f1,2)
                                OMNISM_INTERNALLAST=$(echo "$OMNISM_INTERNALLAST"|cut -d"\`" -f2)
                                OMNISM_POLL=$(echo "$OMNISM_POLL"|cut -d"\`" -f2)
                                OMNISM_TYPE=$(echo "$OMNISM_TYPE"|cut -d"\`" -f2)
                                OMNISM_TALLY=$(echo "$OMNISM_TYPE"|cut -d"\`" -f2)
                                OMNISM_CLASS=$(echo "$OMNISM_TYPE"|cut -d"\`" -f2)
                                OMNISM_GRADE=$(echo "$OMNISM_TYPE"|cut -d"\`" -f2)
                                #OMNISM_NODE=$(echo "${OMNISM_NODE}")
                                LOGDATE=$(echo "$OMNISM_LASTOCCURRENCE")
                                DATE_CONVERTED=$(date --date="$LOGDATE" '+%s')

                                if [[ "$OMNISM_NODE" == 'webgui' ]]
                                then
                                        OMNISM_SERVICE_NAME=$(echo "$OMNISM_ALERTKEY")

                                        if [[ "$OMNISM_SERVICE_NAME" == 'ResultsCache' && ! "$OMNISM_SUMMARY" =~ ALERT ]]
                                        then
                                                OMNISM_METRIC_PRE_NAME=$(echo "$OMNISM_SUMMARY"|cut -d" " -f6)
                                                OMNISM_METRIC_NAME1=$(echo "${OMNISM_METRIC_PRE_NAME,,}-cache-size")
                                                OMNISM_METRIC_NAME2=$(echo "${OMNISM_METRIC_PRE_NAME,,}-hit-rate")
                                                OMNISM_VALUE1=$(echo "$OMNISM_SUMMARY"|cut -d" " -f10|cut -d"," -f1)
                                                OMNISM_VALUE2=$(echo "$OMNISM_SUMMARY"|cut -d":" -f2|cut -d"%" -f1)
                                                OMNISM_METRIC_UNIT1="count"
                                                OMNISM_METRIC_UNIT2="percent"
                                                OMNISM_METRIC="omnibus.${OMNISM_NODE}.sm"
                                                MESSAGES=2
                                                MESSAGE1="put $OMNISM_METRIC $DATE_CONVERTED $OMNISM_VALUE1 app=${APP} metric_name=$OMNISM_METRIC_NAME1 metric_unit=$OMNISM_METRIC_UNIT1 agent=${AGENT}"
                                                MESSAGE2="put $OMNISM_METRIC $DATE_CONVERTED $OMNISM_VALUE2 app=${APP} metric_name=$OMNISM_METRIC_NAME2 metric_unit=$OMNISM_METRIC_UNIT2 agent=${AGENT}"

                                                exec 3>/dev/tcp/${OPENTSDB}/4242
                                                echo -e "${MESSAGE1}\n" >&3
                                                exec 3>&-
                                                echo "$MESSAGE1" >> $OMNISM_LOG

                                                exec 3>/dev/tcp/${OPENTSDB}/4242
                                                echo -e "${MESSAGE2}\n" >&3
                                                exec 3>&-
                                                echo "$MESSAGE2" >> $OMNISM_LOG

                                        elif [[ "$OMNISM_SERVICE_NAME" == 'VMM' && ! "$OMNISM_SUMMARY" =~ ALERT ]]
                                        then
                                                OMNISM_METRIC_POST_NAME=$(echo "$OMNISM_SUMMARY"|cut -d' ' -f8)
                                                OMNISM_METRIC_NAME=$(echo "vmm-sync-${OMNISM_METRIC_POST_NAME}-response-time")
                                                PRE_OMNISM_VALUE=$(echo "$OMNISM_SUMMARY"|cut -d' ' -f11)
                                                OMNISM_VALUE=$(echo "$PRE_OMNISM_VALUE"|sed 's/,//')
                                                OMNISM_METRIC="omnibus.webgui.sm"
                                                OMNISM_METRIC_UNIT="seconds"
                                                MESSAGE="put $OMNISM_METRIC $DATE_CONVERTED $OMNISM_VALUE app=${APP} metric_name=$OMNISM_METRIC_NAME metric_unit=seconds agent=${AGENT}"

                                                exec 3>/dev/tcp/${OPENTSDB}/4242
                                                echo -e "${MESSAGE}\n" >&3
                                                exec 3>&-
                                                echo "$MESSAGE" >> $OMNISM_LOG
                                                unset PRE_OMNISM_VALUE

                                        elif [[ "$OMNISM_SERVICE_NAME" == 'DataSourceCommand' ]] && [[ ! "$OMNISM_SUMMARY" =~ available ]]
                                        then
                                                OMNISM_METRIC_PRE_NAME=$(echo "$OMNISM_SUMMARY"|cut -d' ' -f6)
                                                OMNISM_METRIC_POST_NAME1=$(echo "$OMNISM_SUMMARY"|cut -d' ' -f7)
                                                OMNISM_METRIC_POST_NAME2=$(echo "$OMNISM_SUMMARY"|cut -d' ' -f8)
                                                OMNISM_METRIC_NAME=$(echo "${OMNISM_METRIC_PRE_NAME,,}-${OMNISM_METRIC_POST_NAME1}-${OMNISM_METRIC_POST_NAME2}-response-time")
                                                OMNISM_VALUE=$(echo "$OMNISM_SUMMARY"|cut -d' ' -f11)
                                                OMNISM_METRIC="omnibus.${OMNISM_NODE}.sm"
                                                OMNISM_METRIC_UNIT="seconds"
                                                MESSAGE="put $OMNISM_METRIC $DATE_CONVERTED $OMNISM_VALUE app=${APP} metric_name=$OMNISM_METRIC_NAME metric_unit=$OMNISM_METRIC_UNIT agent=${AGENT}"

                                                exec 3>/dev/tcp/${OPENTSDB}/4242
                                                echo -e "${MESSAGE}\n" >&3
                                                exec 3>&-
                                                echo "$MESSAGE" >> $OMNISM_LOG

                                        elif [[ "$OMNISM_SERVICE_NAME" == 'EventSummaryData' && ! "$OMNISM_SUMMARY" =~ ALERT ]]
                                        then
                                                OMNISM_METRIC_POST_NAME=$(echo "$OMNISM_SUMMARY"|cut -d' ' -f7)
                                                OMNISM_METRIC_NAME=$(echo "event-summary-data-service-${OMNISM_METRIC_POST_NAME}-response-time")
                                                OMNISM_VALUE=$(echo "$OMNISM_SUMMARY"|cut -d' ' -f10)
                                                OMNISM_METRIC="omnibus.${OMNISM_NODE}.sm"
                                                OMNISM_METRIC_UNIT="seconds"
                                                MESSAGE="put $OMNISM_METRIC $DATE_CONVERTED $OMNISM_VALUE app=${APP} metric_name=$OMNISM_METRIC_NAME metric_unit=$OMNISM_METRIC_UNIT agent=${AGENT}"

                                                exec 3>/dev/tcp/${OPENTSDB}/4242
                                                echo -e "${MESSAGE}\n" >&3
                                                exec 3>&-
                                                echo "$MESSAGE" >> $OMNISM_LOG

                                        elif [[ "$OMNISM_SERVICE_NAME" == 'JVM' && ! "$OMNISM_SUMMARY" =~ ALERT ]]
                                        then
                                                OMNISM_METRIC_NAME=$(echo "jvm-memory-used")
                                                OMNISM_VALUE=$(echo "$OMNISM_SUMMARY"|cut -d' ' -f11|cut -d'%' -f1)
                                                OMNISM_METRIC="omnibus.${OMNISM_NODE}.sm"
                                                OMNISM_METRIC_UNIT="percent"
                                                MESSAGE="put $OMNISM_METRIC $DATE_CONVERTED $OMNISM_VALUE app=${APP} metric_name=$OMNISM_METRIC_NAME metric_unit=$OMNISM_METRIC_UNIT agent=${AGENT}"

                                                exec 3>/dev/tcp/${OPENTSDB}/4242
                                                echo -e "${MESSAGE}\n" >&3
                                                exec 3>&-
                                                echo "$MESSAGE" >> $OMNISM_LOG

                                        elif [[ "$OMNISM_SERVICE_NAME" == 'MetricData' ]] || [[ "$OMNISM_SERVICE_NAME" == 'EventData' ]] && [[ ! "$OMNISM_SUMMARY" =~ ALERT ]]
                                        then
                                                OMNISM_METRIC_PRE_NAME=$(echo "$OMNISM_SUMMARY"|cut -d' ' -f3)
                                                OMNISM_METRIC_POST_NAME=$(echo "$OMNISM_SUMMARY"|cut -d' ' -f6)
                                                OMNISM_METRIC_NAME=$(echo "${OMNISM_METRIC_PRE_NAME}-data-service-${OMNISM_METRIC_POST_NAME}-response-time")
                                                OMNISM_VALUE=$(echo "$OMNISM_SUMMARY"|cut -d' ' -f9)
                                                OMNISM_METRIC="omnibus.${OMNISM_NODE}.sm"
                                                OMNISM_METRIC_UNIT="seconds"
                                                MESSAGE="put $OMNISM_METRIC $DATE_CONVERTED $OMNISM_VALUE app=${APP} metric_name=$OMNISM_METRIC_NAME metric_unit=$OMNISM_METRIC_UNIT agent=${AGENT}"

                                                exec 3>/dev/tcp/${OPENTSDB}/4242
                                                echo -e "${MESSAGE}\n" >&3
                                                exec 3>&-
                                                echo "$MESSAGE" >> $OMNISM_LOG

                                        elif [[ "$OMNISM_SERVICE_NAME" == 'SecurityRepository' ]]
                                        then
                                                OMNISM_METRIC_POST_NAME=$(echo "$OMNISM_SUMMARY"|cut -d' ' -f5)
                                                OMNISM_METRIC_NAME=$(echo "security-repository-${OMNISM_METRIC_POST_NAME}-response-time")
                                                OMNISM_VALUE=$(echo "$OMNISM_SUMMARY"|cut -d' ' -f8)
                                                OMNISM_METRIC="omnibus.${OMNISM_NODE}.sm"
                                                OMNISM_METRIC_UNIT="seconds"
                                                MESSAGE="put $OMNISM_METRIC $DATE_CONVERTED $OMNISM_VALUE app=${APP} metric_name=$OMNISM_METRIC_NAME metric_unit=$OMNISM_METRIC_UNIT agent=${AGENT}"

                                                exec 3>/dev/tcp/${OPENTSDB}/4242
                                                echo -e "${MESSAGE}\n" >&3
                                                exec 3>&-
                                                echo "$MESSAGE" >> $OMNISM_LOG

                                        elif [[ "$OMNISM_SERVICE_NAME" == 'DataSourceCommand' ]] && [[ "$OMNISM_SUMMARY" =~ available ]] && [[ ! "$OMNISM_SUMMARY" =~ ALERT ]]
                                        then
                                                OMNISM_METRIC_NAME="data-source-availability"
                                                OMNISM_VALUE=1
                                                OMNISM_METRIC="omnibus.${OMNISM_NODE}.sm"
                                                OMNISM_METRIC_UNIT="availability"
                                                MESSAGE="put $OMNISM_METRIC $DATE_CONVERTED $OMNISM_VALUE app=${APP} metric_name=$OMNISM_METRIC_NAME metric_unit=$OMNISM_METRIC_UNIT agent=${AGENT}"

                                                exec 3>/dev/tcp/${OPENTSDB}/4242
                                                echo -e "${MESSAGE}\n" >&3
                                                exec 3>&-
                                                echo "$MESSAGE" >> $OMNISM_LOG
                                        fi

                                elif [[ "$OMNISM_NODE" == 'objectserver' ]] && [[ ! "$OMNISM_SUMMARY" =~ ALERT ]]
                                then
                                        OMNISM_SERVICE_NAME=$(echo "$OMNISM_ALERTGROUP")

                                        if [[ "$OMNISM_SERVICE_NAME" == 'ProbeStatus' ]]
                                        then
                                                if [[ "$OMNISM_IDENTIFIER" =~ omnibus-socket01.nms.v || "$OMNISM_IDENTIFIER" =~ omnibus-socket02.nms.v ]]
                                                then
                                                        OMNISM_METRIC_PROBE_NAME=$(echo "$OMNISM_IDENTIFIER"|cut -d':' -f4|cut -d'.' -f1)
                                                elif [[ "$OMNISM_IDENTIFIER" =~ euw01 || "$OMNISM_IDENTIFIER" =~ aps01 ]]
                                                then
                                                        OMNISM_METRIC_PROBE_NAME=$(echo "$OMNISM_IDENTIFIER"|cut -d':' -f4|cut -d'.' -f1,2)
                                                else
                                                        OMNISM_METRIC_PROBE_NAME=$(echo "$OMNISM_IDENTIFIER"|cut -d':' -f4|cut -d'.' -f1)
                                                fi
                                                #OMNISM_METRIC_PROBE_NAME=$(echo "$OMNISM_IDENTIFIER"|cut -d':' -f4)
                                                OMNISM_METRIC_PROBE_ID=$(echo "$OMNISM_IDENTIFIER"|cut -d':' -f5)
                                                OMNISM_METRIC_NAME=$(echo "probe-events-per-second")
                                                OMNISM_METRIC="omnibus.${OMNISM_NODE}.sm"
                                                OMNISM_PRE_VALUE=$(echo "$OMNISM_SUMMARY"|cut -d' ' -f11)
                                                OMNISM_VALUE=$(echo "scale=4; $OMNISM_PRE_VALUE/300"|bc)
                                                OMNISM_METRIC_UNIT="events_per_second"
                                                MESSAGE="put $OMNISM_METRIC $DATE_CONVERTED $OMNISM_VALUE app=${APP} metric_name=$OMNISM_METRIC_NAME probe_name=$OMNISM_METRIC_PROBE_NAME probe_id=$OMNISM_METRIC_PROBE_ID metric_unit=$OMNISM_METRIC_UNIT agent=${AGENT}"

                                                exec 3>/dev/tcp/${OPENTSDB}/4242
                                                echo -e "${MESSAGE}\n" >&3
                                                exec 3>&-
                                                echo "$MESSAGE" >> $OMNISM_LOG

                                                unset OMNISM_VALUE
                                                unset OMNISM_GRADE


                                        elif [[ "$OMNISM_SERVICE_NAME" == 'MemstoreStatus' ]]
                                        then
                                                OMNISM_METRIC_NAME=$(echo "table-store-soft-limit-used")
                                                OMNISM_VALUE=$(echo "$OMNISM_SUMMARY"|cut -d'(' -f2|cut -d'%' -f1)
                                                OMNISM_METRIC="omnibus.${OMNISM_NODE}.sm"
                                                OMNISM_METRIC_UNIT="percent"
                                                MESSAGE="put $OMNISM_METRIC $DATE_CONVERTED $OMNISM_VALUE app=${APP} metric_name=$OMNISM_METRIC_NAME metric_unit=$OMNISM_METRIC_UNIT agent=${AGENT}"

                                                exec 3>/dev/tcp/${OPENTSDB}/4242
                                                echo -e "${MESSAGE}\n" >&3
                                                exec 3>&-
                                                echo "$MESSAGE" >> $OMNISM_LOG


                                        elif [[ "$OMNISM_SERVICE_NAME" == 'ConnectionStatus' ]]
                                        then
                                                OMNISM_METRIC="omnibus.${OMNISM_NODE}.sm"
                                                OMNISM_METRIC_NAME=$(echo "connection-status")
                                                OMNISM_CONN_GROUP=$(echo "$OMNISM_SUMMARY"|cut -d':' -f1)
                                                OMNISM_HOST_ID=$(echo "$OMNISM_IDENTIFIER"|cut -d':' -f4)
                                                if [[ "$OMNISM_CONN_GROUP" == 'PROBE' ]]
                                                then
                                                        if [[ "$OMNISM_IDENTIFIER" =~ euw0 || "$OMNISM_IDENTIFIER" =~ aps0 ]]
                                                        then
                                                                OMNISM_CONN_HOST=$(echo "$OMNISM_IDENTIFIER"|cut -d':' -f3)
                                                        else
                                                                OMNISM_CONN_HOST=$(echo "$OMNISM_IDENTIFIER"|cut -d':' -f3|cut -d'.' -f1)
                                                        fi
                                                        OMNISM_VALUE=1
                                                        MESSAGE="put $OMNISM_METRIC $DATE_CONVERTED $OMNISM_VALUE app=${APP} metric_name=$OMNISM_METRIC_NAME metric_unit=$OMNISM_METRIC_UNIT host_id=$OMNISM_HOST_ID host_group=$OMNISM_CONN_GROUP host_name=$OMNISM_CONN_HOST agent=${AGENT}"
                                                        exec 3>/dev/tcp/${OPENTSDB}/4242
                                                        echo -e "${MESSAGE}\n" >&3
                                                        exec 3>&-
                                                        echo "$MESSAGE" >> $OMNISM_LOG

                                                elif [[ "$OMNISM_CONN_GROUP" == 'GATEWAY' ]]
                                                then

                                                        OMNISM_CONN_HOST=$(echo "$OMNISM_IDENTIFIER"|cut -d':' -f3)
                                                        OMNISM_VALUE=1
                                                        MESSAGE="put $OMNISM_METRIC $DATE_CONVERTED $OMNISM_VALUE app=${APP} metric_name=$OMNISM_METRIC_NAME metric_unit=$OMNISM_METRIC_UNIT host_id=$OMNISM_HOST_ID host_group=$OMNISM_CONN_GROUP host_name=$OMNISM_CONN_HOST agent=${AGENT}"

                                                        exec 3>/dev/tcp/${OPENTSDB}/4242
                                                        echo -e "${MESSAGE}\n" >&3
                                                        exec 3>&-
                                                        echo "$MESSAGE" >> $OMNISM_LOG

                                                elif [[ "$OMNISM_SUMMARY" =~ "Available connections" ]]
                                                then
                                                        OMNISM_METRIC_NAME=$(echo "objectserver-available-connections")
                                                        OMNISM_VALUE=$(echo "$OMNISM_SUMMARY"|cut -d' ' -f8)
                                                        MESSAGE="put $OMNISM_METRIC $DATE_CONVERTED $OMNISM_VALUE app=${APP} metric_name=$OMNISM_METRIC_NAME"

                                                        exec 3>/dev/tcp/${OPENTSDB}/4242
                                                        echo -e "${MESSAGE}\n" >&3
                                                        exec 3>&-
                                                        echo "$MESSAGE" >> $OMNISM_LOG
                                                        unset OMNISM_VALUE
                                                        unset OMNISM_GRADE

                                                fi

                                        elif [[ "$OMNISM_SERVICE_NAME" == 'DBStatus' ]]
                                        then
                                                OMNISM_METRIC_PRE_NAME=$(echo "$OMNISM_SUMMARY"|cut -d' ' -f1)
                                                if [[ "$OMNISM_METRIC_PRE_NAME" == 'Last' ]]
                                                then
                                                        OMNISM_METRIC_POST_NAME=$(echo "$OMNISM_SUMMARY"|cut -d' ' -f4|cut -d'.' -f2)
                                                        OMNISM_METRIC_NAME=$(echo "alerts-${OMNISM_METRIC_POST_NAME}-events-per-second")
                                                        OMNISM_PRE_VALUE=$(echo "$OMNISM_GRADE")
                                                        OMNISM_METRIC="omnibus.objectserver.sm"
                                                        OMNISM_PRE_VALUE=$(echo "$OMNISM_SUMMARY"|cut -d' ' -f6)
                                                        OMNISM_VALUE=$(echo "scale=2; ${OMNISM_PRE_VALUE}/300"|bc)
                                                        OMNISM_METRIC_UNIT="events_per_second"
                                                        MESSAGE="put $OMNISM_METRIC $DATE_CONVERTED $OMNISM_VALUE app=${APP} omnism_source=$OMNISM_NODE service_name=$OMNISM_SERVICE_NAME metric_name=$OMNISM_METRIC_NAME metric_unit=$OMNISM_METRIC_UNIT agent=${AGENT}"

                                                        exec 3>/dev/tcp/${OPENTSDB}/4242
                                                        echo -e "${MESSAGE}\n" >&3
                                                        exec 3>&-
                                                        echo "$MESSAGE" >> $OMNISM_LOG
                                                        unset OMNISM_VALUE
                                                        unset OMNISM_GRADE

                                                else
                                                        OMNISM_METRIC_NAME=$(echo "${OMNISM_METRIC_PRE_NAME,,}-row-count")
                                                        OMNISM_METRIC="omnibus.objectserver.sm"
                                                        OMNISM_VALUE=$(echo "$OMNISM_SUMMARY"|cut -d' ' -f4)
                                                        OMNISM_METRIC_UNIT="count"
                                                        MESSAGE="put $OMNISM_METRIC $DATE_CONVERTED $OMNISM_VALUE app=${APP} metric_name=$OMNISM_METRIC_NAME metric_unit=$OMNISM_METRIC_UNIT agent=${AGENT}"

                                                        exec 3>/dev/tcp/${OPENTSDB}/4242
                                                        echo -e "${MESSAGE}\n" >&3
                                                        exec 3>&-
                                                        echo "$MESSAGE" >> $OMNISM_LOG
                                                        unset OMNISM_VALUE
                                                        unset OMNISM_GRADE
                                                fi
                                        fi
                                fi
                        fi
                done
                        echo "=============================" >> $OMNISM_LOG
                        echo "${DATE} - Messages Sent - END" >> $OMNISM_LOG
                        echo "=============================" >> $OMNISM_LOG
                        echo " " >> $OMNISM_LOG
                        echo " " >> $OMNISM_LOG
        else
                nothing="nothing"
        fi
done
#} 2>&1 | tee -a $OMNISM_LOG
