create or replace procedure send_email (in node character(1), in severity integer, in subject character(1), in email character(1), in summary character(1), in hostname character(1)) executable '$OMNIHOME/utils/nco_mail' host hostname user 0 group 0 arguments '\''+node+'\'', severity,'\''+subject+'\'','\''+email+'\'','\''+summary+'\'';
go

create or replace procedure automationExt (in Serial Integer, in Timeout Integer, in Runprog Char(1), in Options Char(1), in Args Char(1), in Args2 Char(1), in Args3 Char(1), in Args4 Char(1), in Args5 Char(1)) executable '/opt/viasat/nms/bin/automation.pl' host  'localhost'  user 800 group 10012 arguments Serial,Timeout,'\''+Runprog+'\'','\''+Options+'\'','\''+Args+'\'','\''+Args2+'\'','\''+Args3+'\'','\''+Args4+'\'','\''+Args5+'\''


go

create or replace procedure EXT_RebuildBladeMap (in arg1 Char(255), in arg2 Char(255), in arg3 Char(255)) executable '/opt/viasat/bullseye/bin/makeBladeMap.sh' host  'nms02-zone01'  user 800 group 10012 arguments arg1, arg2, arg3


go

create or replace procedure send_email_alert (in NodeAlias Char(1), in Severity Integer, in Summary Char(1), in LastOccurrence Unsigned, in Sender Char(1), in RecipientList Char(1)) executable '/opt/viasat/nms/bin/nco_mail.sh' host  'localhost'  user 800 group 10012 arguments '\''+NodeAlias+'\'',Severity,'\''+Summary+'\'',LastOccurrence,'\''+Sender+'\'','\''+RecipientList+'\''


go

create or replace procedure send_email_alert_old (in Node Char(1), in Severity Integer, in Summary Char(1), in LastOccurrence Unsigned, in Sender Char(1), in RecipientList Char(1)) executable '/opt/viasat/nms/bin/nco_mail.sh' host  'localhost'  user 800 group 10012 arguments '\''+Node+'\'',Severity,'\''+Summary+'\'',LastOccurrence,'\''+Sender+'\'','\''+RecipientList+'\''


go

create or replace procedure syslogip (in nodealias Char(1)) executable '/opt/ibm/tivoli/netcool/omnibus/utils/updateip.sh' host  'hostname'  user 800 group 10012 arguments '\'' + nodealias + '\''


go

create or replace procedure test_email_send (in Node Char(9), in Subject Char(79), in Recipient Char(79), in Summary Char(700)) executable '/opt/ibm/tivoli/netcool/omnibus/utils/nco_mail' host  'localhost'  user 800 group 50000 arguments '\'' + Node + '\'', '\'' + Subject + '\'', '\'' + Recipient + '\'', '\'' + Summary + '\''

go

create or replace procedure EXT_carrierInvestigation (in Identifier Char(255), in AlertKey Char(255), in LastOccurrence Unsigned, in RecipientList Char(255)) executable '/opt/viasat/nms/bin/beamInvestigation.sh' host  'nms02-zone01'  user 800 group 10012 arguments '\"+Identifier+\",\"+AlertKey+\",LastOccurrence,\"+RecipientList+\"'


go

create or replace procedure EXT_QOICarrier (in quser Char(1), in state Char(1), in beam Char(1)) executable '/opt/viasat/nms/wrapper/QOIOverrideInterface.pl -u' host  'localhost'  user 800 group 10012 arguments '\''+quser+'\'','\''+state+'\'','\''+beam+'\''


go

create or replace procedure send_nco_nms_email (in node Char(1), in severity Integer, in subject Char(1), in email Char(1), in summary Char(1), in hostname Char(1)) executable '/opt/ibm/tivoli/netcool/omnibus/utils/noc_nms_mail' host  'localhost'  user 800 group 50000 arguments '\''+node+'\'', severity,'\''+subject+'\'','\''+email+'\'','\''+summary+'\''

go

create or replace procedure SetTouchPoint (in p1 Integer) executable '/opt/viasat/nms/wrapper/rcaTouchPoint.pl -S -p 53604 -v1 -l /opt/viasat/nms/log/setTouchPoint.log' host  'localhost'  user 800 group 10012


go

create or replace procedure email_sender (in Node Char(9), in Severity Integer, in Subject Char(79), in Recipient Char(79), in Summary Char(700)) executable '/opt/ibm/tivoli/netcool/omnibus/utils/nco_mail' host  'nmsfms02'  user 800 group 10012 arguments '\'' + Node + '\'', Severity, '\'' + Subject + '\'', '\'' + Recipient + '\'', '\'' + Summary + '\''


go

create or replace procedure sendTrap (in severity Integer, in service Char(64), in location Char(64), in summary Char(128)) executable '/opt/viasat/nms/wrapper/sendTrap.pl' host  'hostname'  user 800 group 10012 arguments severity,'\''+service+'\'','\''+location+'\'','\''+summary+'\''


go

create or replace signal pbrFix (Serial int, Status char(16), ReturnData1 char(255))
comment 'Return from pbrFix.sh';
go

create or replace signal stats_reset 
comment 'Statistics reset signal';
go

create or replace signal fixReplication (Serial int, Status char(16), ReturnData1 char(255))
comment 'Return from fixReplication.pl';
go

create or replace signal clientClassToCarrier (Serial int, Status char(16), ReturnData1 char(255))
comment 'return from clientClassToCarrier.pl';
go

create or replace signal getLinkName (Serial int, Status char(16), ReturnData1 char(255))
comment 'Return from getLinkName.pl';
go

create or replace signal findMissingLocal7 (Serial int, Status char(16), ReturnData1 char(255))
comment 'Return from findMissingLocal7.pl';
go

create or replace trigger group compatibility_triggers;
go

create or replace trigger group ASB1;
go

create or replace trigger group system_watch;
go

create or replace trigger group WBAuto;
go

create or replace trigger group WBMeta;
go

create or replace trigger group failback_triggers;
go

create or replace trigger group WBTrigger;
go

create or replace trigger group self_monitoring_group;
go

create or replace trigger group Disabled;
go
alter trigger group Disabled set enabled false;
go

create or replace trigger group sae;
go

create or replace trigger group RCA;
go

create or replace trigger group default_triggers;
go

create or replace trigger group SB1;
go

create or replace trigger group connection_watch;
go

create or replace trigger group primary_only;
go

create or replace trigger group security_watch;
go

create or replace trigger group audit_config;
go
alter trigger group audit_config set enabled false;
go

create or replace trigger group profiler_triggers;
go

create or replace trigger group trigger_stat_reports;
go

create or replace trigger group stats_triggers;
go

create or replace trigger group itnm_triggers;
go

create or replace trigger group registry_triggers;
go

create or replace trigger group WBPrimaryOnly;
go

create or replace trigger group iduc_triggers;
go

create or replace trigger group scala_triggers;
go
alter trigger group scala_triggers set enabled false;
go

create or replace trigger group WBTest;
go
alter trigger group WBTest set enabled false;
go

create or replace trigger group WBMail;
go

create or replace trigger group WBAugment;
go

create or replace trigger group oslc;
go

create or replace trigger group automatic_backup_system;
go

create or replace trigger group gateway_triggers;
go

create or replace file self_monitoring '/opt/IBM/tivoli/netcool/omnibus/log/NCOMS_selfmonitoring.log' maxfiles 2 maxsize 1048576 B;
go

create or replace file profiler_report '/opt/IBM/tivoli/netcool/omnibus/log/NCOMS_profiler_report.log' maxfiles 2 maxsize 1048576 B;
go

create or replace file logfile '/tmp/netcool' maxfiles 3 maxsize 1048576 B;
go

create or replace file qoilog '/tmp/qoilog' maxfiles 2 maxsize 1048576 B;
go
alter file qoilog set enabled false;
go

create or replace file deletes_file '/opt/IBM/tivoli/netcool/omnibus/log/NCOMS_deletes_file.log' maxfiles 2 maxsize 10485760 B;
go

create or replace file trigger_stats_report '/opt/IBM/tivoli/netcool/omnibus/log/NCOMS_trigger_stats.log' maxfiles 2 maxsize 1048576 B;
go

create or replace procedure insertTrap (in Serial int, in Agent char(64), in AlertGroup char(1), in AlertKey char(1), in Summary char(1), in Severity int, in caller char(32))
begin
	cancel;
end;
go

create or replace procedure rcaGateQProcess (in Node char(64), in methodProcedure char(255), in wbAgentAlias char(64), in Poll int, in wbSmtsIP char(64), in wbNeighbor char(64), in wbCarrier char(16), in rcaProbableCause int, in wbTicketID char(32), in AlertGroup char(255), in Summary char(255), in NodeAlias char(64), in FirstOccurrence utc, in Serial int, in rcaSympatRule int, in ExpireTime int, in Severity int, in wbSat char(8), in wbGateway char(16), in Agent char(64), in AlertKey char(255), in wbAgentNode char(64), in Type int, in wbInterface char(64), in wbAutomationID char(128), in Customer char(64), in rcaSymptomCount int, in Tally int, in NCOType char(1), in caller char(32))
begin
	cancel;
end;
go

create or replace procedure jinsert (in serial int, in uid int, in tstamp utc, in msg char(4080))
begin
	cancel;
end;
go

create or replace procedure sm_insert (in identifier char(255), in node char(64), in alertgroup char(255), in severity int, in summary_string char(255), in event_metric int, in expiretime int, in event_type int)
begin
	cancel;
end;
go

create or replace procedure deleteNewestJournals (in jSerial int, in jCount int)
begin
	cancel;
end;
go

create or replace procedure enableRCA ()
begin
	cancel;
end;
go

create or replace procedure oslcecip_regs_insert (in cipid int)
begin
	cancel;
end;
go

create or replace procedure automation_enable ()
begin
	cancel;
end;
go

create or replace procedure probestats_data (in rowdata row of alerts.status)
begin
	cancel;
end;
go

create or replace procedure oslcecip_regs_delete (in cipid int)
begin
	cancel;
end;
go

create or replace procedure automation_disable ()
begin
	cancel;
end;
go

create or replace procedure disableRCA ()
begin
	cancel;
end;
go

create or replace procedure sm_log (in summary_string char(255))
begin
	cancel;
end;
go

create or replace procedure automationSigRtn (in signalName char(64), in signalSerial int, in signalStatus char(16), in signalReturnData1 char(255))
begin
	cancel;
end;
go

create or replace procedure insertTrapWithNode (in Serial int, in Agent char(64), in Node char(64), in AlertGroup char(1), in AlertKey char(1), in Summary char(1), in Severity int, in caller char(32))
begin
	cancel;
end;
go

create or replace trigger webtop_compatibility
group compatibility_triggers
priority 10
comment 'Populates the master.profiles table for the WebGUI to read.\nNote the \n         trigger can be be disabled if no users are permitted to use the interactive SQL tool within the WebGUI'
every 3600 seconds
begin
	cancel;
end;
go

create or replace trigger qoiOverrideComplete
group ASB1
enabled false
priority 1
comment 'Augmentation of DSSNR journal when QOI Override alert comes in'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger DetectLinkLoad
group ASB1
enabled false
priority 2
comment '\n'
every 122 seconds
begin
	cancel;
end;
go

create or replace trigger DetectDupArpEntries
group ASB1
enabled false
priority 1
comment ''
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger CommLossFlap
group ASB1
enabled false
priority 1
comment ''
every 27 seconds
begin
	cancel;
end;
go

create or replace trigger DetectBladeFailover
group ASB1
enabled false
priority 2
comment 'Finds all blademap failover and failback activities.  The blademap table\nin the bullseye database needs to be rebuilt after any activity like this.\n'
every 31 seconds
begin
	cancel;
end;
go

create or replace trigger DetectCarrierThreshold
group ASB1
enabled false
priority 2
comment '\n'
every 21 seconds
begin
	cancel;
end;
go

create or replace trigger clientClassToCarrier
group ASB1
enabled false
priority 1
comment ''
on signal clientClassToCarrier
begin
	cancel;
end;
go

create or replace trigger ClearModemTraps
group ASB1
enabled false
priority 1
comment 'This is a standard Automation for finding riverdelta events signifying a\nnew flap entry for a device.\n\nThe Action sets the events to  Clear (Severity 0).\n'
every 121 seconds
begin
	cancel;
end;
go

create or replace trigger DetectTelemetryOutage
group ASB1
enabled false
priority 2
comment ''
every 123 seconds
begin
	cancel;
end;
go

create or replace trigger qoiCarrierInsert
group ASB1
enabled false
priority 1
comment ''
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger getLinkName
group ASB1
enabled false
priority 1
comment ''
on signal getLinkName
begin
	cancel;
end;
go

create or replace trigger summaryEnrich
group ASB1
enabled false
priority 1
comment ''
before update on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger DetectBeam28PowerImbalance
group ASB1
enabled false
priority 2
comment ''
every 301 seconds
begin
	cancel;
end;
go

create or replace trigger clientClassToCarrierdb
group ASB1
enabled false
priority 1
comment ''
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger qoiCarrierClear
group ASB1
enabled false
priority 1
comment ''
before update on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger CarrierPowerSingleAmplifier
group ASB1
enabled false
priority 1
comment 'This escalates problems discovered upon receiving\na carrierPower Amplifer alert.'
every 241 seconds
begin
	cancel;
end;
go

create or replace trigger DetectCacheTraps
group ASB1
enabled false
priority 2
comment ''
every 121 seconds
begin
	cancel;
end;
go

create or replace trigger DetectAndrewTrap
group ASB1
enabled false
priority 2
comment ''
every 61 seconds
begin
	cancel;
end;
go

create or replace trigger system_watch_shutdown
group system_watch
priority 1
comment 'Create an alert indicating that the ObjectServer is being shutdown'
on signal shutdown
begin
	cancel;
end;
go

create or replace trigger system_watch_startup
group system_watch
priority 1
comment 'Create an alert indicating that the ObjectServer has started'
on signal startup
begin
	cancel;
end;
go

create or replace trigger originalSeverity
group WBAuto
priority 1
comment ''
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger confirmationTrapClearing
group WBAuto
priority 1
comment 'Clear \'Awaiting Confirmation\' trap if:\nNodeAlias+AlertGroup of the confirmation trap = AlertKey of the AwaitingConfirmation trap'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger insertMetaOutstandingDNSRequests
group WBMeta
enabled false
priority 2
comment 'Inserts an alert as a secondary persistent alert that will outlive an original outstandingDNSRequests alert.  Deduplicationis used to keep the alert alive for a set amount of time after the original self-clears.  ExpireTime is set by alert post processing (e.g. synmpat).'
every 150 seconds
begin
	cancel;
end;
go

create or replace trigger metaPepMemWarning
group WBMeta
enabled false
priority 4
comment 'Create a meta trap whenever a pep mem warning trap comes in\n'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger detectDhcpServerFailure
group WBMeta
enabled false
priority 1
comment 'Evaluate the operational status of primary/secondary pairs of DHCP servers ..dmillis'
every 60 seconds
begin
	cancel;
end;
go

create or replace trigger resync_old_events
group failback_triggers
priority 1
comment 'This trigger processes the contents of the table alerts.resync_complete.  For each entry found, this trigger\nwill initiate a flush of all events over the next IDUC cycle.  This is to ensure synchronicity across all ObjectServers\nin particular between the Aggregation ObjectServers.'
every 15 seconds
begin
	cancel;
end;
go

create or replace trigger detect_agg_gate_resync_complete
group failback_triggers
priority 1
comment 'This trigger detects the moment the faiover Gateway AGG_GATE completes its resychronisation step.\nIt then inserts a row in the table alerts.resync_complete.  The contents of this table is processed by the\ntemporal trigger resync_old_events which updates all events causing them to be flushed to the counterpart\nObjectServer to ensure synchronicity.'
on signal gw_resync_finish
begin
	cancel;
end;
go

create or replace trigger disconnect_all_clients
group failback_triggers
priority 2
comment 'Once bidirectional Gateway resynchronisation has completed, disconnect all clients\nexcept for the bidirectional Gateway, Administrator and Web GUI clients.\nThis will cause all connected clients to fail back to the primary ObjectServer AGG_P.\nThis trigger should only be enabled on the backup ObjectServer AGG_B.'
on signal gw_resync_finish
begin
	cancel;
end;
go

create or replace trigger RCamHlth
group WBTrigger
enabled false
priority 1
comment ''
every 10 seconds
begin
	cancel;
end;
go

create or replace trigger wb_reset_event_filter_time
group WBTrigger
priority 1
comment ''
every 34 seconds
begin
	cancel;
end;
go

create or replace trigger MailOnAmazonCloud
group WBTrigger
enabled false
priority 2
comment 'Mail to developers on FLUME alerts'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger delete_clears_WB
group WBTrigger
enabled false
priority 1
comment 'Delete clear alerts over 2 minutes old in ALERTS.STATUS every 60 seconds\nAlerts that have been touchpointed with an M&P that looks like \'NOC-*\' must also:\n1. Be acknowledged\nor\n2. Be suppressed\n'
every 15 seconds
begin
	cancel;
end;
go

create or replace trigger delete_old_events
group WBTrigger
enabled false
priority 1
comment 'Delete clear alerts over 2 minutes old in ALERTS.STATUS every 60 seconds\nAlerts that have been touchpointed with an M&P that looks like \'NOC-*\' must also:\n1. Be acknowledged\nor\n2. Be suppressed\n'
every 15 seconds
begin
	cancel;
end;
go

create or replace trigger MailOnAccelOutstandingDNSReqs
group WBTrigger
priority 2
comment 'Mail to developers on accelenet outstanding dns request thread alerts'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger nms_probe_hlth
group WBTrigger
enabled false
priority 1
comment ''
every 20 seconds
begin
	cancel;
end;
go

create or replace trigger resetOwnerGID
group WBTrigger
priority 1
comment 'Checks every minute for all alerts with a OwnerGID set as OwnerGID=1 (System) and change to OwnerGID=0 (Public)\r\nJM - 4_28_2015'
every 60 seconds
begin
	cancel;
end;
go

create or replace trigger deduplicate_journal
group WBTrigger
priority 1
comment 'Deduplication processing for ALERTS.STATUS'
before reinsert on alerts.journal for each row
begin
	cancel;
end;
go

create or replace trigger DetectSmtsBladeReset
group WBTrigger
enabled false
priority 1
comment 'This trigger will check every 15 seconds for alerts with Agent=VIASAT-SURFBEAM-2-SMTS-NOTIFICATIONS-MIB and Summary=evtEvtStateMgmtOpStateToDisabledNotification. It will check to see if the alert has cleared (Severity = 0) and if it is younger than 1 minute "(getdate - LastOccurrence) < 60". If the alert matches both criteria then a "evtEvtStateMgmtSmtsBladeReset" alert will be raised and a trap sent. '
every 15 seconds
begin
	cancel;
end;
go

create or replace trigger sm_top_probes_insert
group self_monitoring_group
priority 10
comment 'Populates the top Probes table on insert.'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger sm_process_top_probes
group self_monitoring_group
priority 10
comment 'Creates synthetic events for top Probes.'
every 300 seconds
begin
	cancel;
end;
go

create or replace trigger sm_db_stats
group self_monitoring_group
priority 11
comment 'Creates synthetic events for ObjectServer DB stats.'
every 60 seconds
begin
	cancel;
end;
go

create or replace trigger sm_top_classes_reinsert
group self_monitoring_group
priority 10
comment 'Populates the top Classes table on reinsert.'
before reinsert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger sm_client_time
group self_monitoring_group
priority 10
comment 'Creates synthetic events for ObjectServer time spent executing client SQL'
on signal profiler_report
begin
	cancel;
end;
go

create or replace trigger sm_process_top_classes
group self_monitoring_group
priority 10
comment 'Creates synthetic events for top Classes.'
every 300 seconds
begin
	cancel;
end;
go

create or replace trigger sm_block_events_from_gateway
group self_monitoring_group
priority 1
comment 'TRIGGER: block_sm_events_from_gateway\n--\nThis trigger prevents the self monitoring events from being inserted into the\nDisplay layer ObjectServers from the layers below.  This is to prevent\nduplication of events within the GUI.'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger sm_connections
group self_monitoring_group
priority 10
comment 'Creates synthetic events for ObjectServer client connections stats.'
every 60 seconds
begin
	cancel;
end;
go

create or replace trigger sm_delete_clears_display
group self_monitoring_group
priority 10
comment 'Delete clear synthetic alerts over 2 minutes old on Display ObjectServers.'
every 60 seconds
begin
	cancel;
end;
go

create or replace trigger sm_top_nodes_reinsert
group self_monitoring_group
priority 10
comment 'Populates the top Nodes table on reinsert.'
before reinsert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger sm_memstore
group self_monitoring_group
priority 10
comment 'Creates synthetic events for memstore stats.'
on signal profiler_report
begin
	cancel;
end;
go

create or replace trigger sm_triggers
group self_monitoring_group
priority 10
comment 'Creates synthetic events for Objectserver Trigger stats.'
on signal profiler_report
begin
	cancel;
end;
go

create or replace trigger sm_top_nodes_insert
group self_monitoring_group
priority 10
comment 'Populates the top Nodes table on insert.'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger sm_top_classes_deduplication
group self_monitoring_group
priority 10
comment 'Handles deduplications on the master.sm_top_classes table.'
before reinsert on master.sm_top_classes for each row
begin
	cancel;
end;
go

create or replace trigger sm_top_probes_reinsert
group self_monitoring_group
priority 10
comment 'Populates the top Probes table on reinsert.'
before reinsert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger sm_top_probes_deduplication
group self_monitoring_group
priority 10
comment 'Handles deduplications on the master.sm_top_probes table.'
before reinsert on master.sm_top_probes for each row
begin
	cancel;
end;
go

create or replace trigger sm_expire_display_events
group self_monitoring_group
priority 10
comment 'Expire local self monitoring events on Display ObjectServers.'
every 61 seconds
begin
	cancel;
end;
go

create or replace trigger sm_dbops_stats
group self_monitoring_group
priority 10
comment 'Creates synthetic events for DB operations stats.'
every 60 seconds
begin
	cancel;
end;
go

create or replace trigger sm_deduplication_grade
group self_monitoring_group
priority 10
comment 'Updates Grade, ExpireTime and Acknowledged fields on deduplication\nof self-monitoring events.'
before reinsert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger sm_log_alert_inserts
group self_monitoring_group
priority 10
comment 'Writes log messages to the self monitoring log file for ALERTS.'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger sm_process_top_nodes
group self_monitoring_group
priority 10
comment 'Creates synthetic events for top Nodes.'
every 300 seconds
begin
	cancel;
end;
go

create or replace trigger sm_top_classes_insert
group self_monitoring_group
priority 10
comment 'Populates the top Classes table on insert.'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger sm_top_nodes_deduplication
group self_monitoring_group
priority 10
comment 'Handles deduplications on the master.sm_top_nodes table.'
before reinsert on master.sm_top_nodes for each row
begin
	cancel;
end;
go

create or replace trigger sm_check_probe_heartbeats
group self_monitoring_group
priority 10
comment 'Check Probe heartbeat events and raise Severity of ones that have not heartbeated for more than 3 minutes.'
every 60 seconds
begin
	cancel;
end;
go

create or replace trigger sm_create_journal_on_severity_change
group self_monitoring_group
priority 1
comment 'Inserts a journal for ALERT events if the Severity is updated.'
before reinsert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger sm_time_to_display_severity
group self_monitoring_group
priority 10
comment 'This trigger adjusts the Severity of time to display events based on the metric.'
every 61 seconds
begin
	cancel;
end;
go

create or replace trigger sm_log_alert_reinserts
group self_monitoring_group
priority 10
comment 'Writes log messages to the self monitoring log file for ALERTS.'
before reinsert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger update_service_affecting_events
group sae
priority 1
comment 'Update Service Affecting Events'
every 60 seconds
begin
	cancel;
end;
go

create or replace trigger rcaGateOnClearTransitionOnUpdate
group RCA
enabled false
priority 4
comment 'This transition sends an update(U) anytime an alert we care about goes \nfrom clear to non-cleared or vice-versa.  This is done so the RCA engine\ncan remove dependencies on root cause alerts where the root cause\nalert has been cleared'
before update on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger rcaGateOnClearTransitionOnReinsert
group RCA
enabled false
priority 1
comment 'This transition sends an reinsert(R) anytime an alert we care about goes\nfrom clear to non-cleared or vice-versa.  This is done so the RCA engine\ncan remove dependencies on root  cause alerts where the root cause\nalert has been cleared'
before reinsert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger rcaMetaClear
group RCA
enabled false
priority 1
comment 'rcaMetaClear is triggered whenever a meta \'clear\' event comes in.  This trigger checks to see if there was a corresponding problem alert and cancels the new alert if there is no problem to clear.'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger rcaGateOnTimeout
group RCA
enabled false
priority 4
comment 'rcam.pl sends a \'failsafe\' resolution trap every 30 seconds or so to \nshow that the system is still receiving alerts and processing them.  It\n can only send this trap when it sees an alert.  The failsafe alert exp\nires immediately and is removed from the system within a few minutes.  \nIf a failsafe trap does not exist in the object server, showAlerts disp\nlays a warning message that will result in an escalation by the NOC.\n\nIf there are no touchpointable traps within a few minutes, which can\nhappen pretty easily, this \'timeout alert is sent by rcam.pl.  The time\nout trap exercises the entire system including mttrapd, the object server,\nthe rcaGateFile all the way back to rcam.pl which reads, processes \nthe trap, and allows the \'failsafe\' resolution trap to get sent.'
before reinsert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger rcaCleanRCAGate
group RCA
enabled false
priority 1
comment 'Trims rcaGate table down to 7 minutes'
before insert on custom.RCAGate for each row
begin
	cancel;
end;
go

create or replace trigger rcaGateOnAutomationUpdate
group RCA
enabled false
priority 4
comment 'This trigger sends and update(U) any time the wbAutomationID field\nis updated, which occurs whenever a human requests that an automation\nshould be executed.\nCreated 2009Aug by dmillis'
before update on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger rcaGateOnInsert
group RCA
enabled false
priority 4
comment 'This trigger includes RESOLUTION Type events.  TEST TEST TEST'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger rcaGateOnFieldUpdate
group RCA
enabled false
priority 4
comment 'This transition sends an update(U) anytime an updated alert has a field\nset to something we care about.'
before update on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger rcaGateOnDelete
group RCA
enabled false
priority 4
comment 'Deletes sent on relevant alerts result in the following actions:\n- root cause alerts for this alert have their instance counter decremented\n- all symptom alerts dependent on this root cause alert must have\n  their RCA rerun'
before delete on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger rcaGateCheckForAge
group RCA
enabled false
priority 4
comment 'This automation checks to see if the age has exceeded the rca age\nthreshold for the alert.  This has to be done temporally since the\npassage of time is not a database trigger.'
every 30 seconds
begin
	cancel;
end;
go

create or replace trigger rcaGateOnTallyIncrement
group RCA
enabled false
priority 4
comment 'This triggers the logging of \'PENDING\' alerts whose m&p assignment\ndepends on the tally value.'
before reinsert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger rcaGateOnTallyIncrementTemporal
group RCA
enabled false
priority 4
comment 'This triggers checks for \'PENDING\' alerts whose m&p assignment\n\ndepends on the tally value. Created by dmillis, based on a trigger stolen from aellis'
every 11 seconds
begin
	cancel;
end;
go

create or replace trigger deduplication
group default_triggers
priority 1
comment 'Deduplication processing for ALERTS.STATUS'
before reinsert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger agg_deduplication
group default_triggers
priority 2
comment 'Replacement reinsert trigger (alerts.status) for multi-ObjectServer environments.'
before reinsert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger aen_heartbeat
group default_triggers
enabled false
priority 1
comment 'Send a heartbeat command to the AEN clients to keep the connection alive'
every 180 seconds
begin
	cancel;
end;
go

create or replace trigger delete_clears_VS
group default_triggers
enabled false
priority 1
comment ''
every 23 seconds
begin
	cancel;
end;
go

create or replace trigger service_update
group default_triggers
priority 1
comment 'Service processing for service.status'
before update on service.status for each row
begin
	cancel;
end;
go

create or replace trigger clean_journal_table
group default_triggers
priority 1
comment 'Housekeeping cleanup of ALERTS.JOURNAL'
every 60 seconds
begin
	cancel;
end;
go

create or replace trigger mail_on_probe_failure
group default_triggers
debug true
enabled false
priority 1
comment 'Send email about critical alerts that are unacknowledged after 30 minutes. NOTE This tool is UNIX specific unless an equivalent NT mailer is available.\n for each row critical in alerts.status where critical.Severity = 5 and critical.Grade < 2 and \n\t\t\t\t\t\t\tcritical.Acknowledged = 0 and \n\t\t\t\t\t\t\tcritical.LastOccurrence <= ( getdate() - (60*30) )\n        begin\n                execute send_email( critical.Node, critical.Severity, \'Netcool Email\', \'jeffrey.mclean@viasat.com,kenneth.jenkins@viasat.com\', critical.Summary, \'localhost\');\n                update alerts.status via critical.Identifier set Grade=2;\n        end;'
every 30 seconds
begin
	cancel;
end;
go

create or replace trigger service_insert
group default_triggers
priority 1
comment 'Service processing for service.status'
before insert on service.status for each row
begin
	cancel;
end;
go

create or replace trigger service_reinsert
group default_triggers
priority 1
comment 'Service processing for service.status'
before reinsert on service.status for each row
begin
	cancel;
end;
go

create or replace trigger clean_details_table
group default_triggers
priority 1
comment 'Housekeeping cleanup of ALERTS.DETAILS'
every 60 seconds
begin
	cancel;
end;
go

create or replace trigger state_change
group default_triggers
priority 1
comment 'State change processing for ALERTS.STATUS'
before update on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger wbDeleteNoise
group default_triggers
enabled false
priority 1
comment ''
every 300 seconds
begin
	cancel;
end;
go

create or replace trigger agg_new_row
group default_triggers
priority 2
comment 'Replacement insert trigger (alerts.status) for multi-ObjectServer environments.'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger new_row
group default_triggers
priority 1
comment 'Set default values for new alerts in ALERTS.STATUS'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger deduplicate_details
group default_triggers
priority 1
comment 'Deduplicate rows on alerts.details'
before reinsert on alerts.details for each row
begin
	cancel;
end;
go

create or replace trigger timestamp_inserts
group default_triggers
priority 3
comment 'Records timestamps for insertion into each tier (alerts.status) in multi-ObjectServer environments.'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger connection_watch_connect
group connection_watch
priority 1
comment 'Create an alert when a new client connects\nThe process name identified by the signal is matched against the applications table to identify the appropriate severity and event type for the connect.\nA gateway connection for example is treated as a resolution (clearing a disconnect), whereas an eventlist connect is a Type 1 event which will be resolved by a disconnect) '
on signal connect
begin
	cancel;
end;
go

create or replace trigger connection_watch_disconnect
group connection_watch
priority 1
comment 'Create an alert when a client disconnects\nThe process name identified by the signal is matched against the applications table to identify the appropriate severity and event type for the disconnect.\nA gateway disconnection for example is treated as a problem, where as an eventlist disconnect is a resolution'
on signal disconnect
begin
	cancel;
end;
go

create or replace trigger generic_clear
group primary_only
priority 1
comment 'Generic Problem/Resolution'
every 5 seconds
begin
	cancel;
end;
go

create or replace trigger escalate_off
group primary_only
enabled false
priority 1
comment 'Will set Flash field to 0 (not flashing) and SuppressEscl to 0 (not escalated in this example) when an event that has previously had the Flash field set to 1 is Acknowledged or if the event is Cleared (Severity = 0).'
every 6 seconds
begin
	cancel;
end;
go

create or replace trigger expire
group primary_only
priority 1
comment 'Expiration'
every 60 seconds
begin
	cancel;
end;
go

create or replace trigger delete_clears
group primary_only
priority 1
comment 'Delete clear alerts over 2 minutes old in ALERTS.STATUS every 60 seconds'
every 60 seconds
begin
	cancel;
end;
go

create or replace trigger mail_on_critical
group primary_only
enabled false
priority 1
comment 'Send email about critical alerts that are unacknowledged after 30 minutes. NOTE This tool is UNIX specific unless an equivalent NT mailer is available.'
every 10 seconds
begin
	cancel;
end;
go

create or replace trigger flash_not_ack
group primary_only
enabled false
priority 1
comment 'Will set Flashing on (Flash=1) for events that are Critical (Severity=5) and are 10 minutes old but have not been acknowledged by a user yet (Acknowledge = 0). It sets SuppressEscl to 1 as a further indication of the events escalation status.'
every 31 seconds
begin
	cancel;
end;
go

create or replace trigger resync_complete
group primary_only
priority 1
comment 'Creates synthetic events to indicate when Gateways have completed resynchronisation.'
on signal gw_resync_finish
begin
	cancel;
end;
go

create or replace trigger disable_user
group security_watch
priority 1
comment 'Disable users when they fail to log on after n consecutive failures'
on signal login_failed
begin
	cancel;
end;
go

create or replace trigger disable_inactive_users
group security_watch
enabled false
priority 1
comment 'Disable users that have not logged on to the objectserver within a defined period'
every 86400 seconds
begin
	cancel;
end;
go

