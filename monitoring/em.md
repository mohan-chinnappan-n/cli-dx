# Viewing and Visualizing Event Log files using DX

## Topics
- [Listing Event Types](#types)
- [Get the log files](#get)
- [Charts](#charts)


<a name="types"></a>
## Listing the Event Types
- Requires 0.0.110 version of the plugin
    - sfdx-mohanc-plugins@0.0.110
    - [How to install the plugin](https://mohan-chinnappan-n.github.io/dx/plugins.html#/1)
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
<a name="get"></a>
## Get the Event files for given Event Type

### Usage
```
 sfdx mohanc:monitoring:em:get   -hEvent Files for the given Event Type 

USAGE
  $ sfdx mohanc:monitoring:em:get

OPTIONS
  -e, --enddate=enddate                            End Date for the logs in the format YYYY-MM-DD, example: 2012-12-30
  -o, --eventfileout=eventfileout                  Output CSV file name to write the events into
  -s, --startdate=startdate                        Start Date for the logs in the format YYYY-MM-DD, example: 2012-12-30
  -t, --eventtype=eventtype                        Event Type for which Event File is requested
  -u, --targetusername=targetusername              username or alias for the target org; overrides default target org
  -v, --targetdevhubusername=targetdevhubusername  username or alias for the dev hub org; overrides default dev hub org
  --apiversion=apiversion                          override the api version used for api requests made by this command
  --json                                           format output as json
  --loglevel=(trace|debug|info|warn|error|fatal)   logging level for this command invocation

EXAMPLE

       ** Event Files for the given Event Type  **
       sfdx mohanc:monitoring:em:get -u <userName> -t <eventType> -o <outFileName> -s <startDate> -e <endDate>

```

### Demo
```
$ sfdx mohanc:monitoring:em:get -t API  -u mohan.chinnappan.n_ea2@gmail.com -o API2d.csv -s 2020-11-12 -e 2020-11-13
=== Collecting logs for the EventType: API ...
=== Getting log file for LogDate: 2020-11-13T00:00:00.000+0000 ...
=== Getting log file for LogDate: 2020-11-12T00:00:00.000+0000 ...

=== Opening API2d.csv ...
```
![Event file](img/event-out-1.png)
![fields map](https://res.cloudinary.com/hy4kyit2a/f_auto,fl_lossy,q_70/learn/modules/event_monitoring/event_monitoring_download/images/34f05d6f9de436049c6c33d6131829af_elf_solved_case.png)

<a name="charts"></a>
### Charts
```
$ sfdx mohanc:data:viz:barChart  -d ./API2d.csv -e ./API.csv.encoding-2.json -m bar -o ./APIbarchart.html -p ./apiChart.json

=== Opening ./APIbarchart.html via Local Web Server on port :7020 ...

```
![chart-2](img//api-chart-2.png)
![chart-1](img//api-chart-1.png)
