
## Look at the dataflows
```
$ sfdx mohanc:ea:dataflow:list -u mohan.chinnappan.n_ea2@gmail.com
Id,Label
02K3h000000Mu1oEAC,exportOppty2
02K3h000000Mu0vEAC,exportOppty
02K3h000000MtyuEAC,ExportCustomers
02K3h000000MrxWEAS,fruitsdf
02K3h000000Mr7JEAS,The_Motivator
02K3h000000Mr7KEAS,Default Salesforce Dataflow

```
### Pick The_Motivator dataflow with id: 02K3h000000Mr7JEAS
```
$ sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v50.0/wave/dataflows/02K3h000000Mr7JEAS  -m GET -f header.json > The_Motivator-df.json

```

## 1. Get the aliases for the sfdcRegister

```
$ sfdx mohanc:data:jq -i The_Motivator-df.json -f '.definition[] | select(.action=="sfdcRegister") |  .parameters.alias'
"user"
"activity"
```

## 2. Get the Dataset JSON
### for: **user** dataset

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

- get dataset id
```
$ sfdx mohanc:data:jq -i user-ds-cv.json  -f '.dataset.id'
"0Fb3h0000008ryUCAQ"

```
 - get dependencies for this dataset
```
$ sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v50.0/wave/dependencies/0Fb3h0000008ryUCAQ -m GET -f header.json > user-ds-cv_dep.json 

```

#### get dashboards depending on this dataset
```
$ sfdx mohanc:data:jq -i user-ds-cv_dep.json -f '.dashboards.dependencies' > user-ds-cv_dep-dashboards.json

$ sfdx mohanc:data:jq -i user-ds-cv_dep-dashboards.json -f '.[].url'
"/services/data/v50.0/wave/dashboards/0FK3h0000001yCdGAI"
"/services/data/v50.0/wave/dashboards/0FK3h0000001yCcGAI"
"/services/data/v50.0/wave/dashboards/0FK3h000000FexZGAS


``` 
- get json for these dashboards

```
$ sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v50.0/wave/dashboards/0FK3h0000001yCdGAI -m GET -f header.json  > user-ds-cv_dep-dashboards-1.json 

# this field: UniqueUserName is mentioned in this dashboard?
$ grep 'UniqueUserName'  user-ds-cv_dep-dashboards-1.json | sfdx mohanc:data:htmlDecode
                        "fieldName": "UniqueUserName"
                        "fieldName": "Owner.UniqueUserName"
                    "Owner.UniqueUserName"
                    "Owner.UniqueUserName"
                "query": "e = load "activity"; z = group e by 'Owner.UniqueUserName'; z = foreach z generate first('Owner.SmallPhotoUrl') as 'Chatter_Image', 'Owner.UniqueUserName' as 'Owner.UniqueUserName', coalesce(count(),0) as 'sum_total_activities';z = order z by 'sum_total_activities' desc;",
                    "Owner.UniqueUserName",
                    "query": "{"values":["Account.Name","EventSubtype","Subject","AssignedTo.UniqueUserName","Status","Opportunity.Name","Opportunity.Type","ActivityDate","DaysOverdue","IsClosed"],"order":[["Account.Name",{"ascending":true}]]}",
                "query": "owner = load "activity"; owner = filter owner by {{column(hbar_sales_reps.selection, ["Owner.UniqueUserName"]).asEquality("Owner.UniqueUserName")}}; owner = group owner by all; owner = foreach owner generate coalesce(count(),0) as 'avg_act'; a = load "activity"; a = group a by all; a = foreach a generate count() as 'count'; u = load "user"; b = group u by all full, a by all; b = foreach b generate coalesce(sum(a['count']) / count(u),0) as 'avg_activities_completed'; z = group owner by all, b by all; z = foreach z generate (case when ("{{cell(hbar_sales_reps.selection, 0, "Owner.UniqueUserName").asString()}}" == "null") then 0 else coalesce((sum(owner['avg_act']) - sum(b['avg_activities_completed']))/sum(b['avg_activities_completed']),0) end) as 'sum_percent'; z = foreach z generate 'sum_percent', (case when 'sum_percent' > 0 then "#4ED469" when 'sum_percent' < 0 then "#ED3251" else "#7D98B3" end) as 'color',(case when 'sum_percent' < 0 then "▼" when 'sum_percent' > 0 then "▲" else "◄ ►"  end) as 'diff_arrow';",
                "query": "owner = load "activity"; owner = filter owner by {{column(hbar_sales_reps.selection, ["Owner.UniqueUserName"]).asEquality("Owner.UniqueUserName")}}; owner = filter owner by 'IsOverdue' == "true"; a = load "activity"; a = filter a by 'IsOverdue' == "true"; a = group a by all; a = foreach a generate count() as 'count'; u = load "user"; b = group u by all full, a by all; b = foreach b generate coalesce(sum(a['count'])/count(u),0) as avg_completed; z = group owner by all full, b by all; z = foreach z generate (case when ("{{cell(hbar_sales_reps.selection, 0, "Owner.UniqueUserName").asString()}}" == "null") then 0 else coalesce((count(owner) - sum(b['avg_completed']))/sum(b['avg_completed']),0) end) as 'sum_percent'; z = foreach z generate 'sum_percent', (case when 'sum_percent' > 0 then "#4ED469" when 'sum_percent' < 0 then "#ED3251" else "#7D98B3" end) as 'color',(case when 'sum_percent' < 0 then "▼" when 'sum_percent' > 0 then "▲" else "◄ ►"  end) as 'diff_arrow';",
                "query": "owner = load "activity"; owner = filter owner by {{column(hbar_sales_reps.selection, ["Owner.UniqueUserName"]).asEquality("Owner.UniqueUserName")}}; owner = filter owner by 'IsClosed' == "true"; a = load "activity"; a = filter a by 'IsClosed' == "true"; a = group a by all; a = foreach a generate count() as 'count'; u = load "user"; b = group u by all full, a by all; b = foreach b generate coalesce(sum(a['count'])/count(u),0) as avg_completed; z = group owner by all full, b by all; z = foreach z generate (case when ("{{cell(hbar_sales_reps.selection, 0, "Owner.UniqueUserName").asString()}}" == "null") then 0 else coalesce((count(owner) - sum(b['avg_completed']))/sum(b['avg_completed']),0) end) as 'sum_percent'; z = foreach z generate 'sum_percent', (case when 'sum_percent' > 0 then "#4ED469" when 'sum_percent' < 0 then "#ED3251" else "#7D98B3" end) as 'color',(case when 'sum_percent' < 0 then "▼" when 'sum_percent' > 0 then "▲" else "◄ ►"  end) as 'diff_arrow';",


$ sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v50.0/wave/dashboards/0FK3h0000001yCcGAI -m GET -f header.json  > user-ds-cv_dep-dashboards-2.json

$ sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v50.0/wave/dashboards/0FK3h000000FexZGAS -m GET -f header.json  > user-ds-cv_dep-dashboards-3.json
```
 
### for **activity** dataset 

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


$ sfdx mohanc:data:jq -i activity-ds-cv.json  -f '.dataset.id'
"0Fb3h0000008ryTCAQ"


