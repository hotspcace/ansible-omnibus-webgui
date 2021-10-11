#!/bin/bash

set -x

RUN_LOG="/opt/viasat/omnibus/logs/webgui/run_jazzsm.log"
CONFIGS_HOME="/opt/viasat/omnibus/configs/webgui"

>$RUN_LOG

[ -z "$OBJECTSERVER_PRIMARY_HOST" ] && OBJECTSERVER_PRIMARY_HOST=$OBJSRV_PORT_4100_TCP_ADDR
[ -z "$OBJECTSERVER_PRIMARY_PORT" ] && OBJECTSERVER_PRIMARY_PORT=$OBJSRV_PORT_4100_TCP_PORT
[ -z "$OBJECTSERVER_PRIMARY_NAME" ] && OBJECTSERVER_PRIMARY_NAME=$OBJSRV_ENV_OBJSRV
[ -z "$OBJECTSERVER_USER" ] && OBJECTSERVER_USER=root

{
#for VAR in OBJECTSERVER_PRIMARY_HOST OBJECTSERVER_PRIMARY_NAME OBJECTSERVER_USER OBJECTSERVER_PASSWORD OBJECTSERVER_ENCRYPTED OBJECTSERVER_ALGORITHM_ATTRIBUTE OBJECTSERVER_SSL OBJECTSERVER_PRIMARY_PORT OBJECTSERVER_SECONDARY_HOST OBJECTSERVER_FAILOVER OBJECTSERVER_SECONDARY_PORT
#do
#echo "Setting CONFIGURATION_TOKEN_$VAR to ${!VAR}"
#sed -i"" -e "s/@CONFIGURATION_TOKEN_$VAR@/${!VAR}/g" /opt/viasat/omnibus/configs/webgui/ncwDataSourceDefinitions.xml
#done
#echo "Deleting original file and creating link to webgui config files" >> RUN_LOG
#rm -f /opt/IBM/netcool/gui/omnibus_webgui/bin/ncwDataSourceDefinitions.xml
#ln -s /opt/viasat/omnibus/configs/webgui/ncwDataSourceDefinitions.xml /opt/IBM/netcool/gui/omnibus_webgui/bin/ncwDataSourceDefinitions.xml
#rm -f /opt/IBM/netcool/gui/omnibus_webgui/etc/default/datasources/ncwDataSourceDefinitions.xml
#ln -s /opt/viasat/omnibus/configs/webgui/ncwDataSourceDefinitions.xml /opt/IBM/netcool/gui/omnibus_webgui/etc/default/datasources/ncwDataSourceDefinitions.xml
#rm -f /opt/IBM/netcool/gui/omnibus_webgui/etc/datasources/ncwDataSourceDefinitions.xml
#ln -s /opt/viasat/omnibus/configs/webgui/ncwDataSourceDefinitions.xml /opt/IBM/netcool/gui/omnibus_webgui/etc/datasources/ncwDataSourceDefinitions.xml
#rm -f /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/servers/server1/server.xml
#ln -s /opt/viasat/omnibus/configs/webgui/server.xml /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/servers/server1/server.xml 
#rm -f /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/wim/config/wimconfig.xml
#ln -s /opt/viasat/omnibus/configs/webgui/wimconfig.xml /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/wim/config/wimconfig.xml
#
echo "Now running /opt/IBM/JazzSM/profile/bin/startServer.sh server1 -script /opt/IBM/JazzSM/profile/bin/startJazz.sh"
[ ! -f /opt/IBM/JazzSM/profile/bin/startJazz.sh ] && /opt/IBM/JazzSM/profile/bin/startServer.sh server1 -script /opt/IBM/JazzSM/profile/bin/startJazz.sh
exec /opt/IBM/JazzSM/profile/bin/startJazz.sh
} 2>&1 | tee -a $RUN_LOG
