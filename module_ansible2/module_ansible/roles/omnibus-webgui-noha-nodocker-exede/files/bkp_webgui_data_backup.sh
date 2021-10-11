#!/bin/sh
#set -x
WEBGUI_DATA_BKP_LOG="/opt/viasat/omnibus/logs/webgui/webgui_data_backup.log"
MYDATE=`date +"%m%d%Y_%H_%M"`
DATE=`date`

#if [ ! -f $WEBGUI_DATA_BKP_LOG ]
#then
>$WEBGUI_DATA_BKP_LOG
echo "Restating Webgui server so data will be backed up" >>$WEBGUI_DATA_BKP_LOG
/opt/IBM/JazzSM/profile/bin/stopServer.sh server1 -username smadmin -password smadmin
exit
#else
#        nothing=nada
#fi

#if [ -f /usr/bin/rsync ]
#then
#	myrsync="rsync installed"
#else 
#	yum install rsync -y	
#	updatedb
#	echo "rsync has been installed"
	 
#fi

#echo "##############################################" >> $WEBGUI_DATA_BKP_LOG
#echo "# New Entry for $DATE" >> $WEBGUI_DATA_BKP_LOG
#echo "##############################################" >> $WEBGUI_DATA_BKP_LOG

#if [ -d /opt/IBM/netcool/gui/omnibus_webgui ]
#then
#	if [ -d /opt/viasat/omnibus/data/webgui/etc ]
#        then
#                echo "Deleting directory /opt/viasat/omnibus/data/webgui/etc" >> $WEBGUI_DATA_BKP_LOG
#                rm -rf /opt/viasat/omnibus/data/webgui/etc
#                echo "Now copying /opt/IBM/netcool/gui/omnibus_webgui/etc to /opt/viasat/omnibus/data/webgui" >> $WEBGUI_DATA_BKP_LOG
#		rsync -avhW --no-compress --progress /opt/IBM/netcool/gui/omnibus_webgui/etc /opt/viasat/omnibus/data/webgui/
                #cp -R /opt/IBM/netcool/gui/omnibus_webgui/etc /opt/viasat/omnibus/data/webgui/
#        else
#                echo "Directory /opt/viasat/omnibus/data/webgui/etc does not currently exist and will be copied." >> $WEBGUI_DATA_BKP_LOG
#		rsync -avhW --no-compress --progress /opt/IBM/netcool/gui/omnibus_webgui/etc /opt/viasat/omnibus/data/webgui/
                #cp -R /opt/IBM/netcool/gui/omnibus_webgui/etc /opt/viasat/omnibus/data/webgui/
#        fi
        #if [ -d /opt/viasat/omnibus/data/webgui/data ]
        #then
#echo "Deleting directory /opt/viasat/omnibus/data/webgui/data" >> $WEBGUI_DATA_BKP_LOG
#rm -rf /opt/viasat/omnibus/data/webgui/etc
#echo "Now copying /opt/IBM/netcool/gui/omnibus_webgui/etc/ to /opt/viasat/omnibus/data/webgui/etc" >> $WEBGUI_DATA_BKP_LOG
#yes|cp -R /opt/viasat/var/lib/docker/volumes/userdata/_data/* /opt/viasat/omnibus/data/webgui/etc/data/

