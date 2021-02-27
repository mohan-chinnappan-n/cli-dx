## Apex Code Coverage

### Describe

```
$ sfdx mohanc:tooling:describe -u mohan.chinnappan.n_ea2@gmail.com -s ApexCodeCoverage
Label : Apex Code Coverage Data
Num of Fields : 13
Id
IsDeleted
CreatedDate
CreatedById
LastModifiedDate
LastModifiedById
SystemModstamp
ApexTestClassId
TestMethodName
ApexClassOrTriggerId
NumLinesCovered
NumLinesUncovered
Coverage

```

### Query
```
$ cat ~/tmp/apexCodeCoverage.soql 
SELECT
Id
,IsDeleted
,CreatedDate
,CreatedById
,LastModifiedDate
,LastModifiedById
,SystemModstamp
,ApexTestClassId
,TestMethodName
,ApexClassOrTriggerId
,NumLinesCovered
,NumLinesUncovered
,Coverage

FROM ApexCodeCoverage

```
### Run
```
$ sfdx mohanc:tooling:query -u mohan.chinnappan.n_ea2@gmail.com -q ~/tmp/apexCodeCoverage.soql  -f json 

```
