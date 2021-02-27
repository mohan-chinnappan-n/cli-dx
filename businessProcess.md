## Business Process

```

$ cat ~/tmp/bizprocess.soql
SELECT
Id
,Name
,NamespacePrefix
,ManageableState
,Description
,IsActive
,CreatedById
,CreatedDate
,LastModifiedById
,LastModifiedDate
,EntityDefinitionId
,Metadata
,FullName

FROM BusinessProcess
LIMIT 1


```


```
$ sfdx mohanc:tooling:query -u mchinnappan@fsc-gs0.com -q ~/tmp/bizprocess.soql  -f json 
[
  
    attributes: {
      type: 'BusinessProcess',
      url: '/services/data/v51.0/tooling/sobjects/BusinessProcess/019B00000000KbAIAU'
    },
    Id: '019B00000000KbAIAU',
    Name: 'Opportunity Process',
    NamespacePrefix: 'FinServ',
    ManageableState: 'installed',
    Description: null,
    IsActive: true,
    CreatedById: '005B00000070zgdIAA',
    CreatedDate: '2020-08-21T21:26:29.000+0000',
    LastModifiedById: '005B00000070zgdIAA',
    LastModifiedDate: '2020-08-21T21:26:29.000+0000',
    EntityDefinitionId: 'Opportunity',
    Metadata: { urls: null, values: [Array], description: null, isActive: true },
    FullName: 'Opportunity.FinServ__Opportunity Process'
  }
]
```
