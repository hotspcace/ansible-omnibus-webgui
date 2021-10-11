#!/bin/sh
OBJSRV_CONT_STARTUP_LOG="/opt/viasat/omnibus/logs/objsrv_cont_startup.log"
MYDATE=`date +"%m%d%Y_%H_%M"`
OMNIDB_DIR="$OMNIHOME/db/${$OBJSRV}"
TEST="$OMNIHOME/db/$OBJSRV/table_store.tab"
TEST2=`cat $NCHOME/etc/omni.dat|grep objectserver|cut -d":" -f2|cut -d" " -f2`
TEST3=`cat /opt/IBM/tivoli/netcool/etc/interfaces.linux2x86|grep master|cut -d" " -f4`
KILLDB=0
#CHECKME=`grep objectserver /opt/IBM/tivoli/netcool/etc/omni.dat`
>$OBJSRV_CONT_STARTUP_LOG
{
echo "Running nco_igen to create interfaces file"
/opt/IBM/tivoli/netcool/bin/nco_igen
echo "Finished running nco_igen"
echo "Copying /opt/viasat/omnibus/configs/objectserver/bkp_hist.sh to /root/bkp_hist.sh"
cp /opt/viasat/omnibus/configs/objectserver/bkp_hist.sh /root/bkp_hist.sh
if [[ "$KILLDB" -eq 1 ]]
then
        echo "The KILLDB command has been passed so the current objectserver DB will be deleted and recreated." #>> $OBJSRV_CONT_STARTUP_LOG
        echo "Removing DB." #>> $OBJSRV_CONT_STARTUP_LOG
        rm -rf /opt/viasat/omnibus/objectserver/db/*
        echo "The objectserver DB has been removed." #>> $OBJSRV_CONT_STARTUP_LOG
else
		echo "KILLDB not initiated."
fi

echo "Checking to see if Objectserver DB file exists and if so the I will just start the objectserver."
if [[ -e "$TEST" && -f "$TEST" ]]
then
	if [[ -L "$OMNIDB_DIR" ]]
       	then
               	echo "Omnibus DB Directory $OMNIHOME/db/$OBJSRV exists and is a symbolic link to /opt/viasat/omnibus/db/$OBJSRV"
       	else
               	echo "Creating link to objectserver DB"
               	ln -s /opt/viasat/omnibus/objectserver/db/$OBJSRV $OMNIHOME/db/$OBJSRV
               	echo "Objectserver DB link has been created"
       	fi
        echo "Objectserver DB already exists so starting the objectserver"
        setarch $(arch) --uname-2.6 $OMNIHOME/bin/nco_objserv -propsfile /opt/viasat/omnibus/configs/objectserver/${OBJSRV}.props

else
	if [[ -L "$OMNIDB_DIR" ]]
	then
                echo "Omnibus DB Directory $OMNIHOME/db/$OBJSRV exists and is a symbolic link to /opt/viasat/omnibus/db/$OBJSRV"
        else
                echo "Creating link to objectserver DB"
                ln -s /opt/viasat/omnibus/objectserver/db/$OBJSRV $OMNIHOME/db/$OBJSRV
                echo "Objectserver DB link has been created"
        fi
	echo "Creating DB Directory if it does not exist"
	mkdir -p /opt/viasat/omnibus/objectserver/db/${OBJSRV}
        echo "Initializing Custom Omnibus Objectserver DB for Exede"
		/opt/IBM/tivoli/netcool/omnibus/bin/nco_dbinit -alertsdata -alertsdatafile /opt/viasat/omnibus/configs/objectserver/alertsdata3.sql -applicationfile /opt/viasat/omnibus/configs/objectserver/application3.sql -automationfile /opt/viasat/omnibus/configs/objectserver/automation3.sql -nopropsfile -customconfigfile /opt/viasat/omnibus/configs/objectserver/addcolumns.sql -desktopfile /opt/viasat/omnibus/configs/objectserver/desktop3.sql -force -memstoredatadirectory /opt/viasat/omnibus/objectserver/db -messagelevel DEBUG -messagelog /opt/viasat/omnibus/logs/nco_dbinit.log -objservpropsfile /opt/viasat/omnibus/configs/objectserver/NCOMS.props -secauditlevel DEBUG -secauditlog /opt/viasat/omnibus/logs/secaudit.log -securityfile /opt/viasat/omnibus/configs/objectserver/security3.sql -server NCOMS -systemfile /opt/viasat/omnibus/configs/objectserver/system3.sql
        echo "Custom Omnibus Objectserver DB for Exede has been created."

        echo "Starting the objectserver"
        setarch $(arch) --uname-2.6 $OMNIHOME/bin/nco_objserv -propsfile /opt/viasat/omnibus/configs/objectserver/${OBJSRV}.props
        echo "Objectserver has been started"
 
fi
} 2>&1 | tee -a $OBJSRV_CONT_STARTUP_LOG
cp $OBJSRV_CONT_STARTUP_LOG /opt/viasat/omnibus/logs/objsrv_cont_startup_${MYDATE}.log
rm -f $OBJSRV_CONT_STARTUP_LOG
