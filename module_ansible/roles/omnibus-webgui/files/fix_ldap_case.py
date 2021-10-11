#usage = ./wsadmin.sh -lang jython -user smadmin -password smadmin -f changeKeystorePassword.py
AdminTask.setIdMgrCustomProperty ('[-id LDAP1 -name returnUniqueNameInNormalCaseIfExtIdMapToDN -value true]')
AdminConfig.save()
