create user 'omniadmin' id 10001 full name 'Omnibus Admin' password 'ECBBBJAGFKFHGD' encrypted pam false;
go
alter user 'omniadmin' set enabled true;
go
alter group 'System' assign members 'omniadmin';
go
alter group 'Administrator' assign members 'omniadmin';
go