#echo "Restating Webgui server so data will be backed up" >> $WEBGUI_DATA_BKP_LOG
#/opt/IBM/JazzSM/profile/bin/stopServer.sh server1 -username smadmin -password smadmin
        #else
        #        echo "Directory /opt/viasat/omnibus/data/webgui/data does not currently exist and will be copied." >> $WEBGUI_DATA_BKP_LOG
        #        cp -R /opt/IBM/netcool/gui/omnibus_webgui/etc/data /opt/viasat/omnibus/data/webgui/data
        #fi
        #if [ -d /opt/viasat/omnibus/data/webgui/configstore ]
        #then
        #        echo "Deleting directory /opt/viasat/omnibus/data/webgui/configstore" >> $WEBGUI_DATA_BKP_LOG
        #        rm -rf /opt/viasat/omnibus/data/webgui/configstore
        #        echo "Now copying /opt/IBM/netcool/gui/omnibus_webgui/etc/configstore to /opt/viasat/omnibus/data/webgui/configstore" >> $WEBGUI_DATA_BKP_LOG
        #        cp -R /opt/IBM/netcool/gui/omnibus_webgui/etc/configstore /opt/viasat/omnibus/data/webgui/configstore
        #else
        #        echo "Directory /opt/viasat/omnibus/data/webgui/configstore does not currently exist and will be copied." >> $WEBGUI_DATA_BKP_LOG
        #        cp -R /opt/IBM/netcool/gui/omnibus_webgui/etc/configstore /opt/viasat/omnibus/data/webgui/configstore
        #fi
        #if [ -d /opt/viasat/omnibus/data/webgui/resources ]
        #then
        #        echo "Deleting directory /opt/viasat/omnibus/data/webgui/resources" >> $WEBGUI_DATA_BKP_LOG
        #        rm -rf /opt/viasat/omnibus/data/webgui/resources
        #        echo "Now copying /opt/IBM/netcool/gui/omnibus_webgui/etc/resources to /opt/viasat/omnibus/data/webgui/resources" >> $WEBGUI_DATA_BKP_LOG
        #        cp -R /opt/IBM/netcool/gui/omnibus_webgui/etc/resources /opt/viasat/omnibus/data/webgui/resources
        #else
        #        echo "Directory /opt/viasat/omnibus/data/webgui/resources does not currently exist and will be copied." >> $WEBGUI_DATA_BKP_LOG
        #        cp -R /opt/IBM/netcool/gui/omnibus_webgui/etc/resources /opt/viasat/omnibus/data/webgui/resources
        #fi
        #if [ -d /opt/viasat/omnibus/data/webgui/maps ]
        #then
        #        echo "Deleting directory /opt/viasat/omnibus/data/webgui/maps" >> $WEBGUI_DATA_BKP_LOG
        #        rm -rf /opt/viasat/omnibus/data/webgui/maps
        #        echo "Now copying /opt/IBM/netcool/gui/omnibus_webgui/etc/maps to /opt/viasat/omnibus/data/webgui/maps" >> $WEBGUI_DATA_BKP_LOG
        #        cp -R /opt/IBM/netcool/gui/omnibus_webgui/etc/maps /opt/viasat/omnibus/data/webgui/maps
        #else
        #        echo "Directory /opt/viasat/omnibus/data/webgui/maps does not currently exist and will be copied." >> $WEBGUI_DATA_BKP_LOG
        #        cp -R /opt/IBM/netcool/gui/omnibus_webgui/etc/maps /opt/viasat/omnibus/data/webgui/maps
        #fi
        #if [ -d /opt/viasat/omnibus/data/webgui/charts ]
        #then
        #        echo "Deleting directory /opt/viasat/omnibus/data/webgui/charts" >> $WEBGUI_DATA_BKP_LOG
        #        rm -rf /opt/viasat/omnibus/data/webgui/charts
        #        echo "Now copying /opt/IBM/netcool/gui/omnibus_webgui/etc/charts to /opt/viasat/omnibus/data/webgui/charts" >> $WEBGUI_DATA_BKP_LOG
        #        cp -R /opt/IBM/netcool/gui/omnibus_webgui/etc/charts /opt/viasat/omnibus/data/webgui/charts
        #else
        #        echo "Directory /opt/viasat/omnibus/data/webgui/charts does not currently exist and will be copied." >> $WEBGUI_DATA_BKP_LOG
        #        cp -R /opt/IBM/netcool/gui/omnibus_webgui/etc/charts /opt/viasat/omnibus/data/webgui/charts
        #fi

#echo "##############################################" >> $WEBGUI_DATA_BKP_LOG
#echo "# End entry for $DATE" >> $WEBGUI_DATA_BKP_LOG
#echo "##############################################" >> $WEBGUI_DATA_BKP_LOG
#echo " " >> $WEBGUI_DATA_BKP_LOG

#else
#        echo "Could not find /opt/IBM/netcool/gui/omnibus_webgui/etc directory." >> $WEBGUI_DATA_BKP_LOG
#        echo "##############################################" >> $WEBGUI_DATA_BKP_LOG
#        echo "# End entry for $DATE" >> $WEBGUI_DATA_BKP_LOG
#        echo "##############################################" >> $WEBGUI_DATA_BKP_LOG
#        echo " " >> $WEBGUI_DATA_BKP_LOG
#fi