create or replace trigger reset_user
group security_watch
priority 1
comment 'Reset the users failure count when they logon successfully.'
on signal connect
begin
	cancel;
end;
go

create or replace trigger security_watch_security_failure
group security_watch
priority 1
comment 'Create an alert when a client fails to authenticate'
on signal login_failed
begin
	cancel;
end;
go

create or replace trigger audit_config_alter_object
group audit_config
priority 1
comment 'Create an alert indicating that an object has been altered'
on signal alter_object
begin
	cancel;
end;
go

create or replace trigger audit_config_drop_col_visual
group audit_config
priority 1
comment 'Create an alert indicating that a column visual has been dropped'
before delete on alerts.col_visuals for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_drop_object
group audit_config
priority 1
comment 'Create an alert indicating that an object has been dropped'
on signal drop_object
begin
	cancel;
end;
go

create or replace trigger audit_config_create_tool
group audit_config
priority 1
comment 'Create an alert indicating that a tool has been created'
before insert on tools.actions for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_alter_prompt
group audit_config
priority 1
comment 'Create an alert indicating that a prompt has been altered'
before update on tools.prompt_defs for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_alter_class
group audit_config
priority 1
comment 'Create an alert indicating that a class has been altered'
before update on alerts.objclass for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_alter_col_visual
group audit_config
priority 1
comment 'Create an alert indicating that a column visual has been altered'
before update on alerts.col_visuals for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_drop_tool
group audit_config
priority 1
comment 'Create an alert indicating that a tool has been dropped'
before delete on tools.actions for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_drop_prompt
group audit_config
priority 1
comment 'Create an alert indicating that a prompt has been dropped'
before delete on tools.prompt_defs for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_create_class
group audit_config
priority 1
comment 'Create an alert indicating that a class has been created'
before insert on alerts.objclass for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_alter_menu
group audit_config
priority 1
comment 'Create an alert indicating that a menu has been altered'
before update on tools.menu_items for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_alter_conv
group audit_config
priority 1
comment 'Create an alert indicating that a conversion has been altered'
before update on alerts.conversions for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_create_menu
group audit_config
priority 1
comment 'Create an alert indicating that a menu has been created'
before insert on tools.menu_items for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_create_prompt
group audit_config
priority 1
comment 'Create an alert indicating that a prompt has been created'
before insert on tools.prompt_defs for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_alter_tool
group audit_config
priority 1
comment 'Create an alert indicating that a tool has been altered'
before update on tools.actions for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_create_col_visual
group audit_config
priority 1
comment 'Create an alert indicating that a column visual has been created'
before insert on alerts.col_visuals for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_create_conv
group audit_config
priority 1
comment 'Create an alert indicating that a conversion has been created'
before insert on alerts.conversions for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_alter_property
group audit_config
priority 1
comment 'Create an alert indicating that a property has been altered'
on signal alter_property
begin
	cancel;
end;
go

create or replace trigger audit_config_permission_denied
group audit_config
priority 1
comment 'Create an alert indicating that a permission denied'
on signal permission_denied
begin
	cancel;
end;
go

create or replace trigger audit_config_drop_conv
group audit_config
priority 1
comment 'Create an alert indicating that a conversion has been dropped'
before delete on alerts.conversions for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_drop_class
group audit_config
priority 1
comment 'Create an alert indicating that a class has been dropped'
before delete on alerts.objclass for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_drop_menu
group audit_config
priority 1
comment 'Create an alert indicating that a menu has been dropped'
before delete on tools.menu_items for each row
begin
	cancel;
end;
go

create or replace trigger audit_config_create_object
group audit_config
priority 1
comment 'Create an alert indicating that an object has been created'
on signal create_object
begin
	cancel;
end;
go

create or replace trigger profiler_group_report
group profiler_triggers
priority 2
comment 'Profiler application group reporting trigger'
on signal profiler_report
begin
	cancel;
end;
go

create or replace trigger profiler_report
group profiler_triggers
priority 1
comment 'Profiler reporting trigger'
on signal profiler_report
begin
	cancel;
end;
go

create or replace trigger profiler_toggle
group profiler_triggers
priority 1
comment 'Report that the profiler has been toggled'
on signal profiler_toggle
begin
	cancel;
end;
go

create or replace trigger trigger_stats_report
group trigger_stat_reports
priority 1
comment 'Trigger statistic report trigger'
on signal trigger_stats_report
begin
	cancel;
end;
go

create or replace trigger my_objserv_eventrate
group stats_triggers
priority 20
comment 'Calculate the event rate on the object server'
every 60 seconds
begin
	cancel;
end;
go

create or replace trigger delete_stats
group stats_triggers
priority 20
comment 'keep up to 120 days of records in the master.stats table'
every 86400 seconds
begin
	cancel;
end;
go

create or replace trigger details_inserts
group stats_triggers
priority 20
comment 'Counts details table inserts'
before insert on alerts.details for each row
begin
	cancel;
end;
go

create or replace trigger stats_reset
group stats_triggers
priority 1
comment 'Reset the statistics data'
on signal stats_reset
begin
	cancel;
end;
go

create or replace trigger new_status_inserts
group stats_triggers
priority 20
comment 'Counts new status table inserts'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger deduplicate_probestats
group stats_triggers
priority 1
comment 'Handle duplicate rows on master.probestats'
before reinsert on master.probestats for each row
begin
	cancel;
end;
go

create or replace trigger journal_inserts
group stats_triggers
priority 20
comment 'Counts journal table inserts'
before insert on alerts.journal for each row
begin
	cancel;
end;
go

create or replace trigger status_updates
group stats_triggers
priority 20
comment 'Counts status table updates'
before update on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger probestat_reinsert
group stats_triggers
priority 2
comment 'Trap probestat events and copy data to master.probestats table'
before reinsert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger dedup_status_inserts
group stats_triggers
priority 20
comment 'Counts deduplicated status table inserts'
before reinsert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger statistics_cleanup
group stats_triggers
enabled false
priority 20
comment 'Delete statistics over an hour old'
every 3600 seconds
begin
	cancel;
end;
go

create or replace trigger probe_statistics_report
group stats_triggers
priority 2
comment 'Produce probestats report'
every 30 seconds
begin
	cancel;
end;
go

create or replace trigger probe_statistics_cleanup
group stats_triggers
enabled false
priority 20
comment 'Delete probe statistics over an hour old'
every 3600 seconds
begin
	cancel;
end;
go

create or replace trigger probestats_reset
group stats_triggers
priority 2
comment 'Reset the probe statistics data'
on signal stats_reset
begin
	cancel;
end;
go

create or replace trigger statistics_gather
group stats_triggers
priority 20
comment 'Create some v3.x ObjectServer statistics'
every 300 seconds
begin
	cancel;
end;
go

create or replace trigger probestat_insert
group stats_triggers
priority 2
comment 'Trap probestat events and copy data to master.probestats table'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger suppress_cross_domain_connections
group itnm_triggers
enabled false
priority 1
comment ''
before update on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger severity_from_causetype
group itnm_triggers
enabled false
priority 1
comment ''
before update on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger registry_new_probe
group registry_triggers
priority 10
comment 'Set defaults for new entry in REGISTRY.PROBES'
before insert on registry.probes for each row
begin
	cancel;
end;
go

create or replace trigger registry_reinsert_probe
group registry_triggers
priority 10
comment 'Treat inserts to existing PROBE.REGISTRY entry as though they were updates. Time stamp the record to keep track of the last time this entry was updated. Only probes directly connected, or connected via a proxy server, as well as gateways are allowed to re-insert into the table. Other applications must use UPDATE to modify the probe registry.'
before reinsert on registry.probes for each row
begin
	cancel;
end;
go

create or replace trigger registry_update_probe
group registry_triggers
priority 10
comment 'Set the LastUpdate column for updates coming from all clients except gateways. Only permit updates from gateways if the LastUpdate time is more recent than the existing entry'
before update on registry.probes for each row
begin
	cancel;
end;
go

create or replace trigger registry_probe_disconnect
group registry_triggers
priority 10
comment 'Reset ConnectionID in probe registry when probe or proxy server disconnects.'
on signal disconnect
begin
	cancel;
end;
go

create or replace trigger fixPBRdb
group WBPrimaryOnly
enabled false
priority 1
comment ''
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger fixPBR
group WBPrimaryOnly
enabled false
priority 1
comment ''
on signal pbrFix
begin
	cancel;
end;
go

create or replace trigger disconnect_iduc_missed
group iduc_triggers
priority 1
comment 'Disconnects real-time clients that have not communicated with objectserver for 100 granularity periods'
on signal iduc_missed
begin
	cancel;
end;
go

create or replace trigger iduc_stats_update
group iduc_triggers
priority 1
comment 'update LastIducTime in iduc_system.iduc_stats table on signal iduc_data_fetch'
on signal iduc_data_fetch
begin
	cancel;
end;
go

create or replace trigger iduc_messages_tblclean
group iduc_triggers
priority 1
comment 'Housekeeping cleanup of ALERTS.IDUC_MESSAGES'
every 60 seconds
begin
	cancel;
end;
go

create or replace trigger deduplicate_iduc_stats
group iduc_triggers
priority 1
comment 'Deduplicate rows on iduc_system.iduc_stats'
before reinsert on iduc_system.iduc_stats for each row
begin
	cancel;
end;
go

create or replace trigger iduc_stats_insert
group iduc_triggers
priority 1
comment 'Insert client entry into iduc_system.iduc_stats table on signal iduc_connect'
on signal iduc_connect
begin
	cancel;
end;
go

create or replace trigger scala_reinsert
group scala_triggers
enabled false
priority 20
comment 'Fast Track an event reinsert for alerts.status to message bus Gateway running in SCALA mode'
before reinsert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger scala_insert
group scala_triggers
enabled false
priority 20
comment 'Fast Track an event insert for alerts.status to message bus Gateway running in SCALA mode'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger trimFatJournals
group WBTest
priority 1
comment 'This trigger finds journal entries which have excessive numbers\nof entries, then trims the newest, leaving the oldest ..dmillis'
every 61 seconds
begin
	cancel;
end;
go

create or replace trigger mailOnCysA15Firewall
group WBTest
enabled false
priority 4
comment 'This email notification fires only for Cheyenne A15 firewalls\n\nupon link-down; requested by T4/Net. Created by dmillis 2010jan05'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger DetectTestWarnings
group WBMail
enabled false
priority 2
comment 'Finds all  traps specified of Grade < 2 that match the other criteria\nspecified .  The results will be mailed\n\nGrade is used to keep from acting twice. \n\nThe action must escalate Grade = 2 on this event.'
every 301 seconds
begin
	cancel;
end;
go

create or replace trigger DetectTrapCacheTraps
group WBMail
priority 2
comment ''
every 324 seconds
begin
	cancel;
end;
go

create or replace trigger mailOnWdc1Visibility
group WBMail
enabled false
priority 1
comment 'This trigger will send email on any device visibility alerts in WDC1\naellis...'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger DetectBigIronWarnings
group WBMail
enabled false
priority 2
comment ''
every 61 seconds
begin
	cancel;
end;
go

create or replace trigger mailOnAmazonCloudAlert
group WBMail
enabled false
priority 4
comment 'Send e-mail about critical alerts that are\nthat come from Amazon Cloud that have \'Flume_ERROR\' or \'Flume_FATAL\' in summary'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger DetectDiskWarnings
group WBMail
enabled false
priority 1
comment 'This trigger will send email when a TMPM storage usage alert\nis received for any server in WDC1 PROD\n..aellis'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger oslcreg_sp_new
group oslc
priority 10
comment 'Generate OSLC Service Provider registrations for ECIP for registered provider.'
every 60 seconds
begin
	cancel;
end;
go

create or replace trigger oslcreg_ecip_dedup_after
group oslc
priority 10
comment 'Update OSLC Service Provider registrations for updated ECIP.'
before reinsert on registry.oslcecip for each row
begin
	cancel;
end;
go

create or replace trigger oslcreg_sp_delete_before
group oslc
priority 10
comment 'Cleanup OSLC ECIP registrations for delete Provider registration.'
before delete on registry.oslcsp for each row
begin
	cancel;
end;
go

create or replace trigger oslcreg_ecip_new
group oslc
priority 10
comment 'Generate OSLC Service Provider registrations for inserted ECIP.'
before insert on registry.oslcecip for each row
begin
	cancel;
end;
go

create or replace trigger oslcreg_ecipreg_delete
group oslc
priority 1
comment 'Cleanup OSLC Service Provider registrations for ECIP.'
every 60 seconds
begin
	cancel;
end;
go

create or replace trigger oslcreg_ecip_delete_after
group oslc
priority 10
comment 'Cleanup OSLC Service Provider registrations for ECIP.'
before delete on registry.oslcecip for each row
begin
	cancel;
end;
go

create or replace trigger oslcreg_ecipregs_new
group oslc
priority 10
comment 'Set the RequestTime to now for the registration request row.'
before insert on registry.oslcecip_regs for each row
begin
	cancel;
end;
go

create or replace trigger oslcreg_ecip_update_after
group oslc
priority 10
comment 'Update OSLC Service Provider registrations for updated ECIP.'
before update on registry.oslcecip for each row
begin
	cancel;
end;
go

create or replace trigger oslcreg_ecip_dedup_before
group oslc
priority 10
comment 'Update OSLC Service Provider registrations for updated ECIP.'
before reinsert on registry.oslcecip for each row
begin
	cancel;
end;
go

create or replace trigger backup_succeeded
group automatic_backup_system
priority 1
comment 'Action to perform on a successful backup operation'
on signal backup_succeeded
begin
	cancel;
end;
go

create or replace trigger automatic_backup
group automatic_backup_system
enabled false
priority 1
comment 'The automatic backup trigger\n\nBacks up all ObjectServer memory stores to a sequence of locations dependent on "num_backups"\n'
every 300 seconds
begin
	cancel;
end;
go

create or replace trigger backup_failed
group automatic_backup_system
priority 1
comment 'Action to perform on a failed backup operation'
on signal backup_failed
begin
	cancel;
end;
go

create or replace trigger backup_state_integrity
group automatic_backup_system
priority 1
comment ''
before insert on alerts.backup_state for each row
begin
	cancel;
end;
go

create or replace trigger backup_counterpart_down
group gateway_triggers
enabled false
priority 1
comment 'The counterpart server is down'
on signal gw_counterpart_down
begin
	cancel;
end;
go

create or replace trigger backup_startup
group gateway_triggers
enabled false
priority 1
comment 'On startup dont start the automations'
on signal startup
begin
	cancel;
end;
go

create or replace trigger resync_finished
group gateway_triggers
priority 1
comment 'Resync finished'
on signal gw_resync_finish
begin
	cancel;
end;
go

create or replace trigger pass_deletes
group gateway_triggers
enabled false
priority 1
comment 'Delete rows in destination server that do not exist in source after resync'
on signal gw_resync_finish
begin
	cancel;
end;
go

create or replace trigger backup_counterpart_up
group gateway_triggers
enabled false
priority 1
comment 'The counterpart server has come up'
on signal gw_counterpart_up
begin
	cancel;
end;
go

create or replace procedure insertTrap (in Serial int, in Agent char(64), in AlertGroup char(1), in AlertKey char(1), in Summary char(1), in Severity int, in caller char(32))
declare manager char(16);
    type Integer
begin









    set manager = 'insertWildBlueTrap';
    set type = 1;

    call jinsert( Serial, %user.user_id, getdate,caller );

    insert into alerts.status(
        OwnerUID, OwnerGID, Node, NodeAlias, Severity, Identifier, Summary,
        Type, Manager, Agent, AlertGroup, AlertKey, FirstOccurrence, LastOccurrence
    ) values (
        65534, 0, AlertKey, AlertKey, Severity,
        %user.host_name+manager+Agent+AlertGroup+AlertKey+to_char(type),
        Summary, type, manager, Agent, AlertGroup, AlertKey, getdate,getdate
    );








end;
go

create or replace procedure rcaGateQProcess (in Node char(64), in methodProcedure char(255), in wbAgentAlias char(64), in Poll int, in wbSmtsIP char(64), in wbNeighbor char(64), in wbCarrier char(16), in rcaProbableCause int, in wbTicketID char(32), in AlertGroup char(255), in Summary char(255), in NodeAlias char(64), in FirstOccurrence utc, in Serial int, in rcaSympatRule int, in ExpireTime int, in Severity int, in wbSat char(8), in wbGateway char(16), in Agent char(64), in AlertKey char(255), in wbAgentNode char(64), in Type int, in wbInterface char(64), in wbAutomationID char(128), in Customer char(64), in rcaSymptomCount int, in Tally int, in NCOType char(1), in caller char(32))
begin



      insert into custom.RCAGate (
      Node,
      methodProcedure,
      wbAgentAlias,
      Poll,
      wbSmtsIP,
      wbNeighbor,
      wbCarrier,
      rcaProbableCause,
      wbTicketID,
      AlertGroup,
      Summary,
      NodeAlias,
      FirstOccurrence,
      Serial,
      rcaSympatRule,
      ExpireTime,
      Severity,
      wbSat,
      wbGateway,
      Agent,
      AlertKey,
      wbAgentNode,
      Type,
      wbInterface,
      wbAutomationID,
      Customer,
      rcaSymptomCount,
      Tally,
      RCServer,
      RCType,
      RCTime
    )
    values
    (
      Node,
      methodProcedure,
      wbAgentAlias,
      Poll,
      wbSmtsIP,
      wbNeighbor,
      wbCarrier,
      rcaProbableCause,
      wbTicketID,
      AlertGroup,
      Summary,
      NodeAlias,
      FirstOccurrence,
      Serial,
      rcaSympatRule,
      ExpireTime,
      Severity,
      wbSat,
      wbGateway,
      Agent,
      AlertKey,
      wbAgentNode,
      Type,
      wbInterface,
      wbAutomationID,
      Customer,
      rcaSymptomCount,
      Tally,
      %user.host_name,
      NCOType,
      getdate
        );



end;
go

create or replace procedure jinsert (in serial int, in uid int, in tstamp utc, in msg char(4080))
begin

--
-- Procedure inserts a record into the alerts.journal table. Automations that 
-- require journal entries should execute this procedure.
--
-- Usage:  
--  call procedure jinsert( old.Serial, %user.user_id, getdate, 'This is my journal entry');
--
        insert into alerts.journal values (
		journal_keyfield( to_int( serial ), to_int( uid ), tstamp ), -- KeyField
                serial,                         -- Serial
                uid,                            -- UID
                tstamp,                         -- Chrono
                split_multibyte(msg, 1, 255),   -- Text1
                split_multibyte(msg, 2, 255),   -- Text2
                split_multibyte(msg, 3, 255),   -- Text3
                split_multibyte(msg, 4, 255),   -- Text4
                split_multibyte(msg, 5, 255),   -- Text5
                split_multibyte(msg, 6, 255),   -- Text6
                split_multibyte(msg, 7, 255),   -- Text7
                split_multibyte(msg, 8, 255),   -- Text8 
                split_multibyte(msg, 9, 255),   -- Text9 
                split_multibyte(msg, 10, 255),  -- Text10
                split_multibyte(msg, 11, 255),  -- Text11
                split_multibyte(msg, 12, 255),  -- Text12
                split_multibyte(msg, 13, 255),  -- Text13
                split_multibyte(msg, 14, 255),  -- Text14
                split_multibyte(msg, 15, 255),  -- Text15
                split_multibyte(msg, 16, 255)   -- Text16
	);

end;
go

create or replace procedure sm_insert (in identifier char(255), in node char(64), in alertgroup char(255), in severity int, in summary_string char(255), in event_metric int, in expiretime int, in event_type int)
begin


	-- INSERT A SYNTHETIC EVENT for Self Monitoring
	insert into alerts.status (
		Identifier, Node, Summary, Class, Type, Severity, FirstOccurrence, LastOccurrence,
		Tally, ExpireTime, AlertGroup, OwnerUID, Manager, Agent, ServerName, Grade) 
        values (
		identifier, node, summary_string, 99999, event_type, severity, getdate(), getdate(),
		1, expiretime + 30, alertgroup, 65534, 'OMNIbus Self Monitoring @' + getservername(),
		'OMNIbus SelfMonitoring', getservername(), event_metric) updating (Severity); 

end;
go

create or replace procedure deleteNewestJournals (in jSerial int, in jCount int)
declare Kounter integer;
begin









  -- This procedure will delete the newest journal entries
  -- for a particular alerts.status event, specified by
  -- its Serial.  jCount is the number of journal entries
  -- to delete.
  -- Example: call deleteNewestJournals (7777, 3);
  -- This will delete the most recent 3 journal entries for
  -- the alerts.status row with Serial = 7777
  -- Created by dmillis, 2009dec22
  if ((jSerial > 0) and (jCount > 0)) then
    for Kounter = 1 to jCount DO
    begin
      delete from alerts.journal where Serial = jSerial and Chrono in (select max(Chrono) from alerts.journal where Serial = jSerial);
    end;
  end if;









end;
go

create or replace procedure enableRCA ()
begin






	-- Enable the automations that should be 
	-- running when it is a primary ObjectServer 
	for each row tg in catalog.triggers where 
			tg.GroupName = 'RCA'
	begin
		alter trigger group tg.GroupName set enabled true;
	end;





end;
go

create or replace procedure oslcecip_regs_insert (in cipid int)
begin

	-- Walk the set of service provider registrations.
	for each row provider in registry.oslcsp
	where
		provider.Registered = 1
	begin
		-- Insert ECIP registration for this provider.
		insert into registry.oslcecip_regs (CIPId,RegistryURI)
			values (cipid, provider.RegistryURI);
	end;

end;
go

create or replace procedure automation_enable ()
begin


	-- Enable the automations that should be 
	-- running when it is a primary ObjectServer 
	for each row tg in catalog.triggers where 
			tg.GroupName = 'primary_only'
	begin
		alter trigger group tg.GroupName set enabled true;
	end;

end;
go

create or replace procedure probestats_data (in rowdata row of alerts.status)
declare ProbePID	int;
	StatTime	int;
begin


	-- copy data out into new row in master.probestats
	set ProbePID=to_int( nvp_get( rowdata.ExtendedAttr, 'ProbePID' ));
	set StatTime=to_int( nvp_get( rowdata.ExtendedAttr, 'StatTime' ));
	insert into master.probestats
		( KeyField,
			StatTime, ProbeUpTime, ProbeAgent, ProbeHost,
			ProbeId, ProbePID,
			NumEventsProcessed,
			NumEventsGenerated,
			NumEventsDiscarded,
			RulesFileTimeSec,
			AvgRulesFileTime,
			CPUTimeSec,
			ProbeMemory ) values
		( rowdata.Agent+'@'+rowdata.Node+':'+to_char( StatTime )+':'+to_char( ProbePID ),
			StatTime, to_int(nvp_get( rowdata.ExtendedAttr, 'ProbeUpTime' )), rowdata.Agent,
			rowdata.Node, rowdata.Agent+'@'+rowdata.Node, ProbePID,
			to_int( nvp_get( rowdata.ExtendedAttr, 'NumEventsProcessed' ) ),
			to_int( nvp_get( rowdata.ExtendedAttr, 'NumEventsGenerated' ) ),
			to_int( nvp_get( rowdata.ExtendedAttr, 'NumEventsDiscarded' ) ),
			to_int( nvp_get( rowdata.ExtendedAttr, 'RulesFileTimeSec' ) ),
			to_int( nvp_get( rowdata.ExtendedAttr, 'AvgRulesFileTime' ) ),
			to_int( nvp_get( rowdata.ExtendedAttr, 'CPUTimeSec' ) ),
			to_int( nvp_get( rowdata.ExtendedAttr, 'ProbeMemory' ) )
		);
	-- done


end;
go

create or replace procedure oslcecip_regs_delete (in cipid int)
begin

	delete from registry.oslcecip_regs where CIPId=cipid;

end;
go

create or replace procedure automation_disable ()
begin


	-- Disable the automations that should not be 
	-- running when it is a backup ObjectServer 
	for each row tg in catalog.triggers where 
			tg.GroupName = 'primary_only'
	begin
		alter trigger group tg.GroupName set enabled false;
	end;

end;
go

create or replace procedure disableRCA ()
begin






	-- Disable the automations that should not be 
	-- running when it is a backup ObjectServer 
	for each row tg in catalog.triggers where 
			tg.GroupName = 'RCA'
	begin
		alter trigger group tg.GroupName set enabled false;
	end;





end;
go

create or replace procedure sm_log (in summary_string char(255))
begin


    -- WRITE A RECORD TO THE LOG FILE
    write into self_monitoring values (to_char(getdate), ': ', summary_string);


end;
go

