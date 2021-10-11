#!/bin/bash
#
#set -x

echo "To load the environment just run this script as is."
echo "To add alias' and environment variables to your bashrc file then add 'perm' as an argument when running the script."
echo "Example:"
echo "# ./omni_env.sh perm"
echo " "

read -p "Press enter to continue"

MYCHECK=`grep 'Custom entries start here' /home/$USER/.bashrc`
if [[ "$MYCHECK" =~ Custom ]]
then
        echo "Entries already exist in /home/${USER}/.bashrc so nothing will be written and this script will exit."
        exit
fi
GETHOST=$(hostname -f|cut -d"." -f2)
MYENVIRONMENT=${GETHOST^^}
BASHFILE="/home/$USER/.bashrc"
echo "$BASHFILE"
if [ "$1" == 'perm' ]
then
        if [ ! -f "$BASHFILE" ]
        then
                >${BASHFILE}
                echo "# .bashrc" >> ${BASHFILE}
                echo " " >> ${BASHFILE}
                echo "# Source global definitions" >> ${BASHFILE}
                echo "if [ -f /etc/bashrc ]; then" >> ${BASHFILE}
                echo "       . /etc/bashrc" >> ${BASHFILE}
                echo "fi" >> ${BASHFILE}

                echo "# Uncomment the following line if you don't like systemctl's auto-paging feature:" >> ${BASHFILE}
                echo "# export SYSTEMD_PAGER=" >> ${BASHFILE}
                echo " "
                echo "# User specific aliases and functions" >> ${BASHFILE}
                echo " " >> ${BASHFILE}
                echo " " >> ${BASHFILE}
        fi
        echo "#-----------------------------------------------------" >> ${BASHFILE}
        echo "# Custom entries start here." >> ${BASHFILE}
        echo "#-----------------------------------------------------" >> ${BASHFILE}
        echo "# Custom aliases and functions" >> ${BASHFILE}
        echo " " >> ${BASHFILE}
        echo "## History Save utility" >> ${BASHFILE}
        echo "# --------" >> ${BASHFILE}
        echo "HISTCONTROL=ignoredups:erasedups                                # no duplicate entries" >> ${BASHFILE}
        echo "HISTSIZE=100000                                                 # Big History" >> ${BASHFILE}
        echo "/opt/viasat/omnibus/scripts/bkp_hist.sh         # Script to roll over history to new file" >> ${BASHFILE}
        echo "export HISTCONTROL HISTSIZE" >> ${BASHFILE}

        echo "## Omnibus Global ##############################################" >> ${BASHFILE}
        echo "# --------" >> ${BASHFILE}
        echo "PATH=$PATH:$HOME/bin:/opt/IBM/tivoli/netcool:/opt/IBM/tivoli/netcool/omnibus:/opt/IBM/tivoli/netcool/omnibus/bin" >> ${BASHFILE}
        echo "NCHOME=/opt/IBM/tivoli/netcool" >> ${BASHFILE}
        echo "OMNIHOME=/opt/IBM/tivoli/netcool/omnibus" >> ${BASHFILE}
        echo "MYENVIRONMENT=${MYENVIRONMENT}" >> ${BASHFILE}
        echo "OMNILOGS=/opt/IBM/tivoli/netcool/omnibus/log" >> ${BASHFILE}
        echo "IMHOME=/root/IBM/InstallationManager/eclipse" >> ${BASHFILE}
        echo "IMDATA=/root/var/IBM/InstallationManager" >> ${BASHFILE}
        echo "PS1='\[\033[36m\]\u\[\033[31m\]@\[\033[02;32m\]\H: \[\033[33m\]\w\[\033[0m\]\$'" >> ${BASHFILE}
        echo "MYHOST=`hostname -f`" >> ${BASHFILE}
        echo "export PATH NCHOME OMNIHOME MYENVIRONMENT OMNILOGS IMHOME IMDATA PS1 MYHOST" >> ${BASHFILE}

        MYHOST=`hostname -f`


        if [[ "$MYHOST" =~ webgui ]]
        then
                echo "## WebGUI" >> ${BASHFILE}
                echo "#--------" >> ${BASHFILE}
                echo "NCO_PA_ID='WEBGUI'" >> ${BASHFILE}
                echo "PATH=$PATH:$HOME/bin:/opt/IBM/JazzSM:/opt/IBM/JazzSM/ui:/opt/IBM/netcool/gui/omnibus_webgui" >> ${BASHFILE}
                echo "WEBGUI_HOME='/opt/IBM/netcool/gui/omnibus_webgui'" >> ${BASHFILE}
                echo "JazzSM_HOME='/opt/IBM/JazzSM'" >> ${BASHFILE}
                echo "JazzSM_WAS_Profile='/opt/IBM/JazzSM/profile'" >> ${BASHFILE}
                echo "DASH_Profile='/opt/IBM/JazzSM/profile'" >> ${BASHFILE}
                echo "WAS_HOME='/opt/IBM/WebSphere/AppServer'" >> ${BASHFILE}
                echo "DASH_HOME='/opt/IBM/JazzSM/ui'" >> ${BASHFILE}
                echo "CONFIGSHOME=/opt/viasat/omnibus/configs/webgui" >> ${BASHFILE}
                echo "export NCO_PA_ID PATH WEBGUI_HOME JazzSM_HOME JazzSM_WAS_Profile DASH_Profile WAS_HOME DASH_HOME CONFIGSHOME" >> ${BASHFILE}
                echo " " >> ${BASHFILE}
                echo "alias cdlogs='cd /opt/IBM/JazzSM/profile/logs'" >> ${BASHFILE}
                echo "alias cdserver1logs='cd /opt/IBM/JazzSM/profile/logs/server1'" >> ${BASHFILE}
                echo "alias cdncwlogs='cd /opt/IBM/JazzSM/profile/logs/ncw'" >> ${BASHFILE}
                echo "alias cdffdclogs='cd /opt/IBM/JazzSM/profile/logs/ffdc'" >> ${BASHFILE}
                echo "alias cdwaapi='cd /opt/IBM/netcool/gui/omnibus_webgui/waapi'" >> ${BASHFILE}
                echo "alias runwaapi='/opt/IBM/netcool/gui/omnibus_webgui/waapi/bin/runwaapi'" >> ${BASHFILE}
                echo "alias openfilecounts='/opt/viasat/omnibus/scripts/count_tip_sessions.sh'" >> ${BASHFILE}
                echo "alias tailffdclog='tail -f /opt/IBM/JazzSM/profile/logs/ffdc/server1_exception.log'" >> ${BASHFILE}
                echo "alias tailncwlog0='tail -f /opt/IBM/JazzSM/profile/logs/ncw/ncw.0.log'" >> ${BASHFILE}
                echo "alias tailncwtrace0='tail -f /opt/IBM/JazzSM/profile/logs/ncw/ncw.0.trace'" >> ${BASHFILE}
                echo "alias tailncwlog1='tail -f /opt/IBM/JazzSM/profile/logs/ncw/ncw.1.log'" >> ${BASHFILE}
                echo "alias tailncwtrace1='tail -f /opt/IBM/JazzSM/profile/logs/ncw/ncw.1.trace'" >> ${BASHFILE}
                echo "alias tailncwlog2='tail -f /opt/IBM/JazzSM/profile/logs/ncw/ncw.2.log'" >> ${BASHFILE}
                echo "alias tailncwtrace2='tail -f /opt/IBM/JazzSM/profile/logs/ncw/ncw.2.trace'" >> ${BASHFILE}
                echo "alias tailncwlog3='tail -f /opt/IBM/JazzSM/profile/logs/ncw/ncw.3.log'" >> ${BASHFILE}
                echo "alias tailncwtrace3='tail -f /opt/IBM/JazzSM/profile/logs/ncw/ncw.3.trace'" >> ${BASHFILE}
                echo "alias tailncwlog4='tail -f /opt/IBM/JazzSM/profile/logs/ncw/ncw.4.log'" >> ${BASHFILE}
                echo "alias tailncwtrace4='tail -f /opt/IBM/JazzSM/profile/logs/ncw/ncw.4.trace'" >> ${BASHFILE}
                echo "alias tailsysout='tail -f /opt/IBM/JazzSM/profile/logs/server1/SystemOut.log'" >> ${BASHFILE}
                echo "alias tailsyserr='tail -f /opt/IBM/JazzSM/profile/logs/server1/SystemErr.log'" >> ${BASHFILE}
                echo "alias tailsstart='tail -f /opt/IBM/JazzSM/profile/logs/server1/startServer.log'" >> ${BASHFILE}
                echo "alias tailsstop='tail -f /opt/IBM/JazzSM/profile/logs/server1/stopServer.log'" >> ${BASHFILE}
                echo "alias tailsstatus='tail -f /opt/IBM/JazzSM/profile/logs/server1/serverStatus.log'" >> ${BASHFILE}

        elif [[ "$MYHOST" =~ agg-primary ]]
        then
                echo "## Primary ObjectServer (AGG_P)" >> ${BASHFILE}
                echo "#--------" >> ${BASHFILE}
                echo "NCO_PA_ID='AGG_P_PA'" >> ${BASHFILE}
                echo "CONFIGSHOME=/opt/viasat/omnibus/configs/objectserver" >> ${BASHFILE}
                echo "export NCO_PA_ID CONFIGSHOME" >> ${BASHFILE}
                echo " " >> ${BASHFILE}
                echo "alias admintool='/opt/IBM/tivoli/netcool/omnibus/bin/nco_config'" >> ${BASHFILE}
		echo "alias getobjprops=\"/opt/IBM/tivoli/netcool/omnibus/bin/nco_sql -server AGG_P -user omniadmin -password 'ECBBBJAGFKFHGD' < /opt/viasat/omnibus/configs/objectserver/get_objsrv_props.sql\"" >> ${BASHFILE}
                echo "alias tailsmlog='tail -f /opt/IBM/tivoli/netcool/omnibus/log/AGG_P_selfmonitoring.log1'" >> ${BASHFILE}
                echo "alias tailsmlog='tail -f /opt/IBM/tivoli/netcool/omnibus/log/AGG_P_trigger_stats.log1'" >> ${BASHFILE}
                echo "alias tailaudsql='tail -f /opt/IBM/tivoli/netcool/omnibus/log/AGG_P_audit_sql.log_01'" >> ${BASHFILE}
                echo "alias tailaud='tail -f /opt/IBM/tivoli/netcool/omnibus/log/AGG_P_audit_file.log_01'" >> ${BASHFILE}
                echo "alias tailaud='tail -f /opt/IBM/tivoli/netcool/omnibus/log/AGG_P_profiler_report.log1'" >> ${BASHFILE}
                echo "alias taildel='tail -f /opt/IBM/tivoli/netcool/omnibus/log/AGG_P_deletes_file.log1'" >> ${BASHFILE}
                echo "alias taildel='tail -f /opt/IBM/tivoli/netcool/omnibus/log/AGG_P_deletes_file.log1'" >> ${BASHFILE}
                echo "alias tailaggppa='tail -f /opt/IBM/tivoli/netcool/omnibus/log/AGG_P_PA.log'" >> ${BASHFILE}
                echo "alias tailaggp='tail -f /opt/IBM/tivoli/netcool/omnibus/log/AGG_P.log_01'" >> ${BASHFILE}
                echo "alias tailffg='tail -f /opt/IBM/tivoli/netcool/omnibus/log/FLAT_FILE_GATE.log'" >> ${BASHFILE}

        elif [[ "$MYHOST" =~ agg-backup ]]
        then
                echo "## Backup ObjectServer (AGG_B)" >> ${BASHFILE}
                echo "#--------" >> ${BASHFILE}
                echo "NCO_PA_ID='AGG_B_PA'" >> ${BASHFILE}
                echo "NCO_PA='AGG_B_PA'" >> ${BASHFILE}
                echo "CONFIGSHOME=/opt/viasat/omnibus/configs/objectserver" >> ${BASHFILE}
                echo "export NCO_PA_ID CONFIGSHOME" >> ${BASHFILE}
                echo " " >> ${BASHFILE}
                echo "alias admintool='/opt/IBM/tivoli/netcool/omnibus/bin/nco_config'" >> ${BASHFILE}
		echo "alias getobjprops=\"/opt/IBM/tivoli/netcool/omnibus/bin/nco_sql -server AGG_B -user omniadmin -password 'ECBBBJAGFKFHGD' < /opt/viasat/omnibus/configs/objectserver/get_objsrv_props.sql\"" >> ${BASHFILE}
                echo "alias tailaggg='tail -f /opt/IBM/tivoli/netcool/omnibus/log/AGG_GATE.log'" >> ${BASHFILE}
                echo "alias tailaggb='tail -f /opt/IBM/tivoli/netcool/omnibus/log/AGG_B.log_01'" >> ${BASHFILE}
                echo "alias tailaggbpa='tail -f /opt/IBM/tivoli/netcool/omnibus/log/AGG_B_PA.log'" >> ${BASHFILE}
        elif [[ "$MYHOST" =~ master ]]
        then
                echo "## MTTRAPD PEERED MASTER PROBE (MTTRAPD01_M)" >> ${BASHFILE}
                echo "#--------" >> ${BASHFILE}
                echo "NCO_PA_ID='MTTRAPD01_M_PA'" >> ${BASHFILE}
                echo "NC_RULES_HOME='/opt/viasat/omnibus/omnibus-mttrapd-rules/rules'" >> ${BASHFILE}
                echo "MTTRAPD_MASTER_PID=`cat /opt/IBM/tivoli/netcool/omnibus/var/${NCO_PA_ID}.pid`" >> ${BASHFILE}
                echo "CONFIGSHOME=/opt/viasat/omnibus/configs/probe-mttrap" >> ${BASHFILE}
                echo "export NCO_PA_ID NC_RULES_HOME MTTRAPD_MASTER_PID CONFIGSHOME" >> ${BASHFILE}
                echo " " >> ${BASHFILE}
                echo "alias syntaxcheck='/opt/IBM/tivoli/netcool/omnibus/probes/nco_p_syntax -server AGG_V -rulesfile /opt/viasat/omnibus/omnibus-mttrapd-rules/rules/mttrapd.rules'" >> ${BASHFILE}
                echo "alias hupit='kill -HUP ${MTTRAPD_MASTER_PID}'" >> ${BASHFILE}
        elif [[ "$MYHOST" =~ slave ]]
        then
                echo "## MTTRAPD PEERED SLAVE PROBE (MTTRAPD01_S)" >> ${BASHFILE}
                echo "#--------" >> ${BASHFILE}
                echo "NCO_PA_ID='MTTRAPD01_S_PA'" >> ${BASHFILE}
                echo "NC_RULES_HOME='/opt/viasat/omnibus/omnibus-mttrapd-rules/rules'" >> ${BASHFILE}
                echo "MTTRAPD_SLAVE_PID=`cat /opt/IBM/tivoli/netcool/omnibus/var/${NCO_PA_ID}.pid`" >> ${BASHFILE}
                echo "CONFIGSHOME=/opt/viasat/omnibus/configs/probe-mttrap" >> ${BASHFILE}
                echo "export NCO_PA_ID NC_RULES_HOME MTTRAPD_SLAVE_PID CONFIGSHOME" >> ${BASHFILE}
                echo " " >> ${BASHFILE}
                echo "alias syntaxcheck='/opt/IBM/tivoli/netcool/omnibus/probes/nco_p_syntax -server AGG_V -rulesfile /opt/viasat/omnibus/omnibus-mttrapd-rules/rules/mttrapd.rules'" >> ${BASHFILE}
                echo "alias hupit='kill -HUP ${MTTRAPD_SLAVE_PID}'" >> ${BASHFILE}
        elif [[ "$MYHOST" =~ omnibus-mttrapd01. ]]
        then
                echo "## MTTRAPD CONSUL PROBE (MTTRAPD01)" >> ${BASHFILE}
                echo "#--------" >> ${BASHFILE}
                echo "NCO_PA_ID='MTTRAPD01_PA'" >> ${BASHFILE}
                echo "NC_RULES_HOME='/opt/viasat/omnibus/omnibus-mttrapd-rules/rules'" >> ${BASHFILE}
                echo "MTTRAPD01_PID=`cat /opt/IBM/tivoli/netcool/omnibus/var/${NCO_PA_ID}.pid`" >> ${BASHFILE}
                echo "CONFIGSHOME=/opt/viasat/omnibus/configs/probe-mttrap" >> ${BASHFILE}
                echo "export NCO_PA_ID NC_RULES_HOME MTTRAPD01_PID CONFIGSHOME" >> ${BASHFILE}
                echo " " >> ${BASHFILE}
                echo "alias syntaxcheck='/opt/IBM/tivoli/netcool/omnibus/probes/nco_p_syntax -server AGG_V -rulesfile /opt/viasat/omnibus/omnibus-mttrapd-rules/rules/mttrapd.rules'" >> ${BASHFILE}
                echo "alias hupit='kill -HUP ${MTTRAPD01_PID}'" >> ${BASHFILE}
        elif [[ "$MYHOST" =~ omnibus-mttrapd02. ]]
        then
                echo "## MTTRAPD CONSUL PROBE (MTTRAPD02)" >> ${BASHFILE}
                echo "#--------" >> ${BASHFILE}
                echo "NCO_PA_ID='MTTRAPD02_PA'" >> ${BASHFILE}
                echo "NC_RULES_HOME='/opt/viasat/omnibus/omnibus-mttrapd-rules/rules'" >> ${BASHFILE}
                echo "MTTRAPD02_PID=`cat /opt/IBM/tivoli/netcool/omnibus/var/${NCO_PA_ID}.pid`" >> ${BASHFILE}
                echo "CONFIGSHOME=/opt/viasat/omnibus/configs/probe-mttrap" >> ${BASHFILE}
                echo "export NCO_PA_ID NC_RULES_HOME MTTRAPD02_PID CONFIGSHOME" >> ${BASHFILE}
                echo " " >> ${BASHFILE}
                echo "alias syntaxcheck='/opt/IBM/tivoli/netcool/omnibus/probes/nco_p_syntax -server AGG_V -rulesfile /opt/viasat/omnibus/omnibus-mttrapd-rules/rules/mttrapd.rules'" >> ${BASHFILE}
                echo "alias hupit='kill -HUP ${MTTRAPD02_PID}'" >> ${BASHFILE}
        elif [[ "$MYHOST" =~ omnibus-socket01. ]]
        then
                echo "## SOCKET CONSUL PROBE (MTTRAPD01)" >> ${BASHFILE}
                echo "#--------" >> ${BASHFILE}
                echo "NCO_PA_ID='SOCKET01_PA'" >> ${BASHFILE}
                echo "NC_RULES_HOME='/opt/viasat/omnibus/configs/probe-socket'" >> ${BASHFILE}
                echo "SOCKET01_PID=`cat /opt/IBM/tivoli/netcool/omnibus/var/${NCO_PA_ID}.pid`" >> ${BASHFILE}
                echo "CONFIGSHOME=/opt/viasat/omnibus/configs/probe-socket" >> ${BASHFILE}
                echo "export NCO_PA_ID NC_RULES_HOME MTTRAPD01_PID CONFIGSHOME" >> ${BASHFILE}
                echo " " >> ${BASHFILE}
                echo "alias hupit='kill -HUP ${SOCKET01_PID}'" >> ${BASHFILE}
        elif [[ "$MYHOST" =~ omnibus-socket02. ]]
        then
                echo "## SOCKET CONSUL PROBE (MTTRAPD02)" >> ${BASHFILE}
                echo "#--------" >> ${BASHFILE}
                echo "NCO_PA_ID='SOCKET02_PA'" >> ${BASHFILE}
                echo "NC_RULES_HOME='/opt/viasat/omnibus/configs/probe-socket'" >> ${BASHFILE}
                echo "SOCKET02_PID=`cat /opt/IBM/tivoli/netcool/omnibus/var/${NCO_PA_ID}.pid`" >> ${BASHFILE}
                echo "CONFIGSHOME=/opt/viasat/omnibus/configs/probe-socket" >> ${BASHFILE}
                echo "export NCO_PA_ID NC_RULES_HOME MTTRAPD01_PID CONFIGSHOME" >> ${BASHFILE}
                echo "alias hupit='kill -HUP ${SOCKET01_PID}'" >> ${BASHFILE}
        fi

        echo "alias mkbk='/export/home/nmsadmin/mkbk.sh'" >> ${BASHFILE}
        echo "alias ncoevent='/opt/IBM/tivoli/netcool/omnibus/bin/nco_event'" >> ${BASHFILE}
        echo "alias ncoevents=\"/opt/IBM/tivoli/netcool/omnibus/bin/nco_event -server AGG_V -username -user omniadmin -password 'ECBBBJAGFKFHGD' -elc '/home/omniadmin/omniadmin.elc'\"" >> ${BASHFILE}
        echo "alias ncoid='/opt/IBM/tivoli/netcool/omnibus/bin/nco_id'" >> ${BASHFILE}
        echo "alias ncoidv='/opt/IBM/tivoli/netcool/omnibus/bin/nco_id -v'" >> ${BASHFILE}
        echo "alias ncoidc=\"/opt/IBM/tivoli/netcool/omnibus/bin/nco_id -v|grep ' Name: .*)'\"" >> ${BASHFILE}
        echo "alias ncosql=\"/opt/IBM/tivoli/netcool/omnibus/bin/nco_sql -user omniadmin -password 'ECBBBJAGFKFHGD' -server AGG_P\"" >> ${BASHFILE}
        echo "alias ncopadhist='history | grep nco_pad'" >> ${BASHFILE}
        echo "alias ncosqlhist='history | grep nco_sql'" >> ${BASHFILE}
        echo "alias versionreport='/opt/IBM/tivoli/netcool/bin/nco_id -o /opt/viasat/omnibus/scripts/VersionInformation.html'" >> ${BASHFILE}
        echo "alias pastatus='nco_pa_status -server \${NCO_PA_ID} -user omniadmin -password \"ECBBBJAGFKFHGD\"'" >> ${BASHFILE}
        echo "alias pamanager='/opt/viasat/omnibus/scripts/pamanager.sh'" >> ${BASHFILE}
        echo "alias startpad='/etc/init.d/nco start'" >> ${BASHFILE}
        echo "alias stoppad='/etc/init.d/nco stop'" >> ${BASHFILE}
        echo "alias psnco='ps -ef | grep nco'" >> ${BASHFILE}
        echo "alias cdomnilog='cd /opt/IBM/tivoli/netcool/omnibus/log'" >> ${BASHFILE}
        echo "alias cdomnihome='cd /opt/IBM/tivoli/netcool/omnibus'" >> ${BASHFILE}
        echo "alias cdnchome='cd /opt/IBM/tivoli/netcool'" >> ${BASHFILE}
        echo "alias cdconfigs='cd /opt/viasat/omnibus/configs/*'" >> ${BASHFILE}
        echo "alias cdlogs='cd /opt/viasat/omnibus/logs'" >> ${BASHFILE}
        echo "alias cdscripts='cd /opt/viasat/omnibus/scripts'" >> ${BASHFILE}
        echo "#-----------------------------------------------------" >> ${BASHFILE}
        echo "# Custom entries end here." >> ${BASHFILE}
        echo "#-----------------------------------------------------" >> ${BASHFILE}
