## How to run sharing debugger for the  given user ?

- Chrome Extension version 
![sd](img/sd-1.png)

- Planning to port Chrome Extension version to DX ( Work-in-progress)
- Requires 0.0.54 version of the plugin
    - sfdx-mohanc-plugins@0.0.54
    - [How to install the plugin](https://mohan-chinnappan-n.github.io/dx/plugins.html#/1)


- Login using  sfdx force:auth:web:login 
### Usge
```
$ sfdx mohanc:sharing:debug -h
Run Sharing Debugger on the given org for the given user

USAGE
  $ sfdx mohanc:sharing:debug

OPTIONS
  -e, --email=email                                User Email Id
  -u, --targetusername=targetusername              username or alias for the target org; overrides default target org
  -v, --targetdevhubusername=targetdevhubusername  username or alias for the dev hub org; overrides default dev hub org
  --apiversion=apiversion                          override the api version used for api requests made by this command
  --json                                           format output as json
  --loglevel=(trace|debug|info|warn|error|fatal)   logging level for this command invocation

EXAMPLE

       ** Run Sharing Debugger on the given org for the given user **

       USAGE
       sfdx mohanc:sharing:debug -u <username> -e <UserEmailId> 

```
### Demo
```
$ sfdx mohanc:sharing:debug -u mohan.chinnappan.n_ea2@gmail.com -e mohan.chinnappan.n@gmail.com
____________Profile____________
profileId : 00e3h000001kqJMAAY
____________Permissions____________
"Id","Name","PermissionsViewAllData","PermissionsModifyAllData","PermissionsManageDataIntegrations"
"00e3h000001kqJMAAY","System Administrator",true,true,true
____________PermSets____________
"Id","Label","PermissionsViewAllData","PermissionsModifyAllData","PermissionsManageDataIntegrations"
"0PS3h000002PwNZGA0","00ex00000018ozh_128_09_04_12_1",true,true,true
```

### Listing share sObjects
```
$ sfdx mohanc:ws:rest -f header_ea.json -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/sobjects -m GET  >  sobjects.json 

# sObjects with name ending with Share
$ sfdx mohanc:data:jq -i sobjects.json -f '.sobjects[].name | select ( contains("Share")  )'
"AccountBrandShare"
"AccountShare"
"AcquiredAccount__Share"
"AssetShare"
"AuthorizationFormConsentShare"
"AuthorizationFormDataUseShare"
"AuthorizationFormShare"
"CalendarViewShare"
"CampaignShare"
"CaseShare"
"ChannelProgramLevelShare"
"ChannelProgramMemberShare"
"ChannelProgramShare"
"CommSubscriptionChannelTypeShare"
"CommSubscriptionConsentShare"
"CommSubscriptionShare"
"ConsumptionScheduleShare"
"ContactPointAddressShare"
"ContactPointConsentShare"
"ContactPointEmailShare"
"ContactPointPhoneShare"
"ContactPointTypeConsentShare"
"ContactRequestShare"
"ContactShare"
"DataUseLegalBasisShare"
"DataUsePurposeShare"
"EngagementChannelTypeShare"
"ExternalEventMappingShare"
"FlowInterviewLogShare"
"FlowInterviewShare"
"ImageShare"
"IndividualShare"
"LeadShare"
"ListEmailShare"
"MacroShare"
"MacroUsageShare"
"MyFilter__Share"
"OpportunityHistory__Share"
"OpportunityShare"
"OrderShare"
"OrgDeleteRequestShare"
"PartnerFundAllocationShare"
"PartnerFundClaimShare"
"PartnerFundRequestShare"
"PartnerMarketingBudgetShare"
"PartyConsentShare"
"PromptActionShare"
"QuickTextShare"
"QuickTextUsageShare"
"StreamingChannelShare"
"TodayGoalShare"
"UserAppMenuCustomizationShare"
"UserEmailPreferredPersonShare"
"UserProvisioningRequestShare"
"UserShare"


# __Share sObjects
$  sfdx mohanc:data:jq -i sobjects.json -f '.sobjects[].name | select ( contains("__Share")  )'
"AcquiredAccount__Share"
"MyFilter__Share"
"OpportunityHistory__Share"


```
### Querying the AccountShare
```
$ sfdx mohanc:data:query -q accountShare.soql -u mohan.chinnappan.n_ea2@gmail.com   | sed -e 's/""/"/g' | sed -e 's/"//g'
attributes,Id,AccountId,UserOrGroupId,AccountAccessLevel,ContactAccessLevel,OpportunityAccessLevel,CaseAccessLevel
{type:AccountShare,url:/services/data/v49.0/sobjects/AccountShare/00r3h00000gJvnMAAS},00r3h00000gJvnMAAS,0013h00000FffwFAAR,00G3h000001rhfAEAQ,Read,Read,None,None
{type:AccountShare,url:/services/data/v49.0/sobjects/AccountShare/00r3h00000gJvnDAAS},00r3h00000gJvnDAAS,0013h00000FffwMAAR,00G3h000001rhfAEAQ,Read,Read,None,None
{type:AccountShare,url:/services/data/v49.0/sobjects/AccountShare/00r3h00000gJvryAAC},00r3h00000gJvryAAC,0013h00000FffwVAAR,00G3h000001rhfAEAQ,Read,Read,None,None
...

$ cat accountShare.soql
SELECT Id, AccountId, UserOrGroupId, 
AccountAccessLevel,
ContactAccessLevel,
OpportunityAccessLevel,
CaseAccessLevel

FROM AccountShare





```
