# Apex Code Coverage


## Org Wide
```
$ sfdx mohanc:tooling:describe -u mohan.chinnappan.n_ea2@gmail.com -s ApexOrgWideCoverage
Label : Apex Org-wide Code Coverage
Num of Fields : 8
Id
IsDeleted
CreatedDate
CreatedById
LastModifiedDate
LastModifiedById
SystemModstamp
PercentCovered
~/sfdx/sfdx-mohanc-plugins:
$ sfdx mohanc:tooling:query -u mchinnappan@fsc-gs0.com -q ~/tmp/ApexOrgWideCoverage.soql  -f json 
[
  {
    attributes: {
      type: 'ApexOrgWideCoverage',
      url: '/services/data/v51.0/tooling/sobjects/ApexOrgWideCoverage/716B0000000Gq6pIAC'
    },
    Id: '716B0000000Gq6pIAC',
    IsDeleted: false,
    CreatedDate: '2020-08-21T21:26:29.000+0000',
    CreatedById: '005B00000070zgdIAA',
    LastModifiedDate: '2021-02-19T06:49:38.000+0000',
    LastModifiedById: '005B00000070zgdIAA',
    SystemModstamp: '2021-02-19T06:49:38.000+0000',
    PercentCovered: 0
  }
]
```

## for the given class
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
WHERE ApexClassOrTriggerId ='01p3h00000EqJGw'

```
### Run
```
$ sfdx mohanc:tooling:query -u mohan.chinnappan.n_ea2@gmail.com -q ~/tmp/apexCodeCoverage.soql  -f json 

```
