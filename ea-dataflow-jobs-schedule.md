# Get the dataflow job schedule info

- Plugin version - 0.0.94

## Usage

```
Provide Job Schedule info for the given dataflow id

USAGE
  $ sfdx mohanc:ea:dataflow:schedule:list

OPTIONS
  -d, --dfid=dfid                                 Dataflow Id for which we need Job Schedule info

  -u, --targetusername=targetusername             username or alias for the target org; overrides default target 
                                                  org

  --apiversion=apiversion                         override the api version used for api requests made by this 
                                                  command

  --json                                          format output as json

  --loglevel=(trace|debug|info|warn|error|fatal)  logging level for this command invocation

EXAMPLE

              sfdx mohanc:ea:dataflow:schedule:list  -u <username> -d <Dataflow Id>

              NOTE:
              If you do not specify the Dataflow Id, schedule info for all dataflows will be listed

```

## Get the list of dataflows
```
$ sfdx mohanc:ea:dataflow:list -u mohan.chinnappan.n_ea2@gmail.com
```

```
Id,Label
02K3h000000Mu1oEAC,exportOppty2 <-----
02K3h000000Mu0vEAC,exportOppty
02K3h000000MtyuEAC,ExportCustomers
02K3h000000MrxWEAS,fruitsdf
02K3h000000Mr7JEAS,The_Motivator
02K3h000000Mr7KEAS,Default Salesforce Dataflow

```

## Get the schedule info for a given dataflow id (02K3h000000Mu1oEAC)
```

$ sfdx mohanc:ea:dataflow:schedule:list -u mohan.chinnappan.n_ea2@gmail.com -d 02K3h000000Mu1oEAC
```

```
Id,Label,Name,nextScheduledDate,scheduleAttributes
02K3h000000Mu1oEAC,exportOppty2,exportOppty2,2020-11-15T08:00:00.000Z,{"scheduleType":"weekly","timeZone":"America/Los_Angeles","startTime":{"hour":0,"minute":0},"daysOfWeek":["Sunday"]}

```

## Get the schedule info for all dataflows 
```
$ sfdx mohanc:ea:dataflow:schedule:list -u mohan.chinnappan.n_ea2@gmail.com
```
```
Id,Label,Name,nextScheduledDate,scheduleAttributes
02K3h000000Mu1oEAC,exportOppty2,exportOppty2,2020-11-15T08:00:00.000Z,{"scheduleType":"weekly","timeZone":"America/Los_Angeles","startTime":{"hour":0,"minute":0},"daysOfWeek":["Sunday"]}
02K3h000000Mu0vEAC,exportOppty,exportOppty,undefined,
02K3h000000MtyuEAC,ExportCustomers,ExportCustomers,undefined,
02K3h000000MrxWEAS,fruitsdf,fruitsdf,undefined,
02K3h000000Mr7JEAS,The_Motivator,The_Motivator,undefined,
02K3h000000Mr7KEAS,Default Salesforce Dataflow,SalesEdgeEltWorkflow,undefined,
```
`
