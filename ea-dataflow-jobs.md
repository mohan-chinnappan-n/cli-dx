# Exploring dataflow jobs using DX

##  Login
```
$ sfdx force:auth:web:login 
Successfully authorized mohan.chinnappan.n_ea2@gmail.com with org ID 00D3h000007R1LuEAK
You may now close the browser

# create header.json
sfdx mohanc:hello:myorg -u mohan.chinnappan.n_ea2@gmail.com  >   ~/.headers/header_ea.json

```

## List the dataflow jobs in the org
```
$ sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v50.0/wave/dataflowjobs -m GET -f ~/.headers/header_ea.json 
```
```json
{
    "dataflowJobs": [
        {
            "createdDate": "2020-10-24T03:28:19.000Z",
            "duration": 23,
            "executedDate": "2020-10-24T03:28:20.000Z",
            "id": "03C3h000002pSSeEAM",
            "jobType": "fileupload",
            "label": "fieldusage_csvDataset Upload flow - Overwrite",
            "nodesUrl": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pSSeEAM/nodes",
            "progress": 1,
            "startDate": "2020-10-24T03:28:19.000Z",
            "status": "Success",
            "type": "dataflowjob",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pSSeEAM"
        },
        {
            "createdDate": "2020-10-23T02:05:41.000Z",
            "duration": 4,
            "executedDate": "2020-10-23T02:05:41.000Z",
            "id": "03C3h000002pLrNEAU",
            "jobType": "user",
            "label": "Default Salesforce Dataflow",
            "message": "Something went wrong while executing the Extract_Account node: Error accessing synced dataset.: Invalid extract field name [AccountSource] (02K3h000000Mr7KEAS_03C3h000002pLrNEAU)",
            "nodesUrl": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrNEAU/nodes",
            "progress": 1.0666666666666667,
            "startDate": "2020-10-23T02:05:41.000Z",
            "status": "Failure",
            "type": "dataflowjob",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrNEAU"
        },
        {
            "createdDate": "2020-10-23T02:06:23.000Z",
            "id": "0303h0000027E82AAE",
            "jobType": "user",
            "label": "The_Motivator",
            "message": "scheduled run failed The dataflow job can’t start because it&#39;s already in the queue.",
            "nodesUrl": "/services/data/v50.0/wave/dataflowjobs/0303h0000027E82AAE/nodes",
            "progress": 0,
            "startDate": "2020-10-23T02:06:23.000Z",
            "status": "Failure",
            "type": "dataflowjob",
            "url": "/services/data/v50.0/wave/dataflowjobs/0303h0000027E82AAE"
        },
        {
            "createdDate": "2020-10-23T02:06:50.000Z",
            "duration": 72,
            "executedDate": "2020-10-23T02:06:51.000Z",
            "id": "03C3h000002pLrXEAU",
            "jobType": "user",
            "label": "The_Motivator",
            "nodesUrl": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes",
            "progress": 1,
            "startDate": "2020-10-23T02:06:50.000Z",
            "status": "Success",
            "type": "dataflowjob",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU"
        },
        {
            "createdDate": "2020-10-23T02:06:03.000Z",
            "duration": 46,
            "executedDate": "2020-10-23T02:06:06.000Z",
            "id": "03C3h000002pLoREAU",
            "jobType": "datasync",
            "label": "UserRole (Replication)",
            "nodesUrl": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLoREAU/nodes",
            "progress": 1,
            "startDate": "2020-10-23T02:06:03.000Z",
            "status": "Success",
            "type": "dataflowjob",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLoREAU"
        },
        {
            "createdDate": "2020-10-23T02:06:03.000Z",
            "duration": 37,
            "executedDate": "2020-10-23T02:06:07.000Z",
            "id": "03C3h000002pLoSEAU",
            "jobType": "datasync",
            "label": "Event (Replication)",
            "nodesUrl": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLoSEAU/nodes",
            "progress": 1,
            "startDate": "2020-10-23T02:06:03.000Z",
            "status": "Success",
            "type": "dataflowjob",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLoSEAU"
        },
        {
            "createdDate": "2020-10-23T02:06:03.000Z",
            "duration": 35,
            "executedDate": "2020-10-23T02:06:04.000Z",
            "id": "03C3h000002pLoQEAU",
            "jobType": "datasync",
            "label": "Task (Replication)",
            "nodesUrl": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLoQEAU/nodes",
            "progress": 1,
            "startDate": "2020-10-23T02:06:03.000Z",
            "status": "Success",
            "type": "dataflowjob",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLoQEAU"
        },
        {
            "createdDate": "2020-10-23T00:22:47.000Z",
            "duration": 3,
            "executedDate": "2020-10-23T00:22:47.000Z",
            "id": "03C3h000002pL9VEAU",
            "jobType": "user",
            "label": "Default Salesforce Dataflow",
            "message": "Something went wrong while executing the Extract_Account node: Error accessing synced dataset.: Invalid extract field name [AccountSource] (02K3h000000Mr7KEAS_03C3h000002pL9VEAU)",
            "nodesUrl": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pL9VEAU/nodes",
            "progress": 1.0666666666666667,
            "startDate": "2020-10-23T00:22:47.000Z",
            "status": "Failure",
            "type": "dataflowjob",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pL9VEAU"
        },
        {
            "createdDate": "2020-10-23T00:21:35.000Z",
            "duration": 71,
            "executedDate": "2020-10-23T00:22:13.000Z",
            "id": "03C3h000002pL0UEAU",
            "jobType": "datasync",
            "label": "PricebookEntry (Replication)",
            "nodesUrl": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pL0UEAU/nodes",
            "progress": 1,
            "startDate": "2020-10-23T00:21:35.000Z",
            "status": "Success",
            "type": "dataflowjob",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pL0UEAU"
        },
        {
            "createdDate": "2020-10-23T00:21:35.000Z",
            "duration": 71,
            "executedDate": "2020-10-23T00:22:12.000Z",
            "id": "03C3h000002pKwIEAU",
            "jobType": "datasync",
            "label": "OpportunityLineItem (Replication)",
            "nodesUrl": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pKwIEAU/nodes",
            "progress": 1,
            "startDate": "2020-10-23T00:21:35.000Z",
            "status": "Success",
            "type": "dataflowjob",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pKwIEAU"
        },
        {
            "createdDate": "2020-10-23T00:21:35.000Z",
            "duration": 71,
            "executedDate": "2020-10-23T00:22:12.000Z",
            "id": "03C3h000002pL9LEAU",
            "jobType": "datasync",
            "label": "Opportunity (SFDC_LOCAL)",
            "nodesUrl": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pL9LEAU/nodes",
            "progress": 1,
            "startDate": "2020-10-23T00:21:35.000Z",
            "status": "Success",
            "type": "dataflowjob",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pL9LEAU"
        },
        {
            "createdDate": "2020-10-23T00:21:35.000Z",
            "duration": 37,
            "executedDate": "2020-10-23T00:21:39.000Z",
            "id": "03C3h000002pKzTEAU",
            "jobType": "datasync",
            "label": "Product2 (Replication)",
            "nodesUrl": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pKzTEAU/nodes",
            "progress": 1,
            "startDate": "2020-10-23T00:21:35.000Z",
            "status": "Success",
            "type": "dataflowjob",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pKzTEAU"
        },
        {
            "createdDate": "2020-10-23T00:21:34.000Z",
            "duration": 36,
            "executedDate": "2020-10-23T00:21:37.000Z",
            "id": "03C3h000002pKzREAU",
            "jobType": "datasync",
            "label": "Account (SFDC_LOCAL)",
            "nodesUrl": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pKzREAU/nodes",
            "progress": 1,
            "startDate": "2020-10-23T00:21:34.000Z",
            "status": "Success",
            "type": "dataflowjob",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pKzREAU"
        },
        {
            "createdDate": "2020-10-23T00:21:35.000Z",
            "duration": 36,
            "executedDate": "2020-10-23T00:21:38.000Z",
            "id": "03C3h000002pKzSEAU",
            "jobType": "datasync",
            "label": "User (SFDC_LOCAL)",
            "nodesUrl": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pKzSEAU/nodes",
            "progress": 1,
            "startDate": "2020-10-23T00:21:35.000Z",
            "status": "Success",
            "type": "dataflowjob",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pKzSEAU"
        }
    ],
    "url": "/services/data/v50.0/wave/dataflowjobs"
}
```
```
$ sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v50.0/wave/dataflowjobs/03C3h000002pSSeEAM -m GET -f ~/.headers/header_ea.json 
```
```json
{
    "createdDate": "2020-10-24T03:28:19.000Z",
    "duration": 23,
    "executedDate": "2020-10-24T03:28:20.000Z",
    "id": "03C3h000002pSSeEAM",
    "jobType": "fileupload",
    "label": "fieldusage_csvDataset Upload flow - Overwrite",
    "nodesUrl": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pSSeEAM/nodes",
    "progress": 1,
    "startDate": "2020-10-24T03:28:19.000Z",
    "status": "Success",
    "type": "dataflowjob",
    "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pSSeEAM"
}
```

