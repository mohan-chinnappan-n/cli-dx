## Financial Service Cloud

### Getting sobjects with **FinServ__** name space
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
