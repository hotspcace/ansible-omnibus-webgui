#!/bin/bash

set -x 
{
POST_CONFIG_LOG="/opt/viasat/omnibus/logs/webgui/post_webgui_config.log"
MYDATE=`date`

>$POST_CONFIG_LOG

echo "Sleeping for 30 seconds" >> $POST_CONFIG_LOG
sleep 30

if [ -f /opt/viasat/omnibus/logs/webgui/post_process1 ]
then
        exit
else
        cd /opt/IBM/JazzSM/ui/bin

        /opt/IBM/JazzSM/ui/bin/consolecli.sh ListRolesFromUser --userID smadmin &> smadmin_roles
        /opt/IBM/JazzSM/ui/bin/consolecli.sh ListRolesFromGroup --groupID nms-omnibus-admins &> nms-omnibus-admins
        /opt/IBM/JazzSM/ui/bin/consolecli.sh ListRolesFromGroup --groupID nms-omnibus-users &> nms-omnibus-users
        /opt/IBM/JazzSM/ui/bin/consolecli.sh ListRolesFromGroup --groupID nms-omnibus-viewers &> nms-omnibus-viewers


        applied_smadmin_roles=`grep ncw_admin smadmin_roles|cut -d" " -f1`
        omnibus_admins=`cat nms-omnibus-admins|grep ncw_admin|cut -d" " -f1`
        omnibus_users=`cat nms-omnibus-users|grep ncw_user|cut -d" " -f1`
        omnibus_viewers=`cat nms-omnibus-viewers|grep ncw_user|cut -d" " -f1`



                echo "Assigning Roles to smadmin user" >> $POST_CONFIG_LOG
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

		echo "Assigning Roles to nms-omnibus-admins group"
		/opt/IBM/JazzSM/ui/bin/consolecli.sh MapRolesToGroup --username smadmin --password smadmin --groupID nms-omnibus-admins --rolesList chartViewer,operator,configurator,monitor,chartCreator,suppressmonitor,ncw_admin,ncw_user,ncw_dashboard_editor,ncw_gauges_editor,ncw_gauges_viewer,netcool_ro,netcool_rw,iscadmins,administrator,chartAdministrator,samples
		echo "sleeping 10 seconds before checking if roles were applied"
                sleep 10
                echo "Running query to see if roles were applied and writing it to /opt/IBM/JazzSM/ui/bin/omnibus_admins"
		/opt/IBM/JazzSM/ui/bin/consolecli.sh ListRolesFromGroup --groupID nms-omnibus-admins > nms-omnibus-admins
		if grep -q ncw_admin omnibus_admins
		then
                        echo "The roles were applied successfully to omnibus_admins group"
                else
                        echo "Failed trying to apply roles to omnibus_admins group"
                fi

		echo "Assigning Roles to nms-omnibus-users group"
		/opt/IBM/JazzSM/ui/bin/consolecli.sh MapRolesToGroup --username smadmin --password smadmin --groupID nms-omnibus-users --rolesList chartViewer,operator,configurator,monitor,chartCreator,suppressmonitor,ncw_user,ncw_gauges_viewer,netcool_ro,netcool_rw,samples
		echo "sleeping 10 seconds before checking if roles were applied"
                sleep 10
                echo "Running query to see if roles were applied and writing it to /opt/IBM/JazzSM/ui/bin/omnibus_users"
		/opt/IBM/JazzSM/ui/bin/consolecli.sh ListRolesFromGroup --groupID nms-omnibus-users > nms-omnibus-users	
		if grep -q ncw_user omnibus_users
                then
                        echo "The roles were applied successfully to nms-omnibus-users group"
                else
                        echo "Failed trying to apply roles to nms-omnibus-users group"
                fi

		echo "Assigning Roles to nms-omnibus-users group"
                /opt/IBM/JazzSM/ui/bin/consolecli.sh MapRolesToGroup --username smadmin --password smadmin --groupID nms-omnibus-users --rolesList chartViewer,operator,configurator,monitor,chartCreator,suppressmonitor,ncw_user,ncw_gauges_viewer,netcool_ro,netcool_rw,samples
                echo "sleeping 10 seconds before checking if roles were applied"
                sleep 10
                echo "Running query to see if roles were applied and writing it to /opt/IBM/JazzSM/ui/bin/omnibus_users"
                /opt/IBM/JazzSM/ui/bin/consolecli.sh ListRolesFromGroup --groupID nms-omnibus-users > nms-omnibus-users
                if grep -q ncw_user omnibus_users
                then
                        echo "The roles were applied successfully to nms-omnibus-users group"
                else
                        echo "Failed trying to apply roles to nms-omnibus-users group"
                fi


#	cd /opt/IBM/JazzSM/ui/bin
#	/opt/IBM/JazzSM/ui/bin/consolecli.sh ListRolesFromUser --userID smadmin &> smadmin_roles
#	applied_smadmin_roles=`grep ncw_admin smadmin_roles|cut -d" " -f1`
#	
#	/opt/IBM/JazzSM/ui/bin/consolecli.sh ListRolesFromGroup --groupID nms-omnibus-admins &> nms-omnibus-admins
#	/opt/IBM/JazzSM/ui/bin/consolecli.sh ListRolesFromGroup --groupID nms-omnibus-users &> nms-omnibus-users
#	/opt/IBM/JazzSM/ui/bin/consolecli.sh ListRolesFromGroup --groupID nms-omnibus-viewers &> nms-omnibus-viewers
#
#	omnibus_admins=`cat nms-omnibus-admins|grep ncw_admin|cut -d" " -f1`
#	omnibus_users=`cat nms-omnibus-users|grep ncw_user|cut -d" " -f1`
#	omnibus_viewers=`cat nms-omnibus-viewers|grep ncw_user|cut -d" " -f1`
#
#
#	#if [[ $applied_smadmin_roles == "ncw_admin" ]]
#	#then
#		echo "Assigning Roles to smadmin user" >> $POST_CONFIG_LOG
#		/opt/IBM/JazzSM/ui/bin/consolecli.sh MapRolesToUser --username smadmin --password smadmin --userID smadmin --rolesList chartViewer,operator,configurator,monitor,chartCreator,suppressmonitor,ncw_admin,ncw_user,ncw_dashboard_editor,ncw_gauges_editor,ncw_gauges_viewer,netcool_ro,netcool_rw
#		if [[ ! $omnibus_admins == "ncw_admin" ]]	
#		then
#			echo "LDAP group nms-omnibus-admins was not found and we are trying to assign administrative roles to the group." >> $POST_CONFIG_LOG2
#                	/opt/IBM/JazzSM/ui/bin/consolecli.sh MapRolesToGroup --username smadmin --password smadmin --groupID nms-omnibus-admins --rolesList chartViewer,operator,configurator,monitor,chartCreator,suppressmonitor,ncw_admin,ncw_user,ncw_dashboard_editor,ncw_gauges_editor,ncw_gauges_viewer,netcool_ro,netcool_rw,iscadmins,administrator,chartAdministrator,samples
#			echo "sleeping 10 seconds before checking if roles were applied"
#			unset omnibus_admins
#			sleep 10
#			/opt/IBM/JazzSM/ui/bin/consolecli.sh ListRolesFromGroup --groupID nms-omnibus-admins &> nms-omnibus-admins
#			omnibus_admins=`cat nms-omnibus-admins|grep ncw_admin|cut -d" " -f1`
#			if [[ $omnibus_admins == "ncw_admin" ]]
#			then
#				echo "Webgui roles were successfully applied to nms-omnibus-admins group"
#			else
#				echo "Webgui roles were not found for nms-omnibus-admins group. Sleeping for 30 seconds and trying again"
#				/opt/IBM/JazzSM/ui/bin/consolecli.sh MapRolesToGroup --username smadmin --password smadmin --groupID nms-omnibus-admins --rolesList chartViewer,operator,configurator,monitor,chartCreator,suppressmonitor,ncw_admin,ncw_user,ncw_dashboard_editor,ncw_gauges_editor,ncw_gauges_viewer,netcool_ro,netcool_rw,iscadmins,administrator,chartAdministrator,samples
#				unset omnibus_admins
#				/opt/IBM/JazzSM/ui/bin/consolecli.sh ListRolesFromGroup --groupID nms-omnibus-admins &> nms-omnibus-admins
#				omnibus_admins=`cat nms-omnibus-admins|grep ncw_admin|cut -d" " -f1`
#				if [[ $omnibus_admins == "ncw_admin" ]]
#				then
#					echo "Webgui roles were successfully applied to nms-omnibus-admins group"
#				else
#					echo "Webgui roles were not found for nms-omnibus-admins group. Sleeping for 30 seconds and trying again"
#				fi
#			fi
#				
#		else
#			echo "Webgui roles are already assigned to nms-omnibus-admins group so doing nothing here"
#		fi
#		if [[ ! $omnibus_users == "ncw_user" ]]
#		then
#			echo "LDAP group nms-omnibus-users was not found and we are trying to assign administrative roles to the group." >> $POST_CONFIG_LOG2
#			/opt/IBM/JazzSM/ui/bin/consolecli.sh MapRolesToGroup --username smadmin --password smadmin --groupID nms-omnibus-users --rolesList chartViewer,operator,configurator,monitor,chartCreator,suppressmonitor,ncw_user,ncw_gauges_viewer,netcool_ro,netcool_rw,samples
#                        echo "sleeping 10 seconds before checking if roles were applied"
#                        unset omnibus_users
#                        sleep 10
#                        /opt/IBM/JazzSM/ui/bin/consolecli.sh ListRolesFromGroup --groupID nms-omnibus-users &> nms-omnibus-users
#                        omnibus_users=`cat nms-omnibus-users|grep ncw_user|cut -d" " -f1`
#                        if [[ $omnibus_users == "ncw_user" ]]
#                        then
#                                echo "Webgui roles were successfully applied to nms-omnibus-users group"
#                        else
#                                echo "Webgui roles were not found for nms-omnibus-users group. Sleeping for 30 seconds and trying again"
#				/opt/IBM/JazzSM/ui/bin/consolecli.sh MapRolesToGroup --username smadmin --password smadmin --groupID nms-omnibus-users --rolesList chartViewer,operator,configurator,monitor,chartCreator,suppressmonitor,ncw_user,ncw_gauges_viewer,netcool_ro,netcool_rw,samples
#                                unset omnibus_users
#                                /opt/IBM/JazzSM/ui/bin/consolecli.sh ListRolesFromGroup --groupID nms-omnibus-users &> nms-omnibus-users
#                                omnibus_users=`cat nms-omnibus-users|grep ncw_user|cut -d" " -f1`
#                                if [[ $omnibus_users == "ncw_user" ]]
#                                then
#                                        echo "Webgui roles were successfully applied to nms-omnibus-users group"
#                                else
#                                        echo "Webgui roles were not found for nms-omnibus-users group. Sleeping for 30 seconds and trying again"
#                                fi
#                        fi
#
#                else
#                        echo "Webgui roles are already assigned to nms-omnibus-users group so doing nothing here"
#                fi
#		if [[ ! $omnibus_viewers == "ncw_user" ]]
#                then
#                        echo "LDAP group nms-omnibus-viewers was not found and we are trying to assign administrative roles to the group." >> $POST_CONFIG_LOG2
#			/opt/IBM/JazzSM/ui/bin/consolecli.sh MapRolesToGroup --username smadmin --password smadmin --groupID nms-omnibus-viewers --rolesList chartViewer,monitor,ncw_user,ncw_gauges_viewer,netcool_ro,samples
#                        echo "sleeping 10 seconds before checking if roles were applied"
#                        unset omnibus_viewers
#                        sleep 10
#                        ./consolecli.sh ListRolesFromGroup --groupID nms-omnibus-viewers &> nms-omnibus-viewers
#                        omnibus_viewers=`cat nms-omnibus-viewers|grep ncw_user|cut -d" " -f1`
#                        if [[ $omnibus_viewers == "ncw_user" ]]
#                        then
#                                echo "Webgui roles were successfully applied to nms-omnibus-viewers group"
#                        else
#                                echo "Webgui roles were not found for nms-omnibus-viewers group. Sleeping for 30 seconds and trying again"
#				/opt/IBM/JazzSM/ui/bin/consolecli.sh MapRolesToGroup --username smadmin --password smadmin --groupID nms-omnibus-viewers --rolesList chartViewer,monitor,ncw_user,ncw_gauges_viewer,netcool_ro,samples
#                                unset omnibus_viewers
#                                ./consolecli.sh ListRolesFromGroup --groupID nms-omnibus-viewers &> nms-omnibus-viewers
#                                omnibus_viewers=`cat nms-omnibus-viewers|grep ncw_user|cut -d" " -f1`
#                                if [[ $omnibus_viewers == "ncw_user" ]]
#                                then
#                                        echo "Webgui roles were successfully applied to nms-omnibus-viewers group"
#                                else
#                                        echo "Webgui roles were not found for nms-omnibus-viewers group. Sleeping for 30 seconds and trying again"
#                                fi
#                        fi
#
#                else
#                        echo "Webgui roles are already assigned to nms-omnibus-viewers group so doing nothing here"
#                fi
#	#fi
#
#	#echo "Sleeping for 10 seconds" >> $POST_CONFIG_LOG
#	#sleep 10
#
##	cp /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/wim/config/wimconfig.xml /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/wim/config/bkp_wimconfig.xml
##	rm -f /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/wim/config/wimconfig.xml
##	ln -s /opt/viasat/omnibus/configs/webgui/wimconfig.xml /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/wim/config/wimconfig.xml

	#sed -i "s/bunnyqueue02/{{inventory_hostname}}.{{domain}}/g" /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/serverindex.xml

	#if [ -d /opt/IBM/netcool/gui/omnibus_webgui/etc/data ]
	#then
        #	echo "Rsync backed up webgui data from /opt/viasat/omnibus/data/webgui/etc /opt/IBM/netcool/gui/omnibus_webgui/ directory."
	#	rsync -avhW --no-compress --progress /opt/viasat/omnibus/data/webgui/etc/data /opt/IBM/netcool/gui/omnibus_webgui/etc
	#else
        #	nothing="nothing"
	#fi

	##echo "Copying new server.init file to /opt/IBM/netcool/gui/omnibus_webgui/etc/" >> $POST_CONFIG_LOG
	#mv /opt/IBM/netcool/gui/omnibus_webgui/etc/server.init /opt/IBM/netcool/gui/omnibus_webgui/etc/bkp_server.init 
	##cp /opt/IBM/netcool/gui/omnibus_webgui/etc/server.init /opt/IBM/netcool/gui/omnibus_webgui/etc/bkp_server.init
	##rm -f /opt/IBM/netcool/gui/omnibus_webgui/etc/server.init
	##ln -s /opt/viasat/omnibus/configs/webgui/server.init /opt/IBM/netcool/gui/omnibus_webgui/etc/server.init

	##echo "Copying serverindex.xml file to /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/serverindex.xml" >> $POST_CONFIG_LOG
	##cp /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/serverindex.xml /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/bkp_serverindex.xml
	##rm -f /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/serverindex.xml
	##ln -s /opt/viasat/omnibus/configs/webgui/serverindex.xml /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/serverindex.xml 

	#echo "Copying server.xml file to /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/servers/server1/server.xml" >> $POST_CONFIG_LOG
	#cp /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/servers/server1/server.xml /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/servers/server1/bkp_server.xml 
	#rm -f /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/servers/server1/server.xml 
	#ln -s /opt/viasat/omnibus/configs/webgui/server.xml /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/servers/server1/server.xml 

	#echo "Setting minimum and maximum jvm memory at startup in /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/servers/server1/server.xml" >> $POST_CONFIG_LOG
	#cd /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/servers/server1
	#sed -i 's/initialHeapSize=\"512\"/initialHeapSize="1024"/' server.xml
	#sed -i 's/initialHeapSize=\"768\"/initialHeapSize="2048"/' server.xml

	echo "Creating /opt/viasat/omnibus/logs/webgui/post_process1" 
	touch /opt/viasat/omnibus/logs/webgui/post_process1

	echo "Restarting WebGUI" >> $POST_CONFIG_LOG
	/opt/IBM/JazzSM/profile/bin/stopServer.sh server1 -username smadmin -password smadmin
	exit
fi
} 2>&1 | tee -a $POST_CONFIG_LOG
