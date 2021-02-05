# Using crontab
```
root@jitsi:~/py# vi hw.py

root@jitsi:~/py# sfdx mohanc:py:run -h
Runs python script

USAGE
  $ sfdx mohanc:py:run

OPTIONS
  -s, --pyfilename=pyfilename                     Python Script to run
  --json                                          format output as json
  --loglevel=(trace|debug|info|warn|error|fatal)  logging level for this command invocation

EXAMPLE

       ** Runs python script **

           sfdx mohanc:py:run  -s <py script>
    
 ›   Error: EEXIT: 0
 ›   Code: EEXIT
root@jitsi:~/py# sfdx mohanc:py:run -s hw.py 
[ 'hw' ]
Done.

 
root@jitsi:~/py# crontab -e
crontab: installing new crontab
 
root@jitsi:~/py# crontab -e
crontab: installing new crontab

2 4 * * * /usr/local/bin/sfdx mohanc:py:run -s /root/py/hw.py 
 
root@jitsi:~/py# mail
"/var/mail/root": 1 message 1 new
>N   1 Cron Daemon        Fri Feb  5 04:02  20/672   Cron <root@jitsi> /usr/local/bin/sfdx mohanc:py:run -s /root/py/hw.py 
? 1
Return-Path: <root@jitsi.mohanc.com>
X-Original-To: root
Delivered-To: root@jitsi.mohanc.com
Received: by jitsi.mohanc.com (Postfix, from userid 0)
	id 7C67B4C488A; Fri,  5 Feb 2021 04:02:02 -0500 (EST)
From: root@jitsi.mohanc.com (Cron Daemon)
To: root@jitsi.mohanc.com
Subject: Cron <root@jitsi> /usr/local/bin/sfdx mohanc:py:run -s /root/py/hw.py 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Cron-Env: <SHELL=/bin/sh>
X-Cron-Env: <HOME=/root>
X-Cron-Env: <PATH=/usr/bin:/bin>
X-Cron-Env: <LOGNAME=root>
Message-Id: <20210205090202.7C67B4C488A@jitsi.mohanc.com>
Date: Fri,  5 Feb 2021 04:02:02 -0500 (EST)

[ 'hw' ]
Done.
? 
```
