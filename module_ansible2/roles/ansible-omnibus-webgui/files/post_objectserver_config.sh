#!/bin/bash
set -x 
POST_CONFIG_LOG="/opt/viasat/omnibus/logs/post_objectserver_config.log"
MYDATE=`date +"%m%d%Y_%H_%M"`

>$POST_CONFIG_LOG
{
echo "Running script inside mttrapd container which will run a syntaxcheck and if successful will restart the mttrap probe and enable the new rules."
echo "Attempting to add new columns to alerts.status"
docker exec -i mttrapd bash -l -c /opt/viasat/omnibus/configs/objectserver/addcolumn.sh
} 2>&1 | tee -a $POST_CONFIG_LOG


#----alter trigger group WBTest set enabled false;
#--go

#--create or replace file self_monitoring '/opt/IBM/tivoli/netcool/omnibus/log/NCOMS_selfmonitoring.log' maxfiles 2 maxsize 1048576 B;
#--go

#--create or replace file logfile '/tmp/netcool' maxfiles 3 maxsize 1048576 B;
#--go

#--create or replace procedure oslcecip_regs_delete (in cipid int)
#--begin
#--      cancel;
#--end;
#--go

#--create or replace trigger webtop_compatibility
#--group compatibility_triggers
#--priority 10
#--comment 'Populates the master.profiles table for the WebGUI to read.\nNote the \n         trigger can be be disabled if no users are permitted to use the interactive SQL tool within the WebGUI'
#--every 3600 seconds
#--begin
#--      cancel;
#--end;
#--go

#--create or replace trigger sm_process_top_probes
#--group self_monitoring_group
#--priority 10
#--comment 'Creates synthetic events for top Probes.'
#--every 300 seconds
#--begin
#--      cancel;
#--end;
#--go

#----create or replace trigger backup_counterpart_down
#----group gateway_triggers
#----enabled false
#----priority 1
#----comment 'The counterpart server is down'
#----on signal gw_counterpart_down
#----when get_prop_value( 'BackupObjectServer' ) %= 'TRUE'
#----begin
#----      IDUC ACTCMD 'default','SWITCH TO BACKUP';
#--        -- Enable the trigger groups that need to run in primary
#----      execute procedure automation_enable;
#--        -- Set ActingPrimary property to TRUE
#----      alter system set 'ActingPrimary' = TRUE;
#----end;
#----go

#----create or replace trigger backup_startup
#----group gateway_triggers
#----enabled false
#----priority 1
#----comment 'On startup dont start the automations'
#----on signal startup
#----when (get_prop_value( 'BackupObjectServer' ) %= 'TRUE') and
#----     (get_prop_value( 'ActingPrimary' ) %='FALSE' )
#---- This is the backup server
#----begin
#--        -- Disable the trigger groups that need not to
#--        -- run when object server acts as backup
#----      execute procedure automation_disable;
#----end;
#----go

