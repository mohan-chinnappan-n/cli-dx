## EA dashboard utils with DX

- Login
```
$ sfdx force:auth:web:login 
Successfully authorized mohan.chinnappan.n_ea2@gmail.com with org ID 00D3h000007R1LuEAK
You may now close the browser

# create header.json
sfdx mohanc:hello:myorg -u mohan.chinnappan.n_ea2@gmail.com  > header.json 

```
- Get the Id and version  for the dashboard you want to work with
```

# get all dashboards
$ sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/wave/dashboards -m GET   -f header.json > dashboards.json


# get name and currentVersionUrl
sfdx mohanc:data:jq -i  dashboards.json  -f  ' .dashboards[] | .name, .id'
"fruits_acct_db"
"0FK3h0000001zObGAI"
"Opportunity_Details"
"0FK3h0000001yCgGAI"
"fruits_db"
"0FK3h0000001zOWGAY"
"Opty1"
"0FK3h0000001yGkGAI"
"DTC_Sales_SAMPLE"
"0FK3h0000001yCfGAI"
"Regional_Sales_SAMPLE"
"0FK3h0000001yChGAI"
"Sales_Performance_with_Selectable_Measures_Trailhead"
"0FK3h0000001yCiGAI"
"The_Motivator_1"
"0FK3h0000001yCcGAI"
"The_Motivator_2"
"0FK3h0000001yCdGAI"
"Worldwide_Fundraising_Starter"
"0FK3h0000001yCeGAI"

```

- Get the details of the dashboard you want to view 
```
sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/wave/dashboards/0FK3h0000001zObGAI -m GET   -f header.json  > dashboard-1.json
```
- Query for  Label
```
$ sfdx mohanc:data:jq -i dashboard-1.json -f  '.label'
"fruits-acct-db"
```
- Query for query 

```
$ sfdx mohanc:data:jq -i dashboard-1.json -f  '.state.steps[].query.query'
"{&quot;values&quot;:[&quot;act&quot;,&quot;fruit&quot;,&quot;date_Year&quot;,&quot;date_Quarter&quot;,&quot;qty&quot;,&quot;date_day_epoch&quot;,&quot;date_sec_epoch&quot;]}"

# store in a file query.txt
$ sfdx mohanc:data:jq -i dashboard-1.json -f  '.state.steps[].query.query' > query.txt

# decode
$ cat query.txt |  sfdx mohanc:data:htmlDecode
"{"values":["act","fruit","date_Year","date_Quarter","qty","date_day_epoch","date_sec_epoch"]}"


## Other queries
```
$ sfdx mohanc:data:jq -i  ~/.ea/motivator-db.json  -f '.state.dataSourceLinks' 
```
```json
[
  {
    "fields": [
      {
        "dataSourceName": "user",
        "dataSourceNamespace": "",
        "dataSourceType": "dataset",
        "fieldName": "Role.RoleNames"
      },
      {
        "dataSourceName": "activity",
        "dataSourceNamespace": "",
        "dataSourceType": "dataset",
        "fieldName": "Owner.Role.RoleNames"
      }
    ],
    "label": "RoleNames",
    "name": "connection_rolenames"
  },
  {
    "fields": [
      {
        "dataSourceName": "user",
        "dataSourceNamespace": "",
        "dataSourceType": "dataset",
        "fieldName": "UniqueUserName"
      },
      {
        "dataSourceName": "activity",
        "dataSourceNamespace": "",
        "dataSourceType": "dataset",
        "fieldName": "Owner.UniqueUserName"
      }
    ],
    "label": "Unique User",
    "name": "connection_uniqueusername"
  },
  {
    "fields": [
      {
        "dataSourceName": "Days_Overdue_filter",
        "dataSourceType": "static",
        "fieldName": "overdue"
      },
      {
        "dataSourceName": "activity",
        "dataSourceNamespace": "",
        "dataSourceType": "dataset",
        "fieldName": "IsOverdue"
      }
    ],
    "label": "Overdue",
    "name": "connection_overdue"
  }
]
```
```
$ sfdx mohanc:data:jq -i  ~/.ea/motivator-db.json  -f '.state.dataSourceLinks[].fields' 
```
```json
[
  {
    "dataSourceName": "user",
    "dataSourceNamespace": "",
    "dataSourceType": "dataset",
    "fieldName": "Role.RoleNames"
  },
  {
    "dataSourceName": "activity",
    "dataSourceNamespace": "",
    "dataSourceType": "dataset",
    "fieldName": "Owner.Role.RoleNames"
  }
]
[
  {
    "dataSourceName": "user",
    "dataSourceNamespace": "",
    "dataSourceType": "dataset",
    "fieldName": "UniqueUserName"
  },
  {
    "dataSourceName": "activity",
    "dataSourceNamespace": "",
    "dataSourceType": "dataset",
    "fieldName": "Owner.UniqueUserName"
  }
]
[
  {
    "dataSourceName": "Days_Overdue_filter",
    "dataSourceType": "static",
    "fieldName": "overdue"
  },
  {
    "dataSourceName": "activity",
    "dataSourceNamespace": "",
    "dataSourceType": "dataset",
    "fieldName": "IsOverdue"
  }
]
```
```
$ sfdx mohanc:data:jq -i  ~/.ea/motivator-db.json  -f '.state.filters[]' 
```
```json
{
  "dataset": {
    "id": "0Fb3h0000008ryTCAQ",
    "name": "activity",
    "url": "/services/data/v50.0/wave/datasets/0Fb3h0000008ryTCAQ"
  },
  "dependent": false,
  "fields": [
    "Owner.Role.RoleNames"
  ],
  "label": "View As",
  "locked": false,
  "operator": "in"
}
{
  "dataset": {
    "id": "0Fb3h0000008ryTCAQ",
    "name": "activity",
    "url": "/services/data/v50.0/wave/datasets/0Fb3h0000008ryTCAQ"
  },
  "dependent": false,
  "fields": [
    "Owner.UniqueUserName"
  ],
  "label": "Activity Owner",
  "locked": false,
  "operator": "in"
}
{
  "dataset": {
    "id": "0Fb3h0000008ryTCAQ",
    "name": "activity",
    "url": "/services/data/v50.0/wave/datasets/0Fb3h0000008ryTCAQ"
  },
  "dependent": false,
  "fields": [
    "Account.Name"
  ],
  "label": "Account Name",
  "locked": false,
  "operator": "in"
}

