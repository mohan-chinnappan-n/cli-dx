# Data Connector in EA


## List the data connectors
```
$ sfdx mohanc:ea:dataConnector:list -u mohan.chinnappan.n_ea2@gmail.com  
```
```
Id,Name,Label,connectorType
"0It3h000000bnGUCAY","SFDC_LOCAL","SFDC_LOCAL","SfdcLocal"
"0It3h000000L1r6CAC","s3Connection","s3Connection","AmazonS3"
```

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
