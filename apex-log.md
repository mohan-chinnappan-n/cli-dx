## Apex log

### Describe
```

$ sfdx mohanc:tooling:describe -u mohan.chinnappan.n_ea2@gmail.com -s ApexLog
Label : Apex Debug Log
Num of Fields : 13
Id
LogUserId
LogLength
LastModifiedDate
Request
Operation
Application
Status
DurationMilliseconds
SystemModstamp
StartTime
Location
RequestIdentifier

```

### Query

```
$ cat ~/tmp/apexLog.soql 
SELECT
Id
,LogUserId
,LogLength
,LastModifiedDate
,Request
,Operation
,Application
,Status
,DurationMilliseconds
,SystemModstamp
,StartTime
,Location
,RequestIdentifier

```
### Running
```
$ sfdx mohanc:tooling:query -u mchinnappan@fsc-gs0.com -q ~/tmp/apexLog.soql  -f json 

```