else

        PS1='\[\033[36m\]\u\[\033[31m\]@\[\033[02;32m\]\H: \[\033[33m\]\w\[\033[0m\]\$'
        MYHOST=`hostname -f`
        export PS1 MYHOST

        MYHOST=`hostname -f`
        if [[ "$MYHOST" =~ webgui ]]
        then
                NCO_PA_ID="WEBGUI"
                PATH=${PATH}:/opt/IBM/JazzSM:/opt/IBM/JazzSM/ui:/opt/IBM/netcool/gui/omnibus_webgui
                WEBGUI_HOME='/opt/IBM/netcool/gui/omnibus_webgui'
                JazzSM_HOME='/opt/IBM/JazzSM'
                JazzSM_WAS_Profile='/opt/IBM/JazzSM/profile'
                DASH_Profile='/opt/IBM/JazzSM/profile'
                WAS_HOME='/opt/IBM/WebSphere/AppServer'
                DASH_HOME='/opt/IBM/JazzSM/ui'
                CONFIGSHOME=/opt/viasat/omnibus/configs/webgui
                export NCO_PA_ID PATH WEBGUI_HOME JazzSM_HOME JazzSM_WAS_Profile DASH_Profile WAS_HOME DASH_HOME CONFIGSHOME

        elif [[ "$MYHOST" =~ agg-primary ]]
        then
                NCO_PA_ID='AGG_P_PA'
                CONFIGSHOME=/opt/viasat/omnibus/configs/objectserver
                PATH=$PATH:$HOME/bin:/opt/IBM/tivoli/netcool:/opt/IBM/tivoli/netcool/omnibus:/opt/IBM/tivoli/netcool/omnibus/bin
                NCHOME=/opt/IBM/tivoli/netcool
                OMNIHOME=/opt/IBM/tivoli/netcool/omnibus
                IMHOME=/root/IBM/InstallationManager/eclipse
                IMDATA=/root/var/IBM/InstallationManager
                export NCO_PA_ID CONFIGSHOME PATH NCHOME OMNIHOME MYENVIRONMENT OMNILOGS IMHOME IMDATA PS1 MYHOST

        elif [[ "$MYHOST" =~ agg-backup ]]
        then
                NCO_PA_ID='AGG_B_PA'
                CONFIGSHOME=/opt/viasat/omnibus/configs/objectserver
                PATH=$PATH:$HOME/bin:/opt/IBM/tivoli/netcool:/opt/IBM/tivoli/netcool/omnibus:/opt/IBM/tivoli/netcool/omnibus/bin
                NCHOME=/opt/IBM/tivoli/netcool
                OMNIHOME=/opt/IBM/tivoli/netcool/omnibus
                OMNILOGS=/opt/IBM/tivoli/netcool/omnibus/log
                IMHOME=/root/IBM/InstallationManager/eclipse
                IMDATA=/root/var/IBM/InstallationManager
                export NCO_PA_ID CONFIGSHOME PATH NCHOME OMNIHOME OMNILOGS IMHOME IMDATA


        elif [[ "$MYHOST" =~ slave ]]
        then
                NCO_PA_ID='MTTRAPD01_S_PA'
                NC_RULES_HOME='/opt/viasat/omnibus/omnibus-mttrapd-rules/rules'
                MTTRAPD_SLAVE_PID=`cat /opt/IBM/tivoli/netcool/omnibus/var/${NCO_PA_ID}.pid`
                CONFIGSHOME=/opt/viasat/omnibus/configs/probe-mttrap
                PATH=$PATH:$HOME/bin:/opt/IBM/tivoli/netcool:/opt/IBM/tivoli/netcool/omnibus:/opt/IBM/tivoli/netcool/omnibus/bin
                NCHOME=/opt/IBM/tivoli/netcool
                OMNIHOME=/opt/IBM/tivoli/netcool/omnibus
                OMNILOGS=/opt/IBM/tivoli/netcool/omnibus/log
                IMHOME=/root/IBM/InstallationManager/eclipse
                IMDATA=/root/var/IBM/InstallationManager
                export NCO_PA_ID NC_RULES_HOME MTTRAPD_SLAVE_PID CONFIGSHOME PATH NCHOME OMNIHOME OMNILOGS IMHOME IMDATA

        elif [[ "$MYHOST" =~ omnibus-mttrapd01. ]]
        then
                NCO_PA_ID='MTTRAPD01_PA'
                NC_RULES_HOME='/opt/viasat/omnibus/omnibus-mttrapd-rules/rules'
                MTTRAPD01_PID=`cat /opt/IBM/tivoli/netcool/omnibus/var/${NCO_PA_ID}.pid`
                CONFIGSHOME=/opt/viasat/omnibus/configs/probe-mttrap
                PATH=$PATH:$HOME/bin:/opt/IBM/tivoli/netcool:/opt/IBM/tivoli/netcool/omnibus:/opt/IBM/tivoli/netcool/omnibus/bin
                NCHOME=/opt/IBM/tivoli/netcool
                OMNIHOME=/opt/IBM/tivoli/netcool/omnibus
                OMNILOGS=/opt/IBM/tivoli/netcool/omnibus/log
                IMHOME=/root/IBM/InstallationManager/eclipse
                IMDATA=/root/var/IBM/InstallationManager
                export NCO_PA_ID NC_RULES_HOME MTTRAPD01_PID CONFIGSHOME PATH NCHOME OMNIHOME OMNILOGS IMHOME IMDATA

        elif [[ "$MYHOST" =~ omnibus-mttrapd02. ]]
        then
                NCO_PA_ID='MTTRAPD02_PA'
                NC_RULES_HOME='/opt/viasat/omnibus/omnibus-mttrapd-rules/rules'
                MTTRAPD02_PID=`cat /opt/IBM/tivoli/netcool/omnibus/var/${NCO_PA_ID}.pid`
                CONFIGSHOME=/opt/viasat/omnibus/configs/probe-mttrap
                PATH=$PATH:$HOME/bin:/opt/IBM/tivoli/netcool:/opt/IBM/tivoli/netcool/omnibus:/opt/IBM/tivoli/netcool/omnibus/bin
                NCHOME=/opt/IBM/tivoli/netcool
                OMNIHOME=/opt/IBM/tivoli/netcool/omnibus
                OMNILOGS=/opt/IBM/tivoli/netcool/omnibus/log
                IMHOME=/root/IBM/InstallationManager/eclipse
                IMDATA=/root/var/IBM/InstallationManager
                export NCO_PA_ID NC_RULES_HOME MTTRAPD02_PID CONFIGSHOME PATH NCHOME OMNIHOME OMNILOGS IMHOME IMDATA

        elif [[ "$MYHOST" =~ omnibus-socket01. ]]
        then
                NCO_PA_ID='SOCKET01_PA'
                NC_RULES_HOME='/opt/viasat/omnibus/configs/probe-socket'
                SOCKET01_PID=`cat /opt/IBM/tivoli/netcool/omnibus/var/${NCO_PA_ID}.pid`
                CONFIGSHOME=/opt/viasat/omnibus/configs/probe-socket
                PATH=$PATH:$HOME/bin:/opt/IBM/tivoli/netcool:/opt/IBM/tivoli/netcool/omnibus:/opt/IBM/tivoli/netcool/omnibus/bin
                NCHOME=/opt/IBM/tivoli/netcool
                OMNIHOME=/opt/IBM/tivoli/netcool/omnibus
                OMNILOGS=/opt/IBM/tivoli/netcool/omnibus/log
                IMHOME=/root/IBM/InstallationManager/eclipse
                IMDATA=/root/var/IBM/InstallationManager
                export NCO_PA_ID NC_RULES_HOME SOCKET01_PID CONFIGSHOME PATH NCHOME OMNIHOME OMNILOGS IMHOME IMDATA

        elif [[ "$MYHOST" =~ omnibus-socket02. ]]
        then
                NCO_PA_ID='SOCKET02_PA'
                NC_RULES_HOME='/opt/viasat/omnibus/configs/probe-socket'
                SOCKET02_PID=`cat /opt/IBM/tivoli/netcool/omnibus/var/${NCO_PA_ID}.pid`
                CONFIGSHOME=/opt/viasat/omnibus/configs/probe-socket
                PATH=$PATH:$HOME/bin:/opt/IBM/tivoli/netcool:/opt/IBM/tivoli/netcool/omnibus:/opt/IBM/tivoli/netcool/omnibus/bin
                NCHOME=/opt/IBM/tivoli/netcool
                OMNIHOME=/opt/IBM/tivoli/netcool/omnibus
                OMNILOGS=/opt/IBM/tivoli/netcool/omnibus/log
                IMHOME=/root/IBM/InstallationManager/eclipse
                IMDATA=/root/var/IBM/InstallationManager
                export NCO_PA_ID NC_RULES_HOME SOCKET02_PID CONFIGSHOME PATH NCHOME OMNIHOME OMNILOGS IMHOME IMDATA

        fi
fi
