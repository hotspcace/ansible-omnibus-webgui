ALTER TABLE alerts.status ADD COLUMN wbProbe varchar(64);
go
ALTER TABLE alerts.status ADD COLUMN AlertSubGroup varchar(64);
go
ALTER TABLE alerts.status ADD COLUMN wbAgentAlias varchar(64);
go
ALTER TABLE alerts.status ADD COLUMN wbAgentNode varchar(64);
go
ALTER TABLE alerts.status ADD COLUMN wbSat varchar(8);
go
ALTER TABLE alerts.status ADD COLUMN wbOriginalSeverity integer;
go
ALTER TABLE alerts.status ADD COLUMN VnoId varchar(1024);
go
ALTER TABLE alerts.status ADD COLUMN Tenant varchar(32);
go
ALTER TABLE alerts.status ADD COLUMN wbGateway varchar(16);
go
ALTER TABLE alerts.status ADD COLUMN wbExtra varchar(1024);
go
ALTER TABLE alerts.status ADD COLUMN wbDeviceType varchar(64);
go
ALTER TABLE alerts.status ADD COLUMN wbIfAlias varchar(255);
go
ALTER TABLE alerts.status ADD COLUMN wbTicketID varchar(32);
go
