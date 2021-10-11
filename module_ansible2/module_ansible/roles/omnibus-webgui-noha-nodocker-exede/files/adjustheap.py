import sys
#
# ./wsadmin.sh -lang jython -javaoption -Dscript.encoding=IBM-1047\
# -user userid -password password -f /scriptingpath/heapadjust.py servername initheap maxheap
#
#  © Copyright IBM Corporation, 2007, 2008
#
def printHelp():
    print "This script sets the jvm init and max heap sizes for a server"
    print "Format is heapadjust.py servername initheapsize maxheapsize"
#
if(len(sys.argv) > 2):
    # get server name, initialheapsize, and maxheapsize from the command line
    s1 = sys.argv[0]
    ih = sys.argv[1]
    mh = sys.argv[2]
else:
    printHelp()
    sys.exit() 
ihc = 'initialHeapSize'
mhc = 'maximumHeapSize'
#
#   get the id of the server
#
srv = "/Server:" + s1 + "/"
srvid = AdminConfig.getid(srv)
s1pdefs = AdminConfig.list('ProcessDef', srvid).split("\n")
for pd in s1pdefs:
    if AdminConfig.showAttribute(pd, 'processType') == 'Servant':
        jvms = AdminConfig.list('JavaVirtualMachine', pd).split("\n")
    continue
 
#  we now have the correct jvm
for jvm in jvms:
    AdminConfig.modify(jvm, [[ihc, ih]])
    AdminConfig.modify(jvm, [[mhc, mh]])
    continue
 
#
#   Save the Config
#
AdminConfig.save()
#
#
#   Synchronize with the nodes...
#
nl = AdminConfig.list('Node').split("\n")
#
#
print "Beginning node synchronization"
for n in nl:
    nn = AdminConfig.showAttribute(n, 'name')
    objn = "type=NodeSync,node=" + nn + ",*"
    Syncl = AdminControl.completeObjectName(objn)
    if Syncl != "":
        AdminControl.invoke(Syncl, 'sync')
        print "Done with node " + nn
    else:
        print "Skipping node " + nn
    continue
#  All Done.
