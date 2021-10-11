#!/bin/bash

#set -x 

POST_CONFIG_LOG_TMP3="/opt/viasat/omnibus/logs/webgui/post_webgui_config3_tmp.log"
POST_CONFIG_LOG3="/opt/viasat/omnibus/logs/webgui/post_webgui_config3.log"
MYDATE=`date`

>$POST_CONFIG_LOG_TMP3
>$POST_CONFIG_LOG3
{
if [ -f /opt/viasat/omnibus/logs/webgui/post_process3 ]
then
	echo "File post_process3 exists so exiting"
        exit
else
        cd /opt/IBM/JazzSM/ui/bin

	echo "=============================================================================== "
	echo "Assigning Roles to nms-omnibus-admins group"
	/opt/IBM/JazzSM/ui/bin/consolecli.sh MapRolesToGroup --username smadmin --password smadmin --groupID nms-omnibus-admins --rolesList chartViewer,operator,configurator,monitor,chartCreator,suppressmonitor,ncw_admin,ncw_user,ncw_dashboard_editor,ncw_gauges_editor,ncw_gauges_viewer,netcool_ro,netcool_rw,iscadmins,administrator,chartAdministrator,samples
	echo "sleeping 10 seconds before checking if roles were applied"
	sleep 10
	echo "Running query to see if roles were applied and writing it to /opt/IBM/JazzSM/ui/bin/omnibus_admins"
	/opt/IBM/JazzSM/ui/bin/consolecli.sh ListRolesFromGroup --groupID nms-omnibus-admins > nms-omnibus-admins
	if grep -q ncw_admin nms-omnibus-admins 
	then
		echo "The roles were applied successfully to omnibus_admins group"
	else
		echo "Failed trying to apply roles to omnibus_admins group"
	fi
	echo "=============================================================================== "
        echo " "
        echo "Sleeping for 10 seconds"
	sleep 10
        echo "=============================================================================== "
	echo "Assigning Roles to nms-omnibus-users group"
	/opt/IBM/JazzSM/ui/bin/consolecli.sh MapRolesToGroup --username smadmin --password smadmin --groupID nms-omnibus-users --rolesList chartViewer,operator,configurator,monitor,chartCreator,suppressmonitor,ncw_user,ncw_gauges_viewer,netcool_ro,netcool_rw,samples
	echo "sleeping 10 seconds before checking if roles were applied"
	sleep 10
	echo "Running query to see if roles were applied and writing it to /opt/IBM/JazzSM/ui/bin/omnibus_users"
	/opt/IBM/JazzSM/ui/bin/consolecli.sh ListRolesFromGroup --groupID nms-omnibus-users > nms-omnibus-users	
	if grep -q ncw_user nms-omnibus-users 
	then
		echo "The roles were applied successfully to nms-omnibus-users group"
	else
	echo "Failed trying to apply roles to nms-omnibus-users group"
	fi
	echo "=============================================================================== "
        echo " "
        echo "Sleeping for 10 seconds"
	sleep 10
        echo "=============================================================================== "
	echo "Assigning Roles to nms-omnibus-users group"
	/opt/IBM/JazzSM/ui/bin/consolecli.sh MapRolesToGroup --username smadmin --password smadmin --groupID nms-omnibus-viewers --rolesList chartViewer,monitor,ncw_user,ncw_gauges_viewer,netcool_ro,samples
	echo "sleeping 10 seconds before checking if roles were applied"
	sleep 10
	echo "Running query to see if roles were applied and writing it to /opt/IBM/JazzSM/ui/bin/omnibus_users"
	/opt/IBM/JazzSM/ui/bin/consolecli.sh ListRolesFromGroup --groupID nms-omnibus-viewers > nms-omnibus-viewers
	if grep -q ncw_user nms-omnibus-viewers 
	then
		echo "The roles were applied successfully to nms-omnibus-users group"
	else
		echo "Failed trying to apply roles to nms-omnibus-users group"
	fi
	        echo "=============================================================================== "
        echo " "
	echo "Creating /opt/viasat/omnibus/logs/webgui/post_process3" 
	touch /opt/viasat/omnibus/logs/webgui/post_process3

	echo "Restarting WebGUI"
	/opt/IBM/JazzSM/profile/bin/stopServer.sh server1 -username smadmin -password smadmin

	/opt/IBM/JazzSM/profile/bin/startServer.sh server1
	exit
fi
} 2>&1 | tee -a $POST_CONFIG_LOG_TMP3
grep -v SEVERE $POST_CONFIG_LOG_TMP3 > $POST_CONFIG_LOG3
