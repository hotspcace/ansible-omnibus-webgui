#!/bin/bash

#set -x 

POST_CONFIG_LOG_TMP="/opt/viasat/omnibus/logs/webgui/post_webgui_config_tmp.log"
POST_CONFIG_LOG="/opt/viasat/omnibus/logs/webgui/post_webgui_config.log"
MYDATE=`date`
mkdir -p /opt/viasat/omnibus/logs/webgui

>$POST_CONFIG_LOG_TMP
>$POST_CONFIG_LOG
{
if [ -f /opt/viasat/omnibus/logs/webgui/post_process1 ]
then
	echo "File post_process1 exists so exiting"
        exit
else
        cd /opt/IBM/JazzSM/ui/bin

	echo "Assigning Roles to smadmin user"
	/opt/IBM/JazzSM/ui/bin/consolecli.sh MapRolesToUser --username smadmin --password smadmin --userID smadmin --rolesList chartViewer,operator,configurator,monitor,chartCreator,suppressmonitor,ncw_admin,ncw_user,ncw_dashboard_editor,ncw_gauges_editor,ncw_gauges_viewer,netcool_ro,netcool_rw

	echo "sleeping 10 seconds before checking if roles were applied"

	sleep 10

	echo "Running query to see if roles were applied and writing it to /opt/IBM/JazzSM/ui/bin/smadmin_roles"
	/opt/IBM/JazzSM/ui/bin/consolecli.sh ListRolesFromUser --userID smadmin > smadmin_roles

	if grep -q ncw_admin smadmin_roles
	then
		echo "The roles were applied successfully to smadmin user"
	else
		echo "Failed trying to apply roles to smadmin user"
	fi	

        echo " "
	echo "Creating /opt/viasat/omnibus/logs/webgui/post_process1" 
	touch /opt/viasat/omnibus/logs/webgui/post_process1

	echo "Restarting WebGUI"
	/opt/IBM/JazzSM/profile/bin/stopServer.sh server1 -username smadmin -password smadmin

	sleep 10	

	/opt/IBM/JazzSM/profile/bin/startServer.sh server1
	exit
fi
} 2>&1 | tee -a $POST_CONFIG_LOG_TMP
grep -v SEVERE $POST_CONFIG_LOG_TMP > $POST_CONFIG_LOG