$ sfdx mohanc:data:jq -i  ~/.ea/motivator-db.json  -f '.datasets[]' 
{
  "id": "0Fb3h0000008ryTCAQ",
  "label": "Activities",
  "name": "activity",
  "url": "/services/data/v50.0/wave/datasets/0Fb3h0000008ryTCAQ"
}
{
  "id": "0Fb3h0000008ryUCAQ",
  "label": "Users",
  "name": "user",
  "url": "/services/data/v50.0/wave/datasets/0Fb3h0000008ryUCAQ"
}

```
```
$ sfdx mohanc:data:jq -i  ~/.ea/motivator-db.json  -f '.state.filters[].dataset' 
{
  "id": "0Fb3h0000008ryTCAQ",
  "name": "activity",
  "url": "/services/data/v50.0/wave/datasets/0Fb3h0000008ryTCAQ"
}
{
  "id": "0Fb3h0000008ryTCAQ",
  "name": "activity",
  "url": "/services/data/v50.0/wave/datasets/0Fb3h0000008ryTCAQ"
}
{
  "id": "0Fb3h0000008ryTCAQ",
  "name": "activity",
  "url": "/services/data/v50.0/wave/datasets/0Fb3h0000008ryTCAQ"
}


$ sfdx mohanc:data:jq -i  ~/.ea/motivator-db.json  -f '.state.filters[].fields[]' 
"Owner.Role.RoleNames"
"Owner.UniqueUserName"
"Account.Name"

$ sfdx mohanc:data:jq -i  ~/.ea/motivator-db.json  -f '.state.widgets[].type'
"number"
"number"
"container"
"number"
"container"
"container"
"container"
"number"
"text"
"number"
"number"
"text"
"number"
"number"
"number"
"text"
"number"
"container"
"container"
"text"
"text"
"chart"
"text"
"chart"
"container"
"container"
"text"
"text"
"chart"
"text"
"text"
"text"
"number"
"filterpanel"
"filterpanel"
"number"
"number"
"number"
"number"
"number"
"container"
"chart"
"chart"
"number"
"number"
"number"
"number"
"listselector"
"table"
"pillbox"

$ sfdx mohanc:data:jq -i  ~/.ea/motivator-db.json  -f '.state.widgets[].parameters.step'
"complete_events"
"emails_normal_priority"
null
"emails_high_priority"
null
null
null
"team_comparison_total_activities"
null
"kpi_total_activites"
"all_1"
null
"team_comparison_overdue_activities"
"due_tasks"
"complete_tasks"
null
"due_events"
null
null
null
null
"TaskSubtype_1"
null
"kpi_events"
null
null
null
null
"kpi_calls_1"
null
null
null
"team_comparison_complete_activities"
null
null
"kpi_emails"
"kpi_completed_activites"
"kpi_overdue_activities"
"kpi_calls_1"
"kpi_total_activites"
null
"kpi_tasks"
"kpi_emails"
"outbound_calls"
"inbound_calls"
"kpi_tasks"
"kpi_events"
"Owner_UniqueUserName_1"
"table_Details"
"Days_Overdue_filter"

- [See how to see the fields - Dimensions and Measures in a dataset](./ea-dataset.md)
