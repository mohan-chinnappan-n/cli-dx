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

