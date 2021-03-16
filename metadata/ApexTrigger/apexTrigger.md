```
$ sfdx mohanc:mdapi:list -u mohan.chinnappan.n_ea2@gmail.com -t ApexTrigger
{
  result: [
    {
      createdById: '0053h000002xQ5sAAE',
      createdByName: 'Mohan Chinnappan',
      createdDate: 2020-09-25T17:15:50.000Z,
      fileName: 'triggers/TestTooling.trigger',
      fullName: 'TestTooling',
      id: '01q3h000000aVZAAA2',
      lastModifiedById: '0053h000002xQ5sAAE',
      lastModifiedByName: 'Mohan Chinnappan',
      lastModifiedDate: 2020-09-25T17:15:50.000Z,
      manageableState: 'unmanaged',
      type: 'ApexTrigger'
    }
  ]
}
```

```
$ sfdx mohanc:mdapi:retrieve -u mohan.chinnappan.n_ea2@gmail.com -t "ApexTrigger"
{
    "RetrieveRequest": {
        "apiVersion": "51.0",
        "unpackaged": [
            {
                "types": {
                    "members": "*",
                    "name": "ApexTrigger"
                }
            }
        ]
    }
}
{ result: { done: false, id: '09S3h000005gfG7EAI', state: 'Queued' } }
```

```
$ sfdx mohanc:mdapi:checkRetrieveStatus  -u mohan.chinnappan.n_ea2@gmail.com -i 09S3h000005gfG7EAI
[
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-09-25T17:15:50.000Z,
    fileName: 'unpackaged/triggers/TestTooling.trigger',
    fullName: 'TestTooling',
    id: '01q3h000000aVZAAA2',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2020-09-25T17:15:50.000Z,
    manageableState: 'unmanaged',
    type: 'ApexTrigger'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2021-03-11T20:54:43.366Z,
    fileName: 'unpackaged/package.xml',
    fullName: 'unpackaged/package.xml',
    id: '',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-03-11T20:54:43.366Z,
    manageableState: 'unmanaged',
    type: 'Package'
  }
]
=== Writing zipFile base64 content to 09S3h000005gfG7EAI.zip.txt ...
=== Writing zipFile binary content to 09S3h000005gfG7EAI.zip ... 
```
```
$ unzip 09S3h000005gfG7EAI.zip
Archive:  09S3h000005gfG7EAI.zip
  inflating: unpackaged/triggers/TestTooling.trigger  
  inflating: unpackaged/triggers/TestTooling.trigger-meta.xml  
  inflating: unpackaged/package.xml  
```
```
$ cat unpackaged/triggers/TestTooling.trigger

```
