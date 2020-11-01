# Dataflow  utils for EA

- Requires 0.0.83 version of the plugin
    - sfdx-mohanc-plugins@0.0.83
    - [How to install the plugin](https://mohan-chinnappan-n.github.io/dx/plugins.html#/1)


## List Dataflows 
```
# Usage
$  sfdx mohanc:ea:dataflow:list  -h
Lists Dataflows  

USAGE
  $ sfdx mohanc:ea:dataflow:list

OPTIONS
  -u, --targetusername=targetusername             username or alias for the target org; overrides default target org
  --apiversion=apiversion                         override the api version used for api requests made by this command
  --json                                          format output as json
  --loglevel=(trace|debug|info|warn|error|fatal)  logging level for this command invocation

EXAMPLE

              List Dataflows
              sfdx mohanc:ea:dataflow:list  -u <username> 

```

```
$  sfdx mohanc:ea:dataflow:list  -u mohan.chinnappan.n_ea2@gmail.com 
Id,Label
02K3h000000Mu1oEAC,exportOppty2
02K3h000000Mu0vEAC,exportOppty
02K3h000000MtyuEAC,ExportCustomers
02K3h000000MrxWEAS,fruitsdf
02K3h000000Mr7JEAS,The_Motivator <----------
02K3h000000Mr7KEAS,Default Salesforce Dataflow
```
## Get the fieldSource in the given dataflow
```
$  sfdx mohanc:ea:dataflow:fieldSource  -h
Get Field Source Info for the given dataflow

USAGE
  $ sfdx mohanc:ea:dataflow:fieldSource

OPTIONS
  -d, --dataflowid=dataflowid                     Dashboard name to analyzed
  -u, --targetusername=targetusername             username or alias for the target org; overrides default target org
  --apiversion=apiversion                         override the api version used for api requests made by this command
  --json                                          format output as json
  --loglevel=(trace|debug|info|warn|error|fatal)  logging level for this command invocation

EXAMPLE

              Get Field Source data for the given dataflow
              sfdx mohanc:ea:dataflow:fieldSource  -u <username> -d <dataflowId>

              Creates output in csv file :
              --------------------------------------------------
              NOTE:
              Use:
              sfdx mohanc:ea:dataflow:list  -u <username>
              to list the dataflows in the org


```

```
$  sfdx mohanc:ea:dataflow:fieldSource  -u mohan.chinnappan.n_ea2@gmail.com -d 02K3h000000Mr7JEAS
=== Looking at the dataflow: 02K3h000000Mr7JEAS, The_Motivator ...
=== Looking at the sfdcDigest nodes of the dataflow ...
_________________________________________________
=== Looking at Opportunity ...
=== Looking at Task ...
=== Looking at User ...
=== Looking at Account ...
=== Looking at UserRole ...
=== Looking at Event ...
=== Looking at the augment nodes of the dataflow ...
_________________________________________________
=== Looking at the append nodes of the dataflow ...
_________________________________________________
=== Looking at the flatten nodes of the dataflow ...
_________________________________________________
=== Looking at the computeExpression nodes of the dataflow ...
_________________________________________________
=== Looking at the dataset: user ...
=== Looking at current version of the dataset: user ...
=== Looking at the dataset: activity ...
=== Looking at current version of the dataset: activity ...
_________________________________________________
Writing output file in:   02K3h000000Mr7JEAS.fs.csv 

```
```
$ head 02K3h000000Mr7JEAS.fs.csv 
"type","name","dataflowName","datasetName","source"
"dimension","Role.RoleNames","The_Motivator","user","augment.Join_ActivityOwner"
"dimension","UniqueUserName","The_Motivator","user","augment.Join_ActivityOwner_Product_Opp_User|augment.Join_ActivityOwner|computeExpression.Compute_Manager_Unique"
"dimension","UserRoleId","The_Motivator","user","sfdcDigest.Extract_User|augment.Join_ActivityOwner"
"dimension","IsActive","The_Motivator","user","sfdcDigest.Extract_User"
"dimension","Role.ParentRoleId","The_Motivator","user","augment.Join_ActivityOwner"
"dimension","Role.RolePath","The_Motivator","user","augment.Join_ActivityOwner"
"dimension","Name","The_Motivator","user","sfdcDigest.Extract_Opportunity|sfdcDigest.Extract_User|sfdcDigest.Extract_Account|sfdcDigest.Extract_UserRole|augment.Join_ActivityOwner_Product_Opp_User|augment.Join_ActivityOwner_Product_Opp_User_Account|augment.Join_ActivityOwner_Product_Opp|augment.Augment_ParentName|augment.Join_ActivityOwner|augment.User_with_Roles|augment.User_with_Roles_with_Opportunities"
"dimension","Opportunity.Name","The_Motivator","user",
"dimension","Role.DeveloperName","The_Motivator","user","augment.Join_ActivityOwner"

```
