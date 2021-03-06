# Data util commands

## Topics
- [Split](#split)
- [Head](#head)
- [Sample Data Generator](#fake)
- [Load Sample Data Generated into EA](#eaload)

<a name='split'></a>
## Split the given data file into multiple files based on given field (dimension)

## Usage (requires plugin version 0.0.91)
```
$ sfdx mohanc:data:util:split -h
Split the given data file into multiple files based on given field (dimension)

USAGE
  $ sfdx mohanc:data:util:split

OPTIONS
  -d, --dlim=dlim                                 CSV field delimiter: default: ','
  -f, --dim=dim                                   Filter field for splitting
  -i, --inputfilename=inputfilename               Input Data file in CSV format you want to do the splitting
  --json                                          format output as json
  --loglevel=(trace|debug|info|warn|error|fatal)  logging level for this command invocation

EXAMPLE

       ** Split the given data file into multiple files based on given field (dimension) **
       sfdx mohanc:data:split -i <Input CSV file> -f '<Split field>' -d <CSV field delimiter: default is ','>
       Example:
       sfdx mohanc:data:split -i largeData.csv -f Region -d ','
    



```

## Demo
```
$ cat ~/.ea/pgfu.csv 
"type","name","dataflowName","datasetName","dashboardName","lensName","InSecurityPredicate","usageCount","inUse"
"dimension","OpportunityId.Name","Playground","Product_Opportunities",,,false,0,false
"dimension","OpportunityId","Playground","Product_Opportunities",,,false,0,false
"dimension","Id","Playground","Product_Opportunities","Map_Toggle_Complete",,false,3,true
"dimension","Name","Playground","Product_Opportunities","Map_Toggle_Complete",,false,3,true
"dimension","Item","Playground","NewRetail",,,false,0,false
"dimension","Store","Playground","NewRetail",,,false,0,false
"dimension","Promotion","Playground","NewRetail",,,false,0,false
"dimension","DateNew","Playground","NewRetail",,,false,0,false
"dimension","DateNew_Year","Playground","NewRetail",,,false,0,false
"dimension","DateNew_Quarter","Playground","NewRetail",,,false,0,false
"dimension","DateNew_Month","Playground","NewRetail",,,false,0,false
"dimension","DateNew_Week","Playground","NewRetail",,,false,0,false
"dimension","DateNew_Day","Playground","NewRetail",,,false,0,false
"dimension","DateNew_Hour","Playground","NewRetail",,,false,0,false
"dimension","DateNew_Minute","Playground","NewRetail",,,false,0,false
"dimension","DateNew_Second","Playground","NewRetail",,,false,0,false
"dimension","Date","Playground","NewRetail","Map_Toggle_Complete",,false,3,true
"dimension","Date_Year","Playground","NewRetail","test",,false,1,true
"dimension","Date_Quarter","Playground","NewRetail",,,false,0,false
"dimension","Date_Month","Playground","NewRetail","test",,false,1,true
"dimension","Date_Week","Playground","NewRetail",,,false,0,false
"dimension","Date_Day","Playground","NewRetail","test",,false,1,true
"dimension","Date_Hour","Playground","NewRetail",,,false,0,false
"dimension","Date_Minute","Playground","NewRetail",,,false,0,false
"dimension","Date_Second","Playground","NewRetail",,,false,0,false
"dimension","AccountId","Playground","Oppty","Map_Toggle_Complete",,false,3,true
"dimension","AccountId.BillingCountry","Playground","Oppty","Map_Toggle_Complete",,false,2,true
"dimension","OwnerId.Name","Playground","Oppty",,,false,0,false
"dimension","StageName","Playground","Oppty","test",,false,1,true
"dimension","AccountId.BillingState","Playground","Oppty","Map_Toggle_Complete",,false,2,true
"dimension","IsClosed","Playground","Oppty",,,false,0,false
"dimension","CloseDate","Playground","Oppty","test",,false,1,true
"dimension","CloseDate_Year","Playground","Oppty","test",,false,1,true
"dimension","CloseDate_Quarter","Playground","Oppty",,,false,0,false
"dimension","CloseDate_Month","Playground","Oppty","test",,false,1,true
"dimension","CloseDate_Week","Playground","Oppty",,,false,0,false
"dimension","CloseDate_Day","Playground","Oppty","test",,false,1,true
"dimension","CloseDate_Hour","Playground","Oppty",,,false,0,false
"dimension","CloseDate_Minute","Playground","Oppty",,,false,0,false
"dimension","CloseDate_Second","Playground","Oppty",,,false,0,false
"dimension","Name","Playground","Oppty","Map_Toggle_Complete",,false,3,true
"dimension","Type","Playground","Oppty","Map_Toggle_Complete",,false,3,true
"dimension","AccountId.Type","Playground","Oppty","test",,false,1,true
"dimension","OwnerId","Playground","Oppty",,,false,0,false
"dimension","AccountId.Industry","Playground","Oppty","test",,false,1,true
"dimension","CreatedDate","Playground","Oppty",,,false,0,false
"dimension","CreatedDate_Year","Playground","Oppty",,,false,0,false
"dimension","CreatedDate_Quarter","Playground","Oppty",,,false,0,false
"dimension","CreatedDate_Month","Playground","Oppty",,,false,0,false
"dimension","CreatedDate_Week","Playground","Oppty",,,false,0,false
"dimension","CreatedDate_Day","Playground","Oppty",,,false,0,false
"dimension","CreatedDate_Hour","Playground","Oppty",,,false,0,false
"dimension","CreatedDate_Minute","Playground","Oppty",,,false,0,false
"dimension","CreatedDate_Second","Playground","Oppty",,,false,0,false
"dimension","Id","Playground","Oppty","Map_Toggle_Complete",,false,3,true
"measure","Quantity","Playground","Product_Opportunities",,,false,0,false
"measure","Discount","Playground","NewRetail",,,false,0,false
"measure","DailyQuantity","Playground","NewRetail",,,false,0,false
"measure","DateNew_day_epoch","Playground","NewRetail",,,false,0,false
"measure","DateNew_sec_epoch","Playground","NewRetail",,,false,0,false
"measure","Date_day_epoch","Playground","NewRetail",,,false,0,false
"measure","Date_sec_epoch","Playground","NewRetail",,,false,0,false
"measure","Amount","Playground","Oppty","Map_Toggle_Complete",,false,3,true
"measure","CloseDate_day_epoch","Playground","Oppty",,,false,0,false
"measure","CloseDate_sec_epoch","Playground","Oppty",,,false,0,false
"measure","CreatedDate_day_epoch","Playground","Oppty",,,false,0,false
"measure","CreatedDate_sec_epoch","Playground","Oppty",,,false,0,false
```

```
$ sfdx mohanc:data:util:split -i ~/.ea/pgfu.csv -f type -d ','
/Users/mchinnappan/.ea/pgfu.csv type ,
=== Writing data-dimension.csv ...
=== Writing data-measure.csv ...

```

```
$ cat data-measure.csv

type,name,dataflowName,datasetName,dashboardName,lensName,InSecurityPredicate,usageCount,inUse
measure,Quantity,Playground,Product_Opportunities,,,false,0,false
measure,Discount,Playground,NewRetail,,,false,0,false
measure,DailyQuantity,Playground,NewRetail,,,false,0,false
measure,DateNew_day_epoch,Playground,NewRetail,,,false,0,false
measure,DateNew_sec_epoch,Playground,NewRetail,,,false,0,false
measure,Date_day_epoch,Playground,NewRetail,,,false,0,false
measure,Date_sec_epoch,Playground,NewRetail,,,false,0,false
measure,Amount,Playground,Oppty,Map_Toggle_Complete,,false,3,true
measure,CloseDate_day_epoch,Playground,Oppty,,,false,0,false
measure,CloseDate_sec_epoch,Playground,Oppty,,,false,0,false
measure,CreatedDate_day_epoch,Playground,Oppty,,,false,0,false
measure,CreatedDate_sec_epoch,Playground,Oppty,,,false,0,false
```

``` 
$ cat data-dimension.csv 

type,name,dataflowName,datasetName,dashboardName,lensName,InSecurityPredicate,usageCount,inUse
dimension,OpportunityId.Name,Playground,Product_Opportunities,,,false,0,false
dimension,OpportunityId,Playground,Product_Opportunities,,,false,0,false
dimension,Id,Playground,Product_Opportunities,Map_Toggle_Complete,,false,3,true
dimension,Name,Playground,Product_Opportunities,Map_Toggle_Complete,,false,3,true
dimension,Item,Playground,NewRetail,,,false,0,false
dimension,Store,Playground,NewRetail,,,false,0,false
dimension,Promotion,Playground,NewRetail,,,false,0,false
dimension,DateNew,Playground,NewRetail,,,false,0,false
dimension,DateNew_Year,Playground,NewRetail,,,false,0,false
dimension,DateNew_Quarter,Playground,NewRetail,,,false,0,false
dimension,DateNew_Month,Playground,NewRetail,,,false,0,false
dimension,CreatedDate_Second,Playground,Oppty,,,false,0,false
dimension,Id,Playground,Oppty,Map_Toggle_Complete,,false,3,true
...
```

<a name='head'></a>
## How get the few rows of the  given CSV file
### Usage
```
$ sfdx mohanc:data:util:head  -h  
Get first few rows of the given csv file

USAGE
  $ sfdx mohanc:data:util:head

OPTIONS
  -d, --dlim=dlim                                 CSV field delimiter: default: ','
  -i, --inputfilename=inputfilename               Input Data file in CSV format
  -n, --ncount=ncount                             Number of lines/records to get
  --json                                          format output as json
  --loglevel=(trace|debug|info|warn|error|fatal)  logging level for this command invocation

EXAMPLE

       ** Get first few rows of the given csv file **
       sfdx mohanc:data:head -i <Input CSV file> -n <line count> -d <CSV field delimiter: default is ','>
    
```

### Demo
```
$ sfdx mohanc:data:util:head  -i ~/.ea/pgfu.csv -n 5 -d ','  
```
```
"type","name","dataflowName","datasetName","dashboardName","lensName","InSecurityPredicate","usageCount","inUse"
"dimension","OpportunityId.Name","Playground","Product_Opportunities","","","false","0","false"
"dimension","OpportunityId","Playground","Product_Opportunities","","","false","0","false"
"dimension","Id","Playground","Product_Opportunities","Map_Toggle_Complete","","false","3","true"
"dimension","Name","Playground","Product_Opportunities","Map_Toggle_Complete","","false","3","true"
"dimension","Item","Playground","NewRetail","","","false","0","false"
```

<a name='fake'></a>

## Usage
```
 sfdx mohanc:data:util:gen:fake -h
Fake Data Generator

USAGE
  $ sfdx mohanc:data:util:gen:fake

OPTIONS
  -d, --dataspec=dataspec                         Data Spec in JSON
  -n, --count=count                               Number of records to create
  --json                                          format output as json
  --loglevel=(trace|debug|info|warn|error|fatal)  logging level for this command invocation

EXAMPLE

       ** Fake Data Generator **
       sfdx mohanc:data:gen:fake -d <Data Spec JSON> -n <Count of records>
```

## Demo

```
$ cat ~/.ea/DataSpec.json

```
```json

{
    "phone": [
        "phoneNumber"
    ],
    "name": [
        "firstName"
    ],
    "address": [
        "city"
    ],
    "company": [
        "companyName"
    ],
    "finance": [
        "account"
    ]
}
```
- [ Data Spec fields spec](https://github.com/marak/Faker.js/)

```
$  sfdx mohanc:data:util:gen:fake -d ~/.ea/dataSpec.json -n 5
phone,name,address,company,finance
411-853-5139 x18753,Weston,Bennettmouth,Jakubowski Inc,81159937
(319) 814-7304 x0512,Marilie,Port Elinorstad,Rodriguez and Sons,76187083
887.495.8534 x648,Genevieve,Port Trinityborough,Adams Inc,48837685
1-656-306-5780 x8402,Ellis,Hesselview,Greenfelder Inc,59406342
951.448.7119,Linda,New Nellieborough,Spencer, Lang and Hagenes,79280748
```

<a name="eaload"></a>
## Loading into EA
```
#  Generate 10K records
$ sfdx mohanc:data:util:gen:fake -d ~/.ea/dataSpec.json -n 10000 > ~/.ea/sampleData.csv
```
```
$ sfdx mohanc:ea:dataset:loadLarge  -u mohan.chinnappan.n_ea2@gmail.com -d ~/.ea/sampleData.csv -c 2 -a SampleData
=== Finding the data types based on the sample data ...

[ 'phone', 'name', 'address', 'company', 'finance' ]
[
  '(783) 293-1737 x6657',
  'Sage',
  'North Rheaberg',
  'Schimmel and Sons',
  '48336191'
]
[
  {
    fullyQualifiedName: 'SampleData1.phone',
    label: 'phone',
    name: 'phone',
    isSystemField: false,
    isUniqueId: false,
    isMultiValue: false,
    multiValueSeparator: 'null',
    type: 'Text'
  },
  {
    fullyQualifiedName: 'SampleData1.name',
    label: 'name',
    name: 'name',
    isSystemField: false,
    isUniqueId: false,
    isMultiValue: false,
    multiValueSeparator: 'null',
    type: 'Text'
  },
  {
    fullyQualifiedName: 'SampleData1.address',
    label: 'address',
    name: 'address',
    isSystemField: false,
    isUniqueId: false,
    isMultiValue: false,
    multiValueSeparator: 'null',
    type: 'Text'
  },
  {
    fullyQualifiedName: 'SampleData1.company',
    label: 'company',
    name: 'company',
    isSystemField: false,
    isUniqueId: false,
    isMultiValue: false,
    multiValueSeparator: 'null',
    type: 'Text'
  },
  {
    fullyQualifiedName: 'SampleData1.finance',
    label: 'finance',
    name: 'finance',
    isSystemField: false,
    isUniqueId: false,
    type: 'Numeric',
    defaultValue: '0',
    precision: 18,
    scale: 0
  }
]
=== Preparing for the loading chunkSize: 2097152 ...
{ id: '06V3h000000DgppEAC', success: true, errors: [] }
=== Loading part 1 of size: 1013468 ...
=== Loading Complete.
Going to process...

Done.
open https://mohansun-ea-02-dev-ed.my.salesforce.com/analytics/dataManager in a web browser to view this job
```

### EA Dataflow Monitoring 
![Loaded 1](util-img/ea-load-1.png)
![Loaded 2](util-img/ea-load-2.png)
![Loaded 3](util-img/ea-load-3.png)
