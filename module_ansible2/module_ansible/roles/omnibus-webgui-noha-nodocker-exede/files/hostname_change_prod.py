#import sys
#import java
# usage = ./wsadmin.sh -lang jython -user smadmin -password smadmin -f changeKeystorePassword.py
#AdminTask.changeKeyStorePassword ('[-keyStoreName NodeDefaultTrustStore -scopeName (cell):JazzSMNode01Cell:(node):JazzSMNode01 -keyStorePassword WebAS -newKeyStorePassword changeme -newKeyStorePasswordVerify changeme]')

#change hostname in websphere
hostchange=AdminConfig.list('ServerIndex')
AdminConfig.modify(hostchange, '[[hostName prod-omnibus-webgui01.nms.viasat.io]]')
AdminConfig.save()
