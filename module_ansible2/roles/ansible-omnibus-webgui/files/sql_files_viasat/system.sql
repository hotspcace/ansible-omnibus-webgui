-- First create the memstores
create memstore table_store persistent hard limit 524288000B soft limit 471859200B;
go

-- Next set up security database
create database security;
create database transfer;
go

-- Create ownership table and store ownership of external objects
alter system set 'Store.DefaultPersistent' = 'master_store';
go
create table security.owners persistent
(
	ApplicationID int primary key,
	ObjectType int primary key,
	Object varchar(255) primary key,
	OwnerType int,
	OwnerID int
);
go

insert into security.owners values (1, 1, '', 0, 0);
go
insert into security.owners values (3, 2, 'nco_ccserv.objserv', 0, 0);
go
insert into security.owners values (3, 2, 'nco_ccserv.security', 0, 0);
go
insert into security.owners values (3, 1, 'nco_ccserv', 0, 0);
go
insert into security.owners values (3, 2, 'nco_ccserv.file', 0, 0);
go

-- Create user table, just store system users for now
alter system set 'Store.DefaultPersistent' = 'master_store';
go
create table security.users persistent
(
	UserID int primary key,
	UserName varchar(64),
	SystemUser int,
	FullName varchar(255),
	Passwd varchar(64),
	UsePAM boolean,
	Enabled boolean
);
go

insert into security.users values (65534, 'nobody', 4, 'Nobody', '', 0, 0);
go
insert into security.users values (0, 'root', 1, 'Root User', '', 0, 1);
go

alter system set 'Store.DefaultPersistent' = 'master_store';
go
create table transfer.users persistent
(
	UserID int primary key,
	UserName varchar(64),
	SystemUser int,
	FullName varchar(255),
	Passwd varchar(64),
	UsePAM boolean,
	Enabled boolean
);
go

insert into transfer.users values (65534, 'nobody', 4, 'Nobody', '', 0, 0);
go
insert into transfer.users values (0, 'root', 1, 'Root User', '', 0, 1);
go

-- Create roles table, just store system roles for now
alter system set 'Store.DefaultPersistent' = 'master_store';
go
create table security.roles persistent
(
	RoleID int primary key,
	RoleName varchar(64),
	SystemRole boolean,
	Description varchar(255),
	RoleScope int
);
go

insert into security.roles values (0, 'Public', 1, 'Any User', 0);
go
insert into security.roles values (2, 'Administrator', 1, 'Administrator', 0);
go
insert into security.roles values (3, 'Normal', 1, 'Normal User', 0);
go
insert into security.roles values (-1, 'SuperUser', 1, 'Super User', 0);
go

alter system set 'Store.DefaultPersistent' = 'master_store';
go
create table transfer.roles persistent
(
	RoleID int primary key,
	RoleName varchar(64),
	SystemRole boolean,
	Description varchar(255),
	RoleScope int
);
go

insert into transfer.roles values (0, 'Public', 1, 'Any User', 0);
go
insert into transfer.roles values (2, 'Administrator', 1, 'Administrator', 0);
go
insert into transfer.roles values (3, 'Normal', 1, 'Normal User', 0);
go
insert into transfer.roles values (-1, 'SuperUser', 1, 'Super User', 0);
go

-- Create role grants, just store grant of public to root for now
alter system set 'Store.DefaultPersistent' = 'master_store';
go
create table security.role_grants persistent
(
	GranteeType int primary key,
	GranteeID int primary key,
	RoleID int primary key
);
go

insert into security.role_grants values (0, 0, 0);
go

alter system set 'Store.DefaultPersistent' = 'master_store';
go
create table transfer.role_grants persistent
(
	GranteeType int primary key,
	GranteeID int primary key,
	RoleID int primary key
);
go

insert into transfer.role_grants values (0, 0, 0);
go

-- Create permissions, just store root's permissions and permissions on external objects
alter system set 'Store.DefaultPersistent' = 'master_store';
go
create table security.permissions persistent
(
	ApplicationID int primary key,
	ObjectType int primary key,
	Object varchar(255) primary key,
	GranteeType int primary key,
	GranteeID int primary key,
	Allows int64,
	Denies int64,
	GrantOptions int64
);
go

