## How use the DX plugin for BulkAPI 2 data load

- Requires plugin version 0.46 (not yet published!)

### How use mohanc:data:bulkapi:load?

```
$ sfdx mohanc:data:bulkapi:load -h

Data Load using BulkAPI 2  

USAGE
  $ sfdx mohanc:data:bulkapi:load

OPTIONS
  -e, --lineending=lineending                     Line Ending (LF or CRLF), default:  LF
  -f, --inputfile=inputfile                       CSV file to load, default: input.csv
  -o, --sobject=sobject                           sObject to load into,  default: Case
  -u, --targetusername=targetusername             username or alias for the target org; overrides default target org
  --apiversion=apiversion                         override the api version used for api requests made by this command
  --json                                          format output as json
  --loglevel=(trace|debug|info|warn|error|fatal)  logging level for this command invocation

EXAMPLE

          
              sfdx mohanc:bulkapi:load  -u <username>  -f input.csv -e LF -o Case
      


```

### Example
```
$ sfdx mohanc:data:bulkapi:load -u mohan.chinnappan.n_ea2@gmail.com -f /tmp/input.csv -e LF -o Case
```

### Input file

```
$ cat /tmp/input.csv 
Subject,Priority
Engine cylinder has knocking,High
Wiper Blade needs replacement,Low
```

### Output
```
=== CREATE JOB === 
{
  id: '7503h000003pgNYAAY',
  operation: 'insert',
  object: 'Case',
  createdById: '0053h000002xQ5sAAE',
  createdDate: '2020-08-04T04:32:41.000+0000',
  systemModstamp: '2020-08-04T04:32:41.000+0000',
  state: 'Open',
  concurrencyMode: 'Parallel',
  contentType: 'CSV',
  apiVersion: 49,
  contentUrl: 'services/data/v49.0/jobs/ingest/7503h000003pgNYAAY/batches',
  lineEnding: 'LF',
  columnDelimiter: 'COMMA'
}
jobId: 7503h000003pgNYAAY
=== JOB STATUS === 
=== JOB STATUS for job: 7503h000003pgNYAAY ===
{
  id: '7503h000003pgNYAAY',
  operation: 'insert',
  object: 'Case',
  createdById: '0053h000002xQ5sAAE',
  createdDate: '2020-08-04T04:32:41.000+0000',
  systemModstamp: '2020-08-04T04:32:41.000+0000',
  state: 'Open',
  concurrencyMode: 'Parallel',
  contentType: 'CSV',
  apiVersion: 49,
  jobType: 'V2Ingest',
  contentUrl: 'services/data/v49.0/jobs/ingest/7503h000003pgNYAAY/batches',
  lineEnding: 'LF',
  columnDelimiter: 'COMMA',
  retries: 0,
  totalProcessingTime: 0,
  apiActiveProcessingTime: 0,
  apexProcessingTime: 0
}
=== PUT DATA === 
result: status: 201, statusText: Created
=== JOB STATUS === 
=== JOB STATUS for job: 7503h000003pgNYAAY ===
{
  id: '7503h000003pgNYAAY',
  operation: 'insert',
  object: 'Case',
  createdById: '0053h000002xQ5sAAE',
  createdDate: '2020-08-04T04:32:41.000+0000',
  systemModstamp: '2020-08-04T04:32:41.000+0000',
  state: 'Open',
  concurrencyMode: 'Parallel',
  contentType: 'CSV',
  apiVersion: 49,
  jobType: 'V2Ingest',
  contentUrl: 'services/data/v49.0/jobs/ingest/7503h000003pgNYAAY/batches',
  lineEnding: 'LF',
  columnDelimiter: 'COMMA',
  numberRecordsProcessed: 0,
  numberRecordsFailed: 0,
  retries: 0,
  totalProcessingTime: 0,
  apiActiveProcessingTime: 0,
  apexProcessingTime: 0
}
=== PATCH STATE === 
{
  id: '7503h000003pgNYAAY',
  operation: 'insert',
  object: 'Case',
  createdById: '0053h000002xQ5sAAE',
  createdDate: '2020-08-04T04:32:41.000+0000',
  systemModstamp: '2020-08-04T04:32:41.000+0000',
  state: 'UploadComplete',
  concurrencyMode: 'Parallel',
  contentType: 'CSV',
  apiVersion: 49
}
=== JOB STATUS === 
=== JOB STATUS for job: 7503h000003pgNYAAY ===
jobStatus {
  id: '7503h000003pgNYAAY',
  operation: 'insert',
  object: 'Case',
  createdById: '0053h000002xQ5sAAE',
  createdDate: '2020-08-04T04:32:41.000+0000',
  systemModstamp: '2020-08-04T04:32:43.000+0000',
  state: 'InProgress',
  concurrencyMode: 'Parallel',
  contentType: 'CSV',
  apiVersion: 49,
  jobType: 'V2Ingest',
  lineEnding: 'LF',
  columnDelimiter: 'COMMA',
  numberRecordsProcessed: 0,
  numberRecordsFailed: 0,
  retries: 0,
  totalProcessingTime: 0,
  apiActiveProcessingTime: 0,
  apexProcessingTime: 0
}
WAITING...
{
  id: '7503h000003pgNYAAY',
  operation: 'insert',
  object: 'Case',
  createdById: '0053h000002xQ5sAAE',
  createdDate: '2020-08-04T04:32:41.000+0000',
  systemModstamp: '2020-08-04T04:32:43.000+0000',
  state: 'JobComplete',
  concurrencyMode: 'Parallel',
  contentType: 'CSV',
  apiVersion: 49,
  jobType: 'V2Ingest',
  lineEnding: 'LF',
  columnDelimiter: 'COMMA',
  numberRecordsProcessed: 2,
  numberRecordsFailed: 0,
  retries: 0,
  totalProcessingTime: 152,
  apiActiveProcessingTime: 57,
  apexProcessingTime: 0
}
=== JOB Failure STATUS === 
=== JOB Failure STATUS for job: 7503h000003pgNYAAY ===
"sf__Id","sf__Error",Priority,Subject

=== JOB getUnprocessedRecords STATUS === 
=== JOB getUnprocessedRecords STATUS for job: 7503h000003pgNYAAY ===
Subject,Priority

```
