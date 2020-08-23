## EA dataset utils with DX

- Login
```
$ sfdx force:auth:web:login 
Successfully authorized mohan.chinnappan.n_ea2@gmail.com with org ID 00D3h000007R1LuEAK
You may now close the browser

# create header.json
sfdx mohanc:hello:myorg -u mohan.chinnappan.n_ea2@gmail.com  > header.json 

```
- Get the Id and version  for the dataset you want to work with
```

# get all datasets
$ sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/wave/datasets -m GET   -f header.json > datasets.json


# get name and currentVersionUrl
$ sfdx mohanc:data:jq -i ./datasets.json  -f ".datasets[] | .name, .currentVersionUrl"
"fruit_yield_acct"
"/services/data/v49.0/wave/datasets/0Fb3h0000008sAECAY/versions/0Fc3h0000026QMACA2"
"mycustomers"
"/services/data/v49.0/wave/datasets/0Fb3h0000008spECAQ/versions/0Fc3h0000026e3aCAA"
"DTC_Opportunity_SAMPLE"
"/services/data/v49.0/wave/datasets/0Fb3h0000008ryVCAQ/versions/0Fc3h0000026KlGCAU"
"activity"
"/services/data/v49.0/wave/datasets/0Fb3h0000008ryTCAQ/versions/0Fc3h0000026KlECAU"
"myfruits"
"/services/data/v49.0/wave/datasets/0Fb3h0000008sotCAA/versions/0Fc3h0000026d2LCAQ"
"fruit_yield"
"/services/data/v49.0/wave/datasets/0Fb3h0000008s9kCAA/versions/0Fc3h0000026QBWCA2"
"regFruitYield"
null
"ABC_Seed_Opportunities"
"/services/data/v49.0/wave/datasets/0Fb3h0000008ryhCAA/versions/0Fc3h0000026KlSCAU"
"user"
"/services/data/v49.0/wave/datasets/0Fb3h0000008ryUCAQ/versions/0Fc3h0000026KlFCAU"


```

- Get securityCoverageUrl for the given dataset in EA for the dataset: *mycustomers*
```
$ sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/wave/datasets/0Fb3h0000008spECAQ/versions/0Fc3h0000026e3aCAA -m GET   -f header.json > dataset-1.json

```
- Query for Measures and Dimensions
```

$ sfdx mohanc:data:jq -i ./dataset-1.json  -f '.xmdMain.dimensions[].field'
"dob"
"dob_Year"
"dob_Quarter"
"dob_Month"
"dob_Week"
"dob_Day"
"dob_Hour"
"dob_Minute"
"dob_Second"
"name"
```
- Query for Measures 
```
$ sfdx mohanc:data:jq -i ./dataset-1.json  -f '.xmdMain.measures[].field'
"amt1"
"dob_day_epoch"
"dob_sec_epoch"
"amt2"
"seq"

```

- Query for Total Rows 
```
$ sfdx mohanc:data:jq -i ./dataset-1.json  -f '.totalRows'
2009

```


