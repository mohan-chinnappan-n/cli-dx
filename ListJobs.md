## List BulkAPI 2 jobs

- Requires 0.0.47 version of mohanc dx plugin
### Command usage
```
 sfdx mohanc:data:bulkapi:listJobs -h
List  BulkAPI 2 jobs  

USAGE
  $ sfdx mohanc:data:bulkapi:listJobs

OPTIONS
  -u, --targetusername=targetusername              username or alias for the target org; overrides default target org
  -v, --targetdevhubusername=targetdevhubusername  username or alias for the dev hub org; overrides default dev hub org
  --apiversion=apiversion                          override the api version used for api requests made by this command
  --json                                           format output as json
  --loglevel=(trace|debug|info|warn|error|fatal)   logging level for this command invocation

EXAMPLE


       ** List  BulkAPI 2 jobs   **

           sfdx mohanc:bulkapi:listJobs  -u mchinnappan-jei3@force.com 

 
```


### Demo

```
 sfdx mohanc:data:bulkapi:listJobs  -u mohan.chinnappan.n_ea2@gmail.com
{
  done: true,
  records: [
    {
      id: '7503h000004P3nRAAS',
      operation: 'insert',
      object: 'Case',
      createdById: '0053h000002xQ5sAAE',
      createdDate: '2020-08-11T17:44:31.000+0000',
      systemModstamp: '2020-08-11T17:44:44.000+0000',
      state: 'JobComplete',
      concurrencyMode: 'Parallel',
      contentType: 'CSV',
      apiVersion: 49,
      jobType: 'V2Ingest',
      lineEnding: 'LF',
      columnDelimiter: 'COMMA'
    }
  ],
  nextRecordsUrl: null
}
```

