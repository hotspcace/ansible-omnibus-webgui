create or replace trigger group VSCustomTriggers;
go

create or replace trigger vs_custom_set_expiretime
group VSCustom
enabled false
priority 1
comment 'TRIGGER hk_set_expiretime\n--\nThis trigger sets the ExpireTime field for all events where it is\nnot yet set.  It works in conjunction with the default expire\ntrigger to provide an automated event expiry mechanism.\nDefault ex
piry thresholds:\n\nCritical events - threshold: HKExpireTimeSev5 (master.properties)\nMajor events - threshold: HKExpireTimeSev4 (master.properties)\nMinor events - threshold: HKExpireTimeSev3 (master.properties)\nWarning events - thres
hold: HKExpireTimeSev2 (master.properties)\nIndeterminate events - threshold: HKExpireTimeSev1 (master.properties)\n\nClear events are to be ignored by this trigger.\n'
every 60 seconds
begin
        cancel;
end;
go

create or replace trigger vs_SwapHostname
group VSCustom
priority 1
comment ''
every 3 seconds
begin
        cancel;
end;
go

create or replace trigger vs_SwapNode
group VSCustom
priority 1
comment ''
every 3 seconds
begin
        cancel;
end;
go

create or replace trigger vs_sdp_delete_clears
group VSCustom
priority 1
comment ''
every 600 seconds
begin
        cancel;
end;
go

