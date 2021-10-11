-- CREATE NEW VIASAT CUSTOM FIELDS IN AGGREGATION OBJECTSERVER
-- =================================================================
-- Fields that are commented out are old SB2 (Exede) fields. 
ALTER TABLE alerts.status
	ADD COLUMN AlertSubGroup varchar(64)
        ADD COLUMN wbAgentAlias varchar(64)
        ADD COLUMN wbAgentNode varchar(64)
        ADD COLUMN wbDeviceType varchar(64)
        ADD COLUMN wbExtra varchar(1024)
        ADD COLUMN wbGateway varchar(16)
        ADD COLUMN wbIfAlias varchar(255)
        ADD COLUMN wbOriginalSeverity integer
        ADD COLUMN wbProbe varchar(64)
        ADD COLUMN wbSat varchar(8)
        ADD COLUMN wbTicketID varchar(32)
        ADD COLUMN VnoId varchar(1024)
        ADD COLUMN Tenant varchar(32)
        ADD COLUMN thresholdDescription varchar(255)
        ADD COLUMN methodProcedure varchar(255);
go
