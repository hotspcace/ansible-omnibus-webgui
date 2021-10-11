#import sys
#import java
# usage = ./wsadmin.sh -lang jython -user smadmin -password smadmin -f changeKeystorePassword.py
#AdminTask.changeKeyStorePassword ('[-keyStoreName NodeDefaultTrustStore -scopeName (cell):JazzSMNode01Cell:(node):JazzSMNode01 -keyStorePassword WebAS -newKeyStorePassword changeme -newKeyStorePasswordVerify changeme]')
jvm=AdminConfig.list("JavaVirtualMachine")
AdminConfig.modify(jvm, '[[initialHeapSize 1024]]')
AdminConfig.modify(jvm, '[[maximumHeapSize 2048]]')
AdminConfig.save()
