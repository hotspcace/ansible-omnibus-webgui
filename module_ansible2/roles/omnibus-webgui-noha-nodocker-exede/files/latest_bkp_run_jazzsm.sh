#!/bin/bash
STARTUP_LOG="/opt/viasat/omnibus/logs/webgui/run_jazzsm.log"
>$STARTUP_LOG

set -x
#{
CONFIGS_HOME="/opt/viasat/omnibus/configs/webgui"
#[ -z "$OBJECTSERVER_PRIMARY_HOST" ] && OBJECTSERVER_PRIMARY_HOST=$OBJSRV_PORT_4100_TCP_ADDR
#[ -z "$OBJECTSERVER_PRIMARY_PORT" ] && OBJECTSERVER_PRIMARY_PORT=$OBJSRV_PORT_4100_TCP_PORT
#[ -z "$OBJECTSERVER_PRIMARY_NAME" ] && OBJECTSERVER_PRIMARY_NAME=$OBJSRV_ENV_OBJSRV
#[ -z "$OBJECTSERVER_USER" ] && OBJECTSERVER_USER=root

#if [ -f $CONFIGS_HOME/ncwDataSourceDefinitions.xml ];
#then

#        for VAR in OBJECTSERVER_PRIMARY_HOST OBJECTSERVER_PRIMARY_NAME OBJECTSERVER_USER OBJECTSERVER_PASSWORD OBJECTSERVER_ENCRYPTED OBJECTSERVER_ALGORITHM_ATTRIBUTE OBJECTSERVER_SSL OBJECTSERVER_PRIMARY_PORT OBJECTSERVER_SECONDARY_HOST OBJECTSERVER_FAILOVER OBJECTSERVER_SECONDARY_PORT
#        do
#        echo "Setting CONFIGURATION_TOKEN_$VAR to ${!VAR}"
#                sed -i"" -e "s/@CONFIGURATION_TOKEN_$VAR@/${!VAR}/g" /opt/viasat/omnibus/configs/webgui/ncwDataSourceDefinitions.xml
#	done
                echo "deleting original config files"
                rm -f /opt/IBM/netcool/gui/omnibus_webgui/etc/datasources/ncwDataSourceDefinitions.xml
                rm -f /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/servers/server1/server.xml 

                echo "Creating link to webgui config files"
                ln -s /opt/viasat/omnibus/configs/webgui/ncwDataSourceDefinitions.xml /opt/IBM/netcool/gui/omnibus_webgui/etc/datasources/ncwDataSourceDefinitions.xml
                ln -s /opt/viasat/omnibus/configs/webgui/server.xml /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/servers/server1/server.xml 

        	[ ! -f /opt/IBM/JazzSM/profile/bin/startJazz.sh ] && /opt/IBM/JazzSM/profile/bin/startServer.sh server1 -script /opt/IBM/JazzSM/profile/bin/startJazz.sh
       		exec /opt/IBM/JazzSM/profile/bin/startJazz.sh
#        	sleep 90
#        	cd /opt/IBM/JazzSM/ui/bin
#		./consolecli.sh MapRolesToUser  --username smadmin --password smadmin --userID smadmin --rolesList chartViewer,operator,configurator,samples,monitor,administrator,iscadmins,chartCreator,chartAdministrator,iscusers,suppressmonitor,ncw_admin,ncw_user,ncw_dashboard_editor,ncw_gauges_editor,ncw_gauges_viewer,netcool_ro,netcool_rwd
		#######################################################
		# Applying roles to smadmin if needed
		#######################################################
#		cd /opt/IBM/JazzSM/ui/bin
#		./consolecli.sh ListRolesFromUser --userID smadmin &> smadmin_roles
#		applied_smadmin_roles=`grep ncw_admin smadmin_roles|cut -d" " -f1`

