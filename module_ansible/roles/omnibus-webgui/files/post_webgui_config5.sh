#!/bin/bash
set -x

POST_CONFIG_LOG5="/opt/viasat/omnibus/logs/webgui/post_webgui_config_5.log"

>$POST_CONFIG_LOG5

{
#if [ -f /opt/viasat/omnibus/logs/webgui/post_process1 ] && [ -f /opt/viasat/omnibus/logs/webgui/post_process2 ] && [ -f /opt/viasat/omnibus/logs/webgui/post_process3 ] && [ -f /opt/viasat/omnibus/logs/webgui/post_process4 ]
if [ -f /opt/viasat/omnibus/logs/webgui/post_process1 ] && [ -f /opt/viasat/omnibus/logs/webgui/post_process2 ] && [ -f /opt/viasat/omnibus/logs/webgui/post_process3 ]
then
	#echo "Removing post_process1,post_process2,post_process3 and post_process4 from /opt/viasat/omnibus/logs/webgui" 
	echo "Removing post_process1,post_process2 and post_process3 from /opt/viasat/omnibus/logs/webgui" 
	#rm -f /opt/viasat/omnibus/logs/webgui/post_process1 /opt/viasat/omnibus/logs/webgui/post_process2 /opt/viasat/omnibus/logs/webgui/post_process3 /opt/viasat/omnibus/logs/webgui/post_process4	
	rm -f /opt/viasat/omnibus/logs/webgui/post_process1 /opt/viasat/omnibus/logs/webgui/post_process2 /opt/viasat/omnibus/logs/webgui/post_process3
	echo "Exiting Script"
	exit
else
        echo "There were no files found so exiting"
	echo "Exiting Script"
	exit
fi
} 2>&1 | tee -a $POST_CONFIG_LOG5