create or replace procedure automationSigRtn (in signalName char(64), in signalSerial int, in signalStatus char(16), in signalReturnData1 char(255))
begin









    if (signalStatus = '0' and signalReturnData1<>'') then
        update alerts.status set Customer = signalReturnData1
	where Serial = signalSerial; 
    end if;
    call jinsert(signalSerial, %user.user_id,getdate,'Automation: ' + signalName + '
	returned with status = ' + signalStatus);









end;
go

create or replace procedure insertTrapWithNode (in Serial int, in Agent char(64), in Node char(64), in AlertGroup char(1), in AlertKey char(1), in Summary char(1), in Severity int, in caller char(32))
declare manager char(16);
    type Integer
begin









    set manager = 'insertWildBlueTrap';
    set type = 1;

    call jinsert( Serial, %user.user_id, getdate,caller );

    insert into alerts.status(
        OwnerUID, OwnerGID, Node, NodeAlias, Severity, Identifier, Summary,
        Type, Manager, Agent, AlertGroup, AlertKey, FirstOccurrence, LastOccurrence
    ) values (
        65534, 0, Node, '', Severity,
        %user.host_name+manager+Agent+AlertGroup+AlertKey+to_char(type),
        Summary, type, manager, Agent, AlertGroup, AlertKey, getdate,getdate
    );








end;
go

create or replace trigger webtop_compatibility
group compatibility_triggers
priority 10
comment 'Populates the master.profiles table for the WebGUI to read.\nNote the \n         trigger can be be disabled if no users are permitted to use the interactive SQL tool within the WebGUI'
every 3600 seconds
begin

        -- clean master.profiles
        delete from master.profiles;

        -- Create a row in the master.profiles table for all users
        for each row mpuser in security.users
        begin
                insert into master.profiles ( UID, HasRestriction, Restrict1, Restrict2, Restrict3, Restrict4, AllowISQL )
                        values ( mpuser.UserID, 0, '', '', '', '', 0 );
        end;

        -- Update the users that are allowed to use ISQL
        -- Selects users who are a member of a group which has been assigned a role which has the ISQL permission granted to it.
        for each row isqluser in security.users where isqluser.UserID in ( 
		select UserID from security.group_members where GroupID in ( 
			select GranteeID from security.role_grants where GranteeType = 2 and RoleID in ( 
				select GranteeID from security.permissions where GranteeType = 1 and ObjectType = 1 and ApplicationID = 1 and Object = '' 
                                        and ((Allows & 16777216 ) = 16777216)
                                ) 
                        ) 
                )
        begin
                update master.profiles via isqluser.UserID set AllowISQL = 1;
        end;
end;
go

create or replace trigger qoiOverrideComplete
group ASB1
enabled false
priority 1
comment 'Augmentation of DSSNR journal when QOI Override alert comes in'
after insert on alerts.status for each row
when new.AlertGroup like 'QOI_Override_Status' and new.Type <> 2
declare ak char(64);
cust char(64);
begin

    set ak = upper(new.AlertKey);
    if (new.Summary LIKE 'disabled')
    then
        set cust = ''; 
    else
        set cust = new.Summary;
    end if;

    for each row DSSNR in alerts.status
        where DSSNR.AlertKey = ak
            and DSSNR.AlertGroup = 'CarrierDSSNRThreshold'
        begin
            execute jinsert(DSSNR.Serial,2001,getdate(),new.Summary);
            update alerts.status via DSSNR.Identifier set Customer = cust;
        end;
        write into qoilog values('Called QOI ',ak,' ',cust);
end;
go

create or replace trigger DetectLinkLoad
group ASB1
enabled false
priority 2
comment '\n'
every 122 seconds
evaluate select Identifier, Serial, Node, NodeAlias, Manager, Agent, AlertGroup, AlertKey, Severity, Summary, StateChange, FirstOccurrence, LastOccurrence, InternalLast, Poll, Type, Tally, Class, Grade, Location, OwnerUID, OwnerGID, Acknowledged, Flash, EventId, ExpireTime, ProcessReq, SuppressEscl, Customer, Service, PhysicalSlot, PhysicalPort, PhysicalCard, TaskList, NmosSerial, NmosObjInst, NmosCauseType, LocalNodeAlias, LocalPriObj, LocalSecObj, LocalRootObj, RemoteNodeAlias, RemotePriObj, RemoteSecObj, RemoteRootObj, X733EventType, X733ProbableCause, X733SpecificProb, X733CorrNotif, ServerName, ServerSerial, methodProcedure from alerts.status where Grade = 0 and Severity > 0 and Type = 1 and Agent = 'InfoVista' and Summary like 'Load IN' and AlertGroup like 'WAN Interface'
bind as tt
when true
begin

	-- Condition to be met to execute ascent action
	if %rowcount > 0 then
		-- Execute ascent action
		for each row ttrow in tt
		begin
			-- v3 ascent action name: mailToNetAdmin
			-- 
			update alerts.status via ttrow.Identifier set Grade = 1;
			-- External action
			execute send_email_alert(ttrow.AlertGroup + ':' + ttrow.AlertKey,ttrow.Severity,ttrow.Summary,ttrow.LastOccurrence,'netadmin','sye@wildbluecorp.com WBINT-NetworkEngineering@wildbluecorp.com wliu@wildbluecorp.com WBINT-NMS@wildbluecorp.com');
		end;
	end if;
end;
go

create or replace trigger DetectDupArpEntries
group ASB1
enabled false
priority 1
comment ''
after insert on alerts.status for each row
when new.Agent like 'WildBlue' and new.AlertGroup like 'Duplicate .* Entries in ARP Table'
begin

    execute send_email_alert(new.AlertGroup+':'+new.AlertKey,
        new.Severity,new.Summary,new.LastOccurrence,'DupARPEntries',
        'WBINT-ABUSE@wildbluecorp.com,WBINT-NMS@wildbluecorp.com');
end;
go

create or replace trigger CommLossFlap
group ASB1
enabled false
priority 1
comment ''
every 27 seconds
evaluate select Identifier, Node, Severity, LastOccurrence, Agent  from alerts.status where (Agent like 'ANDW-SMARTMAC-MIB') and (Summary like 'Comm Loss') and Type = 2 and  Poll=0
bind as comloss
begin

      if %rowcount > 0 then 
                  for each row clrow in comloss
     	begin

		update alerts.status set Severity=0 where Agent='ANDW-SMARTMAC-MIB' and Summary like 'Comm Loss' and Type=1 and LastOccurrence=clrow.LastOccurrence and Node=clrow.Node;

		update alerts.status via clrow.Identifier set Poll=1;

	end;
        end if;
   
end;
go

create or replace trigger DetectBladeFailover
group ASB1
enabled false
priority 2
comment 'Finds all blademap failover and failback activities.  The blademap table\nin the bullseye database needs to be rebuilt after any activity like this.\n'
every 31 seconds
evaluate select Identifier, Serial, Node, NodeAlias, Manager, Agent, AlertGroup, AlertKey, Severity, Summary, StateChange, FirstOccurrence, LastOccurrence, InternalLast, Poll, Type, Tally, Class, Grade, Location, OwnerUID, OwnerGID, Acknowledged, Flash, EventId, ExpireTime, ProcessReq, SuppressEscl, Customer, Service, PhysicalSlot, PhysicalPort, PhysicalCard, TaskList, NmosSerial, NmosObjInst, NmosCauseType, LocalNodeAlias, LocalPriObj, LocalSecObj, LocalRootObj, RemoteNodeAlias, RemotePriObj, RemoteSecObj, RemoteRootObj, X733EventType, X733ProbableCause, X733SpecificProb, X733CorrNotif, ServerName, ServerSerial, methodProcedure from alerts.status where ( Agent = 'WildBlue' ) and ( AlertGroup like 'SMTS-sdb.*' or AlertGroup = 'smtsConfigChange'  ) and Grade = 0
bind as tt
when true
begin

	-- Condition to be met to execute ascent action
	if %rowcount > 0 then
		-- Execute ascent action
		for each row ttrow in tt
		begin
			-- v3 ascent action name: RebuildBladeMap
			-- Rebuild the blade map. Set expire time to 10 minutes. 
			update alerts.status via ttrow.Identifier set Grade = 1;
			-- External action
			execute EXT_RebuildBladeMap( 'ems02', 'qad3', 'nmsapp01' );
			break;
		end;
	end if;

end;
go

create or replace trigger DetectCarrierThreshold
group ASB1
enabled false
priority 2
comment '\n'
every 21 seconds
evaluate select Identifier, Serial, Node, NodeAlias, Manager, Agent, AlertGroup, AlertKey, Severity, Summary, StateChange, FirstOccurrence, LastOccurrence, InternalLast, Poll, Type, Tally, Class, Grade, Location, OwnerUID, OwnerGID, Acknowledged, Flash, EventId, ExpireTime, ProcessReq, SuppressEscl, Customer, Service, PhysicalSlot, PhysicalPort, PhysicalCard, TaskList, NmosSerial, NmosObjInst, NmosCauseType, LocalNodeAlias, LocalPriObj, LocalSecObj, LocalRootObj, RemoteNodeAlias, RemotePriObj, RemoteSecObj, RemoteRootObj, X733EventType, X733ProbableCause, X733SpecificProb, X733CorrNotif, ServerName, ServerSerial, methodProcedure from alerts.status where Grade = 0 and Severity > 1 and Type = 1 and Agent = 'WildBlue' and AlertGroup = 'ModemOfflinePercentThresholdExceeded' and Summary like 'Carrier.*'
bind as tt
when true
begin

	-- Condition to be met to execute ascent action
	if %rowcount > 0 then
		-- Execute ascent action
		for each row ttrow in tt
		begin
			-- v3 ascent action name: carrierInvestigation
			-- 
			update alerts.status via ttrow.Identifier set Grade = 1;
			-- External action
			execute EXT_carrierInvestigation(ttrow.Identifier,ttrow.AlertKey,ttrow.LastOccurrence,'WBINT-NetworkEngineering@wildbluecorp.com');
		end;
	end if;
end;
go

create or replace trigger clientClassToCarrier
group ASB1
enabled false
priority 1
comment ''
on signal clientClassToCarrier
begin

    call automationSigRtn('clientClassToCarrier', %signal.Serial+0,
%signal.Status+'', %signal.ReturnData1+'');

end;
go

create or replace trigger ClearModemTraps
group ASB1
enabled false
priority 1
comment 'This is a standard Automation for finding riverdelta events signifying a\nnew flap entry for a device.\n\nThe Action sets the events to  Clear (Severity 0).\n'
every 121 seconds
begin

    update alerts.status set Severity = 0
    where (
        ( Summary like 'New flapList entry .*' )
            or ( Summary like 'Freeing up tid .* with sids still bound' )
            or ( Summary like 'rdnDevCmtsCm.*'  )
        ) and (
            ( Agent = 'riverdelta' or Agent = 'viasat' or Agent = 'rdnRegistration'   ) and ( Severity > 0  )
        )  ;
end;
go

create or replace trigger DetectTelemetryOutage
group ASB1
enabled false
priority 2
comment ''
every 123 seconds
evaluate select Identifier, Serial, Node, NodeAlias, Manager, Agent, AlertGroup, AlertKey, Severity, Summary, StateChange, FirstOccurrence, LastOccurrence, InternalLast, Poll, Type, Tally, Class, Grade, Location, OwnerUID, OwnerGID, Acknowledged, Flash, EventId, ExpireTime, ProcessReq, SuppressEscl, Customer, Service, PhysicalSlot, PhysicalPort, PhysicalCard, TaskList, NmosSerial, NmosObjInst, NmosCauseType, LocalNodeAlias, LocalPriObj, LocalSecObj, LocalRootObj, RemoteNodeAlias, RemotePriObj, RemoteSecObj, RemoteRootObj, X733EventType, X733ProbableCause, X733SpecificProb, X733CorrNotif, ServerName, ServerSerial, methodProcedure from alerts.status where Grade = 0 and Severity > 1 and Type = 1 and Agent = 'WildBlue' and AlertGroup = 'SDM Telemetry'
bind as tt
when true
begin

	-- Condition to be met to execute ascent action
	if %rowcount > 0 then
		-- Execute ascent action
		for each row ttrow in tt
		begin
			-- v3 ascent action name: mailToSatellite
			-- 
			update alerts.status via ttrow.Identifier set Grade = 1;
			-- External action
			execute send_email_alert(ttrow.AlertGroup,ttrow.Severity,ttrow.Summary,ttrow.LastOccurrence,'satNotify','rmartin@wildbluecorp.com,kkashin@wildbluecorp.com,WBINT-NMS@wildbluecorp.com');
		end;
	end if;

end;
go

create or replace trigger qoiCarrierInsert
group ASB1
enabled false
priority 1
comment ''
after insert on alerts.status for each row
when new.AlertGroup='CarrierDSSNRThreshold' and new.Type=1
begin

    execute EXT_QOICarrier('netcool','enable',lower(new.AlertKey));
    execute jinsert(new.Serial,2001,getdate,'QOI Override for beam: ' + new.AlertKey + ' override requested.');
end;
go

create or replace trigger getLinkName
group ASB1
enabled false
priority 1
comment ''
on signal getLinkName
begin
        call automationSigRtn('getLinkName', %signal.Serial+0, %signal.Status+'', %signal.ReturnData1+'');

end;
go

create or replace trigger summaryEnrich
group ASB1
enabled false
priority 1
comment ''
before update on alerts.status for each row
declare jrnl char(255);
begin

if (new.wbView <> old.wbView) then
   set jrnl='Summary enriched with wbView: '  + '<' + new.wbView + '>';
   call jinsert( new.Serial+0, %user.user_id+0, getdate, jrnl );
   set new.Summary = old.Summary + ' <' + new.wbView + '>';
   set new.Flash=2;
end if;

end;
go

create or replace trigger DetectBeam28PowerImbalance
group ASB1
enabled false
priority 2
comment ''
every 301 seconds
evaluate select Identifier, Serial, Node, NodeAlias, Manager, Agent, AlertGroup, AlertKey, Severity, Summary, StateChange, FirstOccurrence, LastOccurrence, InternalLast, Poll, Type, Tally, Class, Grade, Location, OwnerUID, OwnerGID, Acknowledged, Flash, EventId, ExpireTime, ProcessReq, SuppressEscl, Customer, Service, PhysicalSlot, PhysicalPort, PhysicalCard, TaskList, NmosSerial, NmosObjInst, NmosCauseType, LocalNodeAlias, LocalPriObj, LocalSecObj, LocalRootObj, RemoteNodeAlias, RemotePriObj, RemoteSecObj, RemoteRootObj, X733EventType, X733ProbableCause, X733SpecificProb, X733CorrNotif, ServerName, ServerSerial, methodProcedure from alerts.status where Grade = 0 and Severity > 0 and Agent like 'InfoVista' and Summary like 'Power Balance'
bind as tt
when true
begin
	-- Condition to be met to execute ascent action
	if %rowcount > 0 then
		-- Execute ascent action
		for each row ttrow in tt
		begin
			-- v3 ascent action name: Beam28PowerImbalanceNotification
			-- 
			update alerts.status via ttrow.Identifier set Acknowledged = 1;
			-- External action
			execute send_email_alert(ttrow.AlertGroup,ttrow.Severity,ttrow.Summary,ttrow.LastOccurrence,'powerImbalence','WBINT-NMS@wildbluecorp.com,rmartin@wildbluecorp.com,kkashin@wildbluecorp.com');
		end;
	end if;

end;
go

create or replace trigger clientClassToCarrierdb
group ASB1
enabled false
priority 1
comment ''
after insert on alerts.status for each row
when new.AlertGroup='ModemOfflinePercentThresholdExceeded'
begin

    call jinsert(new.Serial,%user.user_id,getdate,'requested clientClassToCarrierdb:'+new.AlertKey);
    execute automationExt(
	new.Serial,
	0,
	'/usr/local/nms/bin/clientClassToCarrier.pl',
	'-l /usr/local/nms/log/clientClassToCarrier.pl.log',
	new.AlertKey,
                        '','','','');
end;
go

create or replace trigger qoiCarrierClear
group ASB1
enabled false
priority 1
comment ''
before update on alerts.status for each row
when old.AlertGroup='CarrierDSSNRThreshold' and new.Severity=0 and old.Poll=0 and old.Type=1
begin

    execute EXT_QOICarrier('netcool','disable',lower(new.AlertKey));
    execute jinsert(new.Serial,2001,getdate,'QOI Override for beam: ' + new.AlertKey + '  clear requested.');
    update alerts.status via old.Identifier set Poll=1;

end;
go

create or replace trigger CarrierPowerSingleAmplifier
group ASB1
enabled false
priority 1
comment 'This escalates problems discovered upon receiving\na carrierPower Amplifer alert.'
every 241 seconds
evaluate select Identifier, Serial, Node, NodeAlias, Manager, Agent, AlertGroup, AlertKey, Severity, Summary, StateChange, FirstOccurrence, LastOccurrence, InternalLast, Poll, Type, Tally, Class, Grade, Location, OwnerUID, OwnerGID, Acknowledged, Flash, EventId, ExpireTime, ProcessReq, SuppressEscl, Customer, Service, PhysicalSlot, PhysicalPort, PhysicalCard, TaskList, NmosSerial, NmosObjInst, NmosCauseType, LocalNodeAlias, LocalPriObj, LocalSecObj, LocalRootObj, RemoteNodeAlias, RemotePriObj, RemoteSecObj, RemoteRootObj, X733EventType, X733ProbableCause, X733SpecificProb, X733CorrNotif, ServerName, ServerSerial, methodProcedure from alerts.status where Grade = 0 and Severity > 0 and Agent like 'WildBlue' and Summary like 'CarrierPower .* 10m' and Type = 1
bind as tt
when true
begin

	-- Condition to be met to execute ascent action
	if %rowcount > 0 then
		-- Execute ascent action
		for each row ttrow in tt
		begin
			-- v3 ascent action name: mailToCarrierPowerAmplifier
			-- 
			update alerts.status via ttrow.Identifier set Grade = 1;
			-- External action
			execute send_email_alert(ttrow.AlertGroup,ttrow.Severity,ttrow.Summary,ttrow.LastOccurrence,'carrierAmplifier','rmartin@wildbluecorp.com,kkashin@wildbluecorp.com,bconnors@wildbluecorp.com');	
		end;
	end if;

end;
go

create or replace trigger DetectCacheTraps
group ASB1
enabled false
priority 2
comment ''
every 121 seconds
evaluate select Identifier, Serial, Node, NodeAlias, Manager, Agent, AlertGroup, AlertKey, Severity, Summary, StateChange, FirstOccurrence, LastOccurrence, InternalLast, Poll, Type, Tally, Class, Grade, Location, OwnerUID, OwnerGID, Acknowledged, Flash, EventId, ExpireTime, ProcessReq, SuppressEscl, Customer, Service, PhysicalSlot, PhysicalPort, PhysicalCard, TaskList, NmosSerial, NmosObjInst, NmosCauseType, LocalNodeAlias, LocalPriObj, LocalSecObj, LocalRootObj, RemoteNodeAlias, RemotePriObj, RemoteSecObj, RemoteRootObj, X733EventType, X733ProbableCause, X733SpecificProb, X733CorrNotif, ServerName, ServerSerial, methodProcedure from alerts.status where Grade = 0 and Severity > 0 and Type = 1 and NodeAlias like '.*-cach.*'
bind as tt
when true
begin

	-- Condition to be met to execute ascent action
	if %rowcount > 0 then
		-- Execute ascent action
		for each row ttrow in tt
		begin
			-- v3 ascent action name: mailToCache
			-- 
			update alerts.status via ttrow.Identifier set Grade = 1;
			-- External action
			execute send_email_alert(ttrow.AlertGroup,ttrow.Severity,ttrow.Summary,ttrow.LastOccurrence,'cacheWarnings','rfranklin@wildbluecorp.com,mhillier@wildbluecorp.com');
		end;
	end if;

end;
go

create or replace trigger DetectAndrewTrap
group ASB1
enabled false
priority 2
comment ''
every 61 seconds
evaluate select Identifier, Serial, Node, NodeAlias, Manager, Agent, AlertGroup, AlertKey, Severity, Summary, StateChange, FirstOccurrence, LastOccurrence, InternalLast, Poll, Type, Tally, Class, Grade, Location, OwnerUID, OwnerGID, Acknowledged, Flash, EventId, ExpireTime, ProcessReq, SuppressEscl, Customer, Service, PhysicalSlot, PhysicalPort, PhysicalCard, TaskList, NmosSerial, NmosObjInst, NmosCauseType, LocalNodeAlias, LocalPriObj, LocalSecObj, LocalRootObj, RemoteNodeAlias, RemotePriObj, RemoteSecObj, RemoteRootObj, X733EventType, X733ProbableCause, X733SpecificProb, X733CorrNotif, ServerName, ServerSerial, methodProcedure from alerts.status where Agent = 'mcsys' and Grade = 0 and Type = 1 and Severity > 1
bind as tt
when true
begin
	-- Condition to be met to execute ascent action
	if %rowcount > 0 then
		-- Execute ascent action
		for each row ttrow in tt
		begin
			-- v3 ascent action name: mailToRFGroup
			-- 
			update alerts.status via ttrow.Identifier set Grade = 1;
			-- External action
			execute send_email_alert(ttrow.AlertGroup,ttrow.Severity,ttrow.Summary,ttrow.LastOccurrence,'rfWarnings','rmartin@wildbluecorp.com,jducey@wildbluecorp.com,bbeauchamp@wildbluecorp.com');
		end;
	end if;

end;
go

create or replace trigger system_watch_shutdown
group system_watch
priority 1
comment 'Create an alert indicating that the ObjectServer is being shutdown'
on signal shutdown
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Type, Severity, FirstOccurrence, LastOccurrence, AlertGroup, OwnerUID) values ('Shutdown@'+%signal.node, 'ObjectServer '+%signal.server+' on '+%signal.node+' shutdown at '+to_char(%signal.at), %signal.node, 'SystemWatch', 1, 5, %signal.at, %signal.at, 'nco_objserv', 65534);
end;
go

create or replace trigger system_watch_startup
group system_watch
priority 1
comment 'Create an alert indicating that the ObjectServer has started'
on signal startup
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Type, Severity, FirstOccurrence, LastOccurrence, AlertGroup, OwnerUID) values ('Startup@'+%signal.node, 'ObjectServer '+%signal.server+' on '+%signal.node+' started at '+to_char(%signal.at), %signal.node, 'SystemWatch', 2, 5, %signal.at, %signal.at, 'nco_objserv', 65534);
end;
go

create or replace trigger originalSeverity
group WBAuto
priority 1
comment ''
before insert on alerts.status for each row
begin
set new.wbOriginalSeverity = new.Severity
end;
go

create or replace trigger confirmationTrapClearing
group WBAuto
priority 1
comment 'Clear \'Awaiting Confirmation\' trap if:\nNodeAlias+AlertGroup of the confirmation trap = AlertKey of the AwaitingConfirmation trap'
after insert on alerts.status for each row
when new.Agent = 'WildBlue'
and new.AlertGroup like '^(smtsClearIpForwardingTable|Restart Conexon)$'
and new.Type = 2
begin
    call jinsert( new.Serial+0, %user.user_id+0, getdate, 'confirmationTrapClearing' );
    for each row confirm in alerts.status
        where confirm.Agent = 'WildBlue' and confirm.Type = 1
        and confirm.AlertGroup = 'Confirmation'
        and confirm.AlertKey =new.AlertGroup+':'+new.AlertKey
        and confirm.LastOccurrence <= new.LastOccurrence

        begin
            update alerts.status via confirm.Identifier set Severity = 0;
            call jinsert( confirm.Serial+0, %user.user_id+0, getdate, 'Cleared by:'+new.Summary );
        end

end;
go

create or replace trigger insertMetaOutstandingDNSRequests
group WBMeta
enabled false
priority 2
comment 'Inserts an alert as a secondary persistent alert that will outlive an original outstandingDNSRequests alert.  Deduplicationis used to keep the alert alive for a set amount of time after the original self-clears.  ExpireTime is set by alert post processing (e.g. synmpat).'
every 150 seconds
begin
for each row dns in alerts.status where
        dns.Agent = 'TNPM'
        and dns.AlertGroup = 'AP~Surfbeam2~ICT~outstandingDnsRequests'
        and dns.Type = 1
    begin
    call insertTrapWithNode(
	dns.Serial+0, 'wbMeta', dns.Node,
	'Persistent~'+dns.AlertGroup+'', dns.AlertKey+'',
        	'Persistent '+dns.Summary+'', dns.Severity+0,
	 'metaOutstandingDNSRequests' )
    end;
end;
go

create or replace trigger metaPepMemWarning
group WBMeta
enabled false
priority 4
comment 'Create a meta trap whenever a pep mem warning trap comes in\n'
after insert on alerts.status for each row
when ( new.Agent = 'Pigeon' )
and ( new.AlertGroup like 'Analyze Pep Mem Stats Warning' )
and ( new.Type = 1 )
begin

    call insertTrap( new.Serial+0, 'wbMeta', new.AlertGroup+'', new.AlertKey+'',
        new.Summary+'', new.Severity+1, 'metaPepMemWarning' )

end;
go

create or replace trigger detectDhcpServerFailure
group WBMeta
enabled false
priority 1
comment 'Evaluate the operational status of primary/secondary pairs of DHCP servers ..dmillis'
every 60 seconds
evaluate select Node, NodeAlias, Poll, AlertGroup, AlertKey, Summary from alerts.status where 
((AlertGroup = 'Server.dhcp - 01 Active Status') and (AlertKey like 'dhcp01'))
bind as primaryDhcp
declare junk char(64);
primaryFqdn char(64);
primaryStatus char (16);
secondaryStatus char (16);
expire int;
identifier char (64);
begin

-- This trigger will evaluate the operational status of a pair of primary/secondary
-- DHCP servers, named 'dhcp01.FQDN' and 'dhcp02.FQDN'.  Each one will be
-- status = Active or Standby;
-- Thus, there are four possiblities:
-- primary is active, secondary is active: (bad) generate problem event
-- primary is active, secondary is standby: (normal) generate resolution event
-- primary is standby, secondary is active: (warning) generate problem event
-- primary is standby, secondary is standby: (bad) generate problem event
  -- write into logfile values (to_char(getdate()), ' ### detectDhcpServerFailure is firing');

  for each row pri in primaryDhcp 
  begin
    -- Extract the fully qualified domain name of the primary DHCP server
    -- from AlertKey.  Format expected:
    -- 'Instance: dhcp01.blah.blah.blah.com'
    set primaryFqdn = substr(pri.AlertKey, 18, 50);
    -- write into logfile values ('  primaryFqdn is ', primaryFqdn);

    -- Extract the status of dhcp01 from Summary.  Format expected:
    -- '300:DHCP Active Status: <status> ( Instance: dhcp01.blah )'
    -- where <status> is 'Active' or 'Standby'
    -- Grabbing only the first three characters, so primaryStatus
    -- will be either 'Act' or 'Sta'
    -- write into logfile values ('Primary Summary is ', pri.Summary);
    set primaryStatus = substr(pri.Summary, 24, 3);
    -- write into logfile values ('  primaryStatus is ', primaryStatus);
    -- write into logfile values ('Poll is ', pri.Poll);

    if (pri.Poll = 0)
    then
      -- use a default expireTime if Poll not set
      set expire = 300;
    else
      -- set expireTime based on Poll interval
      set expire = 3 * pri.Poll;
    end if;
    -- write into logfile values ('  expire is ', expire);

    -- reset secondaryStatus before 'for each row' loop starts
    set secondaryStatus = 'unknown';


    -- Find all events from dhcp02 (secondary server) for this FQDN
    for each row sec in alerts.status
    where sec.AlertGroup = 'Server.dhcp - 01 Active Status' and
          sec.AlertKey like ('dhcp02.'+primaryFqdn)
    begin
      -- write into logfile values ('Secondary Summary is ', sec.Summary);
      set secondaryStatus = substr(sec.Summary, 24, 3);
      -- write into logfile values ('  secondaryStatus is ', secondaryStatus);
      -- There should be only one dhcp02 for each FQDN; therefore break
      break;
    end;

    -- Process the results, comparing primaryStatus and secondaryStatus
    -- Insert a meta event for each of the four scenarios

    case
      -- Problem scenario: Active - Active
      when (primaryStatus = 'Act' and secondaryStatus = 'Act')
      then
        -- write into logfile values ('found scenario Active-Active');
        set identifier = primaryFqdn+'DHCP Primary Secondary Ops Problem';
        insert into alerts.status
          (Identifier, Summary, Severity, Type, ExpireTime, Node, AlertKey, AlertGroup, FirstOccurrence, LastOccurrence, OwnerUID, OwnerGID, Manager, Agent)
        values
          (identifier, 'DHCP Server Status for '+primaryFqdn+': problem: Primary is Active, Secondary is Active', 3, 1, expire, get_prop_value('Name'), primaryFqdn, 'DHCP Primary-Secondary Server Status', getdate(), getdate(), %user.user_id, 170, 'insertWildBlueMetaEvent', 'detectDhcpServerFailure');
        -- since deduplication will not update the Severity, do an immediate update
        update alerts.status via identifier set Severity = 3;

      -- Problem scenario: Standby - Active
      when (primaryStatus = 'Sta' and secondaryStatus = 'Act')
      then
        -- write into logfile values ('found scenario Standby-Active');
        set identifier = primaryFqdn+'DHCP Primary Secondary Ops Problem';
        insert into alerts.status
          (Identifier, Summary, Severity, Type, ExpireTime, Node, AlertKey, AlertGroup, FirstOccurrence, LastOccurrence, OwnerUID, OwnerGID, Manager, Agent)
        values
          (identifier,  'DHCP Server Status for '+primaryFqdn+': problem: Primary is Standby, Secondary is Active', 2, 1, expire, get_prop_value('Name'), primaryFqdn, 'DHCP Primary-Secondary Server Status', getdate(), getdate(), %user.user_id, 170, 'insertWildBlueMetaEvent', 'detectDhcpServerFailure');

        -- since deduplication will not update the Severity, do an immediate update
        update alerts.status via identifier set Severity = 2;


      -- Problem scenario: Standby - Standby
      when (primaryStatus = 'Sta' and secondaryStatus = 'Sta')
      then
        -- write into logfile values ('found scenario Standby-Standby');
        set identifier = primaryFqdn+'DHCP Primary Secondary Ops Problem';
        insert into alerts.status
          (Identifier, Summary, Severity, Type, ExpireTime, Node, AlertKey, AlertGroup, FirstOccurrence, LastOccurrence, OwnerUID, OwnerGID, Manager, Agent)
        values
          (identifier, 'DHCP Server Status for '+primaryFqdn+': problem: Primary is Standby, Secondary is Standby', 5, 1, expire, get_prop_value('Name'), primaryFqdn, 'DHCP Primary-Secondary Server Status', getdate(), getdate(), %user.user_id, 170, 'insertWildBlueMetaEvent', 'detectDhcpServerFailure');
        -- since deduplication will not update the Severity, do an immediate update
        update alerts.status via identifier set Severity = 5;


      -- Resolution scenario: Active - Standby
      when (primaryStatus = 'Act' and secondaryStatus = 'Sta')
      then
        -- write into logfile values ('found scenario Active-Standby');

        -- Update journal for any outstanding prob events that this
        -- resolution event will clear
        for each row problem in alerts.status
        where problem.AlertGroup = 'DHCP Primary-Secondary Server Status' and
          problem.AlertKey = primaryFqdn and
          problem.Severity > 0
        begin
          call jinsert( problem.Serial+0, %user.user_id+0, getdate(), 'Cleared by: DHCP Server Status for '+primaryFqdn+': normal: Primary is Active, Secondary is Standby' );
        end;

        insert into alerts.status
          (Identifier, Summary, Severity, Type, ExpireTime, Node, AlertKey, AlertGroup, FirstOccurrence, LastOccurrence, OwnerUID, OwnerGID, Manager, Agent)
        values
          (primaryFqdn+'DHCP Primary Secondary Ops Normal', 'DHCP Server Status for '+primaryFqdn+': normal: Primary is Active, Secondary is Standby', 1, 2, expire, get_prop_value('Name'), primaryFqdn, 'DHCP Primary-Secondary Server Status', getdate(), getdate(), %user.user_id, 170, 'insertWildBlueMetaEvent', 'detectDhcpServerFailure');
    end case;
  -- end of primary loop
  end;

end;
go

create or replace trigger resync_old_events
group failback_triggers
priority 1
comment 'This trigger processes the contents of the table alerts.resync_complete.  For each entry found, this trigger\nwill initiate a flush of all events over the next IDUC cycle.  This is to ensure synchronicity across all ObjectServers\nin particular between the Aggregation ObjectServers.'
every 15 seconds
begin

	-- PERFORM FULL IDUC FLUSH IF ENTRIES DETECTED
	for each row gate_resynched in alerts.resync_complete
	begin

		-- TOUCH ALL EVENTS IN THE OBJECTSERVER TO ENSURE ANY
		-- ROWS THAT ARE NOT IN THE COUNTERPART OBJECTSERVER
		-- GET SENT OVER TO IT INCLUDING JOURNALS AND DETAILS

		update alerts.status set StateChange = getdate();
		update alerts.journal set Serial = Serial;
		update alerts.details set AttrVal = AttrVal;

	end;

	-- CLEAN OUT THE alerts.resync_complete TABLE
	delete from alerts.resync_complete;
end;
go

create or replace trigger detect_agg_gate_resync_complete
group failback_triggers
priority 1
comment 'This trigger detects the moment the faiover Gateway AGG_GATE completes its resychronisation step.\nIt then inserts a row in the table alerts.resync_complete.  The contents of this table is processed by the\ntemporal trigger resync_old_events which updates all events causing them to be flushed to the counterpart\nObjectServer to ensure synchronicity.'
on signal gw_resync_finish
begin

	-- INSERT THE GATEWAY RESYNC COMPLETION FLAG WHEN THE FAILOVER
	-- GATEWAY COMPLETES A RESYNCHRONISATION
	if (%user.description = 'failover_gate') then

		insert into alerts.resync_complete (
			GatewayName)
		values (
			'AGG_GATE');
	end if;
end;
go

create or replace trigger disconnect_all_clients
group failback_triggers
priority 2
comment 'Once bidirectional Gateway resynchronisation has completed, disconnect all clients\nexcept for the bidirectional Gateway, Administrator and Web GUI clients.\nThis will cause all connected clients to fail back to the primary ObjectServer AGG_P.\nThis trigger should only be enabled on the backup ObjectServer AGG_B.'
on signal gw_resync_finish
begin

	-- CHECK IF gw_resync_finish IS FROM failover_gate
	if (%user.description = 'failover_gate') then

		ALTER SYSTEM SET 'ActingPrimary' = FALSE;

		-- DISCONNECT ALL CLIENTS EXCEPT FOR THE FAILOVER
		-- GATEWAY OR ADMINISTRATOR SESSIONS
		for each row this_connection in catalog.connections where
			this_connection.AppName <> 'Administrator' and
			this_connection.AppName <> 'WEBTOP' and
			this_connection.AppDescription <> 'failover_gate'
		begin

			alter system drop connection this_connection.ConnectionID;
		end;
	end if;
end;
go

create or replace trigger RCamHlth
group WBTrigger
enabled false
priority 1
comment ''
every 10 seconds
evaluate select Identifier, ServerSerial, ServerName, Severity, Summary, Acknowledged,methodProcedure from alerts.status 
 where ((AlertGroup = 'setTouchPoint') and (AlertKey = 'Failsafe') )
bind as failsafe
declare identifier char(255);
begin

   if %rowcount = 0 

   then

      set identifier = '10.65.10.68FailsafesetTouchPointMTTrapd:nmscol01:162';
      insert into alerts.status (Identifier, Node, NodeAlias, Manager, Severity, AlertGroup,AlertKey,Summary,methodProcedure,Type, FirstOccurrence,LastOccurrence) 
      values (identifier, '10.65.10.68','nmsweb02.prod.wdc1.wildblue.net','MTTrapd', 5, 'setTouchPoint','Failsafe', 'setTouchPoint Failsafe alert processing failure','PROD-MP-0024',1,getdate,getdate);

-- node,severity,subject,email,email_summary_text,hostname
     execute send_nco_nms_email('10.65.10.68',5,'setTouchPoint Failsafe alert processing failure','wbnoc@viasat.com, wbint-nms@viasat.com, scott.allen@viasat.com, shelly.sousa@viasat.com,brian.whittington@viasat.com, jose.martino@viasat.com,rich.williams@viasat.com,david.mckinnon@viasat.com','setTouchPoint Failsafe alert processing failure','localhost');
  
elseif %rowcount > 1 

   then

   for each row ack in failsafe

   begin

      if (ack.Acknowledged = 1 and ack.methodProcedure != '')

      then

      update alerts.status
      via ack.Identifier
      set methodProcedure = '';
-- node,severity,subject,email,email_summary_text,hostname
      execute send_nco_nms_email('10.65.10.68',0,'setTouchPoint Failsafe alert processing restored','wbnoc@viasat.com, wbint-nms@viasat.com, scott.allen@viasat.com, shelly.sousa@viasat.com,brian.whittington@viasat.com, jose.martino@viasat.com,rich.williams@viasat.com,david.mckinnon@viasat.com','setTouchPoint Failsafe alert processing restored','localhost');

      end if;

   end

end if;

end;
go

create or replace trigger wb_reset_event_filter_time
group WBTrigger
priority 1
comment ''
every 34 seconds
begin

update alerts.status set wbTime = 0, wbEventFilter = 0 where wbTime <= getdate() and wbEventFilter > 0;

end;
go

create or replace trigger MailOnAmazonCloud
group WBTrigger
enabled false
priority 2
comment 'Mail to developers on FLUME alerts'
after insert on alerts.status for each row
when new.NodeAlias like 'live.wildblue.net' or
     new.NodeAlias like 'mgt-flumeagt' and
     new.Type >= 0
begin

    call email_sender(
	 'Node:'+new.NodeAlias,
	 new.Severity+0,
	 'mailOnAmazonCloud, Flume Process/Mgmt',
                  'kenneth.jenkins@viasat.com,stephan.kemper@viasat.com,rohit.rangnekar@viasat.com',
	 'Summary:'+new.Summary
	 );

    call jinsert(
        new.Serial+0,
        %user.user_id+0,
        getdate,
        'mailOnAmazonCloud Process/Mgmt'
        );

end;
go

create or replace trigger delete_clears_WB
group WBTrigger
enabled false
priority 1
comment 'Delete clear alerts over 2 minutes old in ALERTS.STATUS every 60 seconds\nAlerts that have been touchpointed with an M&P that looks like \'NOC-*\' must also:\n1. Be acknowledged\nor\n2. Be suppressed\n'
every 15 seconds
begin
    delete from alerts.status where
        Severity = 0 and StateChange < (getdate() - 120)
        and (
           ( methodProcedure not like '[0-9]+' and methodProcedure not like 'PENDING' )
            or
           ( Acknowledged > 0 or SuppressEscl > getdate or rcaProbableCause > 0 )
        )
end;
go

create or replace trigger delete_old_events
group WBTrigger
enabled false
priority 1
comment 'Delete clear alerts over 2 minutes old in ALERTS.STATUS every 60 seconds\nAlerts that have been touchpointed with an M&P that looks like \'NOC-*\' must also:\n1. Be acknowledged\nor\n2. Be suppressed\n'
every 15 seconds
begin
    delete from alerts.status where
        StateChange < (getdate() - 259200)
        and (
           ( methodProcedure not like '[0-9]+' and methodProcedure not like 'PENDING' )
            or
            ( Acknowledged > 0 or SuppressEscl > getdate or rcaProbableCause > 0 )
        )

end;
go

create or replace trigger MailOnAccelOutstandingDNSReqs
group WBTrigger
priority 2
comment 'Mail to developers on accelenet outstanding dns request thread alerts'
after insert on alerts.status for each row
when new.AlertGroup = 'AP~Surfbeam2~ICT~outstandingDnsRequests'
begin
call send_email_alert(
      new.NodeAlias,
      new.Severity+0,
      new.Summary+'',
      new.LastOccurrence+0,
      'outstandingDNSReqs',
'wbint-OpsSupportSystems@viasat.com,andy.ellis@viasat.com,david.lerner@viasat.com,andrew.tirella@viasat.com'
);
call jinsert(
      new.Serial+0,
      %user.user_id+0,
      getdate,
      'wdc1Visibility triggered'
);
end;
go

create or replace trigger nms_probe_hlth
group WBTrigger
enabled false
priority 1
comment ''
every 20 seconds
evaluate select Identifier, wbProbe, Severity, Summary, LastOccurrence,methodProcedure,Acknowledged,wbTicketID from alerts.status
  where (AlertGroup = 'Probe Heartbeat')
bind as hbRows
declare summary_text char(255);
begin

   for each row hb in hbRows

   begin

--primary probe failure
  if (hb.wbProbe like 'nmsc' or hb.wbProbe like 'fms') and (hb.Severity = 0) and hb.methodProcedure='' and (hb.LastOccurrence < (getdate() - 240))
      then
      set summary_text = 'NMS Probe Health Check. Possible probe processing failure. Probe: ' + hb.wbProbe;
      update alerts.status
      via hb.Identifier
      set Summary = summary_text, Severity = 5,methodProcedure='PROD-MP-0024';

--node,severity,subject,email,email_summary_text,hostname
      execute send_nco_nms_email(hb.wbProbe,5,summary_text,'wbnoc@viasat.com, wbint-nms@viasat.com,scott.allen@viasat.com, shelly.sousa@viasat.com,brian.whittington@viasat.com, jose.martino@viasat.com,rich.williams@viasat.com,VBB-NMS-Network-Monitoring@viasat.com',summary_text,'localhost');