#		if [[ $applied_smadmin_roles == "ncw_admin" ]]
#		then
#        		echo "Roles already assigned to smadmin" >> $STARTUP_LOG
#		else
#       			echo "Assigning Roles to smadmin user" >> $STARTUP_LOG
#        		#cd /opt/IBM/JazzSM/ui/bin
#        		./consolecli.sh MapRolesToUser  --username smadmin --password smadmin --userID smadmin --rolesList chartViewer,operator,configurator,monitor,chartCreator,suppressmonitor,ncw_admin,ncw_user,ncw_dashboard_editor,ncw_gauges_editor,ncw_gauges_viewer,netcool_ro,netcool_rw
#		fi
#		######################################################
#
#		echo "Sleeping for 10 seconds" >> $STARTUP_LOG
#		sleep 10
#		
#		#####################################################
#		# Importing certificate 1 (awsldapcert)
#		#####################################################
#		echo "Importing certificate 2 (awsldapcert2)" >> $STARTUP_LOG
#		/opt/IBM/WebSphere/AppServer/java/bin/keytool -import -alias awsldapcert2 -file /opt/viasat/omnibus/configs/webgui/awsldapcert2 -keystore /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/trust.p12 -storepass changeme -storetype PKCS12 -noprompt
#
#		echo "Sleeping for 10 seconds" >> $STARTUP_LOG
#		sleep 10
#
#		################################################################################################################
#		# Copying wimconfig.xml file to configs dir and creating symlink
#		################################################################################################################
#		echo "Copying new wimconfig file to /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/wim/config/" >> $STARTUP_LOG
#		mv /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/wim/config/wimconfig.xml /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/wim/config/bkp_wimconfig.xml
#		ln -s /opt/viasat/omnibus/configs/webgui/wimconfig.xml /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/wim/config/wimconfig.xml
#
#		echo "Sleeping for 10 seconds" >> $STARTUP_LOG
#		sleep 10

		############################################################################
		# Checking for environment and replacing root certificate
		##########################################################################
#		if [[ $MY_HOST == "prod-omnibus-webgui01.nms.viasat.io" ]]
##		then
#        		echo "Delete root cert for NodeDefaultTrustStore and replace with new root certificate for prod env" >> $STARTUP_LOG
#        		cd /opt/IBM/JazzSM/profile/bin
#        		./wsadmin.sh -lang jython -user smadmin -password smadmin -f /opt/viasat/omnibus/configs/webgui/replace_root_cert_prod.py
#
#        		echo "changing hostname in websphere to prod hostname" >> $STARTUP_LOG
#        		cd /opt/IBM/JazzSM/profile/bin
#        		./wsadmin.sh -lang jython -user smadmin -password smadmin -f /opt/viasat/omnibus/configs/webgui/hostname_change_prod.py
#
#
#		else
#        		echo "Delete root cert for NodeDefaultTrustStore and replace with new root certificate for non-prod env" >> $STARTUP_LOG
#        		cd /opt/IBM/JazzSM/profile/bin
#        		./wsadmin.sh -lang jython -user smadmin -password smadmin -f /opt/viasat/omnibus/configs/webgui/replace_root_cert.py
#
#        		echo "changing hostname in websphere to non-prod env" >> $STARTUP_LOG
#        		cd /opt/IBM/JazzSM/profile/bin
#        		./wsadmin.sh -lang jython -user smadmin -password smadmin -f /opt/viasat/omnibus/configs/webgui/hostname_change_non_prod.py
#
#		fi
#		echo "Sleeping for 10 seconds" >> $STARTUP_LOG
#		sleep 10

		##########################################################################
		# Copying server.init file and creating symlink
		##########################################################################
#		echo "Copying new server.init file to /opt/IBM/netcool/gui/omnibus_webgui/etc/" >> $STARTUP_LOG
#		mv /opt/IBM/netcool/gui/omnibus_webgui/etc/server.init /opt/IBM/netcool/gui/omnibus_webgui/etc/bkp_server.init
#		ln -s /opt/viasat/omnibus/configs/webgui/server.init /opt/IBM/netcool/gui/omnibus_webgui/etc/server.init

		#####################################
		# Setting Min and Max JVM Memory
		#####################################
#		echo "Setting minimum and maximum jvm memory at startup in /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/servers/server1/server.xml" >> $STARTUP_LOG
#		cd /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/servers/server1

#		sed -i 's/initialHeapSize=\"512\"/initialHeapSize="1024"/' server.xml
#		sed -i 's/initialHeapSize=\"768\"/initialHeapSize="2048"/' server.xml
#		echo "Sleeping for 10 seconds" >> $STARTUP_LOG
#		sleep 10
#
		######################
		# Restarting WebGui
		######################
	
		
