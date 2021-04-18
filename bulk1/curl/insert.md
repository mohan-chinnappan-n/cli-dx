# Using curl to do bulk API 1.0 insert

## Topcs
- [Job (create job)](#createJob) 
    - [batches (add batch into the job)](#addBatchToJob)
- Close Job

    

<a name='createJob'></a>
## 1. Create Insert Job
```
$ cat insertJob.xml
```

```xml

<?xml version="1.0" encoding="UTF-8"?>
<jobInfo xmlns="http://www.force.com/2009/06/asyncapi/dataload">
    <operation>insert</operation>
    <object>Contact</object>
    <contentType>CSV</contentType>
</jobInfo>

```


```

$ curl https://mohansun-ea-02-dev-ed.my.salesforce.com/services/async/51.0/job -H 'X-SFDC-Session: 00D3h000007R1Lu!AR0AQANla55KQmgW5FYTW1LS63HHEJmU7c2615_IQZD2IRxBFuEwacKhWmas8Vb6GDxRIhGOaKMfgirDz8BQIrX2Xzd5Izby' -H "Content-Type: application/xml; charset=UTF-8" -d @insertJob.xml

```

### Job Created
```xml

<?xml version="1.0" encoding="UTF-8"?><jobInfo
   xmlns="http://www.force.com/2009/06/asyncapi/dataload">
 <id>7503h000009yLOeAAM</id>
 <operation>insert</operation>
 <object>Contact</object>
 <createdById>0053h000002xQ5sAAE</createdById>
 <createdDate>2021-04-16T14:47:55.000Z</createdDate>
 <systemModstamp>2021-04-16T14:47:55.000Z</systemModstamp>
 <state>Open</state>
 <concurrencyMode>Parallel</concurrencyMode>
 <contentType>CSV</contentType>
 <numberBatchesQueued>0</numberBatchesQueued>
 <numberBatchesInProgress>0</numberBatchesInProgress>
 <numberBatchesCompleted>0</numberBatchesCompleted>
 <numberBatchesFailed>0</numberBatchesFailed>
 <numberBatchesTotal>0</numberBatchesTotal>
 <numberRecordsProcessed>0</numberRecordsProcessed>
 <numberRetries>0</numberRetries>
 <apiVersion>51.0</apiVersion>
 <numberRecordsFailed>0</numberRecordsFailed>
 <totalProcessingTime>0</totalProcessingTime>
 <apiActiveProcessingTime>0</apiActiveProcessingTime>
 <apexProcessingTime>0</apexProcessingTime>
</jobInfo>
```
![Create Job](img/bulk-1.png)

<a name='addBatchToJob'></a>
## 2.  Add batch to the created job

### Records to be inserted
```
FirstName,LastName,Department,Birthdate,Description
Tom,Jones,Marketing,1940-06-07Z,"Self-described as ""the top"" branding guru on the West Coast"
Ian,Dury,R&D,,"World-renowned expert in fuzzy logic design.  Influential in technology purchases."
```

```
$ curl https://mohansun-ea-02-dev-ed.my.salesforce.com/services/async/51.0/job/7503h000009yLOeAAM/batch  -H 'X-SFDC-Session: 00D3h000007R1Lu!AR0AQANla55KQmgW5FYTW1LS63HHEJmU7c2615_IQZD2IRxBFuEwacKhWmas8Vb6GDxRIhGOaKMfgirDz8BQIrX2Xzd5Izby' -H "Content-Type: text/csv; charset=UTF-8" --data-binary @contacts.csv

```
### Batch created

```xml

<?xml version="1.0" encoding="UTF-8"?><batchInfo
   xmlns="http://www.force.com/2009/06/asyncapi/dataload">
 <id>7513h00000CL92aAAD</id>
 <jobId>7503h000009yLOeAAM</jobId>
 <state>Queued</state>
 <createdDate>2021-04-16T14:54:31.000Z</createdDate>
 <systemModstamp>2021-04-16T14:54:31.000Z</systemModstamp>
 <numberRecordsProcessed>0</numberRecordsProcessed>
 <numberRecordsFailed>0</numberRecordsFailed>
 <totalProcessingTime>0</totalProcessingTime>
 <apiActiveProcessingTime>0</apiActiveProcessingTime>
 <apexProcessingTime>0</apexProcessingTime>
</batchInfo>

```

<a name='closeJob'></a>
## Close Job after adding all batches

```xml


<?xml version="1.0" encoding="UTF-8"?>
<jobInfo xmlns="http://www.force.com/2009/06/asyncapi/dataload">
  <state>Closed</state>
</jobInfo>
```

```
$ curl https://mohansun-ea-02-dev-ed.my.salesforce.com/services/async/51.0/job/7503h000009yLOeAAM -H 'X-SFDC-Session: 00D3h000007R1Lu!AR0AQANla55KQmgW5FYTW1LS63HHEJmU7c2615_IQZD2IRxBFuEwacKhWmas8Vb6GDxRIhGOaKMfgirDz8BQIrX2Xzd5Izby' -H "Content-Type: application/xml; charset=UTF-8" -d @closeJob.xml
```
### Job Closed
```xml

<?xml version="1.0" encoding="UTF-8"?><jobInfo
   xmlns="http://www.force.com/2009/06/asyncapi/dataload">
 <id>7503h000009yLOeAAM</id>
 <operation>insert</operation>
 <object>Contact</object>
 <createdById>0053h000002xQ5sAAE</createdById>
 <createdDate>2021-04-16T14:47:55.000Z</createdDate>
 <systemModstamp>2021-04-16T14:47:55.000Z</systemModstamp>
 <state>Closed</state>
 <concurrencyMode>Parallel</concurrencyMode>
 <contentType>CSV</contentType>
 <numberBatchesQueued>0</numberBatchesQueued>
 <numberBatchesInProgress>0</numberBatchesInProgress>
 <numberBatchesCompleted>1</numberBatchesCompleted>
 <numberBatchesFailed>0</numberBatchesFailed>
 <numberBatchesTotal>1</numberBatchesTotal>
 <numberRecordsProcessed>2</numberRecordsProcessed>
 <numberRetries>0</numberRetries>
 <apiVersion>51.0</apiVersion>
 <numberRecordsFailed>0</numberRecordsFailed>
 <totalProcessingTime>361</totalProcessingTime>
 <apiActiveProcessingTime>164</apiActiveProcessingTime>
 <apexProcessingTime>0</apexProcessingTime>
</jobInfo>

```
![close Job](img/bulk-2.png)


### Data Inserted
-![data inserted](img/bulk-5.png)
