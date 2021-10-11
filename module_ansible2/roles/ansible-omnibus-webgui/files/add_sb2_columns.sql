-- CREATE NEW VIASAT CUSTOM FIELDS IN AGGREGATION OBJECTSERVER);
-- =================================================================);
-- Fields that are commented out are old SB2 (Exede) fields. );
ALTER TABLE alerts.status ADD COLUMN provisoFormulaIndex int;
go
ALTER TABLE alerts.status ADD COLUMN provisoSubElementGrpIndex int;
go
ALTER TABLE alerts.status ADD COLUMN provisoSubElementIndex int;
go
ALTER TABLE alerts.status ADD COLUMN provisoThresholdType int;
go
ALTER TABLE alerts.status ADD COLUMN provisoViolationTime UTC;
go
ALTER TABLE alerts.status ADD COLUMN rcaEscalationId varchar(64);
go
ALTER TABLE alerts.status ADD COLUMN rcaExpire int;
go
ALTER TABLE alerts.status ADD COLUMN rcaMethodProcedureAssignmentId int;
go
ALTER TABLE alerts.status ADD COLUMN rcaProbableCause int;
go
ALTER TABLE alerts.status ADD COLUMN rcaSympatRule int;
go
ALTER TABLE alerts.status ADD COLUMN rcaSymptomCount int;
go
ALTER TABLE alerts.status ADD COLUMN rcaTally int;
go
ALTER TABLE alerts.status ADD COLUMN wbAutomationID varchar(128);
go
ALTER TABLE alerts.status ADD COLUMN wbCarrier varchar(16);
go
ALTER TABLE alerts.status ADD COLUMN wbEventFilter int;
go
ALTER TABLE alerts.status ADD COLUMN wbInterface varchar(64);
go
ALTER TABLE alerts.status ADD COLUMN wbMgtIP varchar(32);
go
ALTER TABLE alerts.status ADD COLUMN wbNeighbor varchar(64);
go
ALTER TABLE alerts.status ADD COLUMN wbSmtsIP varchar(64);
go
ALTER TABLE alerts.status ADD COLUMN wbStatus int;
go
ALTER TABLE alerts.status ADD COLUMN wbSystem varchar(64);
go
ALTER TABLE alerts.status ADD COLUMN wbTime int;
go
ALTER TABLE alerts.status ADD COLUMN wbView varchar(255);
go
