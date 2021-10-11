#!/bin/bash
set -x

POST_CONFIG_LOG4="/opt/viasat/omnibus/logs/webgui/post_webgui_config4.log"
H_USER_DATA_VOLUME="/opt/viasat/omnibus/data/webgui/etc/data"
H_USER_CONFIGSTORE_VOLUME="/opt/viasat/omnibus/data/webgui/etc/configstore"
H_GLOBAL_FILTER_SIZE=`stat -c %s /opt/viasat/omnibus/data/webgui/etc/data/global/filter.xml`
D_USER_DATA_VOLUME="/opt/viasat/omnibus/data/etc/data"
D_USER_CONFIGSTORE_VOLUME="/opt/viasat/omnibus/data/etc/configstore"
D_GLOBAL_FILTER_SIZE=`stat -c %s /opt/viasat/omnibus/data/etc/data/global/filter.xml`
C_USER_DATA_VOLUME="/opt/viasat/var/lib/docker/volumes/userdata/_data"
C_USER_CONFIGSTORE_VOLUME="/opt/viasat/var/lib/docker/volumes/userconfig/_data"
C_GLOBAL_FILTER_SIZE=`stat -c %s /opt/viasat/var/lib/docker/volumes/userdata/_data/global/filter.xml`

>$POST_CONFIG_LOG4

{
if [ -f /opt/viasat/omnibus/logs/webgui/post_process4 ]
then
	echo "/opt/viasat/omnibus/logs/webgui/post_process4 exists so exiting"
	exit
else
	echo "Sleeping for 30 seconds"
	sleep 30


	if [[ -d "$H_USER_DATA_VOLUME" ]]
	then 
		if [[ "$C_GLOBAL_FILTER_SIZE" < "$H_GLOBAL_FILTER_SIZE" ]]
		then
			echo "The containers global filter.xml is larger than the backed up global filter.xml on the host"
			echo "This means webgui started up without roles assigned to the proper LDAP groups"
			echo "The backed up etc directory will now be copied to the container and the container will be gracefully shutdown in order to save the data"
			yes|cp -R ${H_USER_DATA_VOLUME}/* ${C_USER_DATA_VOLUME}/	
			yes|cp -R ${H_USER_CONFIGSTORE_VOLUME}/* ${C_USER_CONFIGSTORE_VOLUME}/	
			if [[ "$C_GLOBAL_FILTER_SIZE" -eq "$H_GLOBAL_FILTER_SIZE" ]]
			then
				echo "Data was verified to be successfully copied"
				echo "Creating /opt/viasat/omnibus/logs/webgui/post_process4"
                		touch /opt/viasat/omnibus/logs/webgui/post_process4
                		echo "Restarting WebGUI"
                		/opt/IBM/JazzSM/profile/bin/stopServer.sh server1 -username smadmin -password smadmin
                		exit
			else
				echo "Data check has failed so something is still wrong"
			fi
			echo "Creating /opt/viasat/omnibus/logs/webgui/post_process4"
        		touch /opt/viasat/omnibus/logs/webgui/post_process4
			echo "Restarting WebGUI"
			/opt/IBM/JazzSM/profile/bin/stopServer.sh server1 -username smadmin -password smadmin
			exit
		else
			echo "No difference in global filter.xml so moving on"
			echo "Creating /opt/viasat/omnibus/logs/webgui/post_process4"
                	touch /opt/viasat/omnibus/logs/webgui/post_process4
			exit
		fi
	else
		echo "Could not find directory $H_USER_DATA_VOLUME so we will try and use default files"
		if [[ -d "$D_USER_DATA_VOLUME" ]]
		then
			echo "$D_USER_DATA_VOLUME was found so copying now"
			yes|cp -R ${D_USER_DATA_VOLUME}/* ${C_USER_DATA_VOLUME}/
			
		else
			echo "$D_USER_DATA_VOLUME was not found either so data will be missing. Please troubleshoot."
		fi
		if [[ -d "$D_USER_CONFIGSTORE_VOLUME" ]]
                then
                        echo "$D_USER_CONFIGSTORE_VOLUME was found so copying now"
                        yes|cp -R ${D_USER_CONFIGSTORE_VOLUME}/* ${C_USER_CONFIGSTORE_VOLUME}/
                else
                        echo "$D_USER_CONFIGSTORE_VOLUME was not found either so data will be missing. Please troubleshoot."
                fi
		if [[ "$C_GLOBAL_FILTER_SIZE" -eq "$D_GLOBAL_FILTER_SIZE" ]]
		then
			echo "Default data was verified to be successfully copied"
			echo "Creating /opt/viasat/omnibus/logs/webgui/post_process4"
			touch /opt/viasat/omnibus/logs/webgui/post_process4
			echo "Restarting WebGUI"
			/opt/IBM/JazzSM/profile/bin/stopServer.sh server1 -username smadmin -password smadmin
			exit
		else
			echo "Data check has failed so something is still wrong"
		fi

	fi
	
fi
} 2>&1 | tee -a $POST_CONFIG_LOG4
