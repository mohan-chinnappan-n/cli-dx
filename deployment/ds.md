# How to check the deployment status using DX?

## Query SOQL

``` 
cat  ~/.soql/depolymentStatus.soql
```
 
```sql

SELECT
Id
,IsDeleted
,CreatedDate
,CreatedById
,LastModifiedDate
,LastModifiedById
,SystemModstamp
,NumberComponentsDeployed
,NumberComponentErrors
,NumberComponentsTotal
,NumberTestsCompleted
,NumberTestErrors
,NumberTestsTotal
,CheckOnly
,IgnoreWarnings
,RollbackOnError
,Type
,StartDate
,CompletedDate
,CanceledById
,RunTestsEnabled
,ChangeSetName
,ErrorStatusCode
,Status
,StateDetail
,ErrorMessage
,AllowMissingFiles
,AutoUpdatePackage
,PurgeOnDelete
,SinglePackage
,TestLevel

FROM DeployRequest 
ORDER BY CompletedDate

```
## JSON output

```
sfdx mohanc:tooling:query -q ~/.soql/depolymentStatus.soql -u mohan.chinnappan.n_ea2@gmail.com -f json > depolymentStatus.json

```
- [depolymentStatus.json](./depolymentStatus.json)

## CSV output

```
sfdx mohanc:tooling:query -q ~/.soql/depolymentStatus.soql -u mohan.chinnappan.n_ea2@gmail.com -f csv > depolymentStatus.csv 

```
- [depolymentStatus.csv](./depolymentStatus.csv)