-- primary probe restore
    elseif (hb.wbProbe like 'nmsc' or hb.wbProbe like 'fms') and (hb.Severity = 0) and (hb.methodProcedure = 'PROD-MP-0024') and (hb.LastOccurrence > (getdate() - 60))
      then
      set summary_text = 'NMS Probe Health Check. Probe processing restored. Clearing M&P and Ack. Probe: ' + hb.wbProbe;
      update alerts.status
      via hb.Identifier
      set Summary = summary_text, methodProcedure='',Acknowledged = 0,wbTicketID='';

-- node,severity,subject,email,email_summary_text,hostname
     execute send_nco_nms_email(hb.wbProbe,0,summary_text,'wbnoc@viasat.com, wbint-nms@viasat.com, scott.allen@viasat.com, shelly.sousa@viasat.com,brian.whittington@viasat.com, jose.martino@viasat.com,rich.williams@viasat.com,VBB-NMS-Network-Monitoring@viasat.com',summary_text,'localhost');

-- up on secondary probe
    elseif (hb.wbProbe like 'pms') and  (hb.Severity = 0) and (hb.LastOccurrence > (getdate() - 240))
      then
      set summary_text = 'NMS Probe Health Check. Secondary probe enabled. Probe: ' + hb.wbProbe;
      update alerts.status
      via hb.Identifier
      set methodProcedure='IGNORE';
      execute send_nco_nms_email(hb.wbProbe,0,summary_text,'VBB-NMS-Network-Monitoring@viasat.com',summary_text,'localhost');

-- secondary probe restored
   elseif (hb.wbProbe like 'pms') and  (hb.Severity = 0) and (hb.LastOccurrence < (getdate() - 60))
      then
      set summary_text = 'NMS Probe Health Check. Primary probe restored. Probe: ' + hb.wbProbe;
      update alerts.status
      via hb.Identifier
      set Summary = summary_text, Severity = 0,methodProcedure='',Acknowledged = 0,wbTicketID='';
      execute send_nco_nms_email(hb.wbProbe,0,summary_text,'VBB-NMS-Network-Monitoring@viasat.com',summary_text,'localhost');
   end if;

   end

end;
go

create or replace trigger resetOwnerGID
group WBTrigger
priority 1
comment 'Checks every minute for all alerts with a OwnerGID set as OwnerGID=1 (System) and change to OwnerGID=0 (Public)\r\nJM - 4_28_2015'
every 60 seconds
begin
	update alerts.status set OwnerGID=0 where OwnerGID=1;
end;
go

create or replace trigger deduplicate_journal
group WBTrigger
priority 1
comment 'Deduplication processing for ALERTS.STATUS'
before reinsert on alerts.journal for each row
begin

	if (old.Text1 = '')
	then
		set old.Text1 = new.Text1;
	elseif (old.Text2 = '')
	then
		set old.Text2 = new.Text1;
	elseif (old.Text3 = '')
	then
		set old.Text3 = new.Text1;
	elseif (old.Text4 = '')
	then
		set old.Text4 = new.Text1;
	elseif (old.Text5 = '')
	then
		set old.Text5 = new.Text1;
	elseif (old.Text6 = '')
	then
		set old.Text6 = new.Text1;
	elseif (old.Text7 = '')
	then
		set old.Text7 = new.Text1;
	elseif (old.Text8 = '')
	then
		set old.Text8 = new.Text1;
	elseif (old.Text9 = '')
	then
		set old.Text9 = new.Text1;
	elseif (old.Text10 = '')
	then
		set old.Text10 = new.Text1;
	elseif (old.Text11 = '')
	then
		set old.Text11 = new.Text1;
	elseif (old.Text12 = '')
	then
		set old.Text12 = new.Text1;
	elseif (old.Text13 = '')
	then
		set old.Text13 = new.Text1;
	elseif (old.Text14 = '')
	then
		set old.Text14 = new.Text1;
	else
		set old.Text15 = 'ERROR: Out of Text Fields';
	end if;



end;
go

create or replace trigger DetectSmtsBladeReset
group WBTrigger
enabled false
priority 1
comment 'This trigger will check every 15 seconds for alerts with Agent=VIASAT-SURFBEAM-2-SMTS-NOTIFICATIONS-MIB and Summary=evtEvtStateMgmtOpStateToDisabledNotification. It will check to see if the alert has cleared (Severity = 0) and if it is younger than 1 minute "(getdate - LastOccurrence) < 60". If the alert matches both criteria then a "evtEvtStateMgmtSmtsBladeReset" alert will be raised and a trap sent. '
every 15 seconds
evaluate select Identifier, Serial, Node, NodeAlias, Manager, Agent, AlertGroup, AlertKey, Severity, Summary, StateChange, FirstOccurrence, LastOccurrence, InternalLast, Poll, Type, Tally, Class, Grade, Location, OwnerUID, OwnerGID, Acknowledged, Flash, EventId, ExpireTime, ProcessReq, SuppressEscl, Customer, Service, PhysicalSlot, PhysicalPort, PhysicalCard, TaskList, NmosSerial, NmosObjInst, NmosCauseType, LocalNodeAlias, LocalPriObj, LocalSecObj, LocalRootObj, RemoteNodeAlias, RemotePriObj, RemoteSecObj, RemoteRootObj, X733EventType, X733ProbableCause, X733SpecificProb, X733CorrNotif, ServerName, ServerSerial, methodProcedure from alerts.status where Agent like 'VIASAT-SURFBEAM-2-SMTS-NOTIFICATIONS-MIB' and Summary like 'evtEvtStateMgmtOpStateToDisabledNotification' and Severity = 0 and (getdate - FirstOccurrence) < 60
bind as br
declare CAlertGroup	CHAR(64);
	CSummary	CHAR(256);
	CIdentifier	CHAR(256);
begin
	-- Condition in "Evaluate" to be met to execute action
	if %rowcount > 0 then
		-- Execute action
		for each row brrow in br
		begin
		-- Set Variables
		set CAlertGroup = 'evtEVTStateMgmtSmtsBladeReset'; 
		set CSummary = CAlertGroup + ': ' + brrow.AlertKey;
		set CIdentifier = brrow.Identifier + CAlertGroup;
		-- Execute insert action
			insert into alerts.status (Identifier, AlertGroup, AlertKey, Severity, Summary, FirstOccurrence, LastOccurrence, Node, NodeAlias ) values (CIdentifier, CAlertGroup, brrow.AlertKey, 4, CSummary, getdate, getdate, brrow.Node, brrow.NodeAlias);
		end;
	end if;
end;
go

create or replace trigger sm_top_probes_insert
group self_monitoring_group
priority 10
comment 'Populates the top Probes table on insert.'
before insert on alerts.status for each row
when %user.app_name = 'PROBE'
begin

	-- INCREMENT THE TALLY FOR THE INCOMING EVENT PROBE
	insert into master.sm_top_probes ( Identifier, Probe, Hostname, ConnectionID, Tally)
        values ( getservername() + ':' +
			%user.description + ':' +
			%user.host_name + ':' +
			to_char(%user.connection_id),
		%user.description, %user.host_name, %user.connection_id, 1);
end;
go

create or replace trigger sm_process_top_probes
group self_monitoring_group
priority 10
comment 'Creates synthetic events for top Probes.'
every 300 seconds
declare sev int;
	sev3 int;
	sev4 int;
	sev5 int;
	enableinfo int;
	deduplicateinfo int;
	identifierappendix char(255);
begin

	-- INITIALISE VARIABLE
	set sev = 0;
	set identifierappendix = '';

	-- GET THRESHOLD VALUES FROM master.sm_thresholds
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_top_probes'
	begin

		set sev3 = thresholds.Sev3;
		set sev4 = thresholds.Sev4;
		set sev5 = thresholds.Sev5;
		set enableinfo = thresholds.EnableInfo;
		set deduplicateinfo = thresholds.DeduplicateInfo;
	end;

	-- PREPEND TIMESTAMP TO Identifier IF NO DEDUPLICATION
	if (deduplicateinfo = 0) then

		set identifierappendix = to_char(getdate());
	end if;

	-- PROCESS CONTENTS OF sm_top_probes TABLE
	for each row this_row in master.sm_top_probes
	begin

		-- INSERT A SYNTHETIC EVENT IF ENABLED
		if (enableinfo = 1) then

			-- INSERT THE EVENT COUNT EVENT
			call procedure sm_insert(
				'OMNIbus ObjectServer : top Probe event rate for ' +
				this_row.Identifier + ':' + identifierappendix,
				get_prop_value('Hostname'), 'ProbeStatus', 2,
				'Last 5 mins: ' + this_row.Probe + ' Probe on ' +
				this_row.Hostname + ' (ID: ' +
				to_char(this_row.ConnectionID) + '): sent ' +
				to_char(this_row.Tally) + ' event(s)',
				this_row.Tally, 300, 13);
		end if;

		-- RESET sev
		set sev = 0;

		-- CHECK IF PROBE COUNT THRESHOLD HAS BEEN BREACHED
		if (this_row.Tally >= sev3 and this_row.Tally < sev4) then
			set sev = 3;
		elseif (this_row.Tally >= sev4 and this_row.Tally < sev5) then
			set sev = 4;
		elseif (this_row.Tally >= sev5) then
			set sev = 5;
		end if;

		-- INSERT A SYNTHETIC ALERT TO SHOW PROBE COUNT THRESHOLD BREACH
		if (sev != 0) then

			call procedure sm_insert(
				'OMNIbus ObjectServer : top Probe event rate for ' +
				this_row.Identifier + ':ALERT',
				get_prop_value('Hostname'), 'ProbeStatus', sev,
				'ALERT: ' + this_row.Probe + ' Probe (Conn ID: ' +
				to_char(this_row.ConnectionID) +
				'): sent high number of events: ' +
				to_char(this_row.Tally), this_row.Tally, 86400, 1);
		end if;
	end;

	-- CLEAN master.sm_top_probes TABLE
	delete from master.sm_top_probes;
end;
go

create or replace trigger sm_db_stats
group self_monitoring_group
priority 11
comment 'Creates synthetic events for ObjectServer DB stats.'
every 60 seconds
declare lastreport int;
	sev int;
	sev3events int;
	sev4events int;
	sev5events int;
	enableinfoevents int;
	deduplicateinfoevents int;
	identifierappendixevents char(255);
	sev3journals int;
	sev4journals int;
	sev5journals int;
	enableinfojournals int;
	deduplicateinfojournals int;
	identifierappendixjournals char(255);
	sev3details int;
	sev4details int;
	sev5details int;
	enableinfodetails int;
	deduplicateinfodetails int;
	identifierappendixdetails char(255);
begin

	-- INITIALISE VARIABLES
	set lastreport = 0;
	set sev = 0;

	-- GET THRESHOLD VALUES FROM master.sm_thresholds FOR EVENT COUNTS
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_db_stats_event_count'
	begin

		set sev3events = thresholds.Sev3;
		set sev4events = thresholds.Sev4;
		set sev5events = thresholds.Sev5;
		set enableinfoevents = thresholds.EnableInfo;
		set deduplicateinfoevents = thresholds.DeduplicateInfo;
	end;

	-- PREPEND TIMESTAMP TO Identifier IF NO DEDUPLICATION
	if (deduplicateinfoevents = 0) then

		set identifierappendixevents = to_char(getdate());
	end if;

	-- GET THRESHOLD VALUES FROM master.sm_thresholds FOR JOURNAL COUNTS
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_db_stats_journal_count'
	begin

		set sev3journals = thresholds.Sev3;
		set sev4journals = thresholds.Sev4;
		set sev5journals = thresholds.Sev5;
		set enableinfojournals = thresholds.EnableInfo;
		set deduplicateinfojournals = thresholds.DeduplicateInfo;
	end;

	-- PREPEND TIMESTAMP TO Identifier IF NO DEDUPLICATION
	if (deduplicateinfojournals = 0) then

		set identifierappendixjournals = to_char(getdate());
	end if;

	-- GET THRESHOLD VALUES FROM master.sm_thresholds FOR DETAILS COUNTS
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_db_stats_details_count'
	begin

		set sev3details = thresholds.Sev3;
		set sev4details = thresholds.Sev4;
		set sev5details = thresholds.Sev5;
		set enableinfodetails = thresholds.EnableInfo;
		set deduplicateinfodetails = thresholds.DeduplicateInfo;
	end;

	-- PREPEND TIMESTAMP TO Identifier IF NO DEDUPLICATION
	if (deduplicateinfodetails = 0) then

		set identifierappendixdetails = to_char(getdate());
	end if;

	-- FIND THE LAST TIME THIS TRIGGER RAN
	for each row this_row in master.sm_activity where
		this_row.ReportTrigger='sm_db_stats'
	begin

		-- RETRIEVE AND STORE THE TIMESTAMP OF THE LAST STATS REPORT PROCESSED
		set lastreport = this_row.MasterStatsLast;
	end;

	-- IF THIS IS THE FIRST TIME THIS TRIGGER HAS RUN, LASTREPORT WILL BE ZERO
	-- SKIP THIS ITERATION OF THE TRIGGER AND STORE THE CURRENT STATS FOR THE NEXT
	-- ITERATION
	if (lastreport = 0) then

		-- ITERATE OVER master.stats TO FIND THE MOST RECENT STATS REPORT
		for each row this_row in master.stats
		begin

			-- STORE THE HIGHEST VALUE
			if (this_row.StatTime > lastreport) then

				set lastreport = this_row.StatTime;
			end if;
		end;

		-- STORE THE HIGHEST VALUE FOR THE NEXT RUN OF THIS TRIGGER
		update master.sm_activity set MasterStatsLast = lastreport where
			ReportTrigger='sm_db_stats';
		
		-- TERMINATE HERE SINCE WE DON'T HAVE ANY PREVIOUS TIMESTAMP
		cancel;
	end if;

	-- RETRIEVE THE LATEST REPORT, IF IT EXISTS, AND INSERT SYNTHETIC EVENTS
	for each row this_row in master.stats where
		this_row.StatTime > lastreport
	begin

		-- FIRST REPORT ON EVENTS IN alerts.status
		-- INSERT A SYNTHETIC EVENT IF ENABLED
		if (enableinfoevents = 1) then

			-- INSERT A SYNTHETIC INFORMATION EVENT TO SHOW EVENT COUNT
			call procedure sm_insert(
				'OMNIbus ObjectServer : alerts.status Database Stats for ' +
				getservername() + ':' + identifierappendixevents,
				get_prop_value('Hostname'), 'DBStatus', 2,
				'Event count (alerts.status): ' + to_char(this_row.EventCount),
				this_row.EventCount, 300, 13);

		end if;

		-- RESET sev
		set sev = 0;

		-- CHECK IF EVENT COUNT THRESHOLD HAS BEEN BREACHED
		if (this_row.EventCount >= sev3events and this_row.EventCount < sev4events) then
			set sev = 3;
		elseif (this_row.EventCount >= sev4events and this_row.EventCount < sev5events) then
			set sev = 4;
		elseif (this_row.EventCount >= sev5events) then
			set sev = 5;
		end if;

		-- INSERT A SYNTHETIC ALERT TO SHOW EVENT COUNT THRESHOLD BREACH
		if (sev != 0) then

			call procedure sm_insert(
				'OMNIbus ObjectServer : alerts.status Database Stats for ' +
				getservername(),
				get_prop_value('Hostname'), 'DBStatus', sev,
				'ALERT: event count (alerts.status) is high: ' +
				to_char(this_row.EventCount), this_row.EventCount,
				86400, 1);
		end if;

		-- SECOND REPORT ON JOURNALS IN alerts.journal
		-- INSERT A SYNTHETIC EVENT IF ENABLED
		if (enableinfojournals = 1) then

			-- INSERT A SYNTHETIC INFORMATION EVENT TO SHOW JOURNAL COUNT
			call procedure sm_insert(
				'OMNIbus ObjectServer : alerts.journal Database Stats for ' +
				getservername() + ':' + identifierappendixjournals,
				get_prop_value('Hostname'), 'DBStatus', 2,
				'Journal count (alerts.journal): ' + to_char(this_row.JournalCount),
				this_row.JournalCount, 300, 13);

		end if;

		-- RESET sev
		set sev = 0;

		-- CHECK IF JOURNAL COUNT THRESHOLD HAS BEEN BREACHED
		if (this_row.JournalCount >= sev3journals and this_row.JournalCount < sev4journals) then
			set sev = 3;
		elseif (this_row.JournalCount >= sev4journals and this_row.JournalCount < sev5journals) then
			set sev = 4;
		elseif (this_row.JournalCount >= sev5journals) then
			set sev = 5;
		end if;

		-- INSERT A SYNTHETIC ALERT TO SHOW JOURNAL COUNT THRESHOLD BREACH
		if (sev != 0) then

			call procedure sm_insert(
				'OMNIbus ObjectServer : alerts.journal Database Stats for ' +
				getservername(),
				get_prop_value('Hostname'), 'DBStatus', sev,
				'ALERT: journal count (alerts.journal) is high: ' +
				to_char(this_row.JournalCount),
				this_row.JournalCount, 86400, 1);
		end if;

		-- THIRD REPORT ON DETAILS IN alerts.details
		-- INSERT A SYNTHETIC EVENT IF ENABLED
		if (enableinfojournals = 1) then

			-- INSERT A SYNTHETIC INFORMATION EVENT TO SHOW DETAILS COUNT
			call procedure sm_insert(
				'OMNIbus ObjectServer : alerts.details Database Stats for ' +
				getservername() + ':' + identifierappendixdetails,
				get_prop_value('Hostname'), 'DBStatus', 2,
				'Details count (alerts.details): ' + to_char(this_row.DetailCount),
				this_row.DetailCount, 300, 13);

		end if;

		-- RESET sev
		set sev = 0;

		-- CHECK IF DETAILS COUNT THRESHOLD HAS BEEN BREACHED
		if (this_row.DetailCount >= sev3details and this_row.DetailCount < sev4details) then
			set sev = 3;
		elseif (this_row.DetailCount >= sev4details and this_row.DetailCount < sev5details) then
			set sev = 4;
		elseif (this_row.DetailCount >= sev5details) then
			set sev = 5;
		end if;

		-- INSERT A SYNTHETIC ALERT TO SHOW DETAILS COUNT THRESHOLD BREACH
		if (sev != 0) then

			call procedure sm_insert(
				'OMNIbus ObjectServer : alerts.details Database Stats for ' +
				getservername(),
				get_prop_value('Hostname'), 'DBStatus', sev,
				'ALERT: details count (alerts.details) is high: ' +
				to_char(this_row.DetailCount),
				this_row.DetailCount, 86400, 1);
		end if;

		-- UPDATE THE STORED TIMESTAMP OF THE LATEST REPORT
		update master.sm_activity set MasterStatsLast = this_row.StatTime where
			ReportTrigger='sm_db_stats';

		--  LOG TO FILE THE ROW COUNTS
		call procedure sm_log(
			'RowCounts: alerts.status: ' + to_char(this_row.EventCount) +
			', alerts.journal: ' + to_char(this_row.JournalCount) +
			', alerts.details: ' + to_char(this_row.DetailCount));

		break;
	end;
end;
go

create or replace trigger sm_top_classes_reinsert
group self_monitoring_group
priority 10
comment 'Populates the top Classes table on reinsert.'
before reinsert on alerts.status for each row
begin

	-- IF IT IS A PROBE PERFORMING THE REINSERT
	if (%user.app_name = 'PROBE') then

		-- INCREMENT THE TALLY FOR THE INCOMING EVENT PROBE
		insert into master.sm_top_classes ( Class, Tally)
            values ( new.Class, 1);

	-- ELSE IF IT IS TopClasses INFO COMING FROM THE COLLECTION LAYER
	elseif (%user.description = 'collection_gate' and new.AlertGroup = 'TopClassesColl') then

		-- ADD THE INCOMING TOTAL TO THE LOCAL TALLY
		insert into master.sm_top_classes ( Class, Tally)
            values ( new.Class, new.Grade);
	end if;
end;
go

create or replace trigger sm_client_time
group self_monitoring_group
priority 10
comment 'Creates synthetic events for ObjectServer time spent executing client SQL'
on signal profiler_report
declare total_time real;
	identifierappendix char(255);
	summary_string char(255);
	app_description char(128);
	sev int;
	sev3 int;
	sev4 int;
	sev5 int;
	enableinfo int;
	deduplicateinfo int;
begin

	-- INITIALISE VARIABLES
	set total_time = 0;
	set summary_string = '';
	set app_description = '';
	set identifierappendix = '';
	set sev = 0;

	-- GET THRESHOLD VALUES FROM master.sm_thresholds
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_client_time_individual'
	begin

		set sev3 = thresholds.Sev3;
		set sev4 = thresholds.Sev4;
		set sev5 = thresholds.Sev5;
	end;

	-- ITERATE OVER EACH CONNECTED CLIENT THAT HAS SUBMITTED REQUESTS
	for each row profile in catalog.profiles where profile.NumSubmits > 0
	begin

		-- RESET sev
		set sev = 0;

		-- CHECK IF CONNECTED CLIENT TIME THRESHOLD HAS BEEN BREACHED
		if (profile.PeriodSQLTime >= sev3 and profile.PeriodSQLTime < sev4) then
			set sev = 3;
		elseif (profile.PeriodSQLTime >= sev4 and profile.PeriodSQLTime < sev5) then
			set sev = 4;
		elseif ( profile.PeriodSQLTime >= sev5) then
			set sev = 5;
		end if;

		-- INSERT A SYNTHETIC ALERT TO SHOW CONNECTED CLIENT TIME THRESHOLD BREACH
		if (sev != 0) then

			-- FIND THE AppDescription FOR THE CONNECTION
			for each row this_connection in catalog.connections where
				this_connection.ConnectionID = profile.ConnectionID
			begin

				set app_description = this_connection.AppDescription;
			end;

			if (app_description = '') then

				-- SET THE SUMMARY FIELD WITHOUT AN APP DESCRIPTION
				set summary_string = 'ALERT: ' + profile.AppName +
					' on ' + profile.HostName + ' (ConnID: ' +
					to_char(profile.ConnectionID) + ') used: ' +
					substr(to_char(profile.PeriodSQLTime), 1, 5) +
					' seconds';

			elseif (app_description like '^e@') then

				-- SET THE SUMMARY FIELD WITH A NATIVE EVENT LIST ENTRY
				set summary_string = 'ALERT: Native Event List on ' +
					profile.HostName + ' (ConnID: ' +
					to_char(profile.ConnectionID) + ') used: ' +
					substr(to_char(profile.PeriodSQLTime), 1, 5) +
					' seconds';
			else

				-- SET THE SUMMARY FIELD WITH A GENERIC APP DESCRIPTION
				set summary_string = 'ALERT: ' + profile.AppName + ': ' +
					app_description + ' on ' + profile.HostName +
					' (ConnID: ' + to_char(profile.ConnectionID) +
					') used: ' + substr(to_char(profile.PeriodSQLTime), 1, 5) +
					' seconds';
			end if;

			-- INSERT A SYNTHETIC EVENT
			call procedure sm_insert(
				'OMNIbus ObjectServer : PeriodSQLtime for ' +
				profile.AppName + ':uid=' + to_char(profile.UID) +
				':' + getservername() + ':' + app_description +
				':' + to_char(profile.ConnectionID),
				get_prop_value('Hostname'), 'ClientStatus', sev,
				summary_string, to_int(ceil(profile.PeriodSQLTime)),
				86400, 1);
		end if;

		set total_time = total_time + profile.PeriodSQLTime;
	end;

	-- GET THRESHOLD VALUES FROM master.sm_thresholds
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_client_time_total'
	begin

		set sev3 = thresholds.Sev3;
		set sev4 = thresholds.Sev4;
		set sev5 = thresholds.Sev5;
		set enableinfo = thresholds.EnableInfo;
		set deduplicateinfo = thresholds.DeduplicateInfo;
	end;

	-- PREPEND TIMESTAMP TO Identifier IF NO DEDUPLICATION
	if (deduplicateinfo = 0) then

		set identifierappendix = to_char(getdate());
	end if;

	-- INSERT A SYNTHETIC EVENT IF ENABLED FOR INFO EVENTS
	if (enableinfo = 1) then

		-- INSERT A SYNTHETIC INFORMATION EVENT TO SHOW TOTAL CLIENT TIME
		call procedure sm_insert(
			'OMNIbus ObjectServer : Total SQL time for all clients ' +
			getservername() + ': ' + identifierappendix,
			get_prop_value('Hostname'), 'ClientStatus', 2,
			'Time for all clients in granularity period (' +
			get_prop_value('Granularity') + 's): ' +
			substr(to_char(total_time), 1, 5) + ' seconds',
			to_int(ceil(total_time)), 60, 13);
	end if;

	-- RESET sev
	set sev = 0;

	-- CHECK IF TOTAL CLIENT TIME THRESHOLD HAS BEEN BREACHED
	if (total_time >= sev3 and total_time < sev4) then
		set sev = 3;
	elseif (total_time >= sev4 and total_time < sev5) then
		set sev = 4;
	elseif (total_time >= sev5) then
		set sev = 5;
	end if;

	-- INSERT A SYNTHETIC ALERT TO SHOW TOTAL CLIENT TIME THRESHOLD BREACH
	if (sev != 0) then

		call procedure sm_insert(
			'OMNIbus ObjectServer : Total SQL time for all clients ' +
			getservername(), get_prop_value('Hostname'),
			'ClientStatus', sev,
			'ALERT: Total time for all clients is high: ' +
			substr(to_char(total_time), 1, 5),
			to_int(ceil(total_time)), 86400, 1);
	end if;
end;
go

create or replace trigger sm_process_top_classes
group self_monitoring_group
priority 10
comment 'Creates synthetic events for top Classes.'
every 300 seconds
declare sev int;
	class_conv char(64);
	summary_string char(255);
	row_identifier char(255);
	sev3 int;
	sev4 int;
	sev5 int;
	enableinfo int;
	deduplicateinfo int;
	identifierappendix char(255);
begin

	-- INITIALISE VARIABLES
	set sev = 0;
	set class_conv = '';
	set summary_string = '';
	set row_identifier = '';
	set identifierappendix = '';

	-- GET THRESHOLD VALUES FROM master.sm_thresholds
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_top_classes'
	begin

		set sev3 = thresholds.Sev3;
		set sev4 = thresholds.Sev4;
		set sev5 = thresholds.Sev5;
		set enableinfo = thresholds.EnableInfo;
		set deduplicateinfo = thresholds.DeduplicateInfo;
	end;

	-- PREPEND TIMESTAMP TO Identifier IF NO DEDUPLICATION
	if (deduplicateinfo = 0) then

		set identifierappendix = to_char(getdate());
	end if;

	-- PROCESS CONTENTS OF sm_top_classes TABLE
	for each row this_row in master.sm_top_classes
	begin

		-- SET IDENTIFIER FOR CURRENT CLASS
		set row_identifier =
			'OMNIbus ObjectServer : top Class event rate for ' +
			to_char(this_row.Class) + ':' + identifierappendix;

		-- SET DEFAULT CLASS CONVERSION
		set class_conv = 'UNKNOWN';

		-- LOOK UP CLASS CONVERSION IN CONVERSIONS TABLE
		for each row this_conversion in alerts.conversions where
			this_conversion.Colname = 'Class' and
			this_conversion.Value = this_row.Class
		begin

			-- SAVE CONVERSION
			set class_conv = this_conversion.Conversion;
			break;
		end;

		-- CONSTRUCT SUMMARY STRING
		set summary_string = 'Last 5 mins: received: ' +
			to_char(this_row.Tally) + ' event(s) of class: ' +
			class_conv + ' (' + to_char(this_row.Class) + ')';

		-- INSERT THE SYNTHETIC EVENTS AT COLLECTION OR AGGREGATION
		if (getservername() like 'AGG') then

			-- INSERT A SYNTHETIC EVENT IF ENABLED
			if (enableinfo = 1) then

				-- INSERT THE SYNTHETIC EVENT FOR CLASS COUNT
				call procedure sm_insert(
					row_identifier, get_prop_value('Hostname'),
					'TopClasses', 2, summary_string,
					this_row.Tally, 300, 13);
			end if;
		
			-- RESET sev
			set sev = 0;

			-- SET EVENT SEVERITY
			if (this_row.Tally >= sev3 and this_row.Tally < sev4) then
				set sev = 3;
			elseif (this_row.Tally >= sev4 and this_row.Tally < sev5) then
				set sev = 4;
			elseif (this_row.Tally >= sev5) then
				set sev = 5;
			end if;

			-- INSERT A SYNTHETIC ALERT TO SHOW CLASS COUNT THRESHOLD BREACH
			if (sev != 0) then

				call procedure sm_insert(
					'OMNIbus ObjectServer : top Class event rate for ' +
					to_char(this_row.Class) + ':ALERT',
					get_prop_value('Hostname'), 'TopClasses', sev,
					'ALERT: last 5 mins: high number of events for class: ' +
					class_conv + ' (' + to_char(this_row.Class) + '): ' +
					to_char(this_row.Tally), this_row.Tally, 86400, 1);
			end if;

		elseif (getservername() like 'COL') then

			-- SET IDENTIFIER FOR A COLLECTION INSERT
			set row_identifier =
				'OMNIbus ObjectServer : top Class event rate for ' +
				to_char(this_row.Class) + ':' + to_char(getdate()) +
				':COLL' + getservername();

			-- INSERT THE SYNTHETIC EVENT
			call procedure sm_insert(
				row_identifier, get_prop_value('Hostname'), 'TopClassesColl',
				2, summary_string, this_row.Tally, 300, 13);

			-- UPDATE THE CLASS FIELD OF THE NEWLY INSERTED EVENT
			update alerts.status set Class = this_row.Class where
				Identifier = row_identifier;
		end if;

	end;

	-- CLEAN master.sm_top_classes TABLE
	delete from master.sm_top_classes;

	-- CLEAN UP ANY ROWS AT AGGREGATION RECEIVED FROM THE COLLECTION LAYER
	if (getservername() like 'AGG') then

		delete from alerts.status where AlertGroup = 'TopClassesColl';
	end if;
end;
go

create or replace trigger sm_block_events_from_gateway
group self_monitoring_group
priority 1
comment 'TRIGGER: block_sm_events_from_gateway\n--\nThis trigger prevents the self monitoring events from being inserted into the\nDisplay layer ObjectServers from the layers below.  This is to prevent\nduplication of events within the GUI.'
before insert on alerts.status for each row
when getservername() like 'DIS'
begin

	-- DROP SELF-MONITORING EVENTS COMING FROM THE DISPLAY GATEWAY
	if (	%user.description = 'display_gate' and
		(	new.Class = 99999 or
			new.Class = 10500 or
			new.AlertGroup = 'ITNM Status' or
			new.Agent = 'OMNIbus SelfMonitoring' or
			new.Manager like 'Watch')) then

		cancel;
	end if;
end;
go

create or replace trigger sm_connections
group self_monitoring_group
priority 10
comment 'Creates synthetic events for ObjectServer client connections stats.'
every 60 seconds
declare lastreport int;
	max_connections int;
	avl_connections int;
	sev3 int;
	sev4 int;
	sev5 int;
	enableinfo int;
	deduplicateinfo int;
	summary_string  char(255);
	identifierappendix char(255);
	sev int;
