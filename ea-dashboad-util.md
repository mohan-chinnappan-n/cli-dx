# EA Dashboard Utils

- Requires 0.0.84 version of the plugin
    - sfdx-mohanc-plugins@0.0.84
    - [How to install the plugin](https://mohan-chinnappan-n.github.io/dx/plugins.html#/1)



## How to find out a given field is used in the dashboard?

```
# Usage
$  sfdx mohanc:ea:dashboard:field:inUse  -h
Finds out the given field is used in the given dashboard

USAGE
  $ sfdx mohanc:ea:dashboard:field:inUse

OPTIONS
  -d, --dashboardname=dashboardname               Dashboard name to analyzed
  -f, --fieldname=fieldname                       Field  name to search

  -u, --targetusername=targetusername             username or alias for the target org; overrides default target 
                                                  org

  --apiversion=apiversion                         override the api version used for api requests made by this 
                                                  command

  --json                                          format output as json

  --loglevel=(trace|debug|info|warn|error|fatal)  logging level for this command invocation

EXAMPLE

              Checks the given field is used in the given dashboard
              sfdx mohanc:ea:dashboard:field:inUse  -u <username> -d <dashboardName> -f <fieldName>

              Note: You can use this command to see the list of dashboards in the org:
              sfdx mohanc:ea:dashboard:list  -u <username>

```
$ sfdx mohanc:ea:dashboard:list  -u mohan.chinnappan.n_ea2@gmail.com Id,Name,Label
0FK3h0000001yCcGAI,The_Motivator_1,The Motivator 1 <------------
0FK3h0000001yCdGAI,The_Motivator_2,The Motivator 2
0FK3h000000FexZGAS,New_dashboard1,New dashboard
0FK3h0000001yGkGAI,Opty1,Opty1
0FK3h000000Ff2QGAS,FieldUsage,FieldUsage
0FK3h0000001yCfGAI,DTC_Sales_SAMPLE,DTC Sales
0FK3h0000001yCgGAI,Opportunity_Details,Opportunity Details
0FK3h000000Ff2VGAS,Field_Usage_for_Dataflow_The_Motivator,Field Usage for Dataflow  - The_Motivator
0FK3h000000FexFGAS,New_dashboard,New dashboard
0FK3h000000Fel3GAC,User_Details,User Details
0FK3h0000001zObGAI,fruits_acct_db,fruits-acct-db
0FK3h0000001zOWGAY,fruits_db,fruits-db
0FK3h0000001yChGAI,Regional_Sales_SAMPLE,Regional Sales
0FK3h0000001yCiGAI,Sales_Performance_with_Selectable_Measures_Trailhead,Sales Performance with Selectable Measures
0FK3h0000001yCeGAI,Worldwide_Fundraising_Starter,Worldwide Fundraising - Starter

$  sfdx mohanc:ea:dashboard:field:inUse  -u mohan.chinnappan.n_ea2@gmail.com -d 0FK3h0000001yCcGAI -f Owner.UniqueUserName
=== Looking at steps in the dashboard: 0FK3h0000001yCcGAI ...
{ item: 'steps', field: 'Owner.UniqueUserName', inUse: true }

$  sfdx mohanc:ea:dashboard:field:inUse  -u mohan.chinnappan.n_ea2@gmail.com -d 0FK3h0000001yCcGAI -f Oppty.Name 
=== Looking at steps in the dashboard: 0FK3h0000001yCcGAI ...
{ item: 'steps', field: 'Oppty.Name', inUse: false }

```

