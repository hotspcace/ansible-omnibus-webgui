#!/bin/bash
set -x

POST_CONFIG_LOG2="/opt/viasat/omnibus/logs/webgui/post_webgui_config_2.log"

>$POST_CONFIG_LOG2

{

if [ -f /opt/viasat/omnibus/logs/webgui/post_process2 ]
then
        exit
else

	echo "================================================================================"
	echo "Change default password for NodeDefaultTrustStore before importing certificates"
	echo "================================================================================"
	cd /opt/IBM/JazzSM/profile/bin
	./wsadmin.sh -lang jython -user smadmin -password smadmin -f /opt/viasat/omnibus/configs/webgui/changeKeystorePassword.py

	echo " "
	echo "================================================================================"
	echo "Importing certificate 1 (awsldapcert)"
	echo "================================================================================"
	/opt/IBM/WebSphere/AppServer/java/bin/keytool -import -alias awsldapcert -file /opt/viasat/omnibus/configs/webgui/awsldapcert -keystore /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/trust.p12 -storepass changeme -storetype PKCS12 -noprompt
	echo " "
        echo "================================================================================"
	echo "Importing certificate 2 (awsldapcert2)"
	echo "================================================================================"
	/opt/IBM/WebSphere/AppServer/java/bin/keytool -import -alias awsldapcert2 -file /opt/viasat/omnibus/configs/webgui/awsldapcert2 -keystore /opt/IBM/JazzSM/profile/config/cells/JazzSMNode01Cell/nodes/JazzSMNode01/trust.p12 -storepass changeme -storetype PKCS12 -noprompt

	echo " "
#        echo "================================================================================"
#        echo "Delete root cert for NodeDefaultTrustStore and replace with new root certificat"
#        echo "================================================================================"
#	if [[ $MY_HOST == "prod-omnibus-webgui01.nms.viasat.io" ]]
#	then
#        	echo "Delete root cert for NodeDefaultTrustStore and replace with new root certificate for prod env"
#        	cd /opt/IBM/JazzSM/profile/bin
#        	./wsadmin.sh -lang jython -user smadmin -password smadmin -f /opt/viasat/omnibus/configs/webgui/replace_root_cert_prod.py
#
#        	echo "changing hostname in websphere to prod hostname"
#        	./wsadmin.sh -lang jython -user smadmin -password smadmin -f /opt/viasat/omnibus/configs/webgui/hostname_change_prod.py
#	else
#        	echo "Delete root cert for NodeDefaultTrustStore and replace with new root certificate for non-prod env"
#		cd /opt/IBM/JazzSM/profile/bin
#        	./wsadmin.sh -lang jython -user smadmin -password smadmin -f /opt/viasat/omnibus/configs/webgui/replace_root_cert.py
#
#        	echo "changing hostname in websphere to non-prod env"
#        	./wsadmin.sh -lang jython -user smadmin -password smadmin -f /opt/viasat/omnibus/configs/webgui/hostname_change_non_prod.py
#	fi
	echo " "
        echo "================================================================================"
        echo "Deleting original container conf file and creating link to conf files on host"
        echo "================================================================================"
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

        echo "Creating /opt/viasat/omnibus/logs/webgui/post_process2"
        touch /opt/viasat/omnibus/logs/webgui/post_process2

	echo "Restarting WebGUI"
	/opt/IBM/JazzSM/profile/bin/stopServer.sh server1 -username smadmin -password smadmin

	sleep 10
	/opt/IBM/JazzSM/profile/bin/startServer.sh server1
	exit
fi
} 2>&1 | tee -a $POST_CONFIG_LOG2