begin

	-- INITIALISE VARIABLES
	set lastreport = 0;
	set sev = 0;
	set max_connections = to_int(get_prop_value('Connections'));
	set avl_connections = max_connections;
	set summary_string = '';
	set identifierappendix = '';

	-- GET THRESHOLD VALUES FROM master.sm_thresholds
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_connections'
	begin

		set sev3 = thresholds.Sev3;
		set sev4 = thresholds.Sev4;
		set sev5 = thresholds.Sev5;
		set enableinfo = thresholds.EnableInfo;
		set deduplicateinfo = thresholds.DeduplicateInfo;
	end;

	-- PREPEND TIMESTAMP TO Identifier IF NO DEDUPLICATION
	if (deduplicateinfo = 0) then

		set identifierappendix = to_char(getdate());
	end if;

	-- FIND THE LAST TIME THIS TRIGGER RAN
	for each row this_row in master.sm_activity where
		this_row.ReportTrigger='sm_connections'
	begin
		set lastreport = this_row.MasterStatsLast;
	end;

	-- IF THIS IS THE FIRST TIME THIS TRIGGER HAS RUN, LASTREPORT WILL BE ZERO
	-- SKIP THIS ITERATION OF THE TRIGGER AND STORE THE CURRENT STATS FOR THE NEXT
	-- ITERATION
	if (lastreport = 0) then

		-- ITERATE OVER master.stats TO FIND THE MOST RECENT STATS REPORT
		for each row this_row in master.stats
		begin

			-- STORE THE HIGHEST VALUE
			if (this_row.StatTime > lastreport) then

				set lastreport = this_row.StatTime;
			end if;
		end;

		-- STORE THE HIGHEST VALUE FOR THE NEXT RUN OF THIS TRIGGER
		update master.sm_activity set MasterStatsLast = lastreport where
			ReportTrigger='sm_connections';

		-- TERMINATE HERE
		cancel;
	end if;

	-- RETRIEVE THE LATEST REPORT, IF IT EXISTS, AND UPDATE SYNTHETIC EVENT
	for each row this_row in master.stats where this_row.StatTime > lastreport
	begin

		-- CALCULATE THE NUMBER OF FREE CONNECTIONS
		set avl_connections = max_connections - this_row.NumClients;

		-- INSERT A SYNTHETIC EVENT IF ENABLED
		if (enableinfo = 1) then

			-- INSERT A SYNTHETIC INFORMATION EVENT TO SHOW THE NUMBER OF
			-- AVAILABLE CONNECTIONS
			call procedure sm_insert(
				'OMNIbus ObjectServer : Connections available for ' +
				getservername() + ':' + identifierappendix,
				get_prop_value('Hostname'), 'ConnectionStatus', 2,
				'Used ' + to_char(this_row.NumClients) + ' of ' +
				to_char(max_connections) +
				' connections. Available connections: ' +
				to_char(avl_connections), avl_connections, 300, 13);
		end if;

		-- RESET sev
		set sev = 0;

		-- CHECK IF EVENT COUNT THRESHOLD HAS BEEN BREACHED
		if (avl_connections <= sev3 and avl_connections > sev4) then
			set sev = 3;
		elseif (avl_connections <= sev4 and avl_connections > sev5) then
			set sev = 4;
		elseif (avl_connections <= sev5) then
			set sev = 5;
		end if;

		-- INSERT A SYNTHETIC ALERT TO SHOW EVENT COUNT THRESHOLD BREACH
		if (sev != 0) then

			call procedure sm_insert(
				'OMNIbus ObjectServer : Connections available for ' +
				getservername() + ':ALERT',
				get_prop_value('Hostname'), 'ConnectionStatus', sev,
				'ALERT: number of available connections is low: ' +
				to_char(avl_connections), avl_connections, 86400, 1);
		end if;

		update master.sm_activity set MasterStatsLast = this_row.StatTime where
			ReportTrigger = 'sm_connections';

		break;
	end;

	-- INSERT SYNTHETIC EVENTS FOR CONNECTIONS IF ENABLED
	if (enableinfo = 1) then

		-- RECREATE CONNECTION SYNTHETIC EVENTS BASED ON CURRENT CONNECTIONS
		for each row client in catalog.connections where
			client.AppName in ('PROBE', 'GATEWAY')
		begin

			-- SET Summary FOR SYNTHETIC EVENT
			set summary_string = client.AppName + ': ' +
				client.AppDescription + ' connected from host ' +
				client.HostName + ' (ID: ' +
				to_char(client.ConnectionID) + ').';

			call procedure sm_insert(
				'probe_gateway_connection_event:' + getservername() +
				':' + client.HostName + ':' +
				to_char(client.ConnectionID) + ':' + client.AppName +
				':' + client.AppDescription + ':' + identifierappendix,
				get_prop_value('Hostname'), 'ConnectionStatus', 2,
				summary_string, client.ConnectionID, 60, 13);
		end;
	end if;

	-- SET FOR EXPIRY ANY ConnectionWatch EVENTS THAT HAVE NOT YET EXPIRED
	update alerts.status set ExpireTime = 86400 where
		ExpireTime = 0 and
		Manager = 'ConnectionWatch';
end;
go

create or replace trigger sm_delete_clears_display
group self_monitoring_group
priority 10
comment 'Delete clear synthetic alerts over 2 minutes old on Display ObjectServers.'
every 60 seconds
when getservername() like 'DIS'
begin

	delete from alerts.status where
		Severity = 0 and
		ServerName = getservername() and
		StateChange < (getdate() - 120);
end;
go

create or replace trigger sm_top_nodes_reinsert
group self_monitoring_group
priority 10
comment 'Populates the top Nodes table on reinsert.'
before reinsert on alerts.status for each row
begin

	-- IF IT IS A PROBE PERFORMING THE REINSERT
	if (%user.app_name = 'PROBE') then

		-- INCREMENT THE TALLY FOR THE INCOMING EVENT NODE
		insert into master.sm_top_nodes ( Node, Tally)
            values ( new.Node, 1);

	-- ELSE IF IT IS TopNodes INFO COMING FROM THE COLLECTION LAYER
	elseif (%user.description = 'collection_gate' and new.AlertGroup = 'TopNodesColl') then

		-- ADD THE INCOMING TOTAL TO THE LOCAL TALLY
		insert into master.sm_top_nodes ( Node, Tally)
            values ( new.Node, new.Grade);
	end if;
end;
go

create or replace trigger sm_memstore
group self_monitoring_group
priority 10
comment 'Creates synthetic events for memstore stats.'
on signal profiler_report
declare percentage real;
	summary_string char(255);
	identifierappendix char(255);
	sev int;
	sev3 int;
	sev4 int;
	sev5 int;
	enableinfo int;
	deduplicateinfo int;
begin

	-- INITIALISE VARIABLES
	set percentage = 0;
	set summary_string = '';
	set identifierappendix = '';
	set sev = 0;

	-- GET THRESHOLD VALUES FROM master.sm_thresholds
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_memstore'
	begin

		set sev3 = thresholds.Sev3;
		set sev4 = thresholds.Sev4;
		set sev5 = thresholds.Sev5;
		set enableinfo = thresholds.EnableInfo;
		set deduplicateinfo = thresholds.DeduplicateInfo;
	end;

	-- PREPEND TIMESTAMP TO Identifier IF NO DEDUPLICATION
	if (deduplicateinfo = 0) then

		set identifierappendix = to_char(getdate());
	end if;

	-- CHECK THE MEMSTORE SIZE AND SET THE SEVERITY OF THE
	-- SYNTHETIC EVENT ACCORDINGLY
	for each row row_mem in catalog.memstores where
		row_mem.StoreName = 'table_store'
	begin
		set percentage = (row_mem.UsedBytes * 100 / row_mem.SoftLimit);
		set summary_string = 'table_store soft limit: used ' +
			to_char(to_int(row_mem.UsedBytes/1048576)) +
			' MB of capacity ' +
			to_char(to_int(row_mem.SoftLimit/1048576)) + ' MB (' +
			to_char(to_int(ceil(percentage))) + '% used)';

		-- INSERT A SYNTHETIC EVENT IF ENABLED
		if (enableinfo = 1) then

			call procedure sm_insert(
				'OMNIbus ObjectServer : Memstore Status for ' +
				getservername() + identifierappendix,
				get_prop_value('Hostname'), 'MemstoreStatus', 2,
				summary_string, to_int(ceil(percentage)), 60, 13);
		end if;

		-- CHECK IF MEMSTORE THRESHOLD HAS BEEN BREACHED
		if (percentage >= sev3 and percentage < sev4) then
			set sev = 3;
			set summary_string = 'ALERT: ' + summary_string;
		elseif (percentage >= sev4 and percentage < sev5) then
			set sev = 4;
			set summary_string = 'ALERT: ' + summary_string;
		elseif (percentage >= sev5) then
			set sev = 5;
			set summary_string = 'ALERT: extend soft limit: ' + summary_string;
		end if;

		-- IF THRESHOLD HAS BEEN BREACHED
		if (sev != 0) then

			-- INSERT A SYNTHETIC ALERT
			call procedure sm_insert('ALERT: OMNIbus ObjectServer : Memstore Status for ' +
				getservername(), get_prop_value('Hostname'),
				'MemstoreStatus', sev, summary_string,
				to_int(ceil(percentage)), 86400, 1);
		end if;
	 end;
end;
go

create or replace trigger sm_triggers
group self_monitoring_group
priority 10
comment 'Creates synthetic events for Objectserver Trigger stats.'
on signal profiler_report
declare total_time real;
	identifierappendix char(255);
	sev int;
	sev3 int;
	sev4 int;
	sev5 int;
	enableinfo int;
	deduplicateinfo int;
begin
	set total_time = 0;
	set identifierappendix = '';
	set sev = 0;

	-- GET TRIGGER TIME THRESHOLD VALUES FROM master.sm_thresholds
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_triggers_individual'
	begin

		set sev3 = thresholds.Sev3;
		set sev4 = thresholds.Sev4;
		set sev5 = thresholds.Sev5;
	end;

	-- FOR EACH ENABLED TRIGGER GROUP
	for each row trigger_group in catalog.trigger_groups where trigger_group.IsEnabled = true
	begin

		-- CHECK THE TRIGGER TIMES FOR EACH ACTIVE TRIGGER IN THAT GROUP
		for each row trig in catalog.trigger_stats
			where trig.TriggerName in (
				select TriggerName from catalog.triggers where
					IsEnabled = true and
					GroupName = trigger_group.GroupName)
		begin

			-- ADD CURRENT TRIGGER TIME TO THE RUNNING TOTAL
			set total_time = total_time + trig.PeriodTime;

			-- GENERATE SYNTHETIC EVENTS FOR INDIVIDUAL TRIGGERS OVER THRESHOLD
 			if (trig.PeriodTime >= sev3) then

				-- SET SEVERITY OF SYNTHETIC EVENTS
				if (trig.PeriodTime >= sev3 and trig.PeriodTime < sev4) then
					set sev = 3;
				elseif (trig.PeriodTime >= sev4 and trig.PeriodTime < sev5) then
					set sev = 4;
				elseif (trig.PeriodTime >= sev5) then
					set sev = 5;
				end if;

				-- INSERT A SYNTHETIC EVENT FOR THIS TRIGGER
				call procedure sm_insert(
					'OMNIbus ObjectServer : Trigger Status for ' +
					getservername() + ':' + trig.TriggerName,
					get_prop_value('Hostname'), 'TriggerStatus',
					sev, 'ALERT: ' + trig.TriggerName +
					': trigger time is high: ' +
					substr(to_char(trig.PeriodTime), 1, 5) +
					' seconds', to_int(ceil(trig.PeriodTime)),
					86400, 1);
			end if;
		end;
	end;

	-- GET TOTAL TRIGGER TIME THRESHOLD VALUES FROM master.sm_thresholds
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_triggers_total'
	begin

		set sev3 = thresholds.Sev3;
		set sev4 = thresholds.Sev4;
		set sev5 = thresholds.Sev5;
		set enableinfo = thresholds.EnableInfo;
		set deduplicateinfo = thresholds.DeduplicateInfo;
	end;

	-- PREPEND TIMESTAMP TO Identifier IF NO DEDUPLICATION
	if (deduplicateinfo = 0) then

		set identifierappendix = to_char(getdate());
	end if;

	-- INSERT A SYNTHETIC EVENT IF ENABLED FOR INFO EVENTS
	if (enableinfo = 1) then

		-- INSERT A SYNTHETIC INFORMATION EVENT TO SHOW TOTAL TRIGGER TIME
		call procedure sm_insert(
			'OMNIbus ObjectServer: Trigger Status for ' +
			getservername() + ': ' + identifierappendix,
			get_prop_value('Hostname'), 'TriggerStatus', 2,
			'Time for all triggers in profiling period (' +
			substr(to_char(%signal.report_period), 1, 5) + 's): ' +
			substr(to_char(total_time), 1, 5) + ' seconds',
			to_int(ceil(total_time)), 60, 13);
	end if;

	-- RESET sev
	set sev = 0;

	-- CHECK IF TOTAL TRIGGER TIME THRESHOLD HAS BEEN BREACHED
	if (total_time >= sev3 and total_time < sev4) then
		set sev = 3;
	elseif (total_time >= sev4 and total_time < sev5) then 
		set sev = 4;
	elseif (total_time >= sev5) then 
		set sev = 5;
	end if;
	
	-- INSERT A SYNTHETIC ALERT TO SHOW TOTAL TRIGGER TIME THRESHOLD BREACH
	if (sev != 0) then

		call procedure sm_insert(
			'OMNIbus ObjectServer: Trigger Status for ' +
			getservername(), get_prop_value('Hostname'),
			'TriggerStatus', sev,
			'ALERT: Time for all triggers in profiling period is high: ' +
			substr(to_char(total_time), 1, 5) + ' seconds',
			to_int(ceil(total_time)), 86400, 1);
	end if;

	-- GET REPORTING PERIOD THRESHOLD VALUES FROM master.sm_thresholds
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_triggers_reporting_period'
	begin

		set sev3 = thresholds.Sev3;
		set sev4 = thresholds.Sev4;
		set sev5 = thresholds.Sev5;
	end;

	-- RESET sev
	set sev = 0;

	-- CHECK IF REPORTING PERIOD THRESHOLD HAS BEEN BREACHED
	if (%signal.report_period >= sev3 and %signal.report_period < sev4) then
		set sev = 3;
	elseif (%signal.report_period >= sev4 and %signal.report_period < sev5) then
		set sev = 4;
	elseif (%signal.report_period >= sev5) then
		set sev = 5;
	end if;

	-- INSERT A SYNTHETIC ALERT TO SHOW REPORTING PERIOD THRESHOLD BREACH
	if (sev != 0) then

		-- INSERT A SYNTHETIC EVENT
		call procedure sm_insert(
			'OMNIbus ObjectServer : Profiler Report Status for '
			+ getservername(), get_prop_value('Hostname'),
			'TriggerStatus', sev,
			'ALERT: ObjectServer profiling period high: ' +
			substr(to_char(%signal.report_period), 1, 5) + ' seconds',
			to_int(ceil(%signal.report_period)), 86400, 1);
	end if;
end;
go

create or replace trigger sm_top_nodes_insert
group self_monitoring_group
priority 10
comment 'Populates the top Nodes table on insert.'
before insert on alerts.status for each row
begin

	-- IF IT IS A PROBE PERFORMING THE INSERT
	if (%user.app_name = 'PROBE') then

		-- INCREMENT THE TALLY FOR THE INCOMING EVENT NODE
		insert into master.sm_top_nodes ( Node, Tally)
            values ( new.Node, 1);

	-- ELSE IF IT IS TopNodes INFO COMING FROM THE COLLECTION LAYER
	elseif (%user.description = 'collection_gate' and new.AlertGroup = 'TopNodesColl') then

		-- ADD THE INCOMING TOTAL TO THE LOCAL TALLY
		insert into master.sm_top_nodes ( Node, Tally)
            values ( new.Node, new.Grade);
	end if;
end;
go

create or replace trigger sm_top_classes_deduplication
group self_monitoring_group
priority 10
comment 'Handles deduplications on the master.sm_top_classes table.'
before reinsert on master.sm_top_classes for each row
begin

	-- INCREMENT THE TALLY FOR THE INCOMING EVENT NODE
	set old.Tally = old.Tally + new.Tally;
end;
go

create or replace trigger sm_top_probes_reinsert
group self_monitoring_group
priority 10
comment 'Populates the top Probes table on reinsert.'
before reinsert on alerts.status for each row
when %user.app_name = 'PROBE'
begin

	-- INCREMENT THE TALLY FOR THE INCOMING EVENT PROBE
	insert into master.sm_top_probes ( Identifier, Probe, Hostname, ConnectionID, Tally)
        values ( getservername() + ':' +
			%user.description + ':' +
			%user.host_name + ':' +
			to_char(%user.connection_id),
		%user.description, %user.host_name, %user.connection_id, 1);
end;
go

create or replace trigger sm_top_probes_deduplication
group self_monitoring_group
priority 10
comment 'Handles deduplications on the master.sm_top_probes table.'
before reinsert on master.sm_top_probes for each row
begin

	-- INCREMENT THE TALLY FOR THE INCOMING EVENT NODE
	set old.Tally = old.Tally + 1;
end;
go

create or replace trigger sm_expire_display_events
group self_monitoring_group
priority 10
comment 'Expire local self monitoring events on Display ObjectServers.'
every 61 seconds
when getservername() like 'DIS'
begin

	-- FIND LOCALLY GENERATED SELF MONITORING EVENTS THAT ARE DUE FOR EXPIRY
	for each row expire in alerts.status where
		expire.Severity != 0 and
		expire.ExpireTime != 0 and
		expire.LastOccurrence < (getdate() - expire.ExpireTime) and
		expire.ServerName = getservername()
	begin

		-- CLEAR EXPIRED EVENTS
		set expire.Severity = 0;
	end;
end;
go

create or replace trigger sm_dbops_stats
group self_monitoring_group
priority 10
comment 'Creates synthetic events for DB operations stats.'
every 60 seconds
declare lastreport int;
	sev int;

	last_StatusInserts int;
	last_JournalInserts int;
	last_DetailsInserts int;
	StatusInserts int;
	JournalInserts int;
	DetailsInserts int;

	sev3statusinserts int;
	enableinfo_si int;
	deduplicateinfo_si int;
	identifierappendix_si char(255);

	sev3journalinserts int;
	enableinfo_ji int;
	deduplicateinfo_ji int;
	identifierappendix_ji char(255);

	sev3detailsinserts int;
	enableinfo_di int;
	deduplicateinfo_di int;
	identifierappendix_di char(255);
begin

	-- INITIALISE VARIABLES
	set lastreport = 0;

	set last_StatusInserts = 0; 
	set last_JournalInserts = 0;
	set last_DetailsInserts = 0;

	set StatusInserts = 0;
	set JournalInserts = 0;
	set DetailsInserts = 0;

	set sev = 0;

	-- GET THRESHOLD VALUES FROM master.sm_thresholds FOR STATUS INSERTS
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_dbops_stats_status_inserts'
	begin

		set sev3statusinserts = thresholds.Sev3;
		set enableinfo_si = thresholds.EnableInfo;
		set deduplicateinfo_si = thresholds.DeduplicateInfo;
	end;

	-- PREPEND TIMESTAMP TO Identifier IF NO DEDUPLICATION
	if (deduplicateinfo_si = 0) then

		set identifierappendix_si = to_char(getdate());
	end if;

	-- GET THRESHOLD VALUES FROM master.sm_thresholds FOR JOURNAL INSERTS
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_dbops_stats_journal_inserts'
	begin

		set sev3journalinserts = thresholds.Sev3;
		set enableinfo_ji = thresholds.EnableInfo;
		set deduplicateinfo_ji = thresholds.DeduplicateInfo;
	end;

	-- PREPEND TIMESTAMP TO Identifier IF NO DEDUPLICATION
	if (deduplicateinfo_ji = 0) then

		set identifierappendix_ji = to_char(getdate());
	end if;

	-- GET THRESHOLD VALUES FROM master.sm_thresholds FOR DETAILS INSERTS
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_dbops_stats_details_inserts'
	begin

		set sev3detailsinserts = thresholds.Sev3;
		set enableinfo_di = thresholds.EnableInfo;
		set deduplicateinfo_di = thresholds.DeduplicateInfo;
	end;

	-- PREPEND TIMESTAMP TO Identifier IF NO DEDUPLICATION
	if (deduplicateinfo_di = 0) then

		set identifierappendix_di = to_char(getdate());
	end if;

	-- FIND THE LAST TIME THIS TRIGGER RAN
	for each row this_row in master.sm_activity where
		this_row.ReportTrigger='sm_dbops_stats'
	begin

		-- RETRIEVE AND STORE THE TIMESTAMP OF THE LAST STATS REPORT PROCESSED
		set lastreport = this_row.MasterStatsLast;
	end;

	-- IF THIS IS THE FIRST TIME THIS TRIGGER HAS RUN, LASTREPORT WILL BE ZERO
	-- SKIP THIS ITERATION OF THE TRIGGER AND STORE THE CURRENT STATS FOR THE NEXT
	-- ITERATION
	if (lastreport = 0) then

		-- ITERATE OVER master.stats TO FIND THE MOST RECENT STATS REPORT
		for each row this_row in master.stats
        -- not used?
		begin

			-- STORE THE HIGHEST VALUE
			if (this_row.StatTime > lastreport) then

				set lastreport = this_row.StatTime;
			end if;
		end;

		-- STORE THE HIGHEST VALUE FOR THE NEXT RUN OF THIS TRIGGER
		update master.sm_activity set MasterStatsLast = lastreport where
			ReportTrigger='sm_dbops_stats';

		-- TERMINATE HERE
		cancel;
	end if;

	-- RETRIEVE THE PREVIOUS REPORT VALUES
	for each row last in master.stats where last.StatTime = lastreport
	begin

 		set last_StatusInserts = last.StatusInserts;
		set last_JournalInserts = last.JournalInserts;
		set last_DetailsInserts = last.DetailsInserts;
	end;

	-- FIND THE LATEST REPORT, IF IT EXISTS, AND UPDATE SYNTHETIC EVENT
	for each row this_row in master.stats where this_row.StatTime > lastreport
	begin
		
		-- CALCULATE THE DELTA BETWEEN THE LAST REPORT AND LATEST REPORT
		set StatusInserts = this_row.StatusInserts - last_StatusInserts;
		set JournalInserts = this_row.JournalInserts - last_JournalInserts;
		set DetailsInserts = this_row.DetailsInserts - last_DetailsInserts;

		-- FIRST REPORT ON NUMBER OF INSERTS INTO alerts.status
		-- INSERT A SYNTHETIC EVENT IF ENABLED
		if (enableinfo_si = 1) then

			-- INSERT A SYNTHETIC INFORMATION EVENT TO SHOW alerts.status INSERTS
			call procedure sm_insert(
				'OMNIbus ObjectServer : alerts.status DB operations stats for ' +
				getservername() + ':' + identifierappendix_si,
				get_prop_value('Hostname'), 'DBStatus', 2,
				'Last 5 mins alerts.status (inserts/deduplications): ' +
				to_char(StatusInserts), StatusInserts, 300, 13);

		end if;

		-- INSERT A SYNTHETIC ALERT TO SHOW DETAILS COUNT THRESHOLD BREACH
		if (StatusInserts >= sev3statusinserts) then

			call procedure sm_insert(
				'OMNIbus ObjectServer : alerts.status DB operations stats for ' +
				getservername(),
				get_prop_value('Hostname'), 'DBStatus', 3,
				'ALERT: last 5 mins alerts.status inserts/deduplications are high: ' +
				to_char(StatusInserts), StatusInserts, 86400, 1);
		end if;

		-- SECOND REPORT ON NUMBER OF INSERTS INTO alerts.journal
		-- INSERT A SYNTHETIC EVENT IF ENABLED
		if (enableinfo_ji = 1) then

			-- INSERT A SYNTHETIC INFORMATION EVENT TO SHOW alerts.journal INSERTS
			call procedure sm_insert(
				'OMNIbus ObjectServer : alerts.journal DB operations stats for ' +
				getservername() + ':' + identifierappendix_ji,
				get_prop_value('Hostname'), 'DBStatus', 2,
				'Last 5 mins alerts.journal (inserts): ' + to_char(JournalInserts),
				JournalInserts, 300, 13);

		end if;

		-- INSERT A SYNTHETIC ALERT TO SHOW JOURNAL COUNT THRESHOLD BREACH
		if (JournalInserts >= sev3journalinserts) then

			call procedure sm_insert(
				'OMNIbus ObjectServer : alerts.journal DB operations stats for ' +
				getservername(),
				get_prop_value('Hostname'), 'DBStatus', 3,
				'ALERT: last 5 mins alerts.journal inserts are high: ' +
				to_char(JournalInserts), JournalInserts, 86400, 1);
		end if;

		-- THIRD REPORT ON NUMBER OF INSERTS INTO alerts.details
		-- INSERT A SYNTHETIC EVENT IF ENABLED
		if (enableinfo_di = 1) then

			-- INSERT A SYNTHETIC INFORMATION EVENT TO SHOW alerts.details INSERTS
			call procedure sm_insert(
				'OMNIbus ObjectServer : alerts.details DB operations stats for ' +
				getservername() + ':' + identifierappendix_di,
				get_prop_value('Hostname'), 'DBStatus', 2,
				'Last 5 mins alerts.details (inserts): ' + to_char(DetailsInserts),
				DetailsInserts, 300, 13);

		end if;

		-- INSERT A SYNTHETIC ALERT TO SHOW DETAILS COUNT THRESHOLD BREACH
		if (DetailsInserts >= sev3detailsinserts) then

			call procedure sm_insert(
				'OMNIbus ObjectServer : alerts.details DB operations stats for ' +
				getservername(),
				get_prop_value('Hostname'), 'DBStatus', 3,
				'ALERT: last 5 mins alerts.details inserts are high: ' +
				to_char(DetailsInserts), DetailsInserts, 86400, 1);
		end if;

		-- LOG TO FILE THE TABLE METRICS
		call procedure sm_log(
			'InsertCounts: Last 5 mins: alerts.status (inserts/deduplications): ' +
			to_char(StatusInserts)  + ', alerts.journal (inserts): ' +
			to_char(JournalInserts) + ', alerts.details (inserts): ' +
			to_char(DetailsInserts));

		-- UPDATE THE LAST REPORT TIME
		update master.sm_activity set MasterStatsLast = this_row.StatTime where
			ReportTrigger='sm_dbops_stats';

		break;
	end;
end;
go

create or replace trigger sm_deduplication_grade
group self_monitoring_group
priority 10
comment 'Updates Grade, ExpireTime and Acknowledged fields on deduplication\nof self-monitoring events.'
before reinsert on alerts.status for each row
when old.Class = 99999
begin

	-- UPDATE Grade FIELD ON DEDUPLICATION OF SELF MONITORING EVENTS
	set old.Grade = new.Grade;
	
	-- UPDATE ExpireTime FIELD ON DEDUPLICATION OF SELF MONITORING EVENTS
	set old.ExpireTime = new.ExpireTime;

	-- UNACKNOWLEDGE EVENT IF IT IS ACKNOWLEDGED
	set old.Acknowledged = 0;
end;
go

create or replace trigger sm_log_alert_inserts
group self_monitoring_group
priority 10
comment 'Writes log messages to the self monitoring log file for ALERTS.'
before insert on alerts.status for each row
when new.Class = 99999 and new.Summary like 'ALERT'
begin


	-- WRITE A LOG MESSAGE
	call procedure sm_log(new.AlertGroup + ': ' + new.Summary);
end;
go

create or replace trigger sm_process_top_nodes
group self_monitoring_group
priority 10
comment 'Creates synthetic events for top Nodes.'
every 300 seconds
declare sev		int;
	summary_string	char(255);	
	row_identifier	char(255);
	sev3 int;
	sev4 int;
	sev5 int;
	enableinfo int;
	deduplicateinfo int;
	identifierappendix char(255);
begin

	-- INITIALISE VARIABLES
	set sev = 0;
	set summary_string = '';
	set row_identifier = '';
	set identifierappendix = '';

	-- GET THRESHOLD VALUES FROM master.sm_thresholds
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_top_nodes'
	begin

		set sev3 = thresholds.Sev3;
		set sev4 = thresholds.Sev4;
		set sev5 = thresholds.Sev5;
		set enableinfo = thresholds.EnableInfo;
		set deduplicateinfo = thresholds.DeduplicateInfo;
	end;

	-- PREPEND TIMESTAMP TO Identifier IF NO DEDUPLICATION
	if (deduplicateinfo = 0) then

		set identifierappendix = to_char(getdate());
	end if;

	-- PROCESS CONTENTS OF sm_top_nodes TABLE
	for each row this_row in master.sm_top_nodes
	begin

		-- SET IDENTIFIER FOR CURRENT NODE
		set row_identifier =
			'OMNIbus ObjectServer : top Node event rate for ' +
			this_row.Node + ':' + identifierappendix;

		-- CONSTRUCT SUMMARY STRING
		set summary_string = 'Last 5 mins: ' + this_row.Node + ' sent ' +
			to_char(this_row.Tally) + ' event(s)';

		-- INSERT THE SYNTHETIC EVENT AT COLLECTION OR AGGREGATION
		if (getservername() like 'AGG') then

			-- INSERT A SYNTHETIC EVENT IF ENABLED
			if (enableinfo = 1) then

				-- INSERT THE SYNTHETIC EVENT FOR CLASS COUNT
				call procedure sm_insert(
					row_identifier, this_row.Node, 'TopNodes', 2,
					summary_string, this_row.Tally, 300, 13);
			end if;

			-- RESET sev
			set sev = 0;

			-- CHECK IF NODE COUNT THRESHOLD HAS BEEN BREACHED
			if (this_row.Tally >= sev3 and this_row.Tally < sev4) then
				set sev = 3;
			elseif (this_row.Tally >= sev4 and this_row.Tally < sev5) then
				set sev = 4;
			elseif (this_row.Tally >= sev5) then
				set sev = 5;
			end if;

			-- INSERT A SYNTHETIC ALERT TO SHOW NODE COUNT THRESHOLD BREACH
			if (sev != 0) then

				call procedure sm_insert(
					'OMNIbus ObjectServer : top Node event rate for ' +
					this_row.Node + ':ALERT', this_row.Node, 'TopNodes',
					sev, 'ALERT: last 5 mins: high number of events sent by: ' +
					this_row.Node + ': ' + to_char(this_row.Tally),
					this_row.Tally, 86400, 1);
			end if;

		elseif (getservername() like 'COL') then

			-- SET IDENTIFIER FOR A COLLECTION INSERT
			set row_identifier =
				'OMNIbus ObjectServer : top Node event rate for ' +
				this_row.Node + ':' + to_char(getdate()) +
				':COLL' + getservername();

			call procedure sm_insert(
				row_identifier, this_row.Node, 'TopNodesColl', 2,
				summary_string, this_row.Tally, 300, 13);
		end if;
	end;

	-- CLEAN master.sm_top_nodes TABLE
	delete from master.sm_top_nodes;

	-- CLEAN UP ANY ROWS AT AGGREGATION RECEIVED FROM THE COLLECTION LAYER
	if (getservername() like 'AGG') then

		delete from alerts.status where AlertGroup = 'TopNodesColl';
	end if;
end;
go

create or replace trigger sm_top_classes_insert
group self_monitoring_group
priority 10
comment 'Populates the top Classes table on insert.'
before insert on alerts.status for each row
begin

	-- IF IT IS A PROBE PERFORMING THE INSERT
	if (%user.app_name = 'PROBE') then

		-- INCREMENT THE TALLY FOR THE INCOMING EVENT PROBE
		insert into master.sm_top_classes ( Class, Tally)
            values ( new.Class, 1);

	-- ELSE IF IT IS TopClasses INFO COMING FROM THE COLLECTION LAYER
	elseif (%user.description = 'collection_gate' and new.AlertGroup = 'TopClassesColl') then

		-- ADD THE INCOMING TOTAL TO THE LOCAL TALLY
		insert into master.sm_top_classes ( Class, Tally)
            values ( new.Class, new.Grade);
	end if;
end;
go

create or replace trigger sm_top_nodes_deduplication
group self_monitoring_group
priority 10
comment 'Handles deduplications on the master.sm_top_nodes table.'
before reinsert on master.sm_top_nodes for each row
begin

	-- INCREMENT THE TALLY FOR THE INCOMING EVENT NODE
	set old.Tally = old.Tally + new.Tally;
end;
go

create or replace trigger sm_check_probe_heartbeats
group self_monitoring_group
priority 10
comment 'Check Probe heartbeat events and raise Severity of ones that have not heartbeated for more than 3 minutes.'
every 60 seconds
when get_prop_value('ActingPrimary') %= 'TRUE' and getservername() like 'AGG'
begin

	-- LOOK FOR UNCLEARED PROBE HEARTBEAT EVENTS THAT HAVE MISSED 3 OR MORE HEARTBEATS
	for each row heartbeat in alerts.status where
		heartbeat.Severity != 0 and
		heartbeat.LastOccurrence < (getdate() - 180) and
		heartbeat.Manager = 'ProbeWatch' and
		heartbeat.Identifier like 'Heartbeat'
	begin

		-- UPDATE SUMMARY AND SEVERITY
		set heartbeat.Summary =
			heartbeat.AlertKey + ' probe on ' +
			heartbeat.Node + ': ALERT: no heartbeat for current PID for ' +
			to_char(to_int((getdate() - heartbeat.LastOccurrence) / 60)) +
			' minutes.';

		set heartbeat.Severity = 3;
	end;
end;
go

create or replace trigger sm_create_journal_on_severity_change
group self_monitoring_group
priority 1
comment 'Inserts a journal for ALERT events if the Severity is updated.'
before reinsert on alerts.status for each row
when old.Class = 99999 and old.Type = 1 and (old.Severity != new.Severity)
declare old_conversion char(255);
	new_conversion char(255);
	journal_string char(255);
begin

	-- SET OLD SEVERITY TEXT
	if (old.Severity = 5) then
		set old_conversion = 'Critical';
	elseif (old.Severity = 4) then
		set old_conversion = 'Major';
	elseif (old.Severity = 3) then
		set old_conversion = 'Minor';
	elseif (old.Severity = 2) then
		set old_conversion = 'Warning';
	elseif (old.Severity = 1) then
		set old_conversion = 'Indeterminate';
	elseif (old.Severity = 0) then
		set old_conversion = 'Clear';
	end if;

	-- SET NEW SEVERITY TEXT
	if (new.Severity = 5) then
		set new_conversion = 'Critical';
	elseif (new.Severity = 4) then
		set new_conversion = 'Major';
	elseif (new.Severity = 3) then
		set new_conversion = 'Minor';
	elseif (new.Severity = 2) then
		set new_conversion = 'Warning';
	elseif (new.Severity = 1) then
		set new_conversion = 'Indeterminate';
	elseif (new.Severity = 0) then
		set new_conversion = 'Clear';
	end if;

	-- START BUILDING JOURNAL STRING
	set journal_string = 'Severity has been ';

	-- CHECK IF SEVERITY IS GOING UP OR DOWN
	if (old.Severity < new.Severity) then

		set journal_string = journal_string + 'upgraded ';

	else
		set journal_string = journal_string + 'downgraded ';
	end if;

	-- COMPLETE JOURNAL STRING
	set journal_string =  journal_string + 'from ' + old_conversion +
		' (' + to_char(old.Severity) + ') to ' + new_conversion +
		' (' + to_char(new.Severity) + ').  The metric was: ' + to_char(old.Grade) +
		' and is now: ' + to_char(new.Grade) + '.';

	-- INSERT JOURNAL
	call procedure jinsert(
		old.Serial,
		%user.user_id,
		getdate(),
		journal_string);
	
