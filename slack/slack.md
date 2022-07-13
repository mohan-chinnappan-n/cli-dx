# How to send slack messages using DX

## Usage
```
Slack Integration

USAGE
  $ sfdx mohanc:slack:guide [-w <string>] [-m <string>] [--json] [--loglevel 
  trace|debug|info|warn|error|fatal|TRACE|DEBUG|INFO|WARN|ERROR|FATAL]

OPTIONS
  -m, --message=message                                                             Message to send
  -w, --webhookuri=webhookuri                                                       webHookURI
  --json                                                                            format output as json

  --loglevel=(trace|debug|info|warn|error|fatal|TRACE|DEBUG|INFO|WARN|ERROR|FATAL)  [default: warn] logging level
                                                                                    for this command invocation

EXAMPLE

             slack
             sfdx mohanc:slack:guide -w <webHookURI> -m <message>

             Example:
             sfdx mohanc:slack:guide -w https://hooks.slack.com/services/x/y/z -m "Deployment completed on PROD"


      

```

## Demo
- Note: URI in below example is mangled for protection
```

sfdx mohanc:slack:guide -w https://hooks.slack.com/services/T03P/B06MP/ZEC6 -m "Deployment completed on PROD"  
```

```
ok

```
## Slack UI

- ![SlackUI](img/slack-1.png)


# Using WebAPI
- Requires plugin version 0.0.193
## Usage
```
Slack Integration WebAPI

USAGE
  $ sfdx mohanc:slack:web [-t <string>] [-m <string>] [-c <string>] [--json] [--loglevel 
  trace|debug|info|warn|error|fatal|TRACE|DEBUG|INFO|WARN|ERROR|FATAL]

OPTIONS
  -c, --channel=channel                                                             Channel to post message to
  -m, --message=message                                                             Message to send
  -t, --token=token                                                                 Token - Bot User OAuth Token
  --json                                                                            format output as json

  --loglevel=(trace|debug|info|warn|error|fatal|TRACE|DEBUG|INFO|WARN|ERROR|FATAL)  [default: warn] logging level for
                                                                                    this command invocation

EXAMPLE

             slack
             sfdx mohanc:slack:web -t <token> -m <message> -c <channel>

             Example:
             sfdx mohanc:slack:web -t 'xoxb-aaa-bbb-ccc' -m "Deployment completed on PROD" -c devops


      

```
## Run
```
sfdx mohanc:slack:web -t 'xoxb-aaa-bbb-ccc' -m 'UAT completed' -c devops
```
```
Successfully send message 1657753210.210029 in conversation: devops

```

- ![Slack ui-2](img/slack-2.png)


