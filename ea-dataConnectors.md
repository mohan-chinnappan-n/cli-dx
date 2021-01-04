# EA Data Connectors

```

$  sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/wave/dataConnectors -m GET   -f ~/.headers/header_ea.json 
```
```json
{
    "dataConnectors": [
        {
            "connectionProperties": [],
            "connectorType": "SfdcLocal",
            "createdBy": {
                "id": "0053h000003de6bAAA",
                "name": "Integration User",
                "profilePhotoUrl": "/img/userprofile/default_profile_45_v2.png"
            },
            "createdDate": "2020-07-13T19:30:57.000Z",
            "description": "SFDC_LOCAL",
            "id": "0It3h000000bnGUCAY",
            "label": "SFDC_LOCAL",
            "lastModifiedBy": {
                "id": "0053h000003de6bAAA",
                "name": "Integration User",
                "profilePhotoUrl": "/img/userprofile/default_profile_45_v2.png"
            },
            "lastModifiedDate": "2020-07-13T19:30:57.000Z",
            "name": "SFDC_LOCAL",
            "type": "dataconnector",
            "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY"
        },
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
            "createdDate": "2020-08-27T21:51:57.000Z",
            "description": "S3 Connection",
            "id": "0It3h000000L1r6CAC",
            "ingestionSchedule": {
                "daysOfWeek": [],
                "notificationLevel": "warnings"
            },
            "label": "s3Connection",
            "lastModifiedBy": {
                "id": "0053h000002xQ5sAAE",
                "name": "Mohan Chinnappan",
                "profilePhotoUrl": "/img/userprofile/default_profile_45_v2.png"
            },
            "lastModifiedDate": "2020-09-02T15:57:30.000Z",
            "name": "s3Connection",
            "type": "dataconnector",
            "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000L1r6CAC"
        }
    ],
    "url": "/services/data/v49.0/wave/dataConnectors"
}
```
```
$  sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY -m GET   -f ~/.headers/header_ea.json 
```
```json
{
    "connectionProperties": [],
    "connectorType": "SfdcLocal",
    "createdBy": {
        "id": "0053h000003de6bAAA",
        "name": "Integration User",
        "profilePhotoUrl": "/img/userprofile/default_profile_45_v2.png"
    },
    "createdDate": "2020-07-13T19:30:57.000Z",
    "description": "SFDC_LOCAL",
    "id": "0It3h000000bnGUCAY",
    "label": "SFDC_LOCAL",
    "lastModifiedBy": {
        "id": "0053h000003de6bAAA",
        "name": "Integration User",
        "profilePhotoUrl": "/img/userprofile/default_profile_45_v2.png"
    },
    "lastModifiedDate": "2020-07-13T19:30:57.000Z",
    "name": "SFDC_LOCAL",
    "type": "dataconnector",
    "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY"
}
```
```
$  sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/wave/dataConnectors/0It3h000000L1r6CAC/status -m GET   -f ~/.headers/header_ea.json 
```json
{
    "message": "Connection Successful",
    "status": "Success",
    "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000L1r6CAC/status"
}
```
- [doc](https://developer.salesforce.com/docs/atlas.en-us.bi_dev_guide_rest.meta/bi_dev_guide_rest/bi_resources_dataconnectors_connectorid_status.htm?search_text=dataConnectors)
```
$  sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects -m GET   -f ~/.headers/header_ea.json 
```
```json
{
    "nextPageUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects?page=eyJwYWdlU2l6ZSI6MjUsInNvcnRPcmRlciI6Ik5BTUUiLCJsYXN0SWQiOiIwMDAwMDAwMDAwMDAwMDAiLCJsYXN0TmFtZSI6IkFjdGl2aXR5SGlzdG9yeSJ9",
    "sourceObjects": [
        {
            "dataPreviewUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AIInsightAction/dataPreview",
            "fieldsUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AIInsightAction/fields",
            "name": "AIInsightAction",
            "replicated": false,
            "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AIInsightAction"
        },
        {
            "dataPreviewUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AIInsightFeedback/dataPreview",
            "fieldsUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AIInsightFeedback/fields",
            "name": "AIInsightFeedback",
            "replicated": false,
            "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AIInsightFeedback"
        },
        {
            "dataPreviewUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AIInsightReason/dataPreview",
            "fieldsUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AIInsightReason/fields",
            "name": "AIInsightReason",
            "replicated": false,
            "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AIInsightReason"
        },
        {
            "dataPreviewUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AIInsightValue/dataPreview",
            "fieldsUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AIInsightValue/fields",
            "name": "AIInsightValue",
            "replicated": false,
            "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AIInsightValue"
        },
        {
            "accessDeniedReason": "This sObject is not visible to the Wave Integration User.",
            "accessible": false,
            "dataPreviewUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AIMetric/dataPreview",
            "fieldsUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AIMetric/fields",
            "name": "AIMetric",
            "replicated": false,
            "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AIMetric"
        },
        {
            "dataPreviewUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AIPredictionEvent/dataPreview",
            "fieldsUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AIPredictionEvent/fields",
            "name": "AIPredictionEvent",
            "replicated": false,
            "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AIPredictionEvent"
        },
        {
            "dataPreviewUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AIRecordInsight/dataPreview",
            "fieldsUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AIRecordInsight/fields",
            "name": "AIRecordInsight",
            "replicated": false,
            "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AIRecordInsight"
        },
        {
            "dataPreviewUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AcceptedEventRelation/dataPreview",
            "fieldsUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AcceptedEventRelation/fields",
            "name": "AcceptedEventRelation",
            "replicated": false,
            "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AcceptedEventRelation"
        },
        {
            "dataPreviewUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/Account/dataPreview",
            "fieldsUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/Account/fields",
            "name": "Account",
            "replicated": true,
            "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/Account"
        },
        {
            "dataPreviewUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AccountBrand/dataPreview",
            "fieldsUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AccountBrand/fields",
            "name": "AccountBrand",
            "replicated": false,
            "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AccountBrand"
        },
        {
            "dataPreviewUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AccountBrandShare/dataPreview",
            "fieldsUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AccountBrandShare/fields",
            "name": "AccountBrandShare",
            "replicated": false,
            "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AccountBrandShare"
        },
        {
            "dataPreviewUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AccountChangeEvent/dataPreview",
            "fieldsUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AccountChangeEvent/fields",
            "name": "AccountChangeEvent",
            "replicated": false,
            "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AccountChangeEvent"
        },
        {
            "dataPreviewUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AccountCleanInfo/dataPreview",
            "fieldsUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AccountCleanInfo/fields",
            "name": "AccountCleanInfo",
            "replicated": false,
            "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AccountCleanInfo"
        },
        {
            "dataPreviewUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AccountContactRole/dataPreview",
            "fieldsUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AccountContactRole/fields",
            "name": "AccountContactRole",
            "replicated": false,
            "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AccountContactRole"
        },
        {
            "dataPreviewUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AccountContactRoleChangeEvent/dataPreview",
            "fieldsUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AccountContactRoleChangeEvent/fields",
            "name": "AccountContactRoleChangeEvent",
            "replicated": false,
            "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AccountContactRoleChangeEvent"
        },
        {
            "dataPreviewUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AccountFeed/dataPreview",
            "fieldsUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AccountFeed/fields",
            "name": "AccountFeed",
            "replicated": false,
            "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AccountFeed"
        },
        {
            "dataPreviewUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AccountHistory/dataPreview",
            "fieldsUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AccountHistory/fields",
            "name": "AccountHistory",
            "replicated": false,
            "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AccountHistory"
        },
        {
            "dataPreviewUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AccountPartner/dataPreview",
            "fieldsUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AccountPartner/fields",
            "name": "AccountPartner",
            "replicated": false,
            "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AccountPartner"
        },
        {
            "dataPreviewUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AccountShare/dataPreview",
            "fieldsUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AccountShare/fields",
            "name": "AccountShare",
            "replicated": false,
            "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AccountShare"
        },
        {
            "dataPreviewUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AcquiredAccount__ChangeEvent/dataPreview",
            "fieldsUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AcquiredAccount__ChangeEvent/fields",
            "name": "AcquiredAccount__ChangeEvent",
            "replicated": false,
            "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AcquiredAccount__ChangeEvent"
        },
        {
            "dataPreviewUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AcquiredAccount__Share/dataPreview",
            "fieldsUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AcquiredAccount__Share/fields",
            "name": "AcquiredAccount__Share",
            "replicated": false,
            "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AcquiredAccount__Share"
        },
        {
            "dataPreviewUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AcquiredAccount__c/dataPreview",
            "fieldsUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AcquiredAccount__c/fields",
            "name": "AcquiredAccount__c",
            "replicated": false,
            "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/AcquiredAccount__c"
        },
        {
            "dataPreviewUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/ActionLinkGroupTemplate/dataPreview",
            "fieldsUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/ActionLinkGroupTemplate/fields",
            "name": "ActionLinkGroupTemplate",
            "replicated": false,
            "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/ActionLinkGroupTemplate"
        },
        {
            "dataPreviewUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/ActionLinkTemplate/dataPreview",
            "fieldsUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/ActionLinkTemplate/fields",
            "name": "ActionLinkTemplate",
            "replicated": false,
            "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/ActionLinkTemplate"
        },
        {
            "dataPreviewUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/ActivityHistory/dataPreview",
            "fieldsUrl": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/ActivityHistory/fields",
            "name": "ActivityHistory",
            "replicated": false,
            "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/ActivityHistory"
        }
    ],
    "totalSize": 703,
    "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects"
}
```
```
$  sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/Account/fields -m GET   -f ~/.headers/header_ea.json 
```
```json
{
    "fields": [
        {
            "fieldType": "text",
            "label": "Account ID",
            "multiValue": false,
            "name": "Id",
            "precision": 18
        },
        {
            "defaultValue": "false",
            "fieldType": "text",
            "label": "Deleted",
            "multiValue": false,
            "name": "IsDeleted"
        },
        {
            "fieldType": "text",
            "label": "Master Record ID",
            "multiValue": false,
            "name": "MasterRecordId",
            "precision": 18
        },
        {
            "fieldType": "text",
            "label": "Account Name",
            "multiValue": false,
            "name": "Name",
            "precision": 255
        },
        {
            "fieldType": "text",
            "label": "Account Type",
            "multiValue": false,
            "name": "Type",
            "precision": 255
        },
        {
            "fieldType": "text",
            "label": "Parent Account ID",
            "multiValue": false,
            "name": "ParentId",
            "precision": 18
        },
        {
            "fieldType": "text",
            "label": "Billing Street",
            "multiValue": false,
            "name": "BillingStreet",
            "precision": 255
        },
        {
            "fieldType": "text",
            "label": "Billing City",
            "multiValue": false,
            "name": "BillingCity",
            "precision": 40
        },
        {
            "fieldType": "text",
            "label": "Billing State/Province",
            "multiValue": false,
            "name": "BillingState",
            "precision": 80
        },
        {
            "fieldType": "text",
            "label": "Billing Zip/Postal Code",
            "multiValue": false,
            "name": "BillingPostalCode",
            "precision": 20
        },
        {
            "fieldType": "text",
            "label": "Billing Country",
            "multiValue": false,
            "name": "BillingCountry",
            "precision": 80
        },
        {
            "fieldType": "numeric",
            "label": "Billing Latitude",
            "multiValue": false,
            "name": "BillingLatitude",
            "precision": 18,
            "scale": 15
        },
        {
            "fieldType": "numeric",
            "label": "Billing Longitude",
            "multiValue": false,
            "name": "BillingLongitude",
            "precision": 18,
            "scale": 15
        },
        {
            "fieldType": "text",
            "label": "Billing Geocode Accuracy",
            "multiValue": false,
            "name": "BillingGeocodeAccuracy",
            "precision": 40
        },
        {
            "fieldType": "text",
            "label": "Shipping Street",
            "multiValue": false,
            "name": "ShippingStreet",
            "precision": 255
        },
        {
            "fieldType": "text",
            "label": "Shipping City",
            "multiValue": false,
            "name": "ShippingCity",
            "precision": 40
        },
        {
            "fieldType": "text",
            "label": "Shipping State/Province",
            "multiValue": false,
            "name": "ShippingState",
            "precision": 80
        },
        {
            "fieldType": "text",
            "label": "Shipping Zip/Postal Code",
            "multiValue": false,
            "name": "ShippingPostalCode",
            "precision": 20
        },
        {
            "fieldType": "text",
            "label": "Shipping Country",
            "multiValue": false,
            "name": "ShippingCountry",
            "precision": 80
        },
        {
            "fieldType": "numeric",
            "label": "Shipping Latitude",
            "multiValue": false,
            "name": "ShippingLatitude",
            "precision": 18,
            "scale": 15
        },
        {
            "fieldType": "numeric",
            "label": "Shipping Longitude",
            "multiValue": false,
            "name": "ShippingLongitude",
            "precision": 18,
            "scale": 15
        },
        {
            "fieldType": "text",
            "label": "Shipping Geocode Accuracy",
            "multiValue": false,
            "name": "ShippingGeocodeAccuracy",
            "precision": 40
        },
        {
            "fieldType": "text",
            "label": "Account Phone",
            "multiValue": false,
            "name": "Phone",
            "precision": 40
        },
        {
            "fieldType": "text",
            "label": "Account Fax",
            "multiValue": false,
            "name": "Fax",
            "precision": 40
        },
        {
            "fieldType": "text",
            "label": "Account Number",
            "multiValue": false,
            "name": "AccountNumber",
            "precision": 40
        },
        {
            "fieldType": "text",
            "label": "Website",
            "multiValue": false,
            "name": "Website",
            "precision": 255
        },
        {
            "fieldType": "text",
            "label": "Photo URL",
            "multiValue": false,
            "name": "PhotoUrl",
            "precision": 255
        },
        {
            "fieldType": "text",
            "label": "SIC Code",
            "multiValue": false,
            "name": "Sic",
            "precision": 20
        },
        {
            "fieldType": "text",
            "label": "Industry",
            "multiValue": false,
            "name": "Industry",
            "precision": 255
        },
        {
            "fieldType": "numeric",
            "label": "Annual Revenue",
            "multiValue": false,
            "name": "AnnualRevenue",
            "precision": 18,
            "scale": 0
        },
        {
            "fieldType": "numeric",
            "label": "Employees",
            "multiValue": false,
            "name": "NumberOfEmployees",
            "precision": 10,
            "scale": 0
        },
        {
            "fieldType": "text",
            "label": "Ownership",
            "multiValue": false,
            "name": "Ownership",
            "precision": 255
        },
        {
            "fieldType": "text",
            "label": "Ticker Symbol",
            "multiValue": false,
            "name": "TickerSymbol",
            "precision": 20
        },
        {
            "fieldType": "text",
            "label": "Account Description",
            "multiValue": false,
            "name": "Description",
            "precision": 32000
        },
        {
            "fieldType": "text",
            "label": "Account Rating",
            "multiValue": false,
            "name": "Rating",
            "precision": 255
        },
        {
            "fieldType": "text",
            "label": "Account Site",
            "multiValue": false,
            "name": "Site",
            "precision": 80
        },
        {
            "fieldType": "text",
            "label": "Owner ID",
            "multiValue": false,
            "name": "OwnerId",
            "precision": 18
        },
        {
            "fieldType": "date",
            "format": "yyyy-MM-ddTHH:mm:ss.SSSZ",
            "label": "Created Date",
            "multiValue": false,
            "name": "CreatedDate"
        },
        {
            "fieldType": "text",
            "label": "Created By ID",
            "multiValue": false,
            "name": "CreatedById",
            "precision": 18
        },
        {
            "fieldType": "date",
            "format": "yyyy-MM-ddTHH:mm:ss.SSSZ",
            "label": "Last Modified Date",
            "multiValue": false,
            "name": "LastModifiedDate"
        },
        {
            "fieldType": "text",
            "label": "Last Modified By ID",
            "multiValue": false,
            "name": "LastModifiedById",
            "precision": 18
        },
        {
            "fieldType": "date",
            "format": "yyyy-MM-ddTHH:mm:ss.SSSZ",
            "label": "System Modstamp",
            "multiValue": false,
            "name": "SystemModstamp"
        },
        {
            "fieldType": "date",
            "format": "yyyy-MM-dd",
            "label": "Last Activity",
            "multiValue": false,
            "name": "LastActivityDate"
        },
        {
            "fieldType": "date",
            "format": "yyyy-MM-ddTHH:mm:ss.SSSZ",
            "label": "Last Viewed Date",
            "multiValue": false,
            "name": "LastViewedDate"
        },
        {
            "fieldType": "date",
            "format": "yyyy-MM-ddTHH:mm:ss.SSSZ",
            "label": "Last Referenced Date",
            "multiValue": false,
            "name": "LastReferencedDate"
        },
        {
            "defaultValue": "false",
            "fieldType": "text",
            "label": "Partner Account",
            "multiValue": false,
            "name": "IsPartner"
        },
        {
            "defaultValue": "false",
            "fieldType": "text",
            "label": "Customer Portal Account",
            "multiValue": false,
            "name": "IsCustomerPortal"
        },
        {
            "fieldType": "text",
            "label": "Channel Program Name",
            "multiValue": false,
            "name": "ChannelProgramName",
            "precision": 255
        },
        {
            "fieldType": "text",
            "label": "Channel Program Level Name",
            "multiValue": false,
            "name": "ChannelProgramLevelName",
            "precision": 255
        },
        {
            "fieldType": "text",
            "label": "Data.com Key",
            "multiValue": false,
            "name": "Jigsaw",
            "precision": 20
        },
        {
            "fieldType": "text",
            "label": "Jigsaw Company ID",
            "multiValue": false,
            "name": "JigsawCompanyId",
            "precision": 20
        },
        {
            "fieldType": "text",
            "label": "Clean Status",
            "multiValue": false,
            "name": "CleanStatus",
            "precision": 40
        },
        {
            "fieldType": "text",
            "label": "Account Source",
            "multiValue": false,
            "name": "AccountSource",
            "precision": 255
        },
        {
            "fieldType": "text",
            "label": "D-U-N-S Number",
            "multiValue": false,
            "name": "DunsNumber",
            "precision": 9
        },
        {
            "fieldType": "text",
            "label": "Tradestyle",
            "multiValue": false,
            "name": "Tradestyle",
            "precision": 255
        },
        {
            "fieldType": "text",
            "label": "NAICS Code",
            "multiValue": false,
            "name": "NaicsCode",
            "precision": 8
        },
        {
            "fieldType": "text",
            "label": "NAICS Description",
            "multiValue": false,
            "name": "NaicsDesc",
            "precision": 120
        },
        {
            "fieldType": "text",
            "label": "Year Started",
            "multiValue": false,
            "name": "YearStarted",
            "precision": 4
        },
        {
            "fieldType": "text",
            "label": "SIC Description",
            "multiValue": false,
            "name": "SicDesc",
            "precision": 80
        },
        {
            "fieldType": "text",
            "label": "D&amp;B Company ID",
            "multiValue": false,
            "name": "DandbCompanyId",
            "precision": 18
        },
        {
            "fieldType": "text",
            "label": "Customer Priority",
            "multiValue": false,
            "name": "CustomerPriority__c",
            "precision": 255
        },
        {
            "fieldType": "text",
            "label": "SLA",
            "multiValue": false,
            "name": "SLA__c",
            "precision": 255
        },
        {
            "fieldType": "text",
            "label": "Active",
            "multiValue": false,
            "name": "Active__c",
            "precision": 255
        },
        {
            "fieldType": "numeric",
            "label": "Number of Locations",
            "multiValue": false,
            "name": "NumberofLocations__c",
            "precision": 3,
            "scale": 0
        },
        {
            "fieldType": "text",
            "label": "Upsell Opportunity",
            "multiValue": false,
            "name": "UpsellOpportunity__c",
            "precision": 255
        },
        {
            "fieldType": "text",
            "label": "SLA Serial Number",
            "multiValue": false,
            "name": "SLASerialNumber__c",
            "precision": 10
        },
        {
            "fieldType": "date",
            "format": "yyyy-MM-dd",
            "label": "SLA Expiration Date",
            "multiValue": false,
            "name": "SLAExpirationDate__c"
        },
        {
            "fieldType": "text",
            "label": "Segment",
            "multiValue": false,
            "name": "Segment__c",
            "precision": 25
        }
    ],
    "url": "/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/Account/fields"
}
```

```
 sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/wave/dataConnectors/0It3h000000bnGUCAY/sourceObjects/Account/dataPreview -m POST   -f ~/.headers/header_ea.json -d ~/.ea/fields.json 
```
```
$ cat ~/.ea/fields.json 
```
```json
{
  "sourceObjectFields": ["Id", "Name"]
}
```

```
 sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/wave/dataConnectorTypes -m GET   -f ~/.headers/header_ea.json
```

