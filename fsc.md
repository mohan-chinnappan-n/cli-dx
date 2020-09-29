# Financial Service Cloud

## Topics

- [FSC Data model in CSV file](#dmcsv)
- [FSC objects](#objs)
- [Getting fields](#fields)
- [Record Types](#rts)

<a name='dmcsv'></a>

## Getting FSC data model in csv format
- [Model Export Doc](https://mohan-chinnappan-n.github.io/dx/plugins.html#/15)

```
$ sfdx mohanc:md:describeGlobal -u mohan.chinnappan.n-7nte@force.com > ~/.fsc/ObjectList.txt
$ sfdx mohanc:md:describe -u mohan.chinnappan.n-7nte@force.com  -i ~/.fsc/ObjectList.txt > ~/.fsc/fsc-md.csv
```
- [Exported FSC data model in CSV](data/fsc-md.csv)

<a name='objs'></a>

## Getting sobjects with **FinServ__** name space
- [FSC data model interactive](https://mohan-chinnappan-n.github.io/sfdc/fs-cloud/model-fsc-224.html)

```
$ sfdx mohanc:ws:rest -f header_fsc.json -r https://mohansun-fsc-201.my.salesforce.com/services/data/v49.0/sobjects -m GET > fsc_objects.json
$ sfdx mohanc:data:jq -i fsc_objects.json -f '.sobjects[].name | select ( contains("FinServ__")  )'
"FinServ__AccountAccountRelation__ChangeEvent"
"FinServ__AccountAccountRelation__Share"
"FinServ__AccountAccountRelation__c"
"FinServ__Alert__ChangeEvent"
"FinServ__Alert__Share"
"FinServ__Alert__c"
"FinServ__AssetsAndLiabilities__ChangeEvent"
"FinServ__AssetsAndLiabilities__Share"
"FinServ__AssetsAndLiabilities__c"
"FinServ__B2CLeadCompanyNameConfig__ChangeEvent"
"FinServ__B2CLeadCompanyNameConfig__Share"
"FinServ__B2CLeadCompanyNameConfig__c"
"FinServ__B2CLeadToOpportunityMapping__mdt"
"FinServ__BillingStatement__ChangeEvent"
"FinServ__BillingStatement__c"
"FinServ__Card__ChangeEvent"
"FinServ__Card__c"
"FinServ__ChargesAndFees__ChangeEvent"
"FinServ__ChargesAndFees__Share"
"FinServ__ChargesAndFees__c"
"FinServ__ContactContactRelation__ChangeEvent"
"FinServ__ContactContactRelation__Share"
"FinServ__ContactContactRelation__c"
"FinServ__CustomFieldSet__mdt"
"FinServ__CustomLabelConf__mdt"
"FinServ__DialogLookUpConfig__mdt"
"FinServ__Education__ChangeEvent"
"FinServ__Education__Share"
"FinServ__Education__c"
"FinServ__Employment__ChangeEvent"
"FinServ__Employment__Share"
"FinServ__Employment__c"
"FinServ__FeatureFlagSettings__mdt"
"FinServ__FinancialAccountRole__ChangeEvent"
"FinServ__FinancialAccountRole__c"
"FinServ__FinancialAccountTransaction__ChangeEvent"
"FinServ__FinancialAccountTransaction__Share"
"FinServ__FinancialAccountTransaction__c"
"FinServ__FinancialAccount__ChangeEvent"
"FinServ__FinancialAccount__History"
"FinServ__FinancialAccount__Share"
"FinServ__FinancialAccount__c"
"FinServ__FinancialGoal__ChangeEvent"
"FinServ__FinancialGoal__Share"
"FinServ__FinancialGoal__c"
"FinServ__FinancialHolding__ChangeEvent"
"FinServ__FinancialHolding__History"
"FinServ__FinancialHolding__c"
"FinServ__GroupRecordTypeMapper__mdt"
"FinServ__IdentificationDocument__ChangeEvent"
"FinServ__IdentificationDocument__Share"
"FinServ__IdentificationDocument__c"
"FinServ__IndividualRecordTypeMapper__mdt"
"FinServ__IndustriesAppConfig__ChangeEvent"
"FinServ__IndustriesAppConfig__Share"
"FinServ__IndustriesAppConfig__c"
"FinServ__IndustriesSettings__ChangeEvent"
"FinServ__IndustriesSettings__Share"
"FinServ__IndustriesSettings__c"
"FinServ__InteractionFieldUpdate__mdt"
"FinServ__JobFlowSetting__mdt"
"FinServ__LifeEvent__ChangeEvent"
"FinServ__LifeEvent__Share"
"FinServ__LifeEvent__c"
"FinServ__LookupSearchConf__mdt"
"FinServ__NextLastInteractionSettings__ChangeEvent"
"FinServ__NextLastInteractionSettings__Share"
"FinServ__NextLastInteractionSettings__c"
"FinServ__PolicyPaymentMethod__ChangeEvent"
"FinServ__PolicyPaymentMethod__History"
"FinServ__PolicyPaymentMethod__Share"
"FinServ__PolicyPaymentMethod__c"
"FinServ__ReciprocalRole__ChangeEvent"
"FinServ__ReciprocalRole__Share"
"FinServ__ReciprocalRole__c"
"FinServ__ReferralRecordTypeMapper__mdt"
"FinServ__Revenue__ChangeEvent"
"FinServ__Revenue__Share"
"FinServ__Revenue__c"
"FinServ__RollupByLookupConfig__ChangeEvent"
"FinServ__RollupByLookupConfig__Share"
"FinServ__RollupByLookupConfig__c"
"FinServ__RollupByLookupFilterCriteria__ChangeEvent"
"FinServ__RollupByLookupFilterCriteria__c"
"FinServ__Securities__ChangeEvent"
"FinServ__Securities__Share"
"FinServ__Securities__c"
"FinServ__Transaction_Dispute_Approval_Limit__mdt"
"FinServ__UsePersonAccount__ChangeEvent"
"FinServ__UsePersonAccount__Share"
"FinServ__UsePersonAccount__c"
"FinServ__WealthAppConfig__ChangeEvent"
"FinServ__WealthAppConfig__Share"
"FinServ__WealthAppConfig__c"
"FinServ__individualExcludedFields__ChangeEvent"
"FinServ__individualExcludedFields__Share"
"FinServ__individualExcludedFields__c"


```


<a name='fields'></a>

## Getting object fields

### Get object fields  for FinServ__AccountAccountRelation__c

```
$ bash getObjectFields_fsc.sh FinServ__AccountAccountRelation__c
Id,Record ID,id,18
OwnerId,Owner ID,reference,18
IsDeleted,Deleted,boolean,0
Name,Account Relation Name,string,80
CreatedDate,Created Date,datetime,0
CreatedById,Created By ID,reference,18
LastModifiedDate,Last Modified Date,datetime,0
LastModifiedById,Last Modified By ID,reference,18
SystemModstamp,System Modstamp,datetime,0
FinServ__Account__c,Account,reference,18
FinServ__Active__c,Active,boolean,0
FinServ__EndDate__c,End Date,date,0
FinServ__ExternalId__c,External ID,string,64
FinServ__InverseRelationship__c,InverseRelationship,reference,18
FinServ__RelatedAccount__c,Related Account,reference,18
FinServ__Role__c,Related Role,reference,18
FinServ__SourceSystemId__c,Source System ID,string,100
FinServ__StartDate__c,Start Date,date,0
FinServ__AssociationType__c,Association Type,picklist,255

```
### Get object fields  for AccountContactRelation

```
$ bash getObjectFields_fsc.sh AccountContactRelation
Id,Account Contact Relationship ID,id,18
AccountId,Account ID,reference,18
ContactId,Contact ID,reference,18
Roles,Roles,multipicklist,4099
IsDirect,Direct,boolean,0
IsActive,Active,boolean,0
StartDate,Start Date,date,0
EndDate,End Date,date,0
IsDeleted,Deleted,boolean,0
CreatedDate,Created Date,datetime,0
CreatedById,Created By ID,reference,18
LastModifiedDate,Last Modified Date,datetime,0
LastModifiedById,Last Modified By ID,reference,18
SystemModstamp,System Modstamp,datetime,0
FinServ__Primary__c,Primary Member,boolean,0
FinServ__Rollups__c,Roll-Ups,multipicklist,4099
FinServ__SourceSystemId__c,Source System ID,string,100
FinServ__IncludeInGroup__c,Include in Primary Group,boolean,0
FinServ__PrimaryGroup__c,Primary Group,boolean,0

```

### Get object fields  for BusinessProcess

```
$ bash getObjectFields_fsc.sh BusinessProcess
Id,Business Process ID,id,18
Name,Name,string,80
NamespacePrefix,Namespace Prefix,string,15
Description,Description,string,255
TableEnumOrId,Entity Enumeration Or ID,picklist,40
IsActive,Active,boolean,0
CreatedById,Created By ID,reference,18
CreatedDate,Created Date,datetime,0
LastModifiedById,Last Modified By ID,reference,18
LastModifiedDate,Last Modified Date,datetime,0
SystemModstamp,System Modstamp,datetime,0

```
### Get records for BusinessProcess

```
$ sfdx mohanc:data:query -q soql/businessProcess.soql -u mohan.chinnappan.n-bdsa@force.com
"attributes","Id","Name","NamespacePrefix","Description","TableEnumOrId","IsActive","CreatedById","CreatedDate","LastModifiedById","LastModifiedDate","SystemModstamp"
"{""type"":""BusinessProcess"",""url"":""/services/data/v49.0/sobjects/BusinessProcess/0194W000000CvbFQAS""}","0194W000000CvbFQAS","Opportunity Process","FinServ",,"Opportunity",true,"0054W00000ABpuUQAT","2020-08-31T22:34:58.000+0000","0054W00000ABpuUQAT","2020-08-31T22:34:58.000+0000","2020-08-31T22:34:58.000+0000"
"{""type"":""BusinessProcess"",""url"":""/services/data/v49.0/sobjects/BusinessProcess/0194W000000CvbGQAS""}","0194W000000CvbGQAS","Wallet Share","FinServ",,"Opportunity",true,"0054W00000ABpuUQAT","2020-08-31T22:34:58.000+0000","0054W00000ABpuUQAT","2020-08-31T22:34:58.000+0000","2020-08-31T22:34:58.000+0000"
"{""type"":""BusinessProcess"",""url"":""/services/data/v49.0/sobjects/BusinessProcess/0194W000000CvbHQAS""}","0194W000000CvbHQAS","Lead Process","FinServ","Consumer lead","Lead",true,"0054W00000ABpuUQAT","2020-08-31T22:34:58.000+0000","0054W00000ABpuUQAT","2020-08-31T22:34:58.000+0000","2020-08-31T22:34:58.000+0000"

$ cat soql/businessProcess.soql 
SELECT
    Id,
    Name,
    NamespacePrefix,
    Description,
    TableEnumOrId,
    IsActive,
    CreatedById,
    CreatedDate,
    LastModifiedById,
    LastModifiedDate,
    SystemModstamp
FROM BusinessProcess
```


### Get object fields for FinServ__IndividualRecordTypeMapper__mdt
```
$ bash getObjectFields_fsc.sh FinServ__IndividualRecordTypeMapper__mdt
Id,Custom Metadata Record ID,id,18
DeveloperName,Custom Metadata Record Name,string,40
MasterLabel,Label,string,40
Language,Master Language,picklist,40
NamespacePrefix,Namespace Prefix,string,15
Label,Label,string,40
QualifiedApiName,Qualified API Name,string,70
FinServ__AccountRecordTypeNamespace__c,Record Type Namespace (Account),string,200
FinServ__AccountRecordType__c,Account Record Type,string,200
FinServ__ContactRecordTypeNamespace__c,Record Type Namespace (Contact),string,200
FinServ__ContactRecordType__c,Contact Record Type,string,200
FinServ__DetailPage__c,Detail Page,string,200
FinServ__IndividualType__c,Account SubType,string,200
FinServ__LeadRecordTypeNamespace__c,Record Type Namespace (Lead),string,200
FinServ__LeadRecordType__c,Lead Record Type,string,200
```
### Get Records for FinServ__IndividualRecordTypeMapper__mdt
```
$ sfdx mohanc:data:query -q soql/FinServ__IndividualRecordTypeMapper__mdt.soql -u mohan.chinnappan.n-bdsa@force.com
"attributes","Id","DeveloperName","MasterLabel","Language","NamespacePrefix","Label","QualifiedApiName","FinServ__AccountRecordTypeNamespace__c","FinServ__AccountRecordType__c","FinServ__ContactRecordTypeNamespace__c","FinServ__ContactRecordType__c","FinServ__DetailPage__c","FinServ__IndividualType__c","FinServ__LeadRecordTypeNamespace__c","FinServ__LeadRecordType__c"
"{""type"":""FinServ__IndividualRecordTypeMapper__mdt"",""url"":""/services/data/v49.0/sobjects/FinServ__IndividualRecordTypeMapper__mdt/m074W000000ob3qQAA""}","m074W000000ob3qQAA","Individual","Individual","en_US","FinServ","Individual","FinServ__Individual","Industries","IndustriesIndividual","Industries","IndustriesIndividual",,"Individual",,
"{""type"":""FinServ__IndividualRecordTypeMapper__mdt"",""url"":""/services/data/v49.0/sobjects/FinServ__IndividualRecordTypeMapper__mdt/m074W000000ob3rQAA""}","m074W000000ob3rQAA","PersonAccount","Person Account","en_US",,"Person Account","PersonAccount",,"PersonAccount",,,,,,

$ cat soql/FinServ__IndividualRecordTypeMapper__mdt.soql
SELECT 
    Id,
    DeveloperName,
    MasterLabel,
    Language,
    NamespacePrefix,
    Label,
    QualifiedApiName,
    FinServ__AccountRecordTypeNamespace__c,
    FinServ__AccountRecordType__c,
    FinServ__ContactRecordTypeNamespace__c,
    FinServ__ContactRecordType__c,
    FinServ__DetailPage__c,
    FinServ__IndividualType__c,
    FinServ__LeadRecordTypeNamespace__c,
    FinServ__LeadRecordType__c

FROM 
FinServ__IndividualRecordTypeMapper__mdt
```
<a name='rts'></a>
### RecordTypes of Account object
```
$ sfdx mohanc:ws:rest -f ~/.headers/header_fsc.json -r https://mohansun-fsc2009.my.salesforce.com/services/data/v49.0/ui-api/object-info/Account > ~/fsc/account.json
$ sfdx mohanc:data:jq -i  ~/fsc/account.json -f '.recordTypeInfos'
```
```json
{
  "012000000000000AAA": {
    "available": true,
    "defaultRecordTypeMapping": false,
    "master": true,
    "name": "Master",
    "recordTypeId": "012000000000000AAA"
  },
  "0124W000001OEiZQAW": {
    "available": true,
    "defaultRecordTypeMapping": false,
    "master": false,
    "name": "Institution",
    "recordTypeId": "0124W000001OEiZQAW"
  },
  "0124W000001OEiaQAG": {
    "available": true,
    "defaultRecordTypeMapping": true,
    "master": false,
    "name": "Household",
    "recordTypeId": "0124W000001OEiaQAG"
  },
  "0124W000001OEibQAG": {
    "available": true,
    "defaultRecordTypeMapping": false,
    "master": false,
    "name": "Business",
    "recordTypeId": "0124W000001OEibQAG"
  },
  "0124W000001OEicQAG": {
    "available": true,
    "defaultRecordTypeMapping": false,
    "master": false,
    "name": "Person Account",
    "recordTypeId": "0124W000001OEicQAG"
  },
  "0124W000001OEidQAG": {
    "available": false,
    "defaultRecordTypeMapping": false,
    "master": false,
    "name": "Individual",
    "recordTypeId": "0124W000001OEidQAG"
  }
}
```

