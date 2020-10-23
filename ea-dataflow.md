## 1. Get the aliases for the sfdcRegister

```
$ sfdx mohanc:data:jq -i The_Motivator.json -f '.[] | select(.action=="sfdcRegister") |  .parameters.alias'
"user"
"activity"
```

## 2. Get the Dataset JSON
- for: **user** dataset
```
$ sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v50.0/wave/datasets/user  -m GET -f header.json  >user-ds.json

``` 
    - get currentVersionrl for this dataset
```
$ sfdx mohanc:data:jq -i user-ds.json  -f '.currentVersionUrl'
"/services/data/v50.0/wave/datasets/0Fb3h0000008ryUCAQ/versions/0Fc3h000003nCMLCA2"
```
    - get currentVersion dataset json
```
$ sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v50.0/wave/datasets/0Fb3h0000008ryUCAQ/versions/0Fc3h000003nCMLCA2  -m GET -f header.json  >user-ds-cv.json

```
    - get dimensions fields
```
$   sfdx mohanc:data:jq -i user-ds-cv.json  -f '.xmdMain.dimensions[].field'
"Role.RoleNames"
"UniqueUserName"
"UserRoleId"
"IsActive"
"Role.ParentRoleId"
"Role.RolePath"
"Name"
"Opportunity.Name"
"Role.DeveloperName"
"SmallPhotoUrl"
"FirstName"
"hasOpportunity"
"Role.ParentRole.Name"
"Role.RoleNamesPath"
"CustomFilter"
"FullPhotoUrl"
"Username"
"Role.Name"
"Role.Roles"
"Id"
"LastName"
"Role.Hierarchy_RoleNames"
"Role.ParentRole.DeveloperName"
"UserType"
"ManagerId"

```
    - get measure fields 
```
$   sfdx mohanc:data:jq -i user-ds-cv.json  -f '.xmdMain.measures[].field'

```
- for **activity** dataset 
```
$ sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v50.0/wave/datasets/activity  -m GET -f header.json  >activity-ds.json

$ sfdx mohanc:data:jq -i activity-ds.json  -f '.currentVersionUrl'
"/services/data/v50.0/wave/datasets/0Fb3h0000008ryTCAQ/versions/0Fc3h000003nChXCAU"

$ sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v50.0/wave/datasets/0Fb3h0000008ryTCAQ/versions/0Fc3h000003nChXCAU  -m GET -f header.json  >activity-ds-cv.json



$ sfdx mohanc:data:jq -i activity-ds-cv.json  -f '.xmdMain.dimensions[].field'
"LastModifiedDate"
"LastModifiedDate_Year"
"LastModifiedDate_Quarter"
"LastModifiedDate_Month"
"LastModifiedDate_Week"
"LastModifiedDate_Day"
"LastModifiedDate_Hour"
"LastModifiedDate_Minute"
"LastModifiedDate_Second"
"LastModifiedDate_Year_Fiscal"
"LastModifiedDate_Quarter_Fiscal"
"LastModifiedDate_Month_Fiscal"
"LastModifiedDate_Week_Fiscal"
"Account.Type"
"AccountId"
"CallDisposition"
"Opportunity.RecordTypeId"
"Owner.Role.ParentRole.Name"
"Owner.Role.Hierarchy_RoleNames"
"Owner.Role.Name"
"Opportunity.StageName"
"Owner.Username"
"AssignedTo.UniqueUserName"
"Owner.Role.DeveloperName"
"Status"
"IsOverdue"
"Owner.Role.RoleNamesPath"
"ActivityDate"
"ActivityDate_Year"
"ActivityDate_Quarter"
"ActivityDate_Month"
"ActivityDate_Week"
"ActivityDate_Day"
"ActivityDate_Hour"
"ActivityDate_Minute"
"ActivityDate_Second"
"ActivityDate_Year_Fiscal"
"ActivityDate_Quarter_Fiscal"
"ActivityDate_Month_Fiscal"
"ActivityDate_Week_Fiscal"
"Priority"
"Owner.Role.RolePath"
"Opportunity.Id"
"Opportunity.IsClosed"
"TaskSubtype"
"Account.BillingCountry"
"CreatedDate"
"CreatedDate_Year"
"CreatedDate_Quarter"
"CreatedDate_Month"
"CreatedDate_Week"
"CreatedDate_Day"
"CreatedDate_Hour"
"CreatedDate_Minute"
"CreatedDate_Second"
"CreatedDate_Year_Fiscal"
"CreatedDate_Quarter_Fiscal"
"CreatedDate_Month_Fiscal"
"CreatedDate_Week_Fiscal"
"Account.OwnerId"
"Id"
"EventSubtype"
"Opportunity.AccountId"
"Owner.Role.RoleNames"
"Owner.UniqueUserName"
"WhatId"
"Owner.FullPhotoUrl"
"CallType"
"AssignedTo.Name"
"IsClosed"
"Owner.SmallPhotoUrl"
"Owner.Role.ParentRoleId"
"Account.Industry"
"Opportunity.Type"
"OwnerId"
"Owner.UserRoleId"
"Opportunity.Name"
"Owner.Name"
"Opportunity.CloseDate"
"Opportunity.CloseDate_Year"
"Opportunity.CloseDate_Quarter"
"Opportunity.CloseDate_Month"
"Opportunity.CloseDate_Week"
"Opportunity.CloseDate_Day"
"Opportunity.CloseDate_Hour"
"Opportunity.CloseDate_Minute"
"Opportunity.CloseDate_Second"
"Opportunity.CreatedDate"
"Opportunity.CreatedDate_Year"
"Opportunity.CreatedDate_Quarter"
"Opportunity.CreatedDate_Month"
"Opportunity.CreatedDate_Week"
"Opportunity.CreatedDate_Day"
"Opportunity.CreatedDate_Hour"
"Opportunity.CreatedDate_Minute"
"Opportunity.CreatedDate_Second"
"Subject"
"Owner.Role.Roles"
"CustomFilter"
"Owner.Role.ParentRole.DeveloperName"
"Opportunity.OwnerId"
"Account.Name"



$ sfdx mohanc:data:jq -i activity-ds-cv.json  -f '.xmdMain.measures[].field'
"LastModifiedDate_day_epoch"
"LastModifiedDate_sec_epoch"
"DaysOverdue"
"ActivityDate_day_epoch"
"ActivityDate_sec_epoch"
"CallDurationInSeconds"
"CreatedDate_day_epoch"
"CreatedDate_sec_epoch"
"DurationInMinutes"
"Opportunity.CloseDate_day_epoch"
"Opportunity.CloseDate_sec_epoch"
"Opportunity.CreatedDate_day_epoch"
"Opportunity.CreatedDate_sec_epoch"

