## How to get Connected App details using metadata tool
```
sfdx mohanc:mdapi:retrieve -u mohan.chinnappan.n_ea2@gmail.com -t "ConnectedApp"

```

```
{
    "RetrieveRequest": {
        "apiVersion": "51.0",
        "unpackaged": [
            {
                "types": {
                    "members": "*",
                    "name": "ConnectedApp"
                }
            }
        ]
    }
}
{ result: { done: false, id: '09S3h000005hBB5EAM', state: 'Queued' } }

```

```
$ sfdx mohanc:mdapi:checkRetrieveStatus  -u mohan.chinnappan.n_ea2@gmail.com -i 09S3h000005hBB5EAM

```

```
[
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-11-08T03:05:53.000Z,
    fileName: 'unpackaged/connectedApps/CMOffice.connectedApp',
    fullName: 'CMOffice',
    id: '09H3h000000HaZ7EAK',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2020-11-08T03:05:53.000Z,
    manageableState: 'unmanaged',
    type: 'ConnectedApp'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-09-15T03:46:51.000Z,
    fileName: 'unpackaged/connectedApps/mohansun4ConnApp.connectedApp',
    fullName: 'mohansun4ConnApp',
    id: '09H3h000000DitoEAC',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2020-09-15T03:46:51.000Z,
    manageableState: 'unmanaged',
    type: 'ConnectedApp'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-09-02T10:42:30.000Z,
    fileName: 'unpackaged/connectedApps/mohansunCApp.connectedApp',
    fullName: 'mohansunCApp',
    id: '09H3h000000DimGEAS',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2020-09-02T10:42:30.000Z,
    manageableState: 'unmanaged',
    type: 'ConnectedApp'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2021-01-20T13:04:25.000Z,
    fileName: 'unpackaged/connectedApps/ForceSlack.connectedApp',
    fullName: 'ForceSlack',
    id: '09H3h000000DjOEEA0',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-01-20T15:24:02.000Z,
    manageableState: 'unmanaged',
    type: 'ConnectedApp'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2021-01-08T16:11:08.000Z,
    fileName: 'unpackaged/connectedApps/MohansunLInux.connectedApp',
    fullName: 'MohansunLInux',
    id: '09H3h000000DjLAEA0',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-01-08T16:23:17.000Z,
    manageableState: 'unmanaged',
    type: 'ConnectedApp'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-09-15T11:58:59.000Z,
    fileName: 'unpackaged/connectedApps/JWTTest.connectedApp',
    fullName: 'JWTTest',
    id: '09H3h000000DityEAC',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2020-09-15T13:59:13.000Z,
    manageableState: 'unmanaged',
    type: 'ConnectedApp'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2021-01-28T03:22:40.000Z,
    fileName: 'unpackaged/connectedApps/EAApp.connectedApp',
    fullName: 'EAApp',
    id: '09H3h000000DjRcEAK',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-01-28T03:22:40.000Z,
    manageableState: 'unmanaged',
    type: 'ConnectedApp'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2021-04-09T15:23:11.707Z,
    fileName: 'unpackaged/package.xml',
    fullName: 'unpackaged/package.xml',
    id: '',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-04-09T15:23:11.707Z,
    manageableState: 'unmanaged',
    type: 'Package'
  }
]
=== Writing zipFile base64 content to 09S3h000005hBB5EAM.zip.txt ...
=== Writing zipFile binary content to 09S3h000005hBB5EAM.zip ... 
```

```
$ unzip 09S3h000005hBB5EAM.zip
Archive:  09S3h000005hBB5EAM.zip
  inflating: unpackaged/connectedApps/CMOffice.connectedApp  
  inflating: unpackaged/connectedApps/mohansun4ConnApp.connectedApp  
  inflating: unpackaged/connectedApps/mohansunCApp.connectedApp  
  inflating: unpackaged/connectedApps/ForceSlack.connectedApp  
  inflating: unpackaged/connectedApps/MohansunLInux.connectedApp  
  inflating: unpackaged/connectedApps/JWTTest.connectedApp  
  inflating: unpackaged/connectedApps/EAApp.connectedApp  
  inflating: unpackaged/package.xml  
```

```
$ cat unpackaged/connectedApps/MohansunLInux.connectedApp 
<?xml version="1.0" encoding="UTF-8"?>
<ConnectedApp xmlns="http://soap.sforce.com/2006/04/metadata">
    <contactEmail>mohan.chinnappan.n@gmail.com</contactEmail>
    <description>JWT Linux testing</description>
    <label>MohansunLInux</label>
    <oauthConfig>
        <callbackUrl>http://localhost:1717/OauthRedirect</callbackUrl>
        <certificate>CERT HERE</certificate>
        <consumerKey>CK here</consumerKey>
        <isAdminApproved>true</isAdminApproved>
        <isConsumerSecretOptional>false</isConsumerSecretOptional>
        <isIntrospectAllTokens>false</isIntrospectAllTokens>
        <isSecretRequiredForRefreshToken>false</isSecretRequiredForRefreshToken>
        <scopes>Basic</scopes>
        <scopes>Api</scopes>
        <scopes>Web</scopes>
        <scopes>RefreshToken</scopes>
    </oauthConfig>
    <oauthPolicy>
        <ipRelaxation>ENFORCE</ipRelaxation>
        <refreshTokenPolicy>infinite</refreshTokenPolicy>
    </oauthPolicy>
    <profileName>System Administrator</profileName>
</ConnectedApp>

```



