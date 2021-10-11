create database custom;
go

alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table custom.RCAGate persistent
(
	RCSerial incr primary key,
	RCServer varchar(64),
	RCTime utc,
	RCType varchar(4),
	Identifier varchar(255),
	Serial int,
	Node varchar(64),
	NodeAlias varchar(64),
	Manager varchar(64),
	Agent varchar(64),
	AlertGroup varchar(255),
	AlertKey varchar(255),
	Severity int,
	Summary varchar(255),
	StateChange utc,
	FirstOccurrence utc,
	LastOccurrence utc,
	InternalLast utc,
	Poll int,
	Type int,
	Tally int,
	Class int,
	Grade int,
	Location varchar(64),
	OwnerUID int,
	OwnerGID int,
	Acknowledged int,
	Flash int,
	EventId varchar(255),
	ExpireTime int,
	ProcessReq int,
	SuppressEscl int,
	Customer varchar(160),
	Service varchar(64),
	PhysicalSlot int,
	PhysicalPort int,
	PhysicalCard varchar(64),
	TaskList int,
	NmosSerial varchar(64),
	NmosObjInst int,
	NmosCauseType int,
	NmosDomainName varchar(64),
	NmosEntityId int,
	NmosManagedStatus int,
	NmosEventMap varchar(64),
	LocalNodeAlias varchar(64),
	LocalPriObj varchar(255),
	LocalSecObj varchar(255),
	LocalRootObj varchar(255),
	RemoteNodeAlias varchar(64),
	RemotePriObj varchar(255),
	RemoteSecObj varchar(255),
	RemoteRootObj varchar(255),
	X733EventType int,
	X733ProbableCause int,
	X733SpecificProb varchar(64),
	X733CorrNotif varchar(255),
	ServerName varchar(64),
	ServerSerial int,
	URL varchar(1024),
	ExtendedAttr varchar(4096),
	OldRow int,
	ProbeSubSecondId int,
	BSM_Identity varchar(1024),
	CollectionFirst utc,
	AggregationFirst utc,
	DisplayFirst utc,
	methodProcedure varchar(64),
	rcaExpire int,
	rcaProbableCause int,
	rcaSympatRule int,
	rcaSymptomCount int,
	rcaTally int,
	wbAgentAlias varchar(64),
	wbAgentNode varchar(64),
	wbAutomationID varchar(128),
	AlertSubGroup varchar(255),
	wbCarrier varchar(16),
	wbGateway varchar(16),
	wbInterface varchar(64),
	wbNeighbor varchar(64),
	wbSat varchar(8),
	wbSmtsIP varchar(64),
	wbStatus int,
	wbTicketID varchar(32),
	wbTime int,
	rcaMethodProcedureAssignmentId int,
	wbDeviceType varchar(64),
	provisoSubElementIndex int,
	provisoThresholdType int,
	provisoViolationTime utc,
	provisoSubElementGrpIndex int,
	provisoFormulaIndex int,
	wbOriginalSeverity int,
	wbMgtIP varchar(32),
	rcaEscalationId varchar(64),
	wbIfAlias varchar(1024),
	wbEventFilter int,
	wbExtra varchar(4096),
	wbView varchar(255),
	wbProbe varchar(64),
	wbSystem varchar(64)
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table custom.runningAutomations persistent
(
	automation_id int primary key,
	serial int primary key,
	PID int,
	startTime varchar(128),
	childPIDs varchar(256)
);
go


create database service;
go

alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table service.status persistent
(
	Name varchar(255) primary key,
	CurrentState int,
	StateChange utc,
	LastGoodAt utc,
	LastBadAt utc,
	LastMarginalAt utc,
	LastReportAt utc
);
go


create database master;
go

alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table master.permissions persistent
(
	UID int primary key,
	AllowISQLWrite int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table master.profiles persistent
(
	UID int primary key,
	HasRestriction int,
	Restrict1 varchar(255),
	Restrict2 varchar(255),
	Restrict3 varchar(255),
	Restrict4 varchar(255),
	AllowISQL int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table master.servergroups persistent
(
	ServerName varchar(64) primary key,
	GroupID int,
	Weight int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table master.class_membership persistent
(
	Class int primary key,
	Parent int primary key,
	ClassName varchar(255)
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table master.stats persistent
(
	StatTime utc primary key,
	NumClients int,
	NumRealtime int,
	NumProbes int,
	NumGateways int,
	NumMonitors int,
	NumProxys int,
	EventCount int,
	JournalCount int,
	DetailCount int,
	StatusInserts int,
	StatusNewInserts int,
	StatusDedups int,
	JournalInserts int,
	DetailsInserts int,
	StatusUpdates int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table master.activity_stats persistent
(
	DatabaseName varchar(40) primary key,
	StatusNewInserts int,
	StatusDedups int,
	JournalInserts int,
	DetailsInserts int,
	StatusUpdates int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table master.probestats persistent
(
	SeqNos incr,
	KeyField varchar(128) primary key,
	StatTime utc,
	ProbeUpTime int,
	ProbeAgent varchar(32),
	ProbeHost varchar(64),
	ProbeId varchar(96),
	ProbePID int,
	NumEventsProcessed int,
	NumEventsGenerated int,
	NumEventsDiscarded int,
	RulesFileTimeSec int,
	AvgRulesFileTime int,
	CPUTimeSec int,
	ProbeMemory int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table master.activity_probestats persistent
(
	ReportAgent char(32) primary key,
	ProbeStatsLastSeqNos int,
	MasterStatsLast utc
);
go


alter system set 'Store.DefaultVirtual' = 'virtual_store';
go
create table master.my_perf_table virtual
(
	DatabaseName varchar(64) primary key,
	EventCount int,
	LastUpdate utc,
	EventRate real
);
go


alter system set 'Store.DefaultVirtual' = 'virtual_store';
go
create table master.sm_top_nodes virtual
(
	Node varchar(64) primary key,
	Tally int
);
go


alter system set 'Store.DefaultVirtual' = 'virtual_store';
go
create table master.sm_top_probes virtual
(
	Identifier varchar(255) primary key,
	Probe varchar(64),
	Hostname varchar(64),
	ConnectionID int,
	Tally int
);
go


alter system set 'Store.DefaultVirtual' = 'virtual_store';
go
create table master.sm_top_classes virtual
(
	Class int primary key,
	Tally int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table master.sm_activity persistent
(
	ReportTrigger char(255) primary key,
	ProbeStatsLastSeqNos int,
	MasterStatsLast utc
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table master.sm_thresholds persistent
(
	ThresholdName char(64) primary key,
	DisplayName char(64),
	Sev1 int,
	Sev2 int,
	Sev3 int,
	Sev4 int,
	Sev5 int,
	EnableInfo int,
	DeduplicateInfo int
);
go


create view master.names as select UserName as Name, UserID as UID, UserID - UserID as GID, Passwd, SystemUser as Type from security.users;
go

create view master.groups as select GroupName as Name, GroupID as GID from security.groups;
go

create view master.members as select Compat as KeyField, UserID as UID, GroupID as GID from security.group_members;
go

create database registry;
go

alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table registry.oslc persistent
(
	Name varchar(64),
	RegistryURI varchar(1024) primary key,
	RegistryUsername varchar(64),
	RegistryPassword varchar(64),
	Registered int,
	RegistrationURI varchar(1024),
	LastRegistered utc
);
go


alter system set 'Store.DefaultVirtual' = 'virtual_store';
go
create table registry.probes virtual
(
	Name varchar(128) primary key,
	Hostname varchar(64) primary key,
	PID int,
	Status int,
	HTTP_port int,
	HTTPS_port int,
	StartTime utc,
	ProbeType varchar(128),
	ConnectionID int,
	LastUpdate utc
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table registry.oslcsp persistent
(
	Name varchar(64),
	RegistryURI varchar(1024) primary key,
	RegistryUsername varchar(64),
	RegistryPassword varchar(64),
	Registered int,
	RegistrationURI varchar(1024),
	LastRegistered utc
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table registry.oslcecip persistent
(
	CIPId incr,
	ResourceType varchar(1024) primary key,
	Name varchar(128),
	Description varchar(1024),
	QueryPattern varchar(4096)
);
go

CREATE INDEX oslcecip_ididx ON registry.oslcecip USING HASH (CIPId);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table registry.oslcecip_regs persistent
(
	CIPId int primary key,
	RegistryURI varchar(1024) primary key,
	RequestTime utc,
	Registered int,
	RegistrationURI varchar(1024),
	LastRegistered utc
);
go


create database alerts;
go

alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table alerts.status persistent
(
	Identifier varchar(255) primary key,
	Serial incr,
	Node varchar(64),
	NodeAlias varchar(64),
	Manager varchar(64),
	Agent varchar(64),
	AlertGroup varchar(255),
	AlertKey varchar(255),
	Severity int,
	Summary varchar(255),
	StateChange utc,
	FirstOccurrence utc,
	LastOccurrence utc,
	InternalLast utc,
	Poll int,
	Type int,
	Tally int,
	Class int,
	Grade int,
	Location varchar(64),
	OwnerUID int,
	OwnerGID int,
	Acknowledged int,
	Flash int,
	EventId varchar(255),
	ExpireTime int,
	ProcessReq int,
	SuppressEscl int,
	Customer varchar(160),
	Service varchar(64),
	PhysicalSlot int,
	PhysicalPort int,
	PhysicalCard varchar(64),
	TaskList int,
	NmosSerial varchar(64),
	NmosObjInst int,
	NmosCauseType int,
	NmosDomainName varchar(64),
	NmosEntityId int,
	NmosManagedStatus int,
	NmosEventMap varchar(64),
	LocalNodeAlias varchar(64),
	LocalPriObj varchar(255),
	LocalSecObj varchar(255),
	LocalRootObj varchar(255),
	RemoteNodeAlias varchar(64),
	RemotePriObj varchar(255),
	RemoteSecObj varchar(255),
	RemoteRootObj varchar(255),
	X733EventType int,
	X733ProbableCause int,
	X733SpecificProb varchar(64),
	X733CorrNotif varchar(255),
	ServerName varchar(64),
	ServerSerial int,
	URL varchar(1024),
	ExtendedAttr varchar(4096),
	OldRow int,
	ProbeSubSecondId int,
	BSM_Identity varchar(1024),
	CollectionFirst utc,
	AggregationFirst utc,
	DisplayFirst utc,
	methodProcedure varchar(64),
	rcaExpire int,
	rcaProbableCause int,
	rcaSympatRule int,
	rcaSymptomCount int,
	rcaTally int,
	wbAgentAlias varchar(64),
	wbAgentNode varchar(64),
	wbAutomationID varchar(128),
	AlertSubGroup varchar(255),
	wbCarrier varchar(16),
	wbGateway varchar(16),
	wbInterface varchar(64),
	wbNeighbor varchar(64),
	wbSat varchar(8),
	wbSmtsIP varchar(64),
	wbStatus int,
	wbTicketID varchar(32),
	wbTime int,
	rcaMethodProcedureAssignmentId int,
	wbDeviceType varchar(64),
	provisoSubElementIndex int,
	provisoThresholdType int,
	provisoViolationTime utc,
	provisoSubElementGrpIndex int,
	provisoFormulaIndex int,
	wbOriginalSeverity int,
	wbMgtIP varchar(32),
	rcaEscalationId varchar(64),
	wbIfAlias varchar(1024),
	wbEventFilter int,
	wbExtra varchar(4096),
	wbView varchar(255),
	wbProbe varchar(64),
	wbSystem varchar(64),
	VnoId varchar(1024)
);
go

CREATE INDEX serial ON alerts.status USING HASH (Serial);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table alerts.journal persistent
(
	KeyField varchar(255) primary key,
	Serial int,
	UID int,
	Chrono utc,
	Text1 varchar(255),
	Text2 varchar(255),
	Text3 varchar(255),
	Text4 varchar(255),
	Text5 varchar(255),
	Text6 varchar(255),
	Text7 varchar(255),
	Text8 varchar(255),
	Text9 varchar(255),
	Text10 varchar(255),
	Text11 varchar(255),
	Text12 varchar(255),
	Text13 varchar(255),
	Text14 varchar(255),
	Text15 varchar(255),
	Text16 varchar(255)
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table alerts.details persistent
(
	KeyField varchar(255) primary key,
	Identifier varchar(255),
	AttrVal int,
	Sequence int,
	Name varchar(255),
	Detail varchar(255)
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table alerts.objclass persistent
(
	Tag int primary key,
	Name varchar(64),
	Icon varchar(255),
	Menu varchar(64)
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table alerts.objmenus persistent
(
	Menu varchar(64) primary key,
	Columns int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table alerts.objmenuitems persistent
(
	KeyField varchar(255) primary key,
	Menu varchar(64),
	Sequence int,
	Title varchar(64),
	Command1 varchar(255),
	Command2 varchar(255),
	Command3 varchar(255),
	Command4 varchar(255),
	RedirectStdin int,
	RedirectStdout int,
	RedirectStderr int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table alerts.resolutions persistent
(
	KeyField varchar(255) primary key,
	Tag int,
	Sequence int,
	Title varchar(64),
	Resolution1 varchar(255),
	Resolution2 varchar(255),
	Resolution3 varchar(255),
	Resolution4 varchar(255)
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table alerts.conversions persistent
(
	KeyField varchar(255) primary key,
	Colname varchar(255),
	Value int,
	Conversion varchar(255)
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table alerts.col_visuals persistent
(
	Colname varchar(255) primary key,
	Title varchar(255),
	DefWidth int,
	MaxWidth int,
	TitleJustify int,
	DataJustify int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table alerts.colors persistent
(
	Severity int primary key,
	AckedRed int,
	AckedGreen int,
	AckedBlue int,
	UnackedRed int,
	UnackedGreen int,
	UnackedBlue int
);
go


alter system set 'Store.DefaultVirtual' = 'virtual_store';
go
create table alerts.iduc_messages virtual
(
	MsgID int primary key,
	MsgText varchar(4096),
	MsgTime utc
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table alerts.application_types persistent
(
	application varchar(64) primary key,
	description varchar(64),
	connect_type int,
	connect_severity int,
	disconnect_type int,
	disconnect_severity int,
	expire_time int,
	discard boolean
);
go


alter system set 'Store.DefaultVirtual' = 'virtual_store';
go
create table alerts.problem_events virtual
(
	Identifier varchar(255) primary key,
	LastOccurrence utc,
	AlertKey varchar(255),
	AlertGroup varchar(255),
	Node varchar(64),
	Manager varchar(64),
	Resolved boolean,
	ProbeSubSecondId int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table alerts.backup_state persistent
(
	KeyField int primary key,
	CurrentBackup unsigned
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table alerts.login_failures persistent
(
	UserName varchar(64) primary key,
	LastFailure utc,
	LastGood utc,
	FailureCount int
);
go


alter system set 'Store.DefaultVirtual' = 'virtual_store';
go
create table alerts.resync_complete virtual
(
	GatewayName varchar(64) primary key
);
go


create database iduc_system;
go

alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table iduc_system.channel persistent
(
	Name varchar(64) primary key,
	ChannelID int primary key,
	Description varchar(2048)
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table iduc_system.channel_interest persistent
(
	InterestID int primary key,
	ElementName varchar(64),
	IsGroup int,
	Hostname varchar(255),
	AppName varchar(255),
	AppDescription varchar(255),
	ChannelID int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table iduc_system.channel_summary persistent
(
	DatabaseName varchar(64) primary key,
	TableName varchar(64) primary key,
	ChannelID int primary key,
	SummaryID int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table iduc_system.channel_summary_cols persistent
(
	ColumnName varchar(64) primary key,
	SummaryID int primary key,
	Position int,
	ChannelID int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table iduc_system.iduc_stats persistent
(
	ServerName varchar(40) primary key,
	AppName varchar(40),
	AppDesc varchar(128) primary key,
	ConnectionId int primary key,
	LastIducTime utc
);
go


create database tools;
go

alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table tools.actions persistent
(
	ActionID int primary key,
	Name varchar(64),
	Owner int,
	Enabled int,
	Description1 varchar(255),
	Description2 varchar(255),
	Description3 varchar(255),
	Description4 varchar(255),
	HasInternal int,
	InternalEffect1 varchar(255),
	InternalEffect2 varchar(255),
	InternalEffect3 varchar(255),
	InternalEffect4 varchar(255),
	InternalForEach int,
	HasExternal int,
	ExternalEffect1 varchar(255),
	ExternalEffect2 varchar(255),
	ExternalEffect3 varchar(255),
	ExternalEffect4 varchar(255),
	ExternalForEach int,
	RedirectOut int,
	RedirectErr int,
	Platform varchar(255),
	JournalText1 varchar(255),
	JournalText2 varchar(255),
	JournalText3 varchar(255),
	JournalText4 varchar(255),
	JournalForEach int,
	HasForcedJournal int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table tools.action_access persistent
(
	ActionID int,
	GID int,
	ClassID int,
	ActionAccessID int primary key
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table tools.menus persistent
(
	MenuID int primary key,
	Name varchar(64),
	Owner int,
	Enabled int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table tools.menu_items persistent
(
	KeyField varchar(32) primary key,
	MenuID int,
	MenuItemID int,
	Title varchar(64),
	Description varchar(255),
	Enabled int,
	InvokeType int,
	InvokeID int,
	Position int,
	Accelerator varchar(32)
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table tools.menu_defs persistent
(
	Name varchar(64) primary key,
	DatabaseName varchar(64),
	TableName varchar(64),
	ShowField varchar(64),
	AssignField varchar(64),
	OrderbyField varchar(64),
	WhereClause varchar(255),
	Direction int
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table tools.prompt_defs persistent
(
	Name varchar(64) primary key,
	Prompt varchar(64),
	Default varchar(64),
	Value varchar(255),
	Type int
);
go


create database precision;
go

alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table precision.entity_service persistent
(
	NmosEntityId int primary key,
	ServiceEntityId int primary key,
	NmosDomainName varchar(255)
);
go


alter system set 'Store.DefaultPersistent' = 'table_store';
go
create table precision.service_details persistent
(
	ServiceEntityId int primary key,
	Type varchar(255),
	Name varchar(255),
	Customer varchar(255),
	NmosDomainName varchar(255)
);
go


alter system set 'Store.DefaultVirtual' = 'virtual_store';
go
create table precision.service_affecting_event virtual
(
	ServiceEntityId int primary key
);
go


