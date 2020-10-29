# Dataset utils for EA

- Requires 0.0.77 version of the plugin
    - sfdx-mohanc-plugins@0.0.77
    - [How to install the plugin](https://mohan-chinnappan-n.github.io/dx/plugins.html#/1)


## List Datasets
```
$ sfdx mohanc:ea:dataset:list -u  mohan.chinnappan.n_ea2@gmail.com 
Id,Name,Label
0Fb3h0000008spECAQ,mycustomers,mycustomers
0Fb3h0000008ryVCAQ,DTC_Opportunity_SAMPLE,DTC Opportunity
0Fb3h0000008ryTCAQ,activity,Activities
0Fb3h0000008ryUCAQ,user,Users
0Fb3h0000005aojCAA,fieldusage_csvDataset,fieldusage_csvDataset
0Fb3h0000008zInCAI,sample_aDS,sample_aDS
0Fb3h0000008zIiCAI,sample_a536087_csvDataset,sample_a536087_csvDataset
0Fb3h0000008zIdCAI,a536087_csvDataset,a536087_csvDataset
0Fb3h0000005Yz0CAE,ea_s3_r,ea-s3-r
0Fb3h0000008zF5CAI,pgfu_csvDataset,pgfu_csvDataset
0Fb3h0000008zFPCAY,tmfu_csvDataset,tmfu_csvDataset
0Fb3h0000008s9uCAA,regFruitYield,regFruitYield
0Fb3h0000008s9kCAA,fruit_yield,fruit-yield
0Fb3h0000005ZvJCAU,oppty_csvDataset,oppty_csvDataset
0Fb3h0000008sAECAY,fruit_yield_acct,fruit-yield-acct
0Fb3h0000005aTZCAY,CityEA_csvDataset,CityEA_csvDataset
0Fb3h0000005ZoNCAU,fruitsdb_csvDataset,fruitsdb_csvDataset
0Fb3h0000005ZrHCAU,fruitsdbsfc_csvDataset,fruitsdbsfc_csvDataset
0Fb3h0000005ZnKCAU,fruits_csvDataset,fruits_csvDataset
0Fb3h0000005ZmqCAE,MyExternalDataset,MyExternalDataset
0Fb3h0000008ryhCAA,ABC_Seed_Opportunities,Fundraising Opportunities
0Fb3h0000008sotCAA,myfruits,myfruits
```
## Get the fields in the given dataset
```
$ sfdx mohanc:ea:dataset:fieldUsage -u  mohan.chinnappan.n_ea2@gmail.com -d DTC_Opportunity_SAMPLE
=== Looking at the dataset: DTC_Opportunity_SAMPLE ...
=== Looking at current version of the dataset: DTC_Opportunity_SAMPLE ...
"type","name","datasetName"
"dimension","Opportunity_Name","DTC_Opportunity_SAMPLE"
"dimension","Billing_State_Province","DTC_Opportunity_SAMPLE"
"dimension","Account_Type","DTC_Opportunity_SAMPLE"
"dimension","Account_Owner","DTC_Opportunity_SAMPLE"
"dimension","Product_Name","DTC_Opportunity_SAMPLE"
"dimension","Forecast_Category","DTC_Opportunity_SAMPLE"
"dimension","Opportunity_Owner","DTC_Opportunity_SAMPLE"
"dimension","Close_Date","DTC_Opportunity_SAMPLE"
"dimension","Close_Date_Year","DTC_Opportunity_SAMPLE"
"dimension","Close_Date_Quarter","DTC_Opportunity_SAMPLE"
"dimension","Close_Date_Month","DTC_Opportunity_SAMPLE"
"dimension","Close_Date_Week","DTC_Opportunity_SAMPLE"
"dimension","Close_Date_Day","DTC_Opportunity_SAMPLE"
"dimension","Close_Date_Hour","DTC_Opportunity_SAMPLE"
"dimension","Close_Date_Minute","DTC_Opportunity_SAMPLE"
"dimension","Close_Date_Second","DTC_Opportunity_SAMPLE"
"dimension","Segment","DTC_Opportunity_SAMPLE"
"dimension","Industry","DTC_Opportunity_SAMPLE"
"dimension","Opportunity_Source","DTC_Opportunity_SAMPLE"
"dimension","Product_Family","DTC_Opportunity_SAMPLE"
"dimension","Closed","DTC_Opportunity_SAMPLE"
"dimension","Billing_Country","DTC_Opportunity_SAMPLE"
"dimension","Won","DTC_Opportunity_SAMPLE"
"dimension","Owner_Role","DTC_Opportunity_SAMPLE"
"dimension","Stage","DTC_Opportunity_SAMPLE"
"dimension","Account_Name","DTC_Opportunity_SAMPLE"
"dimension","Opportunity_Type","DTC_Opportunity_SAMPLE"
"dimension","Created_Date","DTC_Opportunity_SAMPLE"
"dimension","Created_Date_Year","DTC_Opportunity_SAMPLE"
"dimension","Created_Date_Quarter","DTC_Opportunity_SAMPLE"
"dimension","Created_Date_Month","DTC_Opportunity_SAMPLE"
"dimension","Created_Date_Week","DTC_Opportunity_SAMPLE"
"dimension","Created_Date_Day","DTC_Opportunity_SAMPLE"
"dimension","Created_Date_Hour","DTC_Opportunity_SAMPLE"
"dimension","Created_Date_Minute","DTC_Opportunity_SAMPLE"
"dimension","Created_Date_Second","DTC_Opportunity_SAMPLE"
"measure","Amount","DTC_Opportunity_SAMPLE"
"measure","Close_Date_day_epoch","DTC_Opportunity_SAMPLE"
"measure","Close_Date_sec_epoch","DTC_Opportunity_SAMPLE"
"measure","Column1","DTC_Opportunity_SAMPLE"
"measure","Created_Date_day_epoch","DTC_Opportunity_SAMPLE"
...
```