create or replace trigger vs_custom_set_expiretime
group VSCustom
enabled false
priority 1
comment 'TRIGGER hk_set_expiretime\n--\nThis trigger sets the ExpireTime field for all events where it is\nnot yet set.  It works in conjunction with the default expire\ntrigger to provide an automated event expiry mechanism.\nDefault ex
piry thresholds:\n\nCritical events - threshold: HKExpireTimeSev5 (master.properties)\nMajor events - threshold: HKExpireTimeSev4 (master.properties)\nMinor events - threshold: HKExpireTimeSev3 (master.properties)\nWarning events - thres
hold: HKExpireTimeSev2 (master.properties)\nIndeterminate events - threshold: HKExpireTimeSev1 (master.properties)\n\nClear events are to be ignored by this trigger.\n'
every 60 seconds
when get_prop_value('ActingPrimary') %= 'TRUE'
declare expiretimesev5 integer;
expiretimesev4 integer;
expiretimesev3 integer;
expiretimesev2 integer;
expiretimesev1 integer;
counter integer;
begin

        -- INITIALISE VARIABLES TO DEFAULTS
        --set expiretimesev5 = 60 * 60 * 24 * 7; -- 7 DAYS
        --set expiretimesev4 = 60 * 60 * 24 * 5; -- 5 DAYS
        --set expiretimesev3 = 60 * 60 * 24 * 3; -- 3 DAYS
        --set expiretimesev2 = 60 * 60 * 24 * 1; -- 1 DAY
        --set expiretimesev1 = 60 * 60 * 4; -- 4 HOURS
        --set counter = 0;--
        --set expiretimesev5 = 60 * 60 * 24 * 1; -- 1 DAY
        --set expiretimesev4 = 60 * 60 * 12; -- 12 HOURS
        --set expiretimesev3 = 60 * 60 * 4; -- 4 HOURS
        --set expiretimesev2 = 60 * 60 * 1; -- 1 HOUR
        --set expiretimesev1 = 60 * 15; -- 15 MINUTES
	
        set expiretimesev5 = 60 * 60 * 24 * 7; -- 7 DAYS
        set expiretimesev4 = 60 * 60 * 24 * 5; -- 5 DAYS
        set expiretimesev3 = 60 * 60 * 24 * 1; -- 1 DAYS
        set expiretimesev2 = 60 * 60 * 4; -- 4 HOURS
        set expiretimesev2 = 60 * 60 * 1; -- 1 HOUR
        set counter = 0;

        -- LOAD ExpireTime PROPERTIES FROM master.properties
        for each row expiretimeprop in master.properties where  expiretimeprop.Name in ('HKExpireTimeSev5', 'HKExpireTimeSev4', 'HKExpireTimeSev3', 'HKExpireTimeSev2', 'HKExpireTimeSev1')
        begin
                if (expiretimeprop.Name = 'HKExpireTimeSev5') then
                        set expiretimesev5 = expiretimeprop.IntValue;
                elseif (expiretimeprop.Name = 'HKExpireTimeSev4') then
                        set expiretimesev4 = expiretimeprop.IntValue;
                elseif (expiretimeprop.Name = 'HKExpireTimeSev3') then
                        set expiretimesev3 = expiretimeprop.IntValue;
                elseif (expiretimeprop.Name = 'HKExpireTimeSev2') then
                        set expiretimesev2 = expiretimeprop.IntValue;
                elseif (expiretimeprop.Name = 'HKExpireTimeSev1') then
                        set expiretimesev1 = expiretimeprop.IntValue;
                end if;
        end;

        -- FIND ROWS WHERE ExpireTime IS NOT YET SET AND SET ExpireTime
        -- BASED ON EVENT SEVERITY - IGNORE CLEARED EVENTS - IGNORE SYNTHETIC PARENT EVENTS
        for each row unexpired in alerts.status where
                unexpired.ExpireTime = 0 and
                unexpired.Severity != 0 and
                unexpired.wbTicketID not in ('0','1','2','3','4','5','6','7','8','9') and
                unexpired.AlertGroup not in ('SiteNameParent', 'ScopeIDParent', 'Synthetic Event - Parent')
        begin
                -- CRITICAL EVENTS:
                if (unexpired.Severity = 5) then
                        set unexpired.ExpireTime = expiretimesev5;
                        set unexpired.URL = 'ExpireTime set by vs_custom_set_expiretime trigger';
                -- MAJOR EVENTS:
                elseif (unexpired.Severity = 4) then
                        set unexpired.ExpireTime = expiretimesev4;
                        set unexpired.URL = 'ExpireTime set by vs_custom_set_expiretime trigger';
                -- MINOR EVENTS:
                elseif (unexpired.Severity = 3) then
                        set unexpired.ExpireTime = expiretimesev3;
                        set unexpired.URL = 'ExpireTime set by vs_custom_set_expiretime trigger';
                -- WARNING EVENTS:
                elseif (unexpired.Severity = 2) then
                        set unexpired.ExpireTime = expiretimesev2;
                        set unexpired.URL = 'ExpireTime set by vs_custom_set_expiretime trigger';
                -- INDETERMINATE EVENTS:
                elseif (unexpired.Severity = 1) then
                        set unexpired.ExpireTime = expiretimesev1;
                        set unexpired.URL = 'ExpireTime set by vs_custom_set_expiretime trigger';
                end if;

                -- INCREMENT COUNTER
                set counter = counter + 1;
        end;

        -- ADD LOGGING INFORMATION AND SYNTHETIC EVENT
        if (counter != 0) then

                -- ADD A LOG ENTRY TO SELF-MONITORING
                call procedure sm_log('Housekeeping: setting viasat custom ExpireTime for ' +
                        to_char(counter) + ' unset events');

                -- CREATE A SYNTHETIC ALERT TO SHOW PURGE INITIATED
                call procedure sm_insert(
                        'OMNIbus ObjectServer : set viasat custom ExpireTime for unset events for ' +
                        getservername(), get_prop_value('Hostname'), 'DBStatus', 2,
                        'Housekeeping: setting viasat custom ExpireTime for ' + to_char(counter) + ' unset events',
                        counter, 600, 1);
        end if;
end;
go

create or replace trigger vs_SwapHostname
group VSCustom
priority 1
comment ''
every 3 seconds
begin

   for each row sn in alerts.status where sn.Node like '.*\.viasat\.io' and sn.NodeAlias like '.*\.viasat\.io' and (sn.NodeAlias = sn.Node)

   begin

      set sn.NodeAlias= '';

   end

end;
go

create or replace trigger vs_SwapNode
group VSCustom
priority 1
comment ''
every 3 seconds
begin

   for each row sn in alerts.status where (sn.Node like '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]' or sn.Node like 'kapacitor-to-databus') and sn.NodeAlias like '.*\.viasat\.io'

   begin

      set sn.URL= sn.Node;
      set sn.Node= sn.NodeAlias;
      set sn.NodeAlias= sn.URL;

   end

end;
go

create or replace trigger vs_sdp_delete_clears
group VSCustom
priority 1
comment ''
every 600 seconds
begin
        delete from alerts.status where Severity = 0 and wbTicketID = '' and StateChange < (getdate() - 600);
end;
go
