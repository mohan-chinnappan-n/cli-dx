# Getting WaveXmd

```
sfdx mohanc:mdapi:list -u mohan.chinnappan.n_ea2@gmail.com  -t WaveXmd
```

```
{
  result: [
    {
      createdById: '0053h000002xQ5sAAE',
      createdByName: 'Mohan Chinnappan',
      createdDate: 2020-10-20T20:37:46.000Z,
      fileName: 'wave/user.xmd',
      fullName: 'user',
      id: '0KT3h00000567WpGAI',
      lastModifiedById: '0053h000002xQ5sAAE',
      lastModifiedByName: 'Mohan Chinnappan',
      lastModifiedDate: 2020-10-20T20:37:46.000Z,
      manageableState: 'unmanaged',
      type: 'WaveXmd'
    }
  ]
}
```
```
sfdx mohanc:mdapi:retrieve -u mohan.chinnappan.n_ea2@gmail.com  -t WaveXmd
```
```
{
    "RetrieveRequest": {
        "apiVersion": "54.0",
        "unpackaged": [
            {
                "types": {
                    "members": "*",
                    "name": "WaveXmd"
                }
            }
        ]
    }
}
{ result: { done: false, id: '09S3h0000065FXXEA2', state: 'Queued' } }
```


```
sfdx mohanc:mdapi:checkRetrieveStatus -u mohan.chinnappan.n_ea2@gmail.com -i  09S3h0000065FXXEA2
```

```
[
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-10-20T20:37:46.000Z,
    fileName: 'unpackaged/wave/user.xmd',
    fullName: 'user',
    id: '0KT3h00000567WpGAI',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2020-10-20T20:37:46.000Z,
    manageableState: 'unmanaged',
    type: 'WaveXmd'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2022-04-20T01:48:32.076Z,
    fileName: 'unpackaged/package.xml',
    fullName: 'unpackaged/package.xml',
    id: '',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2022-04-20T01:48:32.076Z,
    manageableState: 'unmanaged',
    type: 'Package'
  }
]
=== Writing zipFile base64 content to 09S3h0000065FXXEA2.zip.txt ...
=== Writing zipFile binary content to 09S3h0000065FXXEA2.zip ...
```

``` 
 jar tvf 09S3h0000065FXXEA2.zip
```

```
  1250 Wed Apr 20 01:48:32 EDT 2022 unpackaged/wave/user.xmd
   219 Wed Apr 20 01:48:32 EDT 2022 unpackaged/package.xml
```

```
unzip 09S3h0000065FXXEA2.zip
```

```
Archive:  09S3h0000065FXXEA2.zip
  inflating: unpackaged/wave/user.xmd  
  inflating: unpackaged/package.xml  
```

```
cat unpackaged/wave/user.xmd 
```

```xml
<?xml version="1.0" encoding="UTF-8"?>
<WaveXmd xmlns="http://soap.sforce.com/2006/04/metadata">
    <dataset>user</dataset>
    <dimensions>
        <field>ManagerId</field>
        <isDerived>false</isDerived>
        <linkTemplateEnabled>true</linkTemplateEnabled>
        <recordDisplayFields>
            <recordDisplayField>FirstName</recordDisplayField>
            <sortIndex>0</sortIndex>
        </recordDisplayFields>
        <recordDisplayFields>
            <recordDisplayField>Name</recordDisplayField>
            <sortIndex>1</sortIndex>
        </recordDisplayFields>
        <recordDisplayFields>
            <recordDisplayField>hasOpportunity</recordDisplayField>
            <sortIndex>2</sortIndex>
        </recordDisplayFields>
        <recordDisplayFields>
            <recordDisplayField>LastName</recordDisplayField>
            <sortIndex>3</sortIndex>
        </recordDisplayFields>
        <recordDisplayFields>
            <recordDisplayField>Opportunity.Name</recordDisplayField>
            <sortIndex>4</sortIndex>
        </recordDisplayFields>
        <recordIdField>Id</recordIdField>
        <salesforceActionsEnabled>false</salesforceActionsEnabled>
        <sortIndex>0</sortIndex>
    </dimensions>
</WaveXmd>
````