```
$ sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v50.0/wave/dataflowjobs/03C3h000002pSSeEAM/nodes -m GET -f ~/.headers/header_ea.json 
```

```json
{
    "nodes": [
        {
            "duration": 0,
            "id": "03L3h00000JWahYEAT",
            "inputRows": {},
            "label": "load",
            "message": "",
            "name": "load",
            "nodeType": "sfdcFetch",
            "outputRows": {},
            "startDate": "2020-10-24T03:28:20.219Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pSSeEAM/nodes/03L3h00000JWahYEAT"
        },
        {
            "duration": 0,
            "id": "03L3h00000JWahZEAT",
            "inputRows": {},
            "label": "digest",
            "message": "",
            "name": "digest",
            "nodeType": "csvDigest",
            "outputRows": {
                "failedCount": 0,
                "processedCount": 140
            },
            "startDate": "2020-10-24T03:28:20.614Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pSSeEAM/nodes/03L3h00000JWahZEAT"
        },
        {
            "duration": 0,
            "id": "03L3h00000JWahaEAD",
            "inputRows": {},
            "label": "optimize-register",
            "message": "",
            "name": "optimize-register",
            "nodeType": "internal",
            "outputRows": {},
            "startDate": "2020-10-24T03:28:21.549Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pSSeEAM/nodes/03L3h00000JWahaEAD"
        },
        {
            "duration": 10,
            "id": "03L3h00000JWahbEAD",
            "inputRows": {},
            "label": "register",
            "message": "",
            "name": "register",
            "nodeType": "internal",
            "outputRows": {},
            "startDate": "2020-10-24T03:28:21.610Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pSSeEAM/nodes/03L3h00000JWahbEAD"
        }
    ],
    "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pSSeEAM/nodes"
}
```

```
$ sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v50.0/wave/dataflowjobs/03C3h000002pSSeEAM/nodes/03L3h00000JWahbEAD -m GET -f ~/.headers/header_ea.json 
```
```json
{
    "duration": 10,
    "id": "03L3h00000JWahbEAD",
    "inputRows": {},
    "label": "register",
    "message": "",
    "name": "register",
    "nodeType": "internal",
    "outputRows": {},
    "startDate": "2020-10-24T03:28:21.610Z",
    "status": "success",
    "type": "dataflowjobnode",
    "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pSSeEAM/nodes/03L3h00000JWahbEAD"
}
```