#        	/opt/IBM/JazzSM/profile/bin/stopServer.sh server1 -username smadmin -password smadmin
#} 2>&1 | tee -a $STARTUP_LOG 
#else
        #echo "Hitting first sleep cycle"
        #sleep 10
        #if [ -f $CONFIGS_HOME/ncwDataSourceDefinitions.xml ];
        #then

        #        for VAR in OBJECTSERVER_PRIMARY_HOST OBJECTSERVER_PRIMARY_NAME OBJECTSERVER_USER OBJECTSERVER_PASSWORD OBJECTSERVER_ENCRYPTED OBJECTSERVER_ALGORITHM_ATTRIBUTE OBJECTSERVER_SSL OBJECTSERVER_PRIMARY_PORT OBJECTSERVER_SECONDARY_HOST OBJECTSERVER_FAILOVER OBJECTSERVER_SECONDARY_PORT
        #        do
        #                echo "Setting CONFIGURATION_TOKEN_$VAR to ${!VAR}"
        #                sed -i"" -e "s/@CONFIGURATION_TOKEN_$VAR@/${!VAR}/g" /opt/viasat/omnibus/configs/webgui/ncwDataSourceDefinitions.xml
#
#                        echo "deleting original config files"
                        #rm -f /opt/IBM/netcool/gui/omnibus_webgui/bin/ncwDataSourceDefinitions.xml
                        #rm -f /opt/IBM/netcool/gui/omnibus_webgui/etc/default/datasources/ncwDataSourceDefinitions.xml
#                        rm -f /opt/IBM/netcool/gui/omnibus_webgui/etc/datasources/ncwDataSourceDefinitions.xml
#                        rm -f /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/servers/server1/server.xml
        #               rm -f /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/wim/config/wimconfig.xml

#                        echo "Creating link to webgui config files"
                        #ln -s /opt/viasat/omnibus/configs/webgui/ncwDataSourceDefinitions.xml /opt/IBM/netcool/gui/omnibus_webgui/bin/ncwDataSourceDefinitions.xml
                        #ln -s /opt/viasat/omnibus/configs/webgui/ncwDataSourceDefinitions.xml /opt/IBM/netcool/gui/omnibus_webgui/etc/default/datasources/ncwDataSourceDefinitions.xml
#                        ln -s /opt/viasat/omnibus/configs/webgui/ncwDataSourceDefinitions.xml /opt/IBM/netcool/gui/omnibus_webgui/etc/datasources/ncwDataSourceDefinitions.xml
#			ln -s /opt/viasat/omnibus/configs/webgui/server.xml /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/servers/server1/server.xml
        #               ln -s /opt/viasat/omnibus/configs/webgui/wimconfig.xml /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/wim/config/wimconfig.xml

                        #sed -i"" -e "s/@CONFIGURATION_TOKEN_$VAR@/${!VAR}/g" /opt/IBM/netcool/gui/omnibus_webgui/etc/datasources/ncwDataSourceDefinitions.xml
                        #sed -i"" -e "s/@CONFIGURATION_TOKEN_$VAR@/${!VAR}/g" /opt/IBM/netcool/gui/omnibus_webgui/bin/ncwDataSourceDefinitions.xml


#                done

#[ ! -f /opt/IBM/JazzSM/profile/bin/startJazz.sh ] && /opt/IBM/JazzSM/profile/bin/startServer.sh server1 -script /opt/IBM/JazzSM/profile/bin/startJazz.sh
#exec /opt/IBM/JazzSM/profile/bin/startJazz.sh
        #       sleep 10
        #       /opt/IBM/JazzSM/ui/bin/consolecli.sh MapRolesToUser  --username smadmin --password smadmin --userID smadmin --rolesList chartViewer,operator,configurator,samples,monitor,administrator,iscadmins,chartCreator,chartAdministrator,iscusers,suppressmonitor,ncw_admin,ncw_user,ncw_dashboard_editor,ncw_gauges_editor,ncw_gauges_viewer,netcool_ro,netcool_rwd
        #       /opt/IBM/JazzSM/profile/bin/stopServer.sh server1 -username smadmin -password smadmin
#        else
#                echo "Did not find the file so could not run anything."
#        fi
#fi

