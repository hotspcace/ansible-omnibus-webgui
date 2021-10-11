#import sys
#import java
# usage = ./wsadmin.sh -lang jython -user smadmin -password smadmin -f changeKeystorePassword.py
#AdminTask.changeKeyStorePassword ('[-keyStoreName NodeDefaultTrustStore -scopeName (cell):JazzSMNode01Cell:(node):JazzSMNode01 -keyStorePassword WebAS -newKeyStorePassword changeme -newKeyStorePasswordVerify changeme]')
AdminTask.deleteSignerCertificate('[-keyStoreName NodeDefaultTrustStore -certificateAlias root]')
AdminTask.addSignerCertificate('[-keyStoreName NodeDefaultTrustStore -certificateAlias root -certificateFilePath /opt/viasat/omnibus/configs/webgui/prod_root_replacement_cert -base64Encoded true]')
AdminConfig.save()
