## MetadataComponentDependency

### Describe
```
sfdx mohanc:tooling:describe -u mohan.chinnappan.n_ea2@gmail.com -s MetadataComponentDependency
Label : Metadata Component Dependency
Num of Fields : 9
Id
MetadataComponentId
MetadataComponentNamespace
MetadataComponentName
MetadataComponentType
RefMetadataComponentId
RefMetadataComponentNamespace
RefMetadataComponentName
RefMetadataComponentType

```

### Query Apex Classes

```
## soql query
$ cat ~/tmp/mcd.soql 
SELECT 
Id
,MetadataComponentId
,MetadataComponentNamespace
,MetadataComponentName
,MetadataComponentType
,RefMetadataComponentId
,RefMetadataComponentNamespace
,RefMetadataComponentName
,RefMetadataComponentType

FROM
MetadataComponentDependency
WHERE RefMetadataComponentType = 'ApexClass'
```

``` 
$ sfdx mohanc:tooling:query -u mohan.chinnappan.n_ea2@gmail.com -q ~/tmp/mcd.soql  -f json

```
```json
[
  {
    attributes: {
      type: 'MetadataComponentDependency',
      url: '/services/data/v51.0/tooling/sobjects/MetadataComponentDependency/000000000000000AAA'
    },
    Id: '000000000000000AAA',
    MetadataComponentId: '01p3h00000EngA0AAJ',
    MetadataComponentNamespace: null,
    MetadataComponentName: 'DataManager_controller',
    MetadataComponentType: 'ApexClass',
    RefMetadataComponentId: '01p3h00000Eng9sAAB',
    RefMetadataComponentNamespace: null,
    RefMetadataComponentName: 'DataManager_Quota',
    RefMetadataComponentType: 'ApexClass'
  },
  {
    attributes: {
      type: 'MetadataComponentDependency',
      url: '/services/data/v51.0/tooling/sobjects/MetadataComponentDependency/000000000000000AAA'
    },
    Id: '000000000000000AAA',
    MetadataComponentId: '01p3h00000EngABAAZ',
    MetadataComponentNamespace: null,
    MetadataComponentName: 'DataManager_QuotaTest',
    MetadataComponentType: 'ApexClass',
    RefMetadataComponentId: '01p3h00000Eng9sAAB',
    RefMetadataComponentNamespace: null,
    RefMetadataComponentName: 'DataManager_Quota',
    RefMetadataComponentType: 'ApexClass'
  }...
]
```
