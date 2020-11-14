# Viewing Event Log file using DX

## Listing the Event Types

### Usage
```
USAGE
  $ sfdx mohanc:monitoring:em:types

OPTIONS
  -u, --targetusername=targetusername              username or alias for the target org; overrides default target org
  -v, --targetdevhubusername=targetdevhubusername  username or alias for the dev hub org; overrides default dev hub org
  --apiversion=apiversion                          override the api version used for api requests made by this command
  --json                                           format output as json
  --loglevel=(trace|debug|info|warn|error|fatal)   logging level for this command invocation

EXAMPLE

       ** Show Event Types   **
       sfdx mohanc:monitoring:em:types -u <userName>

```

### Demo
```
$ sfdx mohanc:monitoring:em:types  -u mohan.chinnappan.n_ea2@gmail.com 
API
ApexExecution
ApexTrigger
BulkApi
ContentTransfer
DocumentAttachmentDownloads
LightningInteraction
LightningPageView
LightningPerformance
Login
Logout
RestApi
URI
WaveChange
WaveInteraction
WavePerformance

```

## Get the Event files for given Event Type

### Usage
```
$ sfdx mohanc:monitoring:em:get -h
Event Files for the given Event Type 

USAGE
  $ sfdx mohanc:monitoring:em:get

OPTIONS
  -o, --eventfileout=eventfileout                  Output CSV file name to write the events into
  -t, --eventtype=eventtype                        Event Type for which Event File is requested
  -u, --targetusername=targetusername              username or alias for the target org; overrides default target org
  -v, --targetdevhubusername=targetdevhubusername  username or alias for the dev hub org; overrides default dev hub org
  --apiversion=apiversion                          override the api version used for api requests made by this command
  --json                                           format output as json
  --loglevel=(trace|debug|info|warn|error|fatal)   logging level for this command invocation

EXAMPLE

       ** Event Files for the given Event Type  **
       sfdx mohanc:monitoring:em:get -u <userName> -t <eventType> -o <outFileName>

```

### Demo
```
$ sfdx mohanc:monitoring:em:get -t API  -u mohan.chinnappan.n_ea2@gmail.com -o /tmp/API.csv
=== Collecting logs for the EventType: API ...
........................
=== Opening /tmp/API.csv ...
```
![Event file](img/event-out-1.png)