end;
go

create or replace trigger sm_time_to_display_severity
group self_monitoring_group
priority 10
comment 'This trigger adjusts the Severity of time to display events based on the metric.'
every 61 seconds
when getservername() like 'DIS'
declare sev3 int;
	sev4 int;
	sev5 int;
begin

	-- GET THRESHOLD VALUES FROM master.sm_thresholds
	for each row thresholds in master.sm_thresholds where
		thresholds.ThresholdName = 'sm_time_to_display'
	begin

		set sev3 = thresholds.Sev3;
		set sev4 = thresholds.Sev4;
		set sev5 = thresholds.Sev5;
	end;

	-- FIND TIME TO DISPLAY EVENTS
	for each row ttd in alerts.status where
		ttd.Identifier = 'time_to_display'
	begin

		-- MODIFY SEVERITY BASED ON NUMBER
		if (ttd.Grade < sev3) then
			set ttd.Severity = 2;
		elseif ((ttd.Grade >= sev3) and (ttd.Grade < sev4)) then
			set ttd.Severity = 3;
		elseif ((ttd.Grade >= sev4) and (ttd.Grade < sev5)) then
			set ttd.Severity = 4;
		elseif (ttd.Grade >= sev5) then
			set ttd.Severity = 5;
		end if;
	end;
end;
go

create or replace trigger sm_log_alert_reinserts
group self_monitoring_group
priority 10
comment 'Writes log messages to the self monitoring log file for ALERTS.'
before reinsert on alerts.status for each row
when new.Class = 99999 and new.Summary like 'ALERT'
begin


	-- WRITE A LOG MESSAGE
	call procedure sm_log(new.AlertGroup + ': ' + new.Summary);
end;
go

create or replace trigger update_service_affecting_events
group sae
priority 1
comment 'Update Service Affecting Events'
every 60 seconds
evaluate -- group by is used for "select distinct"
        select ServiceEntityId, count(*)
        from precision.entity_service
        -- there must be an nmos-id in alerts.status for this service-id
        where NmosEntityId in
                (select NmosEntityId from alerts.status
                 where NmosEntityId != 0 and Severity = 5)
        group by ServiceEntityId
bind as services
begin
        -- since we can't do a for each row on a transtable
        -- with a where clause, we first populate a virtual table
        delete from precision.service_affecting_event;

        for each row serv in services
        begin
                insert into precision.service_affecting_event
                values (serv.ServiceEntityId);
        end;

        -- service_affecting_event now contains all the service-ids for which a
        -- service affecting event should exist.

        -- first delete any sae which shouldn't exist; could make
        -- alerts.status smaller
        delete from alerts.status
        where Class = 8001
        and NmosEntityId not in
                (select ServiceEntityId from precision.service_affecting_event);

        -- retrieve the details of the service
        for each row serv_detail in precision.service_details
        where
                serv_detail.ServiceEntityId in
                (select ServiceEntityId from precision.service_affecting_event)
        and
                serv_detail.ServiceEntityId not in
                (select NmosEntityId from alerts.status where Class = 8001)
        begin
                -- create sae for service
                insert into alerts.status (Identifier,
                        NmosEntityId, Severity, ServerName,
                        Summary, Manager, Class,
                        FirstOccurrence, LastOccurrence,
                        AlertGroup, OwnerUID, Type, EventId, NmosDomainName)
                values
                        ('SAE for ' + serv_detail.Name + '-' +
                                serv_detail.Customer,
                        serv_detail.ServiceEntityId,
                        4,
                        getservername,
                        serv_detail.Type + ' ' + serv_detail.Name +
                        ' affected (' + serv_detail.Customer + ')',
                        'Service Automation',
                        8001,
                        getdate, getdate,
                        'nco_objserv', 65534, 1, serv_detail.Type,
			serv_detail.NmosDomainName );
        end;

end;
go

create or replace trigger rcaGateOnClearTransitionOnUpdate
group RCA
enabled false
priority 4
comment 'This transition sends an update(U) anytime an alert we care about goes \nfrom clear to non-cleared or vice-versa.  This is done so the RCA engine\ncan remove dependencies on root cause alerts where the root cause\nalert has been cleared'
before update on alerts.status for each row
when (new.Type <> 2)
and
old.methodProcedure like 'NOC-|INIT-|PROD-|PENDING|TEST'
and
(((old.Severity*new.Severity) = 0) AND (old.Severity <> new.Severity ) )
begin
   insert into custom.RCAGate (
      Serial,
      Node,
      NodeAlias,
      Agent,
      AlertGroup,
      AlertKey,
      Severity,
      Summary,
      FirstOccurrence,
      Poll,
      Type,
      Tally,
      Location,
      ExpireTime,
      Customer,
      methodProcedure,
      rcaProbableCause,
      rcaSympatRule,
      rcaSymptomCount,
      wbAgentAlias,
      wbAgentNode,
      wbAutomationID,
      wbCarrier,
      wbGateway,
      wbNeighbor,
      wbSat,
      wbSmtsIP,
      wbTicketID,
      wbInterface,
      wbSystem,
      RCServer,
      RCType,
      RCTime
   )
   values
   (
      new.Serial,
      new.Node,
      new.NodeAlias,
      new.Agent,
      new.AlertGroup,
      new.AlertKey,
      new.Severity,
      new.Summary,
      new.FirstOccurrence,
      new.Poll,
      new.Type,
      new.Tally,
      new.Location,
      new.ExpireTime,
      new.Customer,
      new.methodProcedure,
      new.rcaProbableCause,
      new.rcaSympatRule,
      new.rcaSymptomCount,
      new.wbAgentAlias,
      new.wbAgentNode,
      new.wbAutomationID,
      new.wbCarrier,
      new.wbGateway,
      new.wbNeighbor,
      new.wbSat,
      new.wbSmtsIP,
      new.wbTicketID,
      new.wbInterface,
      new.wbSystem,
      %user.host_name,
      'U',
      getdate
   );
end;
go

create or replace trigger rcaGateOnClearTransitionOnReinsert
group RCA
enabled false
priority 1
comment 'This transition sends an reinsert(R) anytime an alert we care about goes\nfrom clear to non-cleared or vice-versa.  This is done so the RCA engine\ncan remove dependencies on root  cause alerts where the root cause\nalert has been cleared'
before reinsert on alerts.status for each row
when (new.Type <> 2)
and
old.methodProcedure like 'NOC-|INIT-|PROD-|PENDING|TEST'
and (((old.Severity*new.Severity) = 0)) and (old.Severity <> new.Severity )
begin
   insert into custom.RCAGate (
      Serial,
      Node,
      NodeAlias,
      Agent,
      AlertGroup,
      AlertKey,
      Severity,
      Summary,
      FirstOccurrence,
      Poll,
      Type,
      Tally,
      Location,
      ExpireTime,
      Customer,
      methodProcedure,
      rcaProbableCause,
      rcaSympatRule,
      rcaSymptomCount,
      wbAgentAlias,
      wbAgentNode,
      wbAutomationID,
      wbCarrier,
      wbGateway,
      wbNeighbor,
      wbSat,
      wbSmtsIP,
      wbTicketID,
      wbInterface,
      wbSystem,
      RCServer,
      RCType,
      RCTime
   )
   values
   (
      old.Serial,
      old.Node,
      old.NodeAlias,
      old.Agent,
      old.AlertGroup,
      old.AlertKey,
      old.Severity,
      old.Summary,
      old.FirstOccurrence,
      old.Poll,
      old.Type,
      old.Tally,
      old.Location,
      old.ExpireTime,
      old.Customer,
      old.methodProcedure,
      old.rcaProbableCause,
      old.rcaSympatRule,
      old.rcaSymptomCount,
      old.wbAgentAlias,
      old.wbAgentNode,
      old.wbAutomationID,
      old.wbCarrier,
      old.wbGateway,
      old.wbNeighbor,
      old.wbSat,
      old.wbSmtsIP,
      old.wbTicketID,
      old.wbInterface,
      old.wbSystem,
      %user.host_name,
      'R',
      getdate
   );
end;
go

create or replace trigger rcaMetaClear
group RCA
enabled false
priority 1
comment 'rcaMetaClear is triggered whenever a meta \'clear\' event comes in.  This trigger checks to see if there was a corresponding problem alert and cancels the new alert if there is no problem to clear.'
before insert on alerts.status for each row
when new.Type=2 and new.Agent='wbMeta'
declare rcount integer;
begin

    set rcount = 0 ;
    for each row meta in alerts.status where meta.Agent = 'wbMeta' and meta.Type = 1 and meta.AlertGroup = new.AlertGroup and meta.AlertKey = new.AlertKey and meta.Node = new.Node
        begin
        set rcount=rcount+1;
        end;
    if (rcount = 0)
    then
       cancel;
    end if;

end;
go

create or replace trigger rcaGateOnTimeout
group RCA
enabled false
priority 4
comment 'rcam.pl sends a \'failsafe\' resolution trap every 30 seconds or so to \nshow that the system is still receiving alerts and processing them.  It\n can only send this trap when it sees an alert.  The failsafe alert exp\nires immediately and is removed from the system within a few minutes.  \nIf a failsafe trap does not exist in the object server, showAlerts disp\nlays a warning message that will result in an escalation by the NOC.\n\nIf there are no touchpointable traps within a few minutes, which can\nhappen pretty easily, this \'timeout alert is sent by rcam.pl.  The time\nout trap exercises the entire system including mttrapd, the object server,\nthe rcaGateFile all the way back to rcam.pl which reads, processes \nthe trap, and allows the \'failsafe\' resolution trap to get sent.'
before reinsert on alerts.status for each row
when old.AlertGroup = 'rcam.pl get alert'
and
old.Summary like 'timeout'
begin

  call rcaGateQProcess(
      old.Node,
      old.methodProcedure,
      old.wbAgentAlias,
      old.Poll,
      old.wbSmtsIP,
      old.wbNeighbor,
      old.wbCarrier,
      old.rcaProbableCause,
      old.wbTicketID,
      old.AlertGroup,
      old.Summary,
      old.NodeAlias,
      old.FirstOccurrence,
      old.Serial,
      old.rcaSympatRule,
      old.ExpireTime,
      old.Severity,
      old.wbSat,
      old.wbGateway,
      old.Agent,
      old.AlertKey,
      old.wbAgentNode,
      old.Type,
      old.wbInterface,
      old.wbAutomationID,
      old.Customer,
      old.rcaSymptomCount,
      old.Tally,
    'R',
    'rcaGateOnTimeout'
  );
end;
go

create or replace trigger rcaCleanRCAGate
group RCA
enabled false
priority 1
comment 'Trims rcaGate table down to 7 minutes'
before insert on custom.RCAGate for each row
begin

     delete from custom.RCAGate where RCTime < (getdate-420);

end;
go

create or replace trigger rcaGateOnAutomationUpdate
group RCA
enabled false
priority 4
comment 'This trigger sends and update(U) any time the wbAutomationID field\nis updated, which occurs whenever a human requests that an automation\nshould be executed.\nCreated 2009Aug by dmillis'
before update on alerts.status for each row
when old.wbAutomationID <> new.wbAutomationID
begin
   insert into custom.RCAGate (
      Serial,
      Node,
      NodeAlias,
      Agent,
      AlertGroup,
      AlertKey,
      Severity,
      Summary,
      FirstOccurrence,
      Poll,
      Type,
      Tally,
      Location,
      ExpireTime,
      Customer,
      methodProcedure,
      rcaProbableCause,
      rcaSympatRule,
      rcaSymptomCount,
      wbAgentAlias,
      wbAgentNode,
      wbAutomationID,
      wbCarrier,
      wbGateway,
      wbNeighbor,
      wbSat,
      wbSmtsIP,
      wbTicketID,
      wbInterface,
      wbSystem,
      RCServer,
      RCType,
      RCTime
   )
   values
   (
      new.Serial,
      new.Node,
      new.NodeAlias,
      new.Agent,
      new.AlertGroup,
      new.AlertKey,
      new.Severity,
      new.Summary,
      new.FirstOccurrence,
      new.Poll,
      new.Type,
      new.Tally,
      new.Location,
      new.ExpireTime,
      new.Customer,
      new.methodProcedure,
      new.rcaProbableCause,
      new.rcaSympatRule,
      new.rcaSymptomCount,
      new.wbAgentAlias,
      new.wbAgentNode,
      new.wbAutomationID,
      new.wbCarrier,
      new.wbGateway,
      new.wbNeighbor,
      new.wbSat,
      new.wbSmtsIP,
      new.wbTicketID,
      new.wbInterface,
      new.wbSystem,
      %user.host_name,
      'u',
      getdate
   );
end;
go

create or replace trigger rcaGateOnInsert
group RCA
enabled false
priority 4
comment 'This trigger includes RESOLUTION Type events.  TEST TEST TEST'
after insert on alerts.status for each row
when new.NodeAlias <> 'placeholder for new alert process blocking'
begin
  -- insert alerts.status values into RCAGate
   insert into custom.RCAGate (
      Serial,
      Node,
      NodeAlias,
      Agent,
      AlertGroup,
      AlertKey,
      Severity,
      Summary,
      FirstOccurrence,
      Poll,
      Type,
      Tally,
      Location,
      ExpireTime,
      Customer,
      methodProcedure,
      rcaProbableCause,
      rcaSympatRule,
      rcaSymptomCount,
      wbAgentAlias,
      wbAgentNode,
      wbAutomationID,
      wbCarrier,
      wbGateway,
      wbNeighbor,
      wbSat,
      wbSmtsIP,
      wbTicketID,
      wbInterface,
      wbSystem,
      RCServer,
      RCType,
      RCTime
   )
   values
   (
      new.Serial,
      new.Node,
      new.NodeAlias,
      new.Agent,
      new.AlertGroup,
      new.AlertKey,
      new.Severity,
      new.Summary,
      new.FirstOccurrence,
      new.Poll,
      new.Type,
      new.Tally,
      new.Location,
      new.ExpireTime,
      new.Customer,
      new.methodProcedure,
      new.rcaProbableCause,
      new.rcaSympatRule,
      new.rcaSymptomCount,
      new.wbAgentAlias,
      new.wbAgentNode,
      new.wbAutomationID,
      new.wbCarrier,
      new.wbGateway,
      new.wbNeighbor,
      new.wbSat,
      new.wbSmtsIP,
      new.wbTicketID,
      new.wbInterface,
      new.wbSystem,
      %user.host_name,
      'I',
      getdate
   );
end;
go

create or replace trigger rcaGateOnFieldUpdate
group RCA
enabled false
priority 4
comment 'This transition sends an update(U) anytime an updated alert has a field\nset to something we care about.'
before update on alerts.status for each row
when (new.Type <> 2)
and
old.methodProcedure like 'NOC-|INIT-|PROD-|PENDING|TEST'
and
(
  (new.wbTicketID = 'PENDING')
)
begin
   insert into custom.RCAGate (
      Serial,
      Node,
      NodeAlias,
      Agent,
      AlertGroup,
      AlertKey,
      Severity,
      Summary,
      FirstOccurrence,
      Poll,
      Type,
      Tally,
      Location,
      ExpireTime,
      Customer,
      methodProcedure,
      rcaProbableCause,
      rcaSympatRule,
      rcaSymptomCount,
      wbAgentAlias,
      wbAgentNode,
      wbAutomationID,
      wbCarrier,
      wbGateway,
      wbNeighbor,
      wbSat,
      wbSmtsIP,
      wbTicketID,
      wbInterface,
      wbSystem,
      RCServer,
      RCType,
      RCTime
   )
   values
   (
      new.Serial,
      new.Node,
      new.NodeAlias,
      new.Agent,
      new.AlertGroup,
      new.AlertKey,
      new.Severity,
      new.Summary,
      new.FirstOccurrence,
      new.Poll,
      new.Type,
      new.Tally,
      new.Location,
      new.ExpireTime,
      new.Customer,
      new.methodProcedure,
      new.rcaProbableCause,
      new.rcaSympatRule,
      new.rcaSymptomCount,
      new.wbAgentAlias,
      new.wbAgentNode,
      new.wbAutomationID,
      new.wbCarrier,
      new.wbGateway,
      new.wbNeighbor,
      new.wbSat,
      new.wbSmtsIP,
      new.wbTicketID,
      new.wbInterface,
      new.wbSystem,
      %user.host_name,
      'U',
      getdate
   );
end;
go

create or replace trigger rcaGateOnDelete
group RCA
enabled false
priority 4
comment 'Deletes sent on relevant alerts result in the following actions:\n- root cause alerts for this alert have their instance counter decremented\n- all symptom alerts dependent on this root cause alert must have\n  their RCA rerun'
before delete on alerts.status for each row
when old.Type <> 2 and old.methodProcedure like 'NOC-|INIT-|PROD-|PENDING|TEST'
begin

   call jinsert(
       old.Serial+0,
       %user.user_id ,
       getdate,
       'Alert Deleted');

-- insert alerts.status values into RCAGate
   insert into custom.RCAGate (
      Serial,
      Node,
      NodeAlias,
      Agent,
      AlertGroup,
      AlertKey,
      Severity,
      Summary,
      FirstOccurrence,
      Poll,
      Type,
      Tally,
      Location,
      ExpireTime,
      Customer,
      methodProcedure,
      rcaProbableCause,
      rcaSympatRule,
      rcaSymptomCount,
      wbAgentAlias,
      wbAgentNode,
      wbAutomationID,
      wbCarrier,
      wbGateway,
      wbNeighbor,
      wbSat,
      wbSmtsIP,
      wbTicketID,
      wbInterface,
      wbSystem,
      RCServer,
      RCType,
      RCTime
   )
   values
   (
      old.Serial,
      old.Node,
      old.NodeAlias,
      old.Agent,
      old.AlertGroup,
      old.AlertKey,
      old.Severity,
      old.Summary,
      old.FirstOccurrence,
      old.Poll,
      old.Type,
      old.Tally,
      old.Location,
      old.ExpireTime,
      old.Customer,
      old.methodProcedure,
      old.rcaProbableCause,
      old.rcaSympatRule,
      old.rcaSymptomCount,
      old.wbAgentAlias,
      old.wbAgentNode,
      old.wbAutomationID,
      old.wbCarrier,
      old.wbGateway,
      old.wbNeighbor,
      old.wbSat,
      old.wbSmtsIP,
      old.wbTicketID,
      old.wbInterface,
      old.wbSystem,
      %user.host_name,
      'D',
      getdate
   );
end;
go

create or replace trigger rcaGateCheckForAge
group RCA
enabled false
priority 4
comment 'This automation checks to see if the age has exceeded the rca age\nthreshold for the alert.  This has to be done temporally since the\npassage of time is not a database trigger.'
every 30 seconds
evaluate select
      Node,
      methodProcedure,
      wbAgentAlias,
      Poll,
      wbSmtsIP,
      wbNeighbor,
      wbCarrier,
      rcaProbableCause,
      wbTicketID,
      AlertGroup,
      Summary,
      NodeAlias,
      FirstOccurrence,
      Serial,
      rcaSympatRule,
      ExpireTime,
      Severity,
      wbSat,
      wbGateway,
      Agent,
      AlertKey,
      wbAgentNode,
      Type,
      wbInterface,
      wbAutomationID,
      Customer,
      rcaSymptomCount,
      Tally,
      Location,
      wbSystem
  from alerts.status
where methodProcedure='PENDING'
    and (rcaExpire > 0 and FirstOccurrence < (getdate - rcaExpire))
bind as rcaexpire
begin
   for each row rca in rcaexpire
   begin
      insert into custom.RCAGate(
         Serial,
         Node,
         NodeAlias,
         Agent,
         AlertGroup,
         AlertKey,
         Severity,
         Summary,
         FirstOccurrence,
         Poll,
         Type,
         Tally,
         Location,
         ExpireTime,
         Customer,
         methodProcedure,
         rcaProbableCause,
         rcaSympatRule,
         rcaSymptomCount,
         wbAgentAlias,
         wbAgentNode,
         wbAutomationID,
         wbCarrier,
         wbGateway,
         wbNeighbor,
         wbSat,
         wbSmtsIP,
         wbTicketID,
         wbInterface,
         wbSystem,
         RCServer,
         RCType,
         RCTime
      )
      values
      (
         rca.Serial,
         rca.Node,
         rca.NodeAlias,
         rca.Agent,
         rca.AlertGroup,
         rca.AlertKey,
         rca.Severity,
         rca.Summary,
         rca.FirstOccurrence,
         rca.Poll,
         rca.Type,
         rca.Tally,
         rca.Location,
         rca.ExpireTime,
         rca.Customer,
         rca.methodProcedure,
         rca.rcaProbableCause,
         rca.rcaSympatRule,
         rca.rcaSymptomCount,
         rca.wbAgentAlias,
         rca.wbAgentNode,
         rca.wbAutomationID,
         rca.wbCarrier,
         rca.wbGateway,
         rca.wbNeighbor,
         rca.wbSat,
         rca.wbSmtsIP,
         rca.wbTicketID,
         rca.wbInterface,
         rca.wbSystem,
         %user.host_name,
         'u',
         getdate
      );
   end

end;
go

create or replace trigger rcaGateOnTallyIncrement
group RCA
enabled false
priority 4
comment 'This triggers the logging of \'PENDING\' alerts whose m&p assignment\ndepends on the tally value.'
before reinsert on alerts.status for each row
when old.methodProcedure = 'PENDING'
and old.rcaTally <> 0
and old.Tally >= old.rcaTally
begin
   -- insert alerts.status values into RCAGate
   insert into custom.RCAGate (
      Serial,
      Node,
      NodeAlias,
      Agent,
      AlertGroup,
      AlertKey,
      Severity,
      Summary,
      FirstOccurrence,
      Poll,
      Type,
      Tally,
      Location,
      ExpireTime,
      Customer,
      methodProcedure,
      rcaProbableCause,
      rcaSympatRule,
      rcaSymptomCount,
      wbAgentAlias,
      wbAgentNode,
      wbAutomationID,
      wbCarrier,
      wbGateway,
      wbNeighbor,
      wbSat,
      wbSmtsIP,
      wbTicketID,
      wbInterface,
      RCServer,
      RCType,
      RCTime
   )
   values
   (
      old.Serial,
      old.Node,
      old.NodeAlias,
      old.Agent,
      old.AlertGroup,
      old.AlertKey,
      old.Severity,
      old.Summary,
      old.FirstOccurrence,
      old.Poll,
      old.Type,
      old.Tally,
      old.Location,
      old.ExpireTime,
      old.Customer,
      old.methodProcedure,
      old.rcaProbableCause,
      old.rcaSympatRule,
      old.rcaSymptomCount,
      old.wbAgentAlias,
      old.wbAgentNode,
      old.wbAutomationID,
      old.wbCarrier,
      old.wbGateway,
      old.wbNeighbor,
      old.wbSat,
      old.wbSmtsIP,
      old.wbTicketID,
      old.wbInterface,
      %user.host_name,
      'T',
      getdate
   );
end;
go

create or replace trigger rcaGateOnTallyIncrementTemporal
group RCA
enabled false
priority 4
comment 'This triggers checks for \'PENDING\' alerts whose m&p assignment\n\ndepends on the tally value. Created by dmillis, based on a trigger stolen from aellis'
every 11 seconds
begin

for each row tallyup in alerts.status where
   tallyup.methodProcedure = 'PENDING'
   and tallyup.rcaTally <> 0
   and tallyup.Tally >= tallyup.rcaTally
   begin
      insert into custom.RCAGate (
         Serial,
         Node,
         NodeAlias,
         Agent,
         AlertGroup,
         AlertKey,
         Severity,
         Summary,
         FirstOccurrence,
         Poll,
         Type,
         Tally,
         Location,
         ExpireTime,
         Customer,
         methodProcedure,
         rcaProbableCause,
         rcaSympatRule,
         rcaSymptomCount,
         wbAgentAlias,
         wbAgentNode,
         wbAutomationID,
         wbCarrier,
         wbGateway,
         wbNeighbor,
         wbSat,
         wbSmtsIP,
         wbTicketID,
         wbInterface,
         wbSystem,
         RCServer,
         RCType,
         RCTime
      )
      values
      (
         tallyup.Serial,
         tallyup.Node,
         tallyup.NodeAlias,
         tallyup.Agent,
         tallyup.AlertGroup,
         tallyup.AlertKey,
         tallyup.Severity,
         tallyup.Summary,
         tallyup.FirstOccurrence,
         tallyup.Poll,
         tallyup.Type,
         tallyup.Tally,
         tallyup.Location,
         tallyup.ExpireTime,
         tallyup.Customer,
         tallyup.methodProcedure,
         tallyup.rcaProbableCause,
         tallyup.rcaSympatRule,
         tallyup.rcaSymptomCount,
         tallyup.wbAgentAlias,
         tallyup.wbAgentNode,
         tallyup.wbAutomationID,
         tallyup.wbCarrier,
         tallyup.wbGateway,
         tallyup.wbNeighbor,
         tallyup.wbSat,
         tallyup.wbSmtsIP,
         tallyup.wbTicketID,
         tallyup.wbInterface,
         tallyup.wbSystem,
         %user.host_name,
         'T',
         getdate
      );
   end

end;
go

create or replace trigger deduplication
group default_triggers
priority 1
comment 'Deduplication processing for ALERTS.STATUS'
before reinsert on alerts.status for each row
begin

	if( %user.app_name = 'PROBE' )
	then
		if( (old.LastOccurrence > new.LastOccurrence) or 
		   ((old.ProbeSubSecondId >= new.ProbeSubSecondId) and 
	  	    (old.LastOccurrence = new.LastOccurrence) ) )
		then
			cancel;
		end if;
	end if;

	set old.Tally = old.Tally + 1;
	set old.LastOccurrence =  new.LastOccurrence;
	set old.StateChange = getdate();
	set old.InternalLast = getdate();
	set old.Summary = new.Summary;
	set old.AlertKey = new.AlertKey;
	set old.ProbeSubSecondId = new.ProbeSubSecondId;
	if (( old.Severity = 0) and (new.Severity > 0))
	then
		set old.Severity = new.Severity;
	end if;
end;
go

create or replace trigger agg_deduplication
group default_triggers
priority 2
comment 'Replacement reinsert trigger (alerts.status) for multi-ObjectServer environments.'
before reinsert on alerts.status for each row
declare now utc;
begin
set now = getdate();

-- CANCEL ATTEMPTS BY PROBES TO REINSERT OLD EVENTS
if (%user.app_name = 'PROBE') then

   if ((old.LastOccurrence > new.LastOccurrence) or
      ((old.ProbeSubSecondId >= new.ProbeSubSecondId) and
      (old.LastOccurrence = new.LastOccurrence))) then

      cancel;
   end if;
end if;

-- IF REINSERT IS COMING FROM A FAILOVER GATEWAY
if (%user.description = 'failover_gate') then

   set row old = new;

   -- ELSE REINSERT IS NOT COMING FROM A FAILOVER GATEWAY
   else

   -- IF REINSERT IS COMING FROM A COLLECTION GATEWAY
   if (%user.description = 'collection_gate') then

      -- ADD INCOMING TALLY TO CURRENT TOTAL
      set old.Tally = old.Tally + new.Tally;

      -- ELSE REINSERT IS NOT COMING FROM ANY GATEWAY
   else

   -- SIMPLY INCREMENT TALLY
   set old.Tally = old.Tally + 1;

   end if;

   -- SET LastOccurrence IF NOT SET
   if (new.LastOccurrence = 0) then

      set old.LastOccurrence = now;

      -- ELSE USE THE INCOMING VALUE
      else

      set old.LastOccurrence = new.LastOccurrence;
   end if;

   -- UPDATE THE FOLLOWING FIELDS ON DEDUPLICATION
   set old.Type = new.Type;
--   set old.Summary = new.Summary;
   set old.AlertKey = new.AlertKey;
   set old.wbProbe = new.wbProbe;
   set old.ProbeSubSecondId = new.ProbeSubSecondId;
   if (old.methodProcedure not like '[0-9][0-9]|[0-9][0-9]') then 
      set old.Severity = new.Severity;
      else 
      if (( old.Severity = 0) and (new.Severity > 0)) then 
      set old.Severity = new.Severity;
    end if; 

   end if;
  -- UPDATE SUMMARY IF WBVIEW IS SET 
  if (old.wbView != '') then
      set old.Summary = new.Summary + ' <' + old.wbView + '>';
      else 
      set old.Summary = new.Summary;
   end if;

end if;

  -- UPDATE THE FOLLOWING WITH THE CURRENT TIMESTAMP
   set old.StateChange = now;
   set old.InternalLast = now;
end;
go

create or replace trigger aen_heartbeat
group default_triggers
enabled false
priority 1
comment 'Send a heartbeat command to the AEN clients to keep the connection alive'
every 180 seconds
begin
	iduc actcmd 'default', 'heartbeat ping';
end;
go

create or replace trigger delete_clears_VS
group default_triggers
enabled false
priority 1
comment ''
every 23 seconds
begin



    delete from alerts.status where
        Severity = 0 and StateChange < (getdate() - 120)
        and (
           ( methodProcedure not like '^NOC-.*[0-9]+' and methodProcedure not like '^PROD-.*[0-9]+' and methodProcedure not like '^NIT-.*[0-9]+')
            or
            ( Acknowledged > 0 or SuppressEscl > getdate or rcaProbableCause > 0 )
        )

end;
go

create or replace trigger service_update
group default_triggers
priority 1
comment 'Service processing for service.status'
before update on service.status for each row
declare time_now time;
begin
	set time_now = getdate();

	if ( old.CurrentState != new.CurrentState )
	then
		set new.StateChange = time_now;
	end if;

	if ( new.CurrentState = 0 )
	then
		set new.LastGoodAt = time_now;
	elseif ( new.CurrentState = 1 )
	then
		set new.LastMarginalAt = time_now;
	elseif ( new.CurrentState = 2 )
	then
		set new.LastBadAt = time_now;
	end if;

	set new.LastReportAt = time_now;
end;
go

create or replace trigger clean_journal_table
group default_triggers
priority 1
comment 'Housekeeping cleanup of ALERTS.JOURNAL'
every 60 seconds
begin
	delete from alerts.journal where Serial not in (select Serial from alerts.status);
end;
go

create or replace trigger mail_on_probe_failure
group default_triggers
debug true
enabled false
priority 1
comment 'Send email about critical alerts that are unacknowledged after 30 minutes. NOTE This tool is UNIX specific unless an equivalent NT mailer is available.\n for each row critical in alerts.status where critical.Severity = 5 and critical.Grade < 2 and \n\t\t\t\t\t\t\tcritical.Acknowledged = 0 and \n\t\t\t\t\t\t\tcritical.LastOccurrence <= ( getdate() - (60*30) )\n        begin\n                execute send_email( critical.Node, critical.Severity, \'Netcool Email\', \'jeffrey.mclean@viasat.com,kenneth.jenkins@viasat.com\', critical.Summary, \'localhost\');\n                update alerts.status via critical.Identifier set Grade=2;\n        end;'
every 30 seconds
begin

        for each row critical in alerts.status where critical.Severity = 5 and critical.Manager = 'ConnectionWatch' and critical.Summary like 'disconnected as username probe' and critical.Grade < 2
        begin
                execute send_email( critical.Node, critical.Severity, 'Critical: Omnibus Probe has disconnected', 'jeffrey.mclean@viasat.com,kenneth.jenkins@viasat.com,molly.vang@viasat.com', critical.Summary, 'localhost');
                update alerts.status via critical.Identifier set Grade=2;
        end;

end;
go

create or replace trigger service_insert
group default_triggers
priority 1
comment 'Service processing for service.status'
before insert on service.status for each row
begin
	if ( new.CurrentState = 0 )
	then
		set new.LastBadAt = 0;
		set new.LastMarginalAt = 0;
	elseif ( new.CurrentState = 1 )
	then
		set new.LastBadAt = 0;
		set new.LastGoodAt = 0;
	elseif ( new.CurrentState = 2 ) or ( new.CurrentState = 3 )
	then	
		set new.LastGoodAt = 0;
		set new.LastMarginalAt = 0;
	end if;
end;
go

create or replace trigger service_reinsert
group default_triggers
priority 1
comment 'Service processing for service.status'
before reinsert on service.status for each row
begin
	set old.LastReportAt = new.LastReportAt;

	if ( old.CurrentState != new.CurrentState )
	then
		set old.CurrentState = new.CurrentState;
		set old.StateChange = new.StateChange;
	end if;

	if ( new.CurrentState = 0 )
	then
		set old.LastGoodAt = new.LastGoodAt;
	elseif ( new.CurrentState = 1 )
	then
		set old.LastMarginalAt = new.LastMarginalAt;
	elseif ( new.CurrentState = 2 )
	then
		set old.LastBadAt = new.LastBadAt;
	end if;
end;
go

create or replace trigger clean_details_table
group default_triggers
priority 1
comment 'Housekeeping cleanup of ALERTS.DETAILS'
every 60 seconds
begin
	delete from alerts.details where Identifier not in (select Identifier from alerts.status);
end;
go

create or replace trigger state_change
group default_triggers
priority 1
comment 'State change processing for ALERTS.STATUS'
before update on alerts.status for each row
begin
	set new.StateChange = getdate();
end;
go

