#!/bin/bash
set -x
WEBGUI_USER_DATA_LOG="/opt/viasat/omnibus/configs/webgui/post_webgui_user_data.log"
MYDATE=`date`

>$WEBGUI_USER_DATA_LOG
echo "=======================================" >> $WEBGUI_USER_DATA_LOG
echo "Starting new log entry on $MYDATE" >> $WEBGUI_USER_DATA_LOG
echo "=======================================" >> $WEBGUI_USER_DATA_LOG
echo "Sleeping for 30 seconds" >> $WEBGUI_USER_DATA_LOG
sleep 30

if [ ! -z ${MY_HOST} ]
then
        echo "$MY_HOST"
elif [ ! -z ${MY_WEBGUI} ]
then
        MY_HOST="$MY_WEBGUI"
        echo "$MY_WEBGUI" >> $WEBGUI_USER_DATA_LOG
        echo "$MY_HOST" >> $WEBGUI_USER_DATA_LOG
else
        MY_HOST="$MY_WEBGUI2"
        echo "$MY_WEBGUI2" >> $WEBGUI_USER_DATA_LOG
        echo "$MY_HOST" >> $WEBGUI_USER_DATA_LOG
fi


yum install rsync -y
echo "rsync has been installed" >> $WEBGUI_USER_DATA_LOG

if [ -d /opt/IBM/netcool/gui/omnibus_webgui ]
then
        echo "Rsync attempting to push backed up webgui data from /opt/viasat/omnibus/data/webgui/etc /opt/IBM/netcool/gui/omnibus_webgui/ directory." >> $WEBGUI_USER_DATA_LOG
        /usr/bin/rsync -avhW --no-compress --progress /opt/viasat/omnibus/data/webgui/etc /opt/IBM/netcool/gui/omnibus_webgui/
else
        nothing="nothing"
fi

echo "Restarting WebGUI" >> $WEBGUI_USER_DATA_LOG
/opt/IBM/JazzSM/profile/bin/stopServer.sh server1 -username smadmin -password smadmin