insert into security.permissions values (1, 1, '', 0, 0, 65535, 0, 65535);
go
insert into security.permissions values (3, 2, 'nco_ccserv.objserv', 0, 0, 65535, 0, 65535);
go
insert into security.permissions values (3, 2, 'nco_ccserv.security', 0, 0, 65535, 0, 65535);
go
insert into security.permissions values (3, 2, 'nco_ccserv.file', 0, 0, 65535, 0, 65535);
go
insert into security.permissions values (3, 1, 'nco_ccserv', 0, 0, 65535, 0, 65535);
go

alter system set 'Store.DefaultPersistent' = 'master_store';
go
create table transfer.permissions persistent
(
	ApplicationID int primary key,
	ObjectType int primary key,
	Object varchar(255) primary key,
	GranteeType int primary key,
	GranteeID int primary key,
	Allows int64,
	Denies int64,
	GrantOptions int64
);
go

insert into transfer.permissions values (1, 1, '', 0, 0, 65535, 0, 65535);
go
insert into transfer.permissions values (3, 2, 'nco_ccserv.objserv', 0, 0, 65535, 0, 65535);
go
insert into transfer.permissions values (3, 2, 'nco_ccserv.security', 0, 0, 65535, 0, 65535);
go
insert into transfer.permissions values (3, 2, 'nco_ccserv.file', 0, 0, 65535, 0, 65535);
go
insert into transfer.permissions values (3, 1, 'nco_ccserv', 0, 0, 65535, 0, 65535);
go

-- Create groups table, just store system groups for now
alter system set 'Store.DefaultPersistent' = 'master_store';
go
create table security.groups persistent
(
	GroupID int primary key,
	GroupName varchar(64),
	SystemGroup boolean,
	Description varchar(255),
	Enabled boolean
);
go

insert into security.groups values (0, 'Public', 1, 'Public Group', 0);
go
insert into security.groups values (1, 'System', 1, 'System Group', 0);
go
insert into security.groups values (2, 'Administrator', 1, 'Admin Group', 0);
go
insert into security.groups values (3, 'Normal', 1, 'Normal Group', 0);
go

alter system set 'Store.DefaultPersistent' = 'master_store';
go
create table transfer.groups persistent
(
	GroupID int primary key,
	GroupName varchar(64),
	SystemGroup boolean,
	Description varchar(255),
	Enabled boolean
);
go

insert into transfer.groups values (0, 'Public', 1, 'Public Group', 0);
go
insert into transfer.groups values (1, 'System', 1, 'System Group', 0);
go
insert into transfer.groups values (2, 'Administrator', 1, 'Admin Group', 0);
go
insert into transfer.groups values (3, 'Normal', 1, 'Normal Group', 0);
go

-- Create group membership table, just system group membership for now
alter system set 'Store.DefaultPersistent' = 'master_store';
go
create table security.group_members persistent
(
	UserID int primary key,
	GroupID int primary key,
	Compat varchar(64)
);
go

insert into security.group_members values (0, 0, '');
go
insert into security.group_members values (65534, 0, '');
go
insert into security.group_members values (0, 1, '');
go
insert into security.group_members values (65534, 1, '');
go
insert into security.group_members values (0, 3, '');
go
insert into security.group_members values (65534, 3, '');
go

alter system set 'Store.DefaultPersistent' = 'master_store';
go
create table transfer.group_members persistent
(
	UserID int primary key,
	GroupID int primary key,
	Compat varchar(64)
);
go

insert into transfer.group_members values (0, 0, '');
go
insert into transfer.group_members values (65534, 0, '');
go
insert into transfer.group_members values (0, 1, '');
go
insert into transfer.group_members values (65534, 1, '');
go
insert into transfer.group_members values (0, 3, '');
go
insert into transfer.group_members values (65534, 3, '');
go

-- Create restriction filter table, store none for now
alter system set 'Store.DefaultPersistent' = 'master_store';
go
create table security.restriction_filters persistent
(
	GranteeType int primary key,
	GranteeID int primary key,
	RestrictionName varchar(40) primary key,
	DatabaseName varchar(40),
	TableName varchar(40)
);
go


alter system set 'Store.DefaultPersistent' = 'master_store';
go
create table transfer.restrictions persistent
(
	RestrictionName varchar(40) primary key,
	TableName varchar(40),
	DatabaseName varchar(40),
	ConditionText varchar(16384),
	CreationText varchar(16384)
);
go


alter system set 'Store.DefaultPersistent' = 'master_store';
go
create table transfer.security_restrictions persistent
(
	GranteeType int primary key,
	GranteeID int primary key,
	RestrictionName varchar(40) primary key,
	DatabaseName varchar(40),
	TableName varchar(40)
);
go



-- Other security tables

-- Any other system databases
