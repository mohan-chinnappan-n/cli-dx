# Data Connector in EA

## Topics
- [List the data connectors](#list)
- [Find Source objects for the given data connector](#sourceObjects)
- [Adding new data connection](#newDC)

<a name="list"></a>
## List the data connectors
```
$ sfdx mohanc:ea:dataConnector:list -u mohan.chinnappan.n_ea2@gmail.com  
```
```
Id,Name,Label,connectorType
"0It3h000000bnGUCAY","SFDC_LOCAL","SFDC_LOCAL","SfdcLocal"
"0It3h000000L1r6CAC","s3Connection","s3Connection","AmazonS3"
```
<a name="sourceObjects"></a>
## Find Source objects for the given data connector

```
$ sfdx mohanc:ea:dataConnector:sourceObjects  -u mohan.chinnappan.n_ea2@gmail.com  -i 0It3h000000bnGUCAY
```

```
Name,replicated
"AIApplication","false"
"AIApplicationConfig","false"
"AIInsightAction","false"
"AIInsightFeedback","false"
"AIInsightReason","false"
"AIInsightValue","false"
"AIMetric","false"
"AIPredictionEvent","false"
"AIRecordInsight","false"
"AcceptedEventRelation","false"
"Account","true"
"AccountBrand","false"
"AccountBrandShare","false"
"AccountChangeEvent","false"
"AccountCleanInfo","false"
"AccountContactRole","false"
"AccountContactRoleChangeEvent","false"
"AccountFeed","false"
"AccountHistory","false"
"AccountPartner","false"
"AccountShare","false"
"AccountTeamMember","false"
"AcquiredAccount__ChangeEvent","false"
"AcquiredAccount__Share","false"
"AcquiredAccount__c","false"
```

<a href="newDC"></a>
## Adding new Data Connection

```
$ cat newDC.json
```
```json

{
  "label": "Another S3Connection",
  "name" : "anotherS3Connection",
  "description" : "S3 Connection Test",
  "connectorType" : "AmazonS3",
  "connectionProperties": [
                {
                    "name": "AccessKey",
                    "value": "******"
                },
                {
                    "name": "FolderPath",
                    "value": "bucketea2"
                },
                {
                    "name": "MasterSymmetricKey",
                    "value": "******"
                },
                {
                    "name": "RegionName",
                    "value": "US East(N. Virginia)"
                },
                {
                    "name": "SecretKey",
                    "value": "******"
                }
            ]

}

```

$ sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v51.0/wave/dataconnectors -m POST -f ~/.headers/header_ea.json -d ./newDC.json 
```
```json
{
    "connectionProperties": [
        {
            "name": "AccessKey",
            "value": "******"
        },
        {
            "name": "FolderPath",
            "value": "bucketea2"
        },
        {
            "name": "MasterSymmetricKey",
            "value": "******"
        },
        {
            "name": "RegionName",
            "value": "US East(N. Virginia)"
        },
        {
            "name": "SecretKey",
            "value": "******"
        }
    ],
    "connectorType": "AmazonS3",
    "createdBy": {
        "id": "0053h000002xQ5sAAE",
        "name": "Mohan Chinnappan",
        "profilePhotoUrl": "/img/userprofile/default_profile_45_v2.png"
    },
    "createdDate": "2021-04-29T15:28:03.000Z",
    "description": "S3 Connection Test",
    "id": "0It3h000000TQfYCAW",
    "label": "Another S3Connection",
    "lastModifiedBy": {
        "id": "0053h000002xQ5sAAE",
        "name": "Mohan Chinnappan",
        "profilePhotoUrl": "/img/userprofile/default_profile_45_v2.png"
    },
    "lastModifiedDate": "2021-04-29T15:28:03.000Z",
    "name": "anotherS3Connection",
    "type": "dataconnector",
    "url": "/services/data/v51.0/wave/dataConnectors/0It3h000000TQfYCAW"
}
```

### List the data connectors
```
$ sfdx mohanc:ea:dataConnector:list -u mohan.chinnappan.n_ea2@gmail.com  
```
```
Id,Name,Label,connectorType
"0It3h000000bnGUCAY","SFDC_LOCAL","SFDC_LOCAL","SfdcLocal"
"0It3h000000L1r6CAC","s3Connection","s3Connection","AmazonS3"
"0It3h000000TQfYCAW","anotherS3Connection","Another S3Connection","AmazonS3" 
```
