# Update using Bulk API 2.0

- Requires plugin 0.0.161 or above
- [How to install plugin?](https://mohan-chinnappan-n.github.io/dx/plugins.html#/1)

## Data file (Max size: 100 MB)
- [Data Size Limit](https://developer.salesforce.com/docs/atlas.en-us.api_asynch.meta/api_asynch/upload_job_data.htm)

- If the data file size is bigger than 100 MB, split that large file into 100 MB files using this utility:
	- [CSV split utility](https://github.com/mohan-chinnappan-n/cli-dx/blob/master/util/split.md)
```
cat accounts-update-2.csv
```
```csv
Id,Phone
0013h00000Ffg19AAB,881-222-2391
0013h00000Ffg1AAAR,882-222-2392
0013h00000Ffg1BAAR,883-222-2393
0013h00000Ffg1CAAR,884-222-2394

```

## Login

```
sfdx force:auth:web:login

```

## Run BulkAPI 2.0 Update

```
sfdx mohanc:data:bulkapi:update -u mohan.chinnappan.n_ea2@gmail.com  -e LF -o Account -f accounts-update-2.csv
```
```
accounts-update-2.csv Account LF
=== CREATE JOB === 
{
  id: '7503h00000CV7GpAAL',
  operation: 'update',
  object: 'Account',
  createdById: '0053h000002xQ5sAAE',
  createdDate: '2021-08-31T01:31:13.000+0000',
  systemModstamp: '2021-08-31T01:31:13.000+0000',
  state: 'Open',
  concurrencyMode: 'Parallel',
  contentType: 'CSV',
  apiVersion: 52,
  contentUrl: 'services/data/v52.0/jobs/ingest/7503h00000CV7GpAAL/batches',
  lineEnding: 'LF',
  columnDelimiter: 'COMMA'
}
jobId: 7503h00000CV7GpAAL
=== JOB STATUS === 
=== JOB STATUS for job: 7503h00000CV7GpAAL ===
{
  id: '7503h00000CV7GpAAL',
  operation: 'update',
  object: 'Account',
  createdById: '0053h000002xQ5sAAE',
  createdDate: '2021-08-31T01:31:13.000+0000',
  systemModstamp: '2021-08-31T01:31:13.000+0000',
  state: 'Open',
  concurrencyMode: 'Parallel',
  contentType: 'CSV',
  apiVersion: 52,
  jobType: 'V2Ingest',
  contentUrl: 'services/data/v52.0/jobs/ingest/7503h00000CV7GpAAL/batches',
  lineEnding: 'LF',
  columnDelimiter: 'COMMA',
  retries: 0,
  totalProcessingTime: 0,
  apiActiveProcessingTime: 0,
  apexProcessingTime: 0
}
=== PUT DATA ===  SIZE: == 0.00013065338134765625 MB ==
result: status: 201, statusText: Created
=== JOB STATUS === 
=== JOB STATUS for job: 7503h00000CV7GpAAL ===
{
  id: '7503h00000CV7GpAAL',
  operation: 'update',
  object: 'Account',
  createdById: '0053h000002xQ5sAAE',
  createdDate: '2021-08-31T01:31:13.000+0000',
  systemModstamp: '2021-08-31T01:31:13.000+0000',
  state: 'Open',
  concurrencyMode: 'Parallel',
  contentType: 'CSV',
  apiVersion: 52,
  jobType: 'V2Ingest',
  contentUrl: 'services/data/v52.0/jobs/ingest/7503h00000CV7GpAAL/batches',
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
  id: '7503h00000CV7GpAAL',
  operation: 'update',
  object: 'Account',
  createdById: '0053h000002xQ5sAAE',
  createdDate: '2021-08-31T01:31:13.000+0000',
  systemModstamp: '2021-08-31T01:31:13.000+0000',
  state: 'UploadComplete',
  concurrencyMode: 'Parallel',
  contentType: 'CSV',
  apiVersion: 52
}
=== JOB STATUS === 
=== JOB STATUS for job: 7503h00000CV7GpAAL ===
jobStatus {
  id: '7503h00000CV7GpAAL',
  operation: 'update',
  object: 'Account',
  createdById: '0053h000002xQ5sAAE',
  createdDate: '2021-08-31T01:31:13.000+0000',
  systemModstamp: '2021-08-31T01:31:16.000+0000',
  state: 'InProgress',
  concurrencyMode: 'Parallel',
  contentType: 'CSV',
  apiVersion: 52,
  jobType: 'V2Ingest',
  lineEnding: 'LF',
  columnDelimiter: 'COMMA',
  numberRecordsProcessed: 4,
  numberRecordsFailed: 0,
  retries: 0,
  totalProcessingTime: 170,
  apiActiveProcessingTime: 65,
  apexProcessingTime: 0
}
WAITING...
{
  id: '7503h00000CV7GpAAL',
  operation: 'update',
  object: 'Account',
  createdById: '0053h000002xQ5sAAE',
  createdDate: '2021-08-31T01:31:13.000+0000',
  systemModstamp: '2021-08-31T01:31:16.000+0000',
  state: 'JobComplete',
  concurrencyMode: 'Parallel',
  contentType: 'CSV',
  apiVersion: 52,
  jobType: 'V2Ingest',
  lineEnding: 'LF',
  columnDelimiter: 'COMMA',
  numberRecordsProcessed: 4,
  numberRecordsFailed: 0,
  retries: 0,
  totalProcessingTime: 170,
  apiActiveProcessingTime: 65,
  apexProcessingTime: 0
}
=== JOB Failure STATUS === 
=== JOB Failure STATUS for job: 7503h00000CV7GpAAL ===
"sf__Id","sf__Error",Id,Phone

=== JOB getUnprocessedRecords STATUS === 
=== JOB getUnprocessedRecords STATUS for job: 7503h00000CV7GpAAL ===
Id,Phone
```

## Use BulkAPI 2.0 query to verify the updates

```
sfdx mohanc:data:bulkapi:query -q ~/.query/accts.soql -u mohan.chinnappan.n_ea2@gmail.com                     
```

```
SELECT Id,Name, Phone from Account LIMIT 5

https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v52.0/jobs/query
{
  id: '7503h00000CV7KdAAL',
  operation: 'query',
  object: 'Account',
  createdById: '0053h000002xQ5sAAE',
  createdDate: '2021-08-31T01:37:11.000+0000',
  systemModstamp: '2021-08-31T01:37:11.000+0000',
  state: 'UploadComplete',
  concurrencyMode: 'Parallel',
  contentType: 'CSV',
  apiVersion: 52,
  lineEnding: 'LF',
  columnDelimiter: 'COMMA'
}
=== JOB STATUS === 
=== JOB STATUS for job: 7503h00000CV7KdAAL ===
{
  id: '7503h00000CV7KdAAL',
  operation: 'query',
  object: 'Account',
  createdById: '0053h000002xQ5sAAE',
  createdDate: '2021-08-31T01:37:11.000+0000',
  systemModstamp: '2021-08-31T01:37:12.000+0000',
  state: 'InProgress',
  concurrencyMode: 'Parallel',
  contentType: 'CSV',
  apiVersion: 52,
  jobType: 'V2Query',
  lineEnding: 'LF',
  columnDelimiter: 'COMMA',
  numberRecordsProcessed: 0,
  retries: 0,
  totalProcessingTime: 0
}
WAITING...
{
  id: '7503h00000CV7KdAAL',
  operation: 'query',
  object: 'Account',
  createdById: '0053h000002xQ5sAAE',
  createdDate: '2021-08-31T01:37:11.000+0000',
  systemModstamp: '2021-08-31T01:37:15.000+0000',
  state: 'JobComplete',
  concurrencyMode: 'Parallel',
  contentType: 'CSV',
  apiVersion: 52,
  jobType: 'V2Query',
  lineEnding: 'LF',
  columnDelimiter: 'COMMA',
  numberRecordsProcessed: 5,
  retries: 0,
  totalProcessingTime: 249
}
==== Job State: JobComplete ====
=== Total time taken to process the job : 249 milliseconds ===
=== Total records processed : 5  ===
https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v52.0/jobs/query/7503h00000CV7KdAAL/results
==== Output CSV file written into : /Users/mchinnappan/.query/accts.soql.csv ===
==== View the output file : /Users/mchinnappan/.query/accts.soql.csv using:
 cat /Users/mchinnappan/.query/accts.soql.csv ===
=== JOB Failure STATUS === 
=== JOB Failure STATUS for job: 7503h00000CV7KdAAL === "sf__Id","sf__Error","Id","Name","Phone"
 ===
"sf__Id","sf__Error","Id","Name","Phone"
```

### View the output file

```
cat /Users/mchinnappan/.query/accts.soql.csv 
```
```csv
"Id","Name","Phone"
"0013h00000Ffg18AAB","Boone625 Inc",""
"0013h00000Ffg19AAB","Rodriquez626 Inc","881-222-2391"
"0013h00000Ffg1AAAR","Hale627 Inc","882-222-2392"
"0013h00000Ffg1BAAR","Stokes628 Inc","883-222-2393"
"0013h00000Ffg1CAAR","Edwards629 Inc","884-222-2394"
```