create or replace trigger wbDeleteNoise
group default_triggers
enabled false
priority 1
comment ''
every 300 seconds
begin

delete from alerts.status where 

(AlertGroup like 'cscaFilterChange' ) OR (AlertGroup like 'Generic Authentication') OR (AlertGroup like 'Configuration Change')

end;
go

create or replace trigger agg_new_row
group default_triggers
priority 2
comment 'Replacement insert trigger (alerts.status) for multi-ObjectServer environments.'
before insert on alerts.status for each row
declare now utc;
begin

	-- USE A TEMPORARY VARIABLE TO STORE THE CURRENT TIMESTAMP
	set now = getdate();

	-- SET InternalLast AND StateChange
	set new.InternalLast = now;
	set new.StateChange = now;

	-- SET ServerName AND ServerSerial IF INSERT NOT COMING FROM AN OBJECTSERVER GATEWAY
	if (%user.description not in ('collection_gate', 'failover_gate') or
		new.ServerSerial = 0 or
		new.ServerName = '') then

                set new.ServerName = getservername();
                set new.ServerSerial = new.Serial;
        end if;

	-- SET FirstOccurrence IF NOT SET
	if (new.FirstOccurrence = 0) then

		set new.FirstOccurrence = now;
	end if;

	-- SET LastOccurrence IF NOT SET
	if (new.LastOccurrence = 0) then

		set new.LastOccurrence = now;
	end if;

	-- SET TALLY TO 1 IF SET TO 0.  THIS CAN HAPPEN WHEN
	-- A COLLECTION-TO-AGGREGATION RESYNC TAKES PLACE
	if (new.Tally = 0) then

		set new.Tally = 1;
	end if;
end;
go

create or replace trigger new_row
group default_triggers
priority 1
comment 'Set default values for new alerts in ALERTS.STATUS'
before insert on alerts.status for each row
begin
	if ( ( %user.is_gateway = false ) OR (( new.Manager = 'GatewayWatch' ) AND ( new.ServerSerial = 0 )) )
	then
              set new.Tally = 1;
	      set new.ServerName = getservername();
	end if;
	set new.StateChange = getdate();
	set new.InternalLast = getdate();

	if( new.ServerSerial = 0 )
	then
		set new.ServerSerial = new.Serial;
	end if;

	if( new.LastOccurrence = 0 )
	then
		set new.LastOccurrence = getdate();
	end if;

end;
go

create or replace trigger deduplicate_details
group default_triggers
priority 1
comment 'Deduplicate rows on alerts.details'
before reinsert on alerts.details for each row
begin
	cancel; -- Do nothing. Allow the row to be discarded
end;
go

create or replace trigger timestamp_inserts
group default_triggers
priority 3
comment 'Records timestamps for insertion into each tier (alerts.status) in multi-ObjectServer environments.'
before insert on alerts.status for each row
begin

	-- SET TIMESTAMP AggregationFirst IF NOT SET
	if (new.AggregationFirst = 0) then

		set new.AggregationFirst = getdate();
	end if;
end;
go

create or replace trigger connection_watch_connect
group connection_watch
priority 1
comment 'Create an alert when a new client connects\nThe process name identified by the signal is matched against the applications table to identify the appropriate severity and event type for the connect.\nA gateway connection for example is treated as a resolution (clearing a disconnect), whereas an eventlist connect is a Type 1 event which will be resolved by a disconnect) '
on signal connect
declare -- Define variables
	cseverity	int;
	alert_type	int;
	expire_time	int;
	app_found	boolean;
	app_group	char(64);
begin
	-- Initialise variables to defaults 
	set cseverity = 2;
	set alert_type = 1;
	set expire_time = 0;
	set app_found = FALSE;

	-- Some clients may not provide signal descriptions. For simplicity the 
	-- Summary format assumes that a description will be present. First set 
	-- indicators that determine which format of event to write and the 
	-- Severity and Type for the event

	for each row my_app in alerts.application_types where %signal.process like my_app.application
	begin
		if (my_app.discard = TRUE) then
			cancel;
		end if;
		set cseverity = my_app.connect_severity;
		set alert_type = my_app.connect_type;
		set app_group = my_app.description;
		set app_found = TRUE;
		break;
	end;
	if (%signal.process = 'PROBE' and %signal.description = 'syntax') then
	-- For a syntax check this is a test connection event that will clear 
	-- very quickly, set as a problem event over-riding the normal values 
	-- for a probe connect
		set alert_type = 1;
		set cseverity = 1;
		set expire_time = 180;
	end if;

	-- No entry in the table for the process
	if ( app_found = FALSE ) then
		-- An unknown process, that doesn't have a name associated
		-- with it has connected. Insert the event with a high severity
		if  ( %signal.process = '' ) then
			set app_group = 'Unknown Application';
			set cseverity = 4;
		else
		-- We don't have an entry in the table for the application but 
		-- it has supplied a non-null application name which we will use
			set app_group = %signal.process;
		end if;
	end if;

	if (%signal.username = '') then
		insert into alerts.status (Identifier, Summary, Node, Manager, Type, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID, ExpireTime) values (%signal.process+':'+%signal.description+'@'+%signal.node+' connected '+to_char(%signal.at), 'A '+%signal.process+' process '+%signal.description+' running on '+%signal.node+' has connected', %signal.node, 'ConnectionWatch', alert_type, cseverity, %signal.at, %signal.at, app_group, %signal.process+':'+%signal.description, 65534, expire_time);
	else
		insert into alerts.status (Identifier, Summary, Node, Manager, Type, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID,ExpireTime) values (%signal.process+':'+%signal.description+'@'+%signal.node+'connected'+to_char(%signal.at), 'A '+%signal.process+' process '+%signal.description+' running on '+%signal.node+' has connected as username '+%signal.username, %signal.node, 'ConnectionWatch', alert_type, cseverity, %signal.at, %signal.at,app_group, %signal.process+':'+%signal.description, 65534,expire_time);
	end if;
end;
go

create or replace trigger connection_watch_disconnect
group connection_watch
priority 1
comment 'Create an alert when a client disconnects\nThe process name identified by the signal is matched against the applications table to identify the appropriate severity and event type for the disconnect.\nA gateway disconnection for example is treated as a problem, where as an eventlist disconnect is a resolution'
on signal disconnect
declare -- Define variables
	cseverity	int;
	alert_type	int;
	app_found	boolean;
	app_group	char(64);
