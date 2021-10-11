#!/bin/sh
#set -x
WEBGUI_DATA_BKP_LOG="/opt/viasat/omnibus/logs/webgui/webgui_data_backup.log"
MYDATE=`date +"%m%d%Y_%H_%M"`
DATE=`date`
H_USER_DATA_VOLUME="/opt/viasat/omnibus/data/webgui/etc/data"
H_USER_CONFIGSTORE_VOLUME="/opt/viasat/omnibus/data/webgui/etc/configstore"
H_GLOBAL_FILTER_FILE="/opt/viasat/omnibus/data/webgui/etc/data/global/filter.xml"
H_GLOBAL_FILTER_SIZE=`stat -c %s /opt/viasat/omnibus/data/webgui/etc/data/global/filter.xml`
C_USER_DATA_VOLUME="/opt/viasat/var/lib/docker/volumes/userdata/_data"
C_USER_CONFIGSTORE_VOLUME="/opt/viasat/var/lib/docker/volumes/userconfig/_data"
C_GLOBAL_FILTER_FILE="/opt/viasat/var/lib/docker/volumes/userdata/_data/global/filter.xml"
C_GLOBAL_FILTER_SIZE=`stat -c %s /opt/viasat/var/lib/docker/volumes/userdata/_data/global/filter.xml`

>$WEBGUI_DATA_BKP_LOG

{
if [ -f /opt/viasat/omnibus/logs/webgui/post_process4 ]
then
	echo "Found /opt/viasat/omnibus/logs/webgui/post_process4 so exiting"
        exit
else
        echo "Sleeping for 30 seconds"
        sleep 30

                if [[ "$C_GLOBAL_FILTER_SIZE" > 0 ]] && [[ "$H_GLOBAL_FILTER_SIZE" > 0 ]]
                then
			echo "Both files are larger than 0"
			if [[ "$C_GLOBAL_FILTER_SIZE" > "$H_GLOBAL_FILTER_SIZE" ]]
			then
                        	echo "The containers global filter.xml is larger than the backed up global filter.xml on the host"
                        	echo "This is an indication that the data in the container volume is newer than the backup"
                        	echo "The volumes are persistent so the container will be gracefully shutdown in order to save the data"
				yes|cp -R ${H_USER_DATA_VOLUME}/* ${C_USER_DATA_VOLUME}/
				yes|cp -R ${H_USER_CONFIGSTORE_VOLUME}/* ${C_USER_CONFIGSTORE_VOLUME}/
				unset C_GLOBAL_FILTER_SIZE
                                unset H_GLOBAL_FILTER_SIZE
                                C_GLOBAL_FILTER_SIZE=`stat -c %s /opt/viasat/var/lib/docker/volumes/userdata/_data/global/filter.xml`
                                H_GLOBAL_FILTER_SIZE=`stat -c %s /opt/viasat/omnibus/data/webgui/etc/data/global/filter.xml`
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
	
			elif [[ "$H_GLOBAL_FILTER_SIZE" > "$C_GLOBAL_FILTER_SIZE" ]]
			then
				echo "The containers global filter.xml is smaller than the backed up global filter.xml on the host"
                        	echo "This is an indication that the data in the container volume might be older than the backup"
                        	echo "The container data will be copied and the container will be gracefully shutdown in order to save the data"
				yes|cp -R ${C_USER_DATA_VOLUME}/* ${H_USER_DATA_VOLUME}/
				yes|cp -R ${C_USER_CONFIGSTORE_VOLUME}/* ${H_USER_CONFIGSTORE_VOLUME}/	
				unset C_GLOBAL_FILTER_SIZE
				unset H_GLOBAL_FILTER_SIZE
				C_GLOBAL_FILTER_SIZE=`stat -c %s /opt/viasat/var/lib/docker/volumes/userdata/_data/global/filter.xml`
				H_GLOBAL_FILTER_SIZE=`stat -c %s /opt/viasat/omnibus/data/webgui/etc/data/global/filter.xml`
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
			elif [[ "$C_GLOBAL_FILTER_SIZE" -eq "$H_GLOBAL_FILTER_SIZE" ]]
                       	then
				echo "No difference in global filter.xml so moving on"
                        	echo "Creating /opt/viasat/omnibus/logs/webgui/post_process4"
                        	touch /opt/viasat/omnibus/logs/webgui/post_process4
                        	echo "Restarting WebGUI"
                        	/opt/IBM/JazzSM/profile/bin/stopServer.sh server1 -username smadmin -password smadmin
                        	exit
                        else
				echo "Data check has failed so something is still wrong"
                        fi
		else
			echo "Both files were either not found or either could be zero length so doing nothing"
                fi
fi
} 2>&1 | tee -a $WEBGUI_DATA_BKP_LOG

