#!/bin/bash

#set -x

WEBGUI_CONT_STARTUP_LOG="/opt/viasat/omnibus/logs/webgui/run_jazzsm.log"
MYDATE=`date +"%m%d%Y_%H_%M"`
CONFIGS_HOME="/opt/viasat/omnibus/configs/webgui"

>$WEBGUI_CONT_STARTUP_LOG

#ADMIN_OUTPUT="$(/opt/IBM/JazzSM/ui/bin/consolecli.sh ListRolesFromGroup --groupID nms-omnibus-admins)"

[ -z "$OBJECTSERVER_PRIMARY_HOST" ] && OBJECTSERVER_PRIMARY_HOST=$OBJSRV_PORT_4100_TCP_ADDR
[ -z "$OBJECTSERVER_PRIMARY_PORT" ] && OBJECTSERVER_PRIMARY_PORT=$OBJSRV_PORT_4100_TCP_PORT
[ -z "$OBJECTSERVER_PRIMARY_NAME" ] && OBJECTSERVER_PRIMARY_NAME=$OBJSRV_ENV_OBJSRV
[ -z "$OBJECTSERVER_USER" ] && OBJECTSERVER_USER=root


{

#case $variable in
#     pattern-1)      
#          commands
#          ;;
#     pattern-2)      
#          commands
#          ;;
#     pattern-3|pattern-4|pattern-5)
#          commands
#          ;; 
#     pattern-N)
#          commands
#          ;;
#     *)
#          commands
#          ;;
#esac
#if [ -d /opt/viasat/omnibus/data/webgui/etc ] && [ -f /opt/viasat/omnibus/configs/webgui/postprocess1 ] [ -L /opt/IBM/netcool/gui/omnibus_webgui/ ]
if [ -d /opt/viasat/omnibus/data/webgui/etc ] && [ -L /opt/IBM/netcool/gui/omnibus_webgui ]
then
	echo "/opt/viasat/omnibus/data/webgui/etc directory was found and /opt/IBM/netcool/gui/omnibus_webgui is also a symlink"
   
		if [ -f /opt/viasat/omnibus/configs/webgui/ncwDataSourceDefinitions.xml ];
		then
			echo "Entering Section 1 of run_jazzsm script in the then statement"

			for VAR in OBJECTSERVER_PRIMARY_HOST OBJECTSERVER_PRIMARY_NAME OBJECTSERVER_USER OBJECTSERVER_PASSWORD OBJECTSERVER_ENCRYPTED OBJECTSERVER_ALGORITHM_ATTRIBUTE OBJECTSERVER_SSL OBJECTSERVER_PRIMARY_PORT OBJECTSERVER_SECONDARY_HOST OBJECTSERVER_FAILOVER OBJECTSERVER_SECONDARY_PORT
			do
				echo "Setting CONFIGURATION_TOKEN_$VAR to ${!VAR}"
                		sed -i"" -e "s/@CONFIGURATION_TOKEN_$VAR@/${!VAR}/g" /opt/viasat/omnibus/configs/webgui/ncwDataSourceDefinitions.xml
			done
				#cp -R /opt/IBM/netcool/gui/omnibus_webgui/etc /opt/viasat/omnibus/data/webgui/
				echo "deleting original config files"
				rm -f /opt/IBM/netcool/gui/omnibus_webgui/etc/datasources/ncwDataSourceDefinitions.xml
				rm -f /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/servers/server1/server.xml 
				echo "Creating link to webgui config files"
				ln -s /opt/viasat/omnibus/configs/webgui/ncwDataSourceDefinitions.xml /opt/IBM/netcool/gui/omnibus_webgui/etc/datasources/ncwDataSourceDefinitions.xml
				ln -s /opt/viasat/omnibus/configs/webgui/server.xml /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/servers/server1/server.xml 

			echo "Starting Webgui in Section 1 of the run_jazzsm script"	
			[ ! -f /opt/IBM/JazzSM/profile/bin/startJazz.sh ] && /opt/IBM/JazzSM/profile/bin/startServer.sh server1 -script /opt/IBM/JazzSM/profile/bin/startJazz.sh
			exec /opt/IBM/JazzSM/profile/bin/startJazz.sh
		else
			echo "Entering 1st else section of the run_jazzsm script"
			echo "Hitting first sleep cycle of 10 seconds and looking for /opt/viasat/omnibus/configs/webgui/ncwDataSourceDefinitions.xml again"
			sleep 10
			if [ -f /opt/viasat/omnibus/configs/webgui/ncwDataSourceDefinitions.xml ];
			then
				echo "Found /opt/viasat/omnibus/configs/webgui/ncwDataSourceDefinitions.xml after 1st 10 second sleep"

				for VAR in OBJECTSERVER_PRIMARY_HOST OBJECTSERVER_PRIMARY_NAME OBJECTSERVER_USER OBJECTSERVER_PASSWORD OBJECTSERVER_ENCRYPTED OBJECTSERVER_ALGORITHM_ATTRIBUTE OBJECTSERVER_SSL OBJECTSERVER_PRIMARY_PORT OBJECTSERVER_SECONDARY_HOST OBJECTSERVER_FAILOVER OBJECTSERVER_SECONDARY_PORT
				do
					echo "Setting CONFIGURATION_TOKEN_$VAR to ${!VAR}"
					sed -i"" -e "s/@CONFIGURATION_TOKEN_$VAR@/${!VAR}/g" /opt/viasat/omnibus/configs/webgui/ncwDataSourceDefinitions.xml
				done

					echo "deleting original config files"
					rm -f /opt/IBM/netcool/gui/omnibus_webgui/etc/datasources/ncwDataSourceDefinitions.xml
					rm -f /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/servers/server1/server.xml

					echo "Creating link to webgui config files"
					ln -s /opt/viasat/omnibus/configs/webgui/ncwDataSourceDefinitions.xml /opt/IBM/netcool/gui/omnibus_webgui/etc/datasources/ncwDataSourceDefinitions.xml
					ln -s /opt/viasat/omnibus/configs/webgui/server.xml /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/servers/server1/server.xml
				echo "Starting Webgui after the 1st 10 second sleep cycle"
				[ ! -f /opt/IBM/JazzSM/profile/bin/startJazz.sh ] && /opt/IBM/JazzSM/profile/bin/startServer.sh server1 -script /opt/IBM/JazzSM/profile/bin/startJazz.sh
				exec /opt/IBM/JazzSM/profile/bin/startJazz.sh
			else
				echo "Did not find the file so could not run anything."
			fi
		fi
else
	if [ ! -d /opt/viasat/omnibus/data/webgui/etc ]
	then
		mkdir -p /opt/viasat/omnibus/data/webgui/etc
		cp -R /opt/IBM/netcool/gui/omnibus_webgui/etc/* /opt/viasat/omnibus/data/webgui/etc 
		#CONT_ETC_SIZE=`du -sh /opt/IBM/netcool/gui/omnibus_webgui/etc|grep etc|cut -d"   " -f1`
		#LOCAL_ETC_SIZE=`du -sh /opt/viasat/omnibus/data/webgui/etc|grep etc|cut -d"   " -f1`
		rm -rf /opt/IBM/netcool/gui/omnibus_webgui/etc
		ln -s /opt/viasat/omnibus/data/webgui/etc /opt/IBM/netcool/gui/omnibus_webgui/etc
		if [ -f /opt/viasat/omnibus/configs/webgui/ncwDataSourceDefinitions.xml ];
                then

                        for VAR in OBJECTSERVER_PRIMARY_HOST OBJECTSERVER_PRIMARY_NAME OBJECTSERVER_USER OBJECTSERVER_PASSWORD OBJECTSERVER_ENCRYPTED OBJECTSERVER_ALGORITHM_ATTRIBUTE OBJECTSERVER_SSL OBJECTSERVER_PRIMARY_PORT OBJECTSERVER_SECONDARY_HOST OBJECTSERVER_FAILOVER OBJECTSERVER_SECONDARY_PORT
                        do
                                echo "Setting CONFIGURATION_TOKEN_$VAR to ${!VAR}"
                                sed -i"" -e "s/@CONFIGURATION_TOKEN_$VAR@/${!VAR}/g" /opt/viasat/omnibus/configs/webgui/ncwDataSourceDefinitions.xml
			done
                                #cp -R /opt/IBM/netcool/gui/omnibus_webgui/etc /opt/viasat/omnibus/data/webgui/
                                echo "deleting original config files"
                                rm -f /opt/IBM/netcool/gui/omnibus_webgui/etc/datasources/ncwDataSourceDefinitions.xml
                                rm -f /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/servers/server1/server.xml
                                echo "Creating link to webgui config files"
                                ln -s /opt/viasat/omnibus/configs/webgui/ncwDataSourceDefinitions.xml /opt/IBM/netcool/gui/omnibus_webgui/etc/datasources/ncwDataSourceDefinitions.xml
                                ln -s /opt/viasat/omnibus/configs/webgui/server.xml /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/servers/server1/server.xml


                        [ ! -f /opt/IBM/JazzSM/profile/bin/startJazz.sh ] && /opt/IBM/JazzSM/profile/bin/startServer.sh server1 -script /opt/IBM/JazzSM/profile/bin/startJazz.sh
                        exec /opt/IBM/JazzSM/profile/bin/startJazz.sh 
		else
                                echo "Did not find the file so could not run anything."
                fi
	else 
		rm -rf /opt/IBM/netcool/gui/omnibus_webgui/etc
                ln -s /opt/viasat/omnibus/data/webgui/etc /opt/IBM/netcool/gui/omnibus_webgui/etc
                if [ -f /opt/viasat/omnibus/configs/webgui/ncwDataSourceDefinitions.xml ];
                then

                        for VAR in OBJECTSERVER_PRIMARY_HOST OBJECTSERVER_PRIMARY_NAME OBJECTSERVER_USER OBJECTSERVER_PASSWORD OBJECTSERVER_ENCRYPTED OBJECTSERVER_ALGORITHM_ATTRIBUTE OBJECTSERVER_SSL OBJECTSERVER_PRIMARY_PORT OBJECTSERVER_SECONDARY_HOST OBJECTSERVER_FAILOVER OBJECTSERVER_SECONDARY_PORT
                        do
                                echo "Setting CONFIGURATION_TOKEN_$VAR to ${!VAR}"
                                sed -i"" -e "s/@CONFIGURATION_TOKEN_$VAR@/${!VAR}/g" /opt/viasat/omnibus/configs/webgui/ncwDataSourceDefinitions.xml
			done
                                #cp -R /opt/IBM/netcool/gui/omnibus_webgui/etc /opt/viasat/omnibus/data/webgui/
                                echo "deleting original config files"
                                rm -f /opt/IBM/netcool/gui/omnibus_webgui/etc/datasources/ncwDataSourceDefinitions.xml
                                rm -f /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/servers/server1/server.xml
                                echo "Creating link to webgui config files"
                                ln -s /opt/viasat/omnibus/configs/webgui/ncwDataSourceDefinitions.xml /opt/IBM/netcool/gui/omnibus_webgui/etc/datasources/ncwDataSourceDefinitions.xml
                                ln -s /opt/viasat/omnibus/configs/webgui/server.xml /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/servers/server1/server.xml

                        [ ! -f /opt/IBM/JazzSM/profile/bin/startJazz.sh ] && /opt/IBM/JazzSM/profile/bin/startServer.sh server1 -script /opt/IBM/JazzSM/profile/bin/startJazz.sh
                        exec /opt/IBM/JazzSM/profile/bin/startJazz.sh
                else
                                echo "Did not find the file so could not run anything."
                fi
	fi
fi
} 2>&1 | tee -a $WEBGUI_CONT_STARTUP_LOG 
cp $WEBGUI_CONT_STARTUP_LOG /opt/viasat/omnibus/logs/webgui/run_jazzsm_${MYDATE}.log
rm -f $WEBGUI_CONT_STARTUP_LOG 
#rm -f /opt/viasat/omnibus/configs/webgui/postprocess*
