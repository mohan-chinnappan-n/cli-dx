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

```
- [See how to see the fields - Dimensions and Measures in a dataset](./ea-dataset.md)
