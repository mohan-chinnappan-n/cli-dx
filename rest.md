# REST API support using DX

- Requires 0.0.50 version of the plugin
    - sfdx-mohanc-plugins@0.0.50
    - [How to install the plugin](https://mohan-chinnappan-n.github.io/dx/plugins.html#/1)

- Supported Methods
    - GET
    - PUT
    - POST
    - PATCH
    - DELETE 


### Topics
- [Usage](#usage)
- [REST GET](#get)
- [REST POST](#post)
- [REST PATCH](#patch)
- [REST DELETE](#delete)
- [REST PUT](#put)
- [Getting Saleforce access-token, instanceUrl, API Version, RestAPIUri](#myorg)
- [BulkAPI 2.0 data load](#bulkapi2) 

<a name="usage"></a>
## Usage
```
$ sfdx mohanc:ws:rest -h
REST API 

USAGE
  $ sfdx mohanc:ws:rest

OPTIONS
  -d, --datafilename=datafilename                 data filename (content in json)
  -f, --headerfilename=headerfilename             header filename (content in json)
  -m, --method=method                             REST method (GET|POST|PATCH)
  -r, --resourceuri=resourceuri                   REST Resource URI
  --json                                          format output as json
  --loglevel=(trace|debug|info|warn|error|fatal)  logging level for this command invocation

EXAMPLE

              Perform REST API calls
              sfdx mohanc:ws:rest  -r <resourceURI> -m <method: GET|POST|PATCH|PUT|DELETE> -f <header-file> -d <data>



```

## Demos
<a name="get"></a>
###  GET
- get time
```
$ sfdx mohanc:ws:rest -r https://mohansun-rum.herokuapp.com/time  -m GET 
{
    "time": "2020-08-21T20:24:56.033Z"
}
```
- get random dog images

```
$ sfdx mohanc:ws:rest -r https://dog.ceo/api/breeds/image/random  -m GET 
{
    "message": "https://images.dog.ceo/breeds/papillon/n02086910_9317.jpg",
    "status": "success"
}

```

- Get all bulkAPI 2.0 jobs
```
$ sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/jobs/ingest  -m GET -f header.json 
{
    "done": true,
    "records": [
        {
            "id": "7503h000004R4JuAAK",
            "operation": "insert",
            "object": "Case",
            "createdById": "0053h000002xQ5sAAE",
            "createdDate": "2020-08-21T20:30:24.000+0000",
            "systemModstamp": "2020-08-21T20:30:30.000+0000",
            "state": "InProgress",
            "concurrencyMode": "Parallel",
            "contentType": "CSV",
            "apiVersion": 49,
            "jobType": "V2Ingest",
            "lineEnding": "LF",
            "columnDelimiter": "COMMA"
        }
    ],
    "nextRecordsUrl": null
}

$ cat header.json 
{
 "Content-Type": "application/json",
  "Authorization": "Bearer 00D3h000007R1Lu!AR0AQMlV_9bUOI21JUNKJjAKIuy.2wbCg_OLXxoFrrKvL2aG9"

}

```
<a name="patch"></a>
### PATCH

- Abort a BulkAPI 2.0 job

```
$ sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/jobs/ingest/7503h000004R4JuAAK  -m PATCH -f header.json -d bulakpi-abort.json 
[
    {
        "errorCode": "INVALIDJOBSTATE",
        "message": "Aborting already Completed Job not allowed"
    }
]

$ cat bulakpi-abort.json 
{
 "state": "Aborted"

}

```

<a name="delete"></a>

### DELETE
- Delete an Account Record with ID:0013h00000Fz0GzAAJ
```
$ sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/sobjects/Account/0013h00000Fz0GzAAJ  -m DELETE -f header.json

# delete again to verify
$ sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/sobjects/Account/0013h00000Fz0GzAAJ  -m DELETE -f header.json
[{"message":"entity is deleted","errorCode":"ENTITY_IS_DELETED","fields":[]}]

```
<a name="post"></a>


### POST
- Start a Dataflow in EA
```
$ sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/wave/dataflowjobs  -m POST -f header.json -d df-start.json
{
    "progress": 0,
    "status": "Queued",
    "type": "dataflowjob"
}

$ cat df-start.json 
{
   "command": "start",
   "dataflowId": "02K3h000000Mu1oEAC"
}

```
- Run EA Query
```
$ sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/wave/query  -m POST -d fruit-act.saql  -f header.json 
{
    "action": "query",
    "responseId": "4XpnbbxmMVwrdvX2-prgV-",
    "results": {
        "metadata": [
            {
                "lineage": {
                    "type": "foreach",
                    "projections": [
                        {
                            "field": {
                                "id": "q.account",
                                "type": "string"
                            },
                            "inputs": [
                                {
                                    "id": "q.act"
                                }
                            ]
                        },
                        {
                            "field": {
                                "id": "q.qty",
                                "type": "numeric"
                            },
                            "inputs": [
                                {
                                    "id": "q.qty"
                                }
                            ]
                        }
                    ]
                }
            }
        ],
        "records": [
            {
                "account": "Abbott358 Inc",
                "qty": 30
            },
            {
                "account": "Abbott372 Inc",
                "qty": 78
            },
            {
                "account": "Allen182 Inc",
                "qty": 70
            },
            {
                "account": "Alvarez72 Inc",
                "qty": 2222
            },
            {
                "account": "Alvarez888 Inc",
                "qty": 130
            }
        ]
    },
    "query": "q = load \"0Fb3h0000008sAECAY/0Fc3h0000026QMACA2\";  q = foreach q generate act as  account, qty as qty ;   q = limit q 5;",
    "responseTime": 2
}

$ cat fruit-act.saql 
{
    "query":"q = load \"0Fb3h0000008sAECAY/0Fc3h0000026QMACA2\";  q = foreach q generate act as  account, qty as qty ;   q = limit q 5;"
}

```            
### PUT
- Schedule a dataflow  run 
```
 $ sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/wave/asset/02K3h000000Mu1oEAC/schedule -m PUT -d df-sched.json   -f header.json 
{}

$ cat df-sched.json | jq
{
  "daysOfWeek": [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ],
  "lastHour": 20,
  "hourlyInterval": 3,
  "time": {
    "hour": 2,
    "minute": 30
  },
  "frequency": "hourly"
}

``` 
![sched1](img/df-sched-1.png)
![sched2](img/df-sched-2.png)
 
## Questions

<a name='myorg'></a>
### How I can access-token and instanceUrl in for the Salesforce org I logged in via sfdx force:auth:web:login ?
```
$ sfdx mohanc:hello:myorg -u mohan.chinnappan.n_ea2@gmail.com

        accessToken: 00D3h000007R1Lu!JUNK.GLAo61XhzbQ_gxT3uHNm7YWkbDp4pajIRXKMOyldZepiJjAKIuy.2wbCg_OLXxoFrrKvL2aG9
        instanceUrl: https://mohansun-ea-02-dev-ed.my.salesforce.com
        apiVersion: 49.0
        restAPIURI: https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/

```
<a name='bulkapi2'></a>

### How I can load data using BulkAPI 2.0 using DX
- [How use the DX plugin for BulkAPI 2 data load ?](https://github.com/mohan-chinnappan-n/bulkapi2-dx)