begin
	-- Initialise variables to defaults 
	set cseverity = 2;
	set alert_type = 2;
	set app_found = FALSE;

	-- Some clients may not provide signal descriptions. For simplicity the Summary 
	-- format assumes that a description will be present. first set indicators that 
	-- determine which format of event to write and the Severity and Type for 
	-- the event
	for each row my_app in alerts.application_types where %signal.process like my_app.application
	begin
		if (my_app.discard = TRUE) then
			cancel;
		end if;
		set cseverity = my_app.disconnect_severity;
		set alert_type = my_app.disconnect_type;
		set app_group = my_app.description;
		set app_found = TRUE;
		break;
	end;
	if (%signal.process = 'PROBE' and %signal.description = 'syntax') then
	-- For a syntax check this is a test connection event that will clear 
	-- very quickly, set as a problem event over-riding the normal values 
	-- for a probe connect
			set alert_type = 2;
			set cseverity = 1;
	end if;
	
	-- No entry in the table for the process
	if ( app_found = FALSE ) then
		-- An unknown process, that doesn't have a name associated is
		-- disconnecting
		if  ( %signal.process = '' ) then
			set app_group = 'Unknown Application';
		else
		-- We don't have an entry in the table for the application but 
		-- it has supplied a non-null application name which we will use
			set app_group = %signal.process;
		end if;
	end if;
	
	if (%signal.username = '') then
		insert into alerts.status (Identifier, Summary, Node, Manager, Type, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values (%signal.process+':'+%signal.description+'@'+%signal.node+'disconnected '+to_char(%signal.at), 'A '+%signal.process+' process '+%signal.description+' running on '+%signal.node+' has disconnected', %signal.node, 'ConnectionWatch', alert_type, cseverity, %signal.at, %signal.at, app_group, %signal.process+':'+%signal.description, 65534);
	else
		insert into alerts.status (Identifier, Summary, Node, Manager, Type, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values (%signal.process+':'+%signal.description+'@'+%signal.node+'disconnected'+to_char(%signal.at), 'A '+%signal.process+' process '+%signal.description+' running on '+%signal.node+' has disconnected as username '+%signal.username, %signal.node, 'ConnectionWatch', alert_type, cseverity, %signal.at, %signal.at,app_group, %signal.process+':'+%signal.description, 65534);
	end if;
end;
go

create or replace trigger generic_clear
group primary_only
priority 1
comment 'Generic Problem/Resolution'
every 5 seconds
begin
	-- Populate a table with Type 1 events corresponding to any uncleared Type 2 events
	for each row problem in alerts.status where
				problem.Type = 1 and problem.Severity > 0 and
                                (problem.Node + problem.AlertKey + problem.AlertGroup + problem.Manager) in
                                ( select Node + AlertKey + AlertGroup + Manager from alerts.status where Severity > 0 and Type = 2 ) 
	begin
		insert into alerts.problem_events values ( problem.Identifier, problem.LastOccurrence, 
							problem.AlertKey, problem.AlertGroup, 
							problem.Node, problem.Manager, false );
	end;

	-- For each resolution event, mark the corresponding problem_events entry as resolved
	-- and clear the resolution
	for each row resolution in alerts.status where resolution.Type = 2 and resolution.Severity > 0
	begin
		set resolution.Severity = 0;
		update alerts.problem_events set Resolved = true where 
				LastOccurrence < resolution.LastOccurrence and 
				Manager = resolution.Manager and Node = resolution.Node and 
				AlertKey = resolution.AlertKey and AlertGroup = resolution.AlertGroup ;
	end;

	-- Clear the resolved events
	for each row problem in alerts.problem_events where problem.Resolved = true
	begin
		update alerts.status via problem.Identifier set Severity = 0;	
	end;

	-- Remove all entries from the problems table
	delete from alerts.problem_events;
end;
go

create or replace trigger escalate_off
group primary_only
enabled false
priority 1
comment 'Will set Flash field to 0 (not flashing) and SuppressEscl to 0 (not escalated in this example) when an event that has previously had the Flash field set to 1 is Acknowledged or if the event is Cleared (Severity = 0).'
every 6 seconds
begin
	update alerts.status set Flash = 0, SuppressEscl = 0 where (Flash = 1 or SuppressEscl > 0) and (Acknowledged = 1 or Severity = 0);
end;
go

create or replace trigger expire
group primary_only
priority 1
comment 'Expiration'
every 60 seconds
begin
	for each row expire in alerts.status where expire.ExpireTime > 0 and expire.Severity > 0
	begin
		update alerts.status via expire.Identifier set Severity = 0 where LastOccurrence < (getdate() - expire.ExpireTime);
	end;	
end;
go

create or replace trigger delete_clears
group primary_only
priority 1
comment 'Delete clear alerts over 2 minutes old in ALERTS.STATUS every 60 seconds'
every 60 seconds
begin
	delete from alerts.status where Severity = 0 and StateChange < (getdate() - 120);
end;
go

create or replace trigger mail_on_critical
group primary_only
enabled false
priority 1
comment 'Send email about critical alerts that are unacknowledged after 30 minutes. NOTE This tool is UNIX specific unless an equivalent NT mailer is available.'
every 10 seconds
begin
        for each row critical in alerts.status where critical.Severity = 5 and critical.Grade < 2 and 
							critical.Acknowledged = 0 and 
							critical.LastOccurrence <= ( getdate() - (60*30) )
        begin
                execute send_email( critical.Node, critical.Severity, 'Netcool Email', 'root@localhost', critical.Summary, 'localhost');
                update alerts.status via critical.Identifier set Grade=2;
        end;
end;
go

create or replace trigger flash_not_ack
group primary_only
enabled false
priority 1
comment 'Will set Flashing on (Flash=1) for events that are Critical (Severity=5) and are 10 minutes old but have not been acknowledged by a user yet (Acknowledge = 0). It sets SuppressEscl to 1 as a further indication of the events escalation status.'
every 31 seconds
begin
	update alerts.status set Flash = 1, SuppressEscl = 1 where Flash = 0 and Acknowledged = 0 and Severity = 5 and FirstOccurrence <= (getdate - 600);
end;
go

create or replace trigger resync_complete
group primary_only
priority 1
comment 'Creates synthetic events to indicate when Gateways have completed resynchronisation.'
on signal gw_resync_finish
declare now utc;
	summary_string char(512);
begin

	-- INITIALISE VARIABLE
	set now = getdate();
	set summary_string = '';

	-- CONSTRUCT SUMMARY STRING
	if (%user.description = 'collection_gate') then

		set summary_string = 'Collection ';

	elseif (%user.description = 'failover_gate') then

		set summary_string = 'Failover ';

	elseif (%user.description = 'display_gate') then

		set summary_string = 'Display ';

	end if;

	set summary_string = summary_string +
		'Gateway resynchronisation complete on ' +
		%user.host_name +
		'.'; 

	-- INSERT A SYNTHETIC EVENT TO INDICATE GATEWAY RESYNCHRONISATION COMPLETION
	insert into alerts.status (
		Identifier,
		Node,
		Summary,
		Type,
		Severity,
		FirstOccurrence,
		LastOccurrence,
		Tally,
		ExpireTime,
		AlertGroup,
		OwnerUID,
		Manager)
	values (
		'gateway_resync_' + to_char(now) + '_' + %user.description + '_' + to_char(%user.connection_id),
		get_prop_value('Hostname'),
		summary_string,
		13,
		2,
		now,
		now,
		1,
		86400,
		'nco_objserv',
		65534,
		'SystemWatch');

end;
go

create or replace trigger disable_user
group security_watch
priority 1
comment 'Disable users when they fail to log on after n consecutive failures'
on signal login_failed
declare failurecount	unsigned;
	userfound	boolean;
begin
	set failurecount = 5;
	set userfound = false;

	for each row disable_user in alerts.login_failures where
                            disable_user.UserName = %signal.username 
	begin
		if ( disable_user.FailureCount >= failurecount )
		then
			-- Zero the failure count - to ensure they aren't disabled immediately the user is re-enabled.
			set disable_user.FailureCount = 0;
			set disable_user.LastFailure = getdate();
			
			-- Disable the user.
			alter user %signal.username set enabled false;
			
			-- Put an event into alerts.status.
			insert into alerts.status (Identifier, Summary, Node, Manager, Type, Severity, FirstOccurrence, LastOccurrence, AlertGroup, OwnerUID) values ('Disabling user '+%signal.username+' from host '+%signal.node+' failure count exceeded', 'Disabling user '+%signal.username+' from host '+%signal.node+' failure count exceeded', %signal.node, 'SecurityWatch', 1, 5, %signal.at, %signal.at, %signal.process, 65534);
		elseif ( disable_user.FailureCount < failurecount )
            	then
			-- Increment the failure count for the user
			set disable_user.FailureCount = disable_user.FailureCount+1;
			set disable_user.LastFailure = getdate();
		end if;

		set userfound = true;	
	end;

	-- If the user wasn't in the table, add them now.
	if ( userfound = false )
	then
		for each row existing_user in security.users where
                            existing_user.UserName = %signal.username 
		begin
			insert into alerts.login_failures ( UserName, LastFailure, FailureCount ) values ( %signal.username, getdate(), 1 );
		end;
	end if;
end;
go

create or replace trigger disable_inactive_users
group security_watch
enabled false
priority 1
comment 'Disable users that have not logged on to the objectserver within a defined period'
every 86400 seconds
declare inactive_period integer;
	inactive_days integer;
begin

        -- Set the number of days a user can be inactive for
	set inactive_days = 30;

	-- Calculate time in seconds for the inactive period
        set inactive_period = 60 * 60 * 24 * inactive_days;

	-- Find all users that haven't successfully logged on in more than the allowed time.
        for each row disable_user in alerts.login_failures where
                disable_user.LastGood != 0 
		and ( disable_user.LastGood + inactive_period ) < getdate() 
		and disable_user.UserName in ( Select UserName from security.users )
        begin
                -- Disable the user.
                alter user disable_user.UserName set enabled false;

                -- Insert an event.
                insert into alerts.status (Identifier, Summary, Manager, Type, Severity, FirstOccurrence, LastOccurrence, AlertGroup, OwnerUID) 
					   values  ('Disabling user '+disable_user.UserName+' User has been inactive for ' + to_char( inactive_days ) + ' days.', 
					    	    'Disabling user '+disable_user.UserName+' User has been inactive for ' + to_char( inactive_days ) + ' days.',  
						    'SecurityWatch', 1, 5, getdate(), getdate(), 'nco_objserv', 65534);

        end;
end;
go

create or replace trigger reset_user
group security_watch
priority 1
comment 'Reset the users failure count when they logon successfully.'
on signal connect
declare userfound	boolean;
begin
	set userfound = false;
	for each row disable_user in alerts.login_failures where
		disable_user.UserName = %signal.username 
	begin
		-- Reset the number of failures for this user.
		set disable_user.FailureCount = 0;
		set disable_user.LastGood = getdate();
		set userfound = true;
	end;

	-- If the user wasn't in the table, add them now
	if ( userfound = false )
	then
		insert into alerts.login_failures ( UserName, LastGood, FailureCount ) values ( %signal.username, getdate(), 0 );
	end if;
end;
go

create or replace trigger security_watch_security_failure
group security_watch
priority 1
comment 'Create an alert when a client fails to authenticate'
on signal login_failed
begin
	if( %signal.process = 'nco_objserv' ) then
		insert into alerts.status (Identifier, Summary, Node, Manager, Type, Severity, FirstOccurrence, LastOccurrence, AlertGroup, OwnerUID) values ( 'ObjectServer on ' + %signal.node + ' failed to connect as user ' + %signal.username, 'ObjectServer on ' + %signal.node + ' failed to connect as user ' + %signal.username, %signal.node, 'SecurityWatch', 1, 4, %signal.at, %signal.at, %signal.process, 65534);
	else
		insert into alerts.status (Identifier, Summary, Node, Manager, Type, Severity, FirstOccurrence, LastOccurrence, AlertGroup, OwnerUID) values ('Attempt to login as '+%signal.username+' from host '+%signal.node+' failed', 'Attempt to login as '+%signal.username+' from host '+%signal.node+' failed', %signal.node, 'SecurityWatch', 1, 4, %signal.at, %signal.at, %signal.process, 65534);
	end if;
end;
go

create or replace trigger audit_config_alter_object
group audit_config
priority 1
comment 'Create an alert indicating that an object has been altered'
on signal alter_object
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ( %signal.objecttype+%signal.name+'@'+%signal.node+to_char(getdate()), %signal.objecttype+' '+%signal.name+' on ObjectServer '+%signal.server+' running on '+%signal.node+'. Altered by user '+%signal.username+' at '+to_char(%signal.at)+' on host '+%signal.hostname, %signal.node, 'SystemWatch', 2, %signal.at,%signal.at, 'ObjectAudit', %signal.name, 65534 );
end;
go

create or replace trigger audit_config_drop_col_visual
group audit_config
priority 1
comment 'Create an alert indicating that a column visual has been dropped'
after delete on alerts.col_visuals for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('DropColVisual'+old.Colname+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Drop column visual '+old.Colname+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' dropped at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'ColVisAudit', old.Colname, 65534 );
end;
go

create or replace trigger audit_config_drop_object
group audit_config
priority 1
comment 'Create an alert indicating that an object has been dropped'
on signal drop_object
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ( %signal.objecttype+%signal.name+'@'+%signal.node+to_char(getdate()), %signal.objecttype+' '+%signal.name+' on ObjectServer '+%signal.server+' running on '+%signal.node+'. Dropped by user '+%signal.username+' at '+to_char(%signal.at)+' on host '+%signal.hostname, %signal.node, 'SystemWatch', 2, %signal.at,%signal.at, 'ObjectAudit', %signal.name, 65534 );
end;
go

create or replace trigger audit_config_create_tool
group audit_config
priority 1
comment 'Create an alert indicating that a tool has been created'
after insert on tools.actions for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('CreateTool'+new.Name+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Create tool '+new.Name+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' created at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'ToolAudit', new.Name, 65534 );
end;
go

create or replace trigger audit_config_alter_prompt
group audit_config
priority 1
comment 'Create an alert indicating that a prompt has been altered'
after update on tools.prompt_defs for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('AlterPrompt'+new.Name+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Alter prompt '+new.Name+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' altered at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'PromptAudit', new.Name, 65534 );
end;
go

create or replace trigger audit_config_alter_class
group audit_config
priority 1
comment 'Create an alert indicating that a class has been altered'
after update on alerts.objclass for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('AlterClass'+new.Name+to_char(new.Tag)+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Alter class '+new.Name+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' altered at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'ClassAudit', new.Name, 65534 );
end;
go

create or replace trigger audit_config_alter_col_visual
group audit_config
priority 1
comment 'Create an alert indicating that a column visual has been altered'
after update on alerts.col_visuals for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('AlterColVisual'+new.Colname+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Alter column visual '+new.Colname+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' altered at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'ColVisAudit', new.Colname, 65534 );
end;
go

create or replace trigger audit_config_drop_tool
group audit_config
priority 1
comment 'Create an alert indicating that a tool has been dropped'
after delete on tools.actions for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('DropTool'+old.Name+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Drop tool '+old.Name+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' dropped at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'ToolAudit', old.Name, 65534 );
end;
go

create or replace trigger audit_config_drop_prompt
group audit_config
priority 1
comment 'Create an alert indicating that a prompt has been dropped'
after delete on tools.prompt_defs for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('DropPrompt'+old.Name+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Drop prompt '+old.Name+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' dropped at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'PromptAudit', old.Name, 65534 );
end;
go

create or replace trigger audit_config_create_class
group audit_config
priority 1
comment 'Create an alert indicating that a class has been created'
after insert on alerts.objclass for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('CreateClass'+new.Name+to_char(new.Tag)+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Create class '+new.Name+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' created at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'ClassAudit', new.Name, 65534 );
end;
go

create or replace trigger audit_config_alter_menu
group audit_config
priority 1
comment 'Create an alert indicating that a menu has been altered'
after update on tools.menu_items for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('AlterMenu'+new.Title+new.KeyField+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Alter menu '+new.Title+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' altered at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'MenuAudit', new.Title, 65534 );
end;
go

create or replace trigger audit_config_alter_conv
group audit_config
priority 1
comment 'Create an alert indicating that a conversion has been altered'
after update on alerts.conversions for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('AlterConv'+new.Colname+new.KeyField+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Alter conversion '+new.Colname+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' altered at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'ConversionAudit', new.Colname, 65534 );
end;
go

create or replace trigger audit_config_create_menu
group audit_config
priority 1
comment 'Create an alert indicating that a menu has been created'
after insert on tools.menu_items for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('CreateMenu'+new.Title+new.KeyField+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Create menu '+new.Title+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' created at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'MenuAudit', new.Title, 65534 );
end;
go

create or replace trigger audit_config_create_prompt
group audit_config
priority 1
comment 'Create an alert indicating that a prompt has been created'
after insert on tools.prompt_defs for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('CreatePrompt'+new.Name+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Create prompt '+new.Name+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' created at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'PromptAudit', new.Name, 65534 );
end;
go

create or replace trigger audit_config_alter_tool
group audit_config
priority 1
comment 'Create an alert indicating that a tool has been altered'
after update on tools.actions for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('AlterTool'+new.Name+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Alter tool '+new.Name+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' altered at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'ToolAudit', new.Name, 65534 );
end;
go

create or replace trigger audit_config_create_col_visual
group audit_config
priority 1
comment 'Create an alert indicating that a column visual has been created'
after insert on alerts.col_visuals for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('CreateColVisual'+new.Colname+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Create column visual '+new.Colname+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' created at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'ColVisAudit', new.Colname, 65534 );
end;
go

create or replace trigger audit_config_create_conv
group audit_config
priority 1
comment 'Create an alert indicating that a conversion has been created'
after insert on alerts.conversions for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('CreateConv'+new.Colname+new.KeyField+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Create conversion '+new.Colname+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' created at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'ConversionAudit', new.Colname, 65534 );
end;
go

create or replace trigger audit_config_alter_property
group audit_config
priority 1
comment 'Create an alert indicating that a property has been altered'
on signal alter_property
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ( 'AlterProperty'+%signal.name+'@'+%signal.node+to_char(getdate()), 'Alter property'+' '+%signal.name+' on ObjectServer '+%signal.server+' running on '+%signal.node+'. Altered by user '+%signal.username+' at '+to_char(%signal.at), %signal.node, 'SystemWatch', 2, %signal.at,%signal.at, 'PropertyAudit', 'Properties', 65534 );
end;
go

create or replace trigger audit_config_permission_denied
group audit_config
priority 1
comment 'Create an alert indicating that a permission denied'
on signal permission_denied
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ( 'permissiondenied'+'@'+%signal.node+to_char(getdate()), 'Permission was denied on ObjectServer '+%signal.server+' running on '+%signal.node+ '. Executed by user '+%signal.username+' at '+to_char(%signal.at)+' on host '+%signal.hostname+', '+%signal.sql_cmd, %signal.node, 'SystemWatch', 2, %signal.at,%signal.at, 'ObjectAudit', 'PermissionDenied', 65534 );
end;
go

create or replace trigger audit_config_drop_conv
group audit_config
priority 1
comment 'Create an alert indicating that a conversion has been dropped'
after delete on alerts.conversions for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('DropConv'+old.Colname+old.KeyField+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Drop conversion '+old.Colname+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' dropped at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'ConversionAudit', old.Colname, 65534 );
end;
go

create or replace trigger audit_config_drop_class
group audit_config
priority 1
comment 'Create an alert indicating that a class has been dropped'
after delete on alerts.objclass for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('DropClass'+old.Name+to_char(old.Tag)+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Drop class '+old.Name+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' dropped at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'ClassAudit', old.Name, 65534 );
end;
go

create or replace trigger audit_config_drop_menu
group audit_config
priority 1
comment 'Create an alert indicating that a menu has been dropped'
after delete on tools.menu_items for each row
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ('DropMenu'+old.Title+old.KeyField+'@'+get_prop_value('Hostname')+to_char(getdate()), 'Drop menu '+old.Title+' on ObjectServer '+get_prop_value('Name')+' running on '+get_prop_value('Hostname')+' dropped at '+to_char(getdate()),get_prop_value('Hostname'), 'SystemWatch', 2, getdate(),getdate(), 'MenuAudit', old.Title, 65534 );
end;
go

create or replace trigger audit_config_create_object
group audit_config
priority 1
comment 'Create an alert indicating that an object has been created'
on signal create_object
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey, OwnerUID) values ( %signal.objecttype+%signal.name+'@'+%signal.node+to_char(getdate()), %signal.objecttype+' '+%signal.name+' on ObjectServer '+%signal.server+' running on '+%signal.node+'. Created by user '+%signal.username+' at '+to_char(%signal.at)+' on host '+%signal.hostname, %signal.node, 'SystemWatch', 2, %signal.at,%signal.at, 'ObjectAudit', %signal.name, 65534 );
end;
go

create or replace trigger profiler_group_report
group profiler_triggers
priority 2
comment 'Profiler application group reporting trigger'
on signal profiler_report
evaluate select AppName, sum( PeriodSQLTime ) as ClientTypeTotalTime
		from catalog.profiles
		where NumSubmits > 0
		group by AppName
bind as profile_tt
declare header		boolean;
	total		real;
begin
	-- Initialise client's total period time
	set total = 0.0;

	-- Display header
	set header = true;

	-- Report grouped SQL timings
	for each row profile in profile_tt
	begin
		if( header = true ) then
			-- Header
			write into profiler_report
				values( to_char( %signal.report_time ) + ': Grouped user profiles:' );
			set header = false;
		end if;

		write into profiler_report
			values( to_char( %signal.report_time ) + ': Execution time for all connections whose application name is \'' +
				profile.AppName + '\': ' + to_char( profile.ClientTypeTotalTime ) + 's' );

		-- Accumulate the total time for all client types
		set total = total + profile.ClientTypeTotalTime;
	end;

	write into profiler_report
		values( to_char( %signal.report_time ) + ': Total time in the report period (' + to_char( %signal.report_period ) + 's): ' +
		      	to_char( total ) + 's' );
end;
go

create or replace trigger profiler_report
group profiler_triggers
priority 1
comment 'Profiler reporting trigger'
on signal profiler_report
declare header		boolean;
begin
	-- Display header
	set header = true;

	-- Create a report for each row in catalog.profiles where NumSubmits > 0
	for each row profile in catalog.profiles where profile.NumSubmits > 0
	begin
		if( header = true ) then
			-- Header
			write into profiler_report
				values( to_char( %signal.report_time ) + ': Individual user profiles:' );
			set header = false;
		end if;

		write into profiler_report
			values( to_char( %signal.report_time ) + ': \'' + profile.AppName + '\' (uid = ' + to_char( profile.UID ) + ') time on ' + profile.HostName + ': ' +
				to_char( profile.PeriodSQLTime ) + 's' );
	end;
end;
go

create or replace trigger profiler_toggle
group profiler_triggers
priority 1
comment 'Report that the profiler has been toggled'
on signal profiler_toggle
begin
	-- Insert different rows depending upon the state of the profiler
	if( %signal.enabled = true ) then
		-- Inform the outside world that the profiler has been enabled
		insert into alerts.status ( Identifier, Summary, Node, Manager, Type, Severity, FirstOccurrence, LastOccurrence, AlertGroup, OwnerUID )
			values( 'ProfilerEnableToggle@'+getservername()+':'+%signal.node, 'ObjectServer '+getservername()+' Profiler enabled at '+
			to_char(%signal.at), %signal.node, 'Profiler', 2, 1, %signal.at, %signal.at, 'nco_objserv', 65534 );

		write into profiler_report
			values( to_char( getdate() ) + ': Profiling enabled at ' + to_char( %signal.at ) );
	else
		-- Inform the outside world that the profiler has been disabled
		insert into alerts.status ( Identifier, Summary, Node, Manager, Type, Severity, FirstOccurrence, LastOccurrence, AlertGroup, OwnerUID )
			values( 'ProfilerDisableToggle@'+getservername()+':'+%signal.node, 'ObjectServer '+getservername()+' Profiler disabled at '+
			to_char(%signal.at),%signal.node, 'Profiler', 2, 1, %signal.at, %signal.at, 'nco_objserv', 65534 );

		write into profiler_report
			values( to_char( getdate() ) + ': Profiling disabled at ' + to_char( %signal.at ) );
	end if
end;
go

create or replace trigger trigger_stats_report
group trigger_stat_reports
priority 1
comment 'Trigger statistic report trigger'
on signal trigger_stats_report
declare period char(40);
	total_time real;
begin
	-- Get the report period
	set period = get_prop_value( 'Auto.StatsInterval' );

	-- Initialise 'total_time' for all triggers
	set total_time = 0;

	-- Header
	write into trigger_stats_report
		values( to_char( %signal.report_time ) + ': Trigger Profile Report' );

	-- Report trigger times per active trigger group
	for each row t_group in catalog.trigger_groups where t_group.IsEnabled = true
	begin
		write into trigger_stats_report
			values( to_char( %signal.report_time ) + ': Trigger Group \'' + t_group.GroupName + '\'' );

		-- Report each of the group's active trigger times in the report period
		for each row trig in catalog.trigger_stats
			where trig.TriggerName in ( select TriggerName from catalog.triggers where IsEnabled = true and GroupName = t_group.GroupName )
		begin
			write into trigger_stats_report
				values( to_char( %signal.report_time ) + ':     Trigger time for \'' + trig.TriggerName + '\': ' + to_char( trig.PeriodTime ) + 's' );

			set total_time = total_time + trig.PeriodTime;
		end;
	end;

	-- Report time for all triggers
	write into trigger_stats_report
		values( to_char( %signal.report_time ) + ': Time for all triggers in report period (' + period + 's): ' + to_char( total_time ) + 's' );
end;
go

create or replace trigger my_objserv_eventrate
group stats_triggers
priority 20
comment 'Calculate the event rate on the object server'
every 60 seconds
declare elapsed time;  --to store the time elapsed
firstRun boolean;  --Is this the first run?
eventCount integer; --temp event count
begin
    set firstRun = true;
    for each row mrow in master.my_perf_table --this is our table
    begin
        set firstRun = false; --if there are no rows in my_peft_table, this will not happen
        set elapsed = getdate() - mrow.LastUpdate; --work out how much time has passed since the last run (by default this will usually be 60)
        
        set eventCount = 0;
        for each row srow in master.activity_stats where srow.DatabaseName = 'alerts'
        begin
            set eventCount = srow.StatusNewInserts + srow.StatusDedups + srow.JournalInserts + srow.DetailsInserts; --add up all the events going into alerts database
        end;
        -- This next step can be done (more efficiently) with one update. For ease of reading I have split it
        update master.my_perf_table via 'alerts' set EventRate = to_real((eventCount - mrow.EventCount)) / to_real(elapsed); --events now minus events before divided by time
        update master.my_perf_table via 'alerts' set EventCount = eventCount; --update this count for the next run
        update master.my_perf_table via 'alerts' set LastUpdate = getdate(); --update the time for the next run
        
        --In one command it looks like the following
        --update master.my_perf_table via 'alerts' set EventRate = to_real((eventCount - mrow.EventCount)) / to_real(elapsed) , EventCount = eventCount, LastUpdate = getdate();
    end;

    if(firstRun = true) then
        -- This will only run when our table is empty (first run)
        set eventCount = 0;
        for each row srow in master.activity_stats where srow.DatabaseName = 'alerts'
        begin
            set eventCount = srow.StatusNewInserts + srow.StatusDedups + srow.JournalInserts + srow.DetailsInserts;
        end;
        insert into master.my_perf_table values('alerts', getdate(), eventCount, 0); --first event rate will be 0.0
    end if;
end;
go

create or replace trigger delete_stats
group stats_triggers
priority 20
comment 'keep up to 120 days of records in the master.stats table'
every 86400 seconds
declare days_data int;
begin
        -- Keep 120 days of data
	-- Modify this to reduce / increase the number
	set days_data = 86400*120;
	delete from master.stats where StatTime < (getdate - days_data);
end;
go

create or replace trigger details_inserts
group stats_triggers
priority 20
comment 'Counts details table inserts'
after insert on alerts.details for each row
begin
	update master.activity_stats via 'alerts' set DetailsInserts = DetailsInserts + 1;
end;
go

create or replace trigger stats_reset
group stats_triggers
priority 1
comment 'Reset the statistics data'
on signal stats_reset
begin
	delete from master.stats;
	delete from master.activity_stats;
	insert into master.activity_stats values( 'alerts', 0, 0, 0, 0, 0 );
end;
go

create or replace trigger new_status_inserts
group stats_triggers
priority 20
comment 'Counts new status table inserts'
after insert on alerts.status for each row
begin
	update master.activity_stats via 'alerts' set StatusNewInserts = StatusNewInserts + 1;
end;
go

create or replace trigger deduplicate_probestats
group stats_triggers
priority 1
comment 'Handle duplicate rows on master.probestats'
before reinsert on master.probestats for each row
begin
	cancel; -- Do nothing. Allow the new row to be discarded
end;
go

create or replace trigger journal_inserts
group stats_triggers
priority 20
comment 'Counts journal table inserts'
after insert on alerts.journal for each row
begin
	update master.activity_stats via 'alerts' set JournalInserts = JournalInserts + 1;
end;
go

create or replace trigger status_updates
group stats_triggers
priority 20
comment 'Counts status table updates'
after update on alerts.status for each row
begin
	update master.activity_stats via 'alerts' set StatusUpdates = StatusUpdates + 1;
end;
go

create or replace trigger probestat_reinsert
group stats_triggers
priority 2
comment 'Trap probestat events and copy data to master.probestats table'
before reinsert on alerts.status for each row
begin
	-- probestat event sent by Heartbeat section of probewatch.include
	if( new.Identifier = 'probestat' ) then
		-- call the common probestats_data procedure on this row
		call procedure probestats_data ( new );
		-- cancel causes the alerts.status insert to be dropped
		cancel;
	end if;
end;
go

create or replace trigger dedup_status_inserts
group stats_triggers
priority 20
comment 'Counts deduplicated status table inserts'
after reinsert on alerts.status for each row
begin
	update master.activity_stats via 'alerts' set StatusDedups = StatusDedups + 1;
end;
go

create or replace trigger statistics_cleanup
group stats_triggers
enabled false
priority 20
comment 'Delete statistics over an hour old'
every 3600 seconds
begin
	delete from master.stats where StatTime < (getdate() - 3600);
end;
go

create or replace trigger probe_statistics_report
group stats_triggers
priority 2
comment 'Produce probestats report'
every 30 seconds
begin
	cancel;
end;
go

create or replace trigger probe_statistics_cleanup
group stats_triggers
enabled false
priority 20
comment 'Delete probe statistics over an hour old'
every 3600 seconds
begin
	delete from master.probestats where StatTime < (getdate() - 3600);
end;
go

create or replace trigger probestats_reset
group stats_triggers
priority 2
comment 'Reset the probe statistics data'
on signal stats_reset
begin
	delete from master.probestats;
	delete from master.activity_probestats;
	insert into master.activity_probestats values ( 'objservlog', 1, 0);
end;
go

create or replace trigger statistics_gather
group stats_triggers
priority 20
comment 'Create some v3.x ObjectServer statistics'
every 300 seconds
declare clients		int;
	realtimes	int;
	probes		int;
	gateways	int;
	monitors	int;
	proxys		int;
	ecount		int;
	jcount		int;
	dcount		int;
	sinserts	int;
	sninserts	int;
	sdedups		int;
	jinserts	int;
	dinserts	int;
	supdates	int;
begin
	-- Initialise counters
	set clients = 0;
	set realtimes = 0;
	set probes = 0;
	set gateways = 0;
	set monitors = 0;
	set proxys = 0;
	set ecount = 0;
	set jcount = 0;
	set dcount = 0;

	-- Get number of clients
	for each row srow in catalog.connections
	begin
		set clients = clients + 1;
	end;

	-- Get number of realtime clients
	for each row srow in catalog.connections where srow.IsRealTime = true
	begin
		set realtimes = realtimes + 1;
	end;

	-- Get number of probes
	for each row srow in catalog.connections where srow.AppName = 'PROBE'
	begin
		set probes = probes + 1;
	end;

	-- Get number of Gateways
	for each row srow in catalog.connections where srow.AppName = 'GATEWAY'
	begin
		set gateways = gateways + 1;
	end;

	-- Get number of monitors
	for each row srow in catalog.connections where srow.AppName = 'MONITOR'
	begin
		set monitors = monitors + 1;
	end;

	-- Get number of proxies
	for each row srow in catalog.connections where srow.AppName = 'PROXY'
	begin
		set proxys = proxys + 1;
	end;

	-- Get number of rows in alerts.status
	for each row srow in alerts.status
	begin
		set ecount = ecount + 1;
	end;

	-- Get number of rows in alerts.journal
	for each row srow in alerts.journal
	begin
		set jcount = jcount + 1;
	end;

	-- Get number of rows in alerts.details
	for each row srow in alerts.details
	begin
		set dcount = dcount + 1;
	end;

	-- Get status/journal/details table activity statistics.
	for each row srow in master.activity_stats where srow.DatabaseName = 'alerts'
	begin
		set sinserts = srow.StatusNewInserts + srow.StatusDedups;
		set sninserts = srow.StatusNewInserts;
		set sdedups = srow.StatusDedups;
		set jinserts = srow.JournalInserts;
		set dinserts = srow.DetailsInserts;
		set supdates = srow.StatusUpdates;
	end;

	-- Insert a stats row
	insert into master.stats values( getdate(), clients, realtimes, probes, gateways, monitors, proxys, ecount, jcount, dcount, sinserts, sninserts, sdedups, jinserts, dinserts, supdates );
end;
go

create or replace trigger probestat_insert
group stats_triggers
priority 2
comment 'Trap probestat events and copy data to master.probestats table'
before insert on alerts.status for each row
begin
	-- probestat event sent by Heartbeat section of probewatch.include
	if( new.Identifier = 'probestat' ) then
		-- call the common probestats_data procedure on this row
		call procedure probestats_data ( new );
		-- cancel causes the alerts.status insert to be dropped
		cancel;
	end if;
end;
go

create or replace trigger suppress_cross_domain_connections
group itnm_triggers
enabled false
priority 1
comment ''
before update on alerts.status for each row
begin
    -- Only interested in changes made by the ITNM Gateway
    if (%user.description in ('ncp_g_event','ncp_ncogate'))
    then
        -- Only interested in events have a remode node set and are root cause
        if (new.RemoteNodeAlias != '') and (new.NmosCauseType = 1)
        then
            if (new.Severity > 0)
            then
                -- It's going to be root cause unless we find a supressor in another domain
                for each row Suppressor in alerts.status where Suppressor.LocalNodeAlias = new.RemoteNodeAlias
                                                           and Suppressor.NmosDomainName != new.NmosDomainName
                                                           and Suppressor.NmosCauseType = 1
                                                           and Suppressor.Severity > 0
                  begin
                    -- Found a suppressor in another domain - suppress this event
                    set new.NmosCauseType = 2;
                    set new.NmosSerial = to_char(Suppressor.Serial);
-- Comment out the next line if not setting severity
                    set new.Severity = 1;
                  end;
            else
                -- It's been cleared so if it was suppressing cross domain then unsuppress
                for each row Suppressed in alerts.status where Suppressed.RemoteNodeAlias = new.LocalNodeAlias
                                                           and Suppressed.NmosDomainName != new.NmosDomainName
                                                           and Suppressed.NmosSerial = to_char(new.Serial)
                  begin
                    -- Found a suppressed event in another domain - unsuppress it
                    set Suppressed.NmosCauseType = 0;
                    set Suppressed.NmosSerial = '0';
-- Comment out the next line if not setting severity
                    set Suppressed.Severity = 2;
                  end;
            end if;
        end if;
    end if;
end;
go

create or replace trigger severity_from_causetype
group itnm_triggers
enabled false
priority 1
comment ''
before update on alerts.status for each row
begin

    -- Only interested in changes made by the ITNM Gateway
    if (%user.description in ('ncp_g_event','ncp_ncogate'))
    then
        -- Only interested in events processed by ITNM
        if (new.NmosObjInst > 0)
        then
            -- Ignore events which have been cleared
            if (old.Severity > 0)
            then
                if (new.NmosCauseType = 1)
                then
                    -- This is a 'Root Cause' event so set Severity to 'Critical'
                    set new.Severity = 5;

                elseif (new.NmosCauseType = 2)
                then
                    -- This is a 'Symptom' event so set Severity to 'Indeterminate'
                    set new.Severity = 1;

                elseif (new.NmosCauseType = 0)
                then
                    if (old.NmosCauseType = 2)
                    then
                        -- This was a 'Symptom' but now its 'Unknown' so set Severity to 'Warning'
                        set new.Severity = 2;
                    end if;
                end if;
            end if;
        end if;
    end if;
end;
go

create or replace trigger registry_new_probe
group registry_triggers
priority 10
comment 'Set defaults for new entry in REGISTRY.PROBES'
before insert on registry.probes for each row
begin
if (%user.app_name = 'PROBE') or (%user.app_name = 'PROXY') then
	set new.ConnectionID = %user.connection_id;
end if;
if (%user.app_name != 'GATEWAY') then
	set new.LastUpdate = getdate;
end if;
end;
go

create or replace trigger registry_reinsert_probe
group registry_triggers
priority 10
comment 'Treat inserts to existing PROBE.REGISTRY entry as though they were updates. Time stamp the record to keep track of the last time this entry was updated. Only probes directly connected, or connected via a proxy server, as well as gateways are allowed to re-insert into the table. Other applications must use UPDATE to modify the probe registry.'
before reinsert on registry.probes for each row
begin
	if (%user.app_name = 'PROBE') or
	   (%user.app_name = 'PROXY') then
		set row old = new; 
		set old.ConnectionID = %user.connection_id;
		set old.LastUpdate = getdate;
	elseif (%user.app_name = 'GATEWAY') and
	       (new.LastUpdate > old.LastUpdate) then
		-- Only update the registry if the reinsert is more recent
		set row old = new;
	else
		cancel;
	end if;
end;
go

create or replace trigger registry_update_probe
group registry_triggers
priority 10
comment 'Set the LastUpdate column for updates coming from all clients except gateways. Only permit updates from gateways if the LastUpdate time is more recent than the existing entry'
before update on registry.probes for each row
begin
	if (%user.app_name != 'GATEWAY') then
		set new.LastUpdate = getdate();
	elseif (new.LastUpdate < old.LastUpdate) then
		cancel;
	end if;
end;
go

create or replace trigger registry_probe_disconnect
group registry_triggers
priority 10
comment 'Reset ConnectionID in probe registry when probe or proxy server disconnects.'
on signal disconnect
begin
	if (%signal.process = 'PROBE') then
		update registry.probes set ConnectionID = 0, LastUpdate = getdate
			where ConnectionID = %signal.connectionid;
	-- proxy server shuffles probe connections dynamically.
	-- Unsafe to reset probes that have not stopped.
	elseif (%signal.process = 'PROXY') then
		update registry.probes set ConnectionID = 0, LastUpdate = getdate
			where ConnectionID = %signal.connectionid
			 and  Status = 0;
	end if;
end;
go

create or replace trigger fixPBRdb
group WBPrimaryOnly
enabled false
priority 1
comment ''
after insert on alerts.status for each row
when new.Agent = 'Pigeon' and new.Summary like 'PBR.* Failed' and new.NodeAlias like 'nmsapp01' and new.Type = 1 and new.Grade=0
begin
      execute automationExt(
	new.Serial,
	0,
	'/usr/local/nms/bin/pbrFix.sh',
	'',
	new.NodeAlias,
	to_char(new.Severity),
	new.Location,
	new.Summary,
'sye@wildbluecorp.com,cpatten@wildbluecorp.com,rfranklin@wildbluecorp.com,wliu@wildbluecorp.com,WBINT-NetworkEngineering@wildbluecorp.com, WBINT-NMS@wildbluecorp.com'	
	);
       update alerts.status via new.Identifier set Grade=1;
       call jinsert(new.Serial,2001,getdate,'pbrFix.sh called');
end;
go

create or replace trigger fixPBR
group WBPrimaryOnly
enabled false
priority 1
comment ''
on signal pbrFix
begin
        call automationSigRtn('fixPBR', %signal.Serial, %signal.Status, %signal.ReturnData1);

end;
go

create or replace trigger disconnect_iduc_missed
group iduc_triggers
priority 1
comment 'Disconnects real-time clients that have not communicated with objectserver for 100 granularity periods'
on signal iduc_missed
begin
	if( %signal.missed_cycles > 100 )
	then
		insert into alerts.status (Identifier, Summary, Node, Manager, Type, Severity, FirstOccurrence, LastOccurrence, AlertGroup, AlertKey,OwnerUID) values(%signal.process+':'+%signal.node+':iducmissed:'+%signal.username, 'Disconnecting '+%signal.process+' process '+%signal.description+' connected as user '+%signal.username+'.Reason - Missed '+to_char(%signal.missed_cycles)+' iduc cycles.', %signal.node, 'SystemWatch', 1, 1, %signal.at, %signal.at,'IducMissed',%signal.process+':iducmissed',65534); 

		alter system drop connection %signal.connectionid;
	end if;
end;
go

create or replace trigger iduc_stats_update
group iduc_triggers
priority 1
comment 'update LastIducTime in iduc_system.iduc_stats table on signal iduc_data_fetch'
on signal iduc_data_fetch
begin
	update iduc_system.iduc_stats set LastIducTime = %signal.at where ServerName = getservername()
		and AppName = %signal.process and AppDesc = %signal.description;
end;
go

create or replace trigger iduc_messages_tblclean
group iduc_triggers
priority 1
comment 'Housekeeping cleanup of ALERTS.IDUC_MESSAGES'
every 60 seconds
begin
	delete from alerts.iduc_messages where (MsgTime + 120) <= getdate;
end;
go

create or replace trigger deduplicate_iduc_stats
group iduc_triggers
priority 1
comment 'Deduplicate rows on iduc_system.iduc_stats'
before reinsert on iduc_system.iduc_stats for each row
begin
	cancel; -- Do nothing. Allow the row to be discarded
end;
go

create or replace trigger iduc_stats_insert
group iduc_triggers
priority 1
comment 'Insert client entry into iduc_system.iduc_stats table on signal iduc_connect'
on signal iduc_connect
declare failure_time utc;
begin
	set failure_time = getdate();
	for each row cnxn in iduc_system.iduc_stats where cnxn.AppDesc = %signal.description 
		and cnxn.ConnectionId != %signal.conn_id and cnxn.ServerName = getservername() 
		and cnxn.AppName = 'GATEWAY'
	begin
		set failure_time = cnxn.LastIducTime;
	end;
	-- delete entry for iduc client because connectionid is changed now 
	-- but retain LastIducTime
	
	delete from iduc_system.iduc_stats where AppDesc = %signal.description and ConnectionId != %signal.conn_id and AppName = 'GATEWAY'  and  ServerName = getservername();
	
	insert into iduc_system.iduc_stats (ServerName,AppName,AppDesc,ConnectionId,LastIducTime) values (getservername(),%signal.process,%signal.description,%signal.conn_id,failure_time);
							
end;
go

create or replace trigger scala_reinsert
group scala_triggers
enabled false
priority 20
comment 'Fast Track an event reinsert for alerts.status to message bus Gateway running in SCALA mode'
after reinsert on alerts.status for each row
begin
	iduc evtft 'scala' , update , new ;
end;
go

create or replace trigger scala_insert
group scala_triggers
enabled false
priority 20
comment 'Fast Track an event insert for alerts.status to message bus Gateway running in SCALA mode'
after insert on alerts.status for each row
begin
	iduc evtft 'scala' , insert , new ;
end;
go

create or replace trigger trimFatJournals
group WBTest
priority 1
comment 'This trigger finds journal entries which have excessive numbers\nof entries, then trims the newest, leaving the oldest ..dmillis'
every 61 seconds
evaluate select Serial, count(Serial) as Entries 
  from alerts.journal
    group by Serial
bind as journalBundles
declare threshold int;
  counter int;
begin

  set threshold = 48;
  for each row bundle in journalBundles
  begin
    -- Find journals which have more than <threshold> rows for a specific
    -- alerts.status entry (identified by Serial)
    if (bundle.Entries > threshold)
    then
      set counter = bundle.Entries - threshold;
      call deleteNewestJournals (bundle.Serial, counter);
    end if;
  end;

end;
go

create or replace trigger mailOnCysA15Firewall
group WBTest
enabled false
priority 4
comment 'This email notification fires only for Cheyenne A15 firewalls\n\nupon link-down; requested by T4/Net. Created by dmillis 2010jan05'
before insert on alerts.status for each row
begin
	cancel;
end;
go

create or replace trigger DetectTestWarnings
group WBMail
enabled false
priority 2
comment 'Finds all  traps specified of Grade < 2 that match the other criteria\nspecified .  The results will be mailed\n\nGrade is used to keep from acting twice. \n\nThe action must escalate Grade = 2 on this event.'
every 301 seconds
evaluate select Identifier, Serial, Node, NodeAlias, Manager, Agent, AlertGroup, AlertKey, Severity, Summary, StateChange, FirstOccurrence, LastOccurrence, InternalLast, Poll, Type, Tally, Class, Grade, Location, OwnerUID, OwnerGID, Acknowledged, Flash, EventId, ExpireTime, ProcessReq, SuppressEscl, Customer, Service, PhysicalSlot, PhysicalPort, PhysicalCard, TaskList, NmosSerial, NmosObjInst, NmosCauseType, LocalNodeAlias, LocalPriObj, LocalSecObj, LocalRootObj, RemoteNodeAlias, RemotePriObj, RemoteSecObj, RemoteRootObj, X733EventType, X733ProbableCause, X733SpecificProb, X733CorrNotif, ServerName, ServerSerial, methodProcedure from alerts.status where Summary like '^No Rules' and Grade = 0
bind as tt
when true
begin

	-- Condition to be met to execute ascent action
	if %rowcount > 0 then
		-- Execute ascent action
		for each row ttrow in tt
		begin
			-- v3 ascent action name: mailToAndy
			-- 
			update alerts.status via ttrow.Identifier set Grade = 1;
			-- External action
			execute send_email_alert(ttrow.AlertGroup,ttrow.Severity,ttrow.Summary,ttrow.LastOccurrence,'unknownRules','aellis@wildbluecorp.com');
		end;
	end if;
end;
go

create or replace trigger DetectTrapCacheTraps
group WBMail
priority 2
comment ''
every 324 seconds
evaluate select Identifier, Serial, Node, NodeAlias, Manager, Agent, AlertGroup, AlertKey, Severity, Summary, StateChange, FirstOccurrence, LastOccurrence, InternalLast, Poll, Type, Tally, Class, Grade, Location, OwnerUID, OwnerGID, Acknowledged, Flash, EventId, ExpireTime, ProcessReq, SuppressEscl, Customer, Service, PhysicalSlot, PhysicalPort, PhysicalCard, TaskList, NmosSerial, NmosObjInst, NmosCauseType, LocalNodeAlias, LocalPriObj, LocalSecObj, LocalRootObj, RemoteNodeAlias, RemotePriObj, RemoteSecObj, RemoteRootObj, X733EventType, X733ProbableCause, X733SpecificProb, X733CorrNotif, ServerName, ServerSerial, methodProcedure from alerts.status where Grade = 0 and Severity > 0 and Type = 1 and Tally > 2 and AlertGroup = 'nmsTrap:Cache'
bind as tt
begin
	-- Condition to be met to execute ascent action
	if %rowcount > 0 then
		-- Execute ascent action
		for each row ttrow in tt
		begin
			-- v3 ascent action name: mailToNmsTrap
			-- 
			update alerts.status via ttrow.Identifier set Grade = 1;
			-- External action
			execute send_email_alert(ttrow.AlertGroup,ttrow.Severity,ttrow.Summary,ttrow.LastOccurrence,'nmsTrap','WBINT-NMS@wildbluecorp.com,plapoirie@wildbluecorp.com');
		end;
	end if;
end;
go

create or replace trigger mailOnWdc1Visibility
group WBMail
enabled false
priority 1
comment 'This trigger will send email on any device visibility alerts in WDC1\naellis...'
after insert on alerts.status for each row
when new.Node like '10\.65\.'
and new.AlertGroup like 'AP~WildBlue~Devices~Availability~Visibility'
begin

call send_email_alert(
      new.NodeAlias,
      new.Severity+0,
      new.Summary+'',
      new.LastOccurrence+0,
      'wdc1Visibility',
      'jeff.williams@viasat.com,andy.ellis@viasat.com'
);
call jinsert(
      new.Serial+0,
      %user.user_id+0,
      getdate,
      'wdc1Visibility triggered'
);
end;
go

create or replace trigger DetectBigIronWarnings
group WBMail
enabled false
priority 2
comment ''
every 61 seconds
evaluate select Identifier, Serial, Node, NodeAlias, Manager, Agent, 
AlertGroup, AlertKey, Severity, Summary, StateChange, FirstOccurrence, 
LastOccurrence, InternalLast, Poll, Type, Tally, Class, Grade, Location, 
OwnerUID, OwnerGID, Acknowledged, Flash, EventId, ExpireTime, ProcessReq, 
SuppressEscl, Customer, Service, PhysicalSlot, PhysicalPort, PhysicalCard, 
TaskList, NmosSerial, NmosObjInst, NmosCauseType, LocalNodeAlias, 
LocalPriObj, LocalSecObj, LocalRootObj, RemoteNodeAlias, RemotePriObj, 
RemoteSecObj, RemoteRootObj, X733EventType, X733ProbableCause, 
X733SpecificProb, X733CorrNotif, ServerName, ServerSerial, methodProcedure 
  from alerts.status where 
  Grade = 0 and 
  Severity > 1 and 
  Type = 1 and 
  Agent like 'BigIron' and 
  NodeAlias like 'cys|lrd|syr|laax|ywg' and 
  NodeAlias not like '\.wb1\.'
bind as tt
when true
begin

  -- Condition to be met to execute ascent action
  if %rowcount > 0 then
    -- Execute ascent action
    for each row ttrow in tt
    begin
      -- v3 ascent action name: BigIronFailNotification
      update alerts.status via ttrow.Identifier set Grade = 1;
      -- External action
      execute send_email_alert(ttrow.NodeAlias,ttrow.Severity,ttrow.Summary,ttrow.LastOccurrence,'bigIron','sye@wildbluecorp.com,cpatten@wildbluecorp.com,wliu@wildbluecorp.com'
   );
    end;
  end if;

end;
go

create or replace trigger mailOnAmazonCloudAlert
group WBMail
enabled false
priority 4
comment 'Send e-mail about critical alerts that are\nthat come from Amazon Cloud that have \'Flume_ERROR\' or \'Flume_FATAL\' in summary'
after insert on alerts.status for each row
when new.Summary LIKE 'Flume_ERROR' or new.Summary LIKE 'Flume_FATAL' AND new.Type = 1
begin

call send_email_alert(
	new.NodeAlias,
	new.Severity+0,
	new.Summary+'',
	new.LastOccurrence+0,
	'mailOnAmazonCloudFlumeAlert',
	'stephan.kemper@viasat.com, rohit.rangnekar@viasat.com,christopher.munson@viasat.com'
);
call jinsert(
	new.Serial+0,
	%user.user_id+0,
	getdate,
	'mailOnAmazonCloudFlumeAlert Triggered'
);

end;
go

create or replace trigger DetectDiskWarnings
group WBMail
enabled false
priority 1
comment 'This trigger will send email when a TMPM storage usage alert\nis received for any server in WDC1 PROD\n..aellis'
after insert on alerts.status for each row
when new.Agent = 'TNPM' and
new.AlertGroup = 'AP~Specific~SNMP~Devices~HostResources~hrPercentStorageUsed' and
new.Summary not like 'emory' and
--     new.Type = 1 and
new.Node like '10\.65\.'
begin

call send_email_alert(
        new.NodeAlias,
        new.Severity,
        new.Summary,
        new.LastOccurrence,
       'StorageUse',
       'jeff.williams@viasat.com,andy.ellis@viasat.com'
);
call jinsert(
      new.Serial+0,
      %user.user_id+0,
      getdate,
      'storageUsage triggered'
);

end;
go

create or replace trigger oslcreg_sp_new
group oslc
priority 10
comment 'Generate OSLC Service Provider registrations for ECIP for registered provider.'
every 60 seconds
begin
	-- Walk the set of service provider registrations.
	for each row provider in registry.oslcsp
	where
		provider.Registered = 1
	begin
		-- Delete any failed registrations.
		delete from registry.oslcecip_regs where
			RegistryURI=provider.RegistryURI and
			Registered = 0 and
			RequestTime >= (getdate() - 240);

		-- Walk the set of ECIP definitions to add any missing 
		-- registrations. This will force a retry of any that failed.
		for each row ecip in registry.oslcecip
		where
			ecip.CIPId not in (select CIPId from
						registry.oslcecip_regs
					where RegistryURI=provider.RegistryURI)
		begin
			-- Insert ECIP registration for this provider.
			insert into registry.oslcecip_regs (CIPId,RegistryURI)
				values (ecip.CIPId, provider.RegistryURI);
		end;
	end;
end;
go

create or replace trigger oslcreg_ecip_dedup_after
group oslc
priority 10
comment 'Update OSLC Service Provider registrations for updated ECIP.'
after reinsert on registry.oslcecip for each row
begin
	-- Delete all of the existing registrations for this ECIP.
	execute oslcecip_regs_delete(new.CIPId);

	-- Insert all of the required registration requests for this ECIP.
	execute oslcecip_regs_insert(new.CIPId);
end;
go

create or replace trigger oslcreg_sp_delete_before
group oslc
priority 10
comment 'Cleanup OSLC ECIP registrations for delete Provider registration.'
before delete on registry.oslcsp for each row
begin
	delete from registry.oslcecip_regs where RegistryURI=old.RegistryURI;
end;
go

create or replace trigger oslcreg_ecip_new
group oslc
priority 10
comment 'Generate OSLC Service Provider registrations for inserted ECIP.'
after insert on registry.oslcecip for each row
begin
	-- Insert all of the required registration requests for this ECIP.
	execute oslcecip_regs_insert(new.CIPId);
end;
go

create or replace trigger oslcreg_ecipreg_delete
group oslc
priority 1
comment 'Cleanup OSLC Service Provider registrations for ECIP.'
every 60 seconds
begin
	delete from registry.oslcecip_regs where
		CIPId not in (select CIPId from registry.oslcecip) or
		RegistryURI not in (select RegistryURI from registry.oslcsp);
end;
go

create or replace trigger oslcreg_ecip_delete_after
group oslc
priority 10
comment 'Cleanup OSLC Service Provider registrations for ECIP.'
after delete on registry.oslcecip for each row
begin
	delete from registry.oslcecip_regs where
		CIPId not in (select CIPId from registry.oslcecip) or
		RegistryURI not in (select RegistryURI from registry.oslcsp);
end;
go

create or replace trigger oslcreg_ecipregs_new
group oslc
priority 10
comment 'Set the RequestTime to now for the registration request row.'
before insert on registry.oslcecip_regs for each row
begin
	set new.RequestTime = getdate();
end;
go

create or replace trigger oslcreg_ecip_update_after
group oslc
priority 10
comment 'Update OSLC Service Provider registrations for updated ECIP.'
after update on registry.oslcecip for each row
begin
	-- Delete all of the existing registrations for this ECIP.
	execute oslcecip_regs_delete(new.CIPId);

	-- Insert all of the required registration requests for this ECIP.
	execute oslcecip_regs_insert(new.CIPId);
end;
go

create or replace trigger oslcreg_ecip_dedup_before
group oslc
priority 10
comment 'Update OSLC Service Provider registrations for updated ECIP.'
before reinsert on registry.oslcecip for each row
begin
	set old.Name = new.Name;
	set old.Description = new.Description;
	set old.QueryPattern = new.QueryPattern;
end;
go

create or replace trigger backup_succeeded
group automatic_backup_system
priority 1
comment 'Action to perform on a successful backup operation'
on signal backup_succeeded
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Type, Severity, FirstOccurrence, LastOccurrence, AlertGroup, OwnerUID) values ( 'ObjectServer Backup: ' + to_char(getdate) + %signal.path_prefix , 'Backup to ' + %signal.path_prefix + ' complete. Operation took ' + to_char( %signal.elapsed_time ) + ' seconds.', %signal.node, 'Automatic backup system', 0, 0, %signal.at, %signal.at, 'nco_objserv', 65534 );
end;
go

create or replace trigger automatic_backup
group automatic_backup_system
enabled false
priority 1
comment 'The automatic backup trigger\n\nBacks up all ObjectServer memory stores to a sequence of locations dependent on "num_backups"\n'
every 300 seconds
declare num_backups unsigned;
	backup_dir   unsigned;
begin
	-- Change this constant to control the number of backups maintained on disk
	set num_backups = 2;

	-- Get the current backup directory suffix
	for each row backup_record in alerts.backup_state where backup_record.KeyField = 0
	begin
		-- Read the suffix from the backup record
		set backup_dir = backup_record.CurrentBackup;	
	end;

	-- Do the backup
	alter system backup '$OMNIHOME/backup/' + getservername() + '/BACKUP_' + to_char( backup_dir );
	
	-- Increment the backup record suffix.
	-- This uses the MOD function to wrap back to 0 when the value of num_backups is reached
	update alerts.backup_state set CurrentBackup = mod( backup_dir + 1, num_backups);
end;
go

create or replace trigger backup_failed
group automatic_backup_system
priority 1
comment 'Action to perform on a failed backup operation'
on signal backup_failed
begin
	insert into alerts.status (Identifier, Summary, Node, Manager, Type, Severity, FirstOccurrence, LastOccurrence, AlertGroup, OwnerUID) values ( 'ObjectServer Backup: ' + to_char(getdate) + %signal.path_prefix , 'Backup to ' + %signal.path_prefix + ' failed. ' + %signal.error + '. Operation took ' + to_char( %signal.elapsed_time ) + ' seconds.', %signal.node, 'Automatic backup system', 0, 5, %signal.at, %signal.at, 'nco_objserv', 65534 );
end;
go

create or replace trigger backup_state_integrity
group automatic_backup_system
priority 1
comment ''
before insert on alerts.backup_state for each row
begin
	cancel;
end;
go

create or replace trigger backup_counterpart_down
group gateway_triggers
enabled false
priority 1
comment 'The counterpart server is down'
on signal gw_counterpart_down
when get_prop_value( 'BackupObjectServer' ) %= 'TRUE'
begin
	IDUC ACTCMD 'default','SWITCH TO BACKUP';       
	-- Enable the trigger groups that need to run in primary 
	execute procedure automation_enable;
	-- Set ActingPrimary property to TRUE
	alter system set 'ActingPrimary' = TRUE;
end;
go

create or replace trigger backup_startup
group gateway_triggers
enabled false
priority 1
comment 'On startup dont start the automations'
on signal startup
when (get_prop_value( 'BackupObjectServer' ) %= 'TRUE') and
     (get_prop_value( 'ActingPrimary' ) %='FALSE' )
-- This is the backup server
begin
	-- Disable the trigger groups that need not to 
	-- run when object server acts as backup 
	execute procedure automation_disable;
end;
go

create or replace trigger resync_finished
group gateway_triggers
priority 1
comment 'Resync finished'
on signal gw_resync_finish
when (get_prop_value( 'BackupObjectServer' ) %= 'TRUE')
-- This is the backup server
begin
if ( %user.description = 'failover_gate') then
                -- This is gw_resync_finish signal from failover gateway 
                -- update Backup OS's ActingPrimary to reflect it as backup
                alter system set 'ActingPrimary' = FALSE;
end if;
end;
go

create or replace trigger pass_deletes
group gateway_triggers
enabled false
priority 1
comment 'Delete rows in destination server that do not exist in source after resync'
on signal gw_resync_finish
begin
	delete from alerts.status where OldRow = 1;
end;
go

create or replace trigger backup_counterpart_up
group gateway_triggers
enabled false
priority 1
comment 'The counterpart server has come up'
on signal gw_counterpart_up
when get_prop_value( 'BackupObjectServer' ) %= 'TRUE'
begin
	IDUC ACTCMD 'default','SWITCH TO PRIMARY';	
	-- Disable the trigger groups that need not to
	-- run when object server acts as backup 
	execute procedure automation_disable;
end;
go

