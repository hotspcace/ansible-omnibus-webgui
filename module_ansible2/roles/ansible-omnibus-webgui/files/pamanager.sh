#! /bin/sh

MYHOST=`hostname -f`

if [[ "$MYHOST" =~ webgui ]]
then
        NCO_PA_ID="WEBGUI"
elif [[ "$MYHOST" =~ agg-primary ]]
then
        NCO_PA_ID="AGG_P_PA"
elif [[ "$MYHOST" =~ agg-backup ]]
then
        NCO_PA_ID="AGG_B_PA"
elif [[ "$MYHOST" =~ master ]]
then
        NCO_PA_ID="MTTRAPD01_M_PA"
elif [[ "$MYHOST" =~ slave ]]
then
        NCO_PA_ID="MTTRAPD01_S_PA"
elif [[ "$MYHOST" =~ omnibus-mttrapd01. ]]
then
        NCO_PA_ID="MTTRAPD01_PA"
elif [[ "$MYHOST" =~ omnibus-mttrapd02. ]]
then
        NCO_PA_ID="MTTRAPD02_PA"
fi



PA=${NCO_PA_ID}
PAUSER='omniadmin'
PAPASSWORD='ECBBBJAGFKFHGD'

export PA PAUSER PAPASSWORD
export LINES TLINES HLINES PATEXT PASERVICES PAPROCESSES STOP_SERVICE
# User must provide process agent name, user, passowrd details
#if [ $# -ne 3 ]
#then
#        echo "Usage : $0 [PA] [user] [password]"
#       echo
#       echo " PA       - nco_pad process name [e.g. NCO_PA]"
#       echo " user     - PA user [e.g. root]"
##      echo " password - PA users password [plain-text|nco_pa_crpyt]"
#        exit
#fi
#PA=$1
#PAUSER=$2
#PAPASSWORD=$3
#
# Test connectivity
#
PING_TEST=`nco_ping ${PA}`
if [ "$PING_TEST" ]
then
echo "Server available"
else
echo "Server is not available"
exit
fi

LINES=`nco_pa_status -server ${PA} -user ${PAUSER} -password ${PAPASSWORD} | wc -l`
if [ $LINES -gt 3 ]
then
echo "ok"
else
echo "unable to connect to ${PA}"
exit
fi

TLINES=`expr $LINES - 3`
HLINES=`expr $TLINES - 1`
PATEXT="nco_pa_status -server ${PA} -user ${PAUSER} -password ${PAPASSWORD} | tail -$TLINES | head -$HLINES"
PASERVICES=`nco_pa_status -server ${PA} -user ${PAUSER} -password ${PAPASSWORD} | tail -$TLINES | head -$HLINES | cut -c1-21 | sort -u`
PAPROCESSES=`nco_pa_status -server ${PA} -user ${PAUSER} -password ${PAPASSWORD} | tail -$TLINES | head -$HLINES | cut -c22-42 | sort -u`
# Main loop
while true
do
clear
nco_pa_status -server ${PA} -user ${PAUSER} -password ${PAPASSWORD}
echo "Note: Services and processes must be single words - Control-C to exit"
echo
echo "1. Restart a service "
echo "2. Restart a process "
echo "3. Stop a service "
echo "4. Stop a process "
echo "5. Restart all "
echo "Enter number: "
read answer

case $answer in
# RESTART ALL
5)
        for service in $PASERVICES
        do
        RESTART_SERVICE=$service
        nco_pa_stop -server ${PA} -user ${PAUSER} -password ${PAPASSWORD} -service $RESTART_SERVICE
        nco_pa_start -server ${PA} -user ${PAUSER} -password ${PAPASSWORD} -service $RESTART_SERVICE
        done
        echo "Hit return to continue"
;;
# RESTART SERVICE
1)
        i=0
        for service in $PASERVICES
        do
        i=`expr $i + 1`
        echo "$i) $service"
        done
        echo "Enter number: "
        read sanswer
        j=0
        for service in $PASERVICES
        do
        j=`expr $j + 1`
        if [ $j -eq $sanswer ]
        then
        RESTART_SERVICE=$service
        fi
        done
        nco_pa_stop -server ${PA} -user ${PAUSER} -password ${PAPASSWORD} -service $RESTART_SERVICE
        sleep 5
        nco_pa_start -server ${PA} -user ${PAUSER} -password ${PAPASSWORD} -service $RESTART_SERVICE
        echo "Hit return to continue"
        read n
;;
# STOP SERVICE
3)
        i=0
        for service in $PASERVICES
        do
        i=`expr $i + 1`
        echo "$i) $service"
        done
        echo "Enter number: "
        read sanswer
        j=0
        for service in $PASERVICES
        do
        j=`expr $j + 1`
        if [ $j -eq $sanswer ]
        then
        STOP_SERVICE=$service
        fi
        done
        nco_pa_stop -server ${PA} -user ${PAUSER} -password ${PAPASSWORD} -service $STOP_SERVICE
        echo "Hit return to continue"
        read n
;;

# RESTART PROCESS
2)
        i=0
        for process in $PAPROCESSES
        do
        i=`expr $i + 1`
        echo "$i) $process"
        done
        echo "Enter number: "
        read panswer
        j=0
        for process in $PAPROCESSES
        do
        j=`expr $j + 1`
        if [ $j -eq $panswer ]
        then
        RESTART_PROCESS=$process
        fi
        done
        nco_pa_stop  -server ${PA} -user ${PAUSER} -password ${PAPASSWORD} -process $RESTART_PROCESS
        sleep 5
        nco_pa_start -server ${PA} -user ${PAUSER} -password ${PAPASSWORD} -process $RESTART_PROCESS
        echo "Hit return to continue"
        read n
;;
# STOP PROCESS
4)
        i=0
        for process in $PAPROCESSES
        do
        i=`expr $i + 1`
        echo "$i) $process"
        done
        echo "Enter number: "
        read panswer
        j=0
        for process in $PAPROCESSES
        do
        j=`expr $j + 1`
        if [ $j -eq $panswer ]
        then
        STOP_PROCESS=$process
        fi
        done
        nco_pa_stop  -server ${PA} -user ${PAUSER} -password ${PAPASSWORD} -process $STOP_PROCESS
        echo "Hit return to continue"
        read n
;;
*)
echo "Unknown option"
;;
esac
done

#EOF


