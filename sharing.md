## How to run sharing debugger for the  given user ?

- Chrome Extension version 
![sd](img/sd-1.png)

### Demo
![sd-demo](img/sd-2.gif)

- [FAQ](#faq)


### Plans
- Planning to port Chrome Extension version to DX ( Work-in-progress)
- Requires 0.0.144 version of the plugin
    - sfdx-mohanc-plugins@0.0.144
    - [How to install the plugin](https://mohan-chinnappan-n.github.io/dx/plugins.html#/1)

![viz-1](img/userInfo.svg)

- Login using  sfdx force:auth:web:login 
### Usage
```
$ sfdx mohanc:sharing:debug -h
Run Sharing Debugger on the given org for the given user

USAGE
  $ sfdx mohanc:sharing:debug

Run Sharing Debugger on the given org for the given user

USAGE
  $ sfdx mohanc:sharing:debug

OPTIONS
  -n, --username=username                          User Name to Debug
  -u, --targetusername=targetusername              username or alias for the target org; overrides default target org
  -v, --targetdevhubusername=targetdevhubusername  username or alias for the dev hub org; overrides default dev hub org
  --apiversion=apiversion                          override the api version used for api requests made by this command
  --json                                           format output as json
  --loglevel=(trace|debug|info|warn|error|fatal)   logging level for this command invocation

EXAMPLE

       ** Run Sharing Debugger on the given org for the given user **

       USAGE
       sfdx mohanc:sharing:debug -u <username>  -n <userNameToDebug>

       writes userInfo.json and userInfo.svg files in the current directory

       -----------
    

```
### Demo
```
$ sfdx mohanc:sharing:debug -u mohan.chinnappan.n_ea2@gmail.com -n mohan.chinnappan.n_ea2@gmail.com
____________Profile____________
profileId : 00e3h000001kqJMAAY
____________Permissions____________
"Id","Name","PermissionsViewAllData","PermissionsModifyAllData","PermissionsManageDataIntegrations"
"00e3h000001kqJMAAY","System Administrator",true,true,true
____________PermSets____________
"Id","Label","PermissionsViewAllData","PermissionsModifyAllData","PermissionsManageDataIntegrations"
"0PS3h000002PwNZGA0","00ex00000018ozh_128_09_04_12_1",true,true,true
____________AccountShare____________
"Id","AccountId","AccountAccessLevel","OpportunityAccessLevel","CaseAccessLevel","ContactAccessLevel","RowCause"
"00r3h000033f9xzAAA","0013h00000FfgCMAAZ","All","Edit","Edit","Edit","Owner"
"00r3h000033fA4bAAE","0013h00000FfgCNAAZ","All","Edit","Edit","Edit","Owner"
____________OpportunityShare____________
=== None found ===
```

<a name='faq'></a>

### FAQ
- Why this user has access to this Account record, as per org security settings, this user should not have access to?
![Why this access](sharing/img/why-user-A-has-RO-to-userB-Account-2.png)
- [Refer: Users can view records which are not shared to them ](https://help.salesforce.com/s/articleView?id=000325230&type=1)


### How to query AccoutShare object
```sql
SELECT Id ,AccountId,
      UserOrGroupId,AccountAccessLevel,OpportunityAccessLevel,CaseAccessLevel,ContactAccessLevel,RowCause 
      FROM AccountShare
      WHERE AccountId ='YOUR ACOUNT ID'

```
![query account share object](sharing/img/accountShare.webm.gif)

### How to query UserRecordAccess object
```
sfdx mohanc:data:query -q ~/.query/userRecordAccess.soql -u mohan.chinnappan.n_ea2@gmail.com -f json
```
```json
[
    {
        "attributes": {
            "type": "UserRecordAccess",
            "url": "/services/data/v52.0/sobjects/UserRecordAccess/0013h00000FfgCMAAZ"
        },
        "RecordId": "0013h00000FfgCMAAZ",
        "HasReadAccess": true,
        "HasEditAccess": true,
        "HasDeleteAccess": true,
        "HasTransferAccess": true,
        "HasAllAccess": true
    }
]
```

```
cat ~/.query/userRecordAccess.soql 
```
```sql
SELECT  RecordId,
HasReadAccess,HasEditAccess,HasDeleteAccess,
HasTransferAccess,HasAllAccess
FROM UserRecordAccess
WHERE UserId='0053h000002xQ5sAAE' AND
      RecordId = '0013h00000FfgCMAAZ'
```
![User Record Access](sharing/img/userRecord-access.png)
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


# list name,isCustomObject
$  sfdx mohanc:data:jq -i sobjects.json -f '.sobjects[] | .name + "," + (.custom | tostring)' | sed -e 's/"//g'
AIInsightAction,false
AIInsightFeedback,false
AIInsightReason,false
AIInsightValue,false
AIMetric,false
AIPredictionEvent,false
AIRecordInsight,false
AcceptedEventRelation,false
...


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

### Getting name,label,type,length for a given sObject (say Group)

```
$ bash ./sh/getObjectFields.sh Group
Id,Group ID,id,18
Name,Name,string,40
DeveloperName,Developer Name,string,80
RelatedId,Related ID,reference,18
Type,Type,picklist,40
Email,Email,email,255
OwnerId,Owner ID,reference,18
DoesSendEmailToMembers,Send Email to Members,boolean,0
DoesIncludeBosses,Include Bosses,boolean,0
CreatedDate,Created Date,datetime,0
CreatedById,Created By ID,reference,18
LastModifiedDate,Last Modified Date,datetime,0
LastModifiedById,Last Modified By ID,reference,18
SystemModstamp,System Modstamp,datetime,0

```

### Read Group sObject
```
$ sfdx mohanc:data:query -u mohan.chinnappan.n_ea2@gmail.com -q ./soql/group.soql | sed -e 's/""/"/g' | sed -e 's/"//g'
attributes,Id,Name,DeveloperName,RelatedId,Type,Email,OwnerId,DoesSendEmailToMembers,DoesIncludeBosses
{type:Group,url:/services/data/v49.0/sobjects/Group/00G3h000001rhf6EAA},00G3h000001rhf6EAA,,Sales_WW,00E3h000001JaqREAS,Role,,00D3h000007R1LuEAK,false,true
{type:Group,url:/services/data/v49.0/sobjects/Group/00G3h000001rhf8EAA},00G3h000001rhf8EAA,,CEOA,00E3h000001JaqUEAS,Role,,00D3h000007R1LuEAK,false,true
{type:Group,url:/services/data/v49.0/sobjects/Group/00G3h000001rhf9EAA},00G3h000001rhf9EAA,,CIO,00E3h000001JaqQEAS,Role,,00D3h000007R1LuEAK,false,true
{type:Group,url:/services/data/v49.0/sobjects/Group/00G3h000001rhfAEAQ},00G3h000001rhfAEAQ,,Sales_AMER,00E3h000001JaqSEAS,Role,,00D3h000007R1LuEAK,false,true
{type:Group,url:/services/data/v49.0/sobjects/Group/00G3h000001rhfBEAQ},00G3h000001rhfBEAQ,,Sales_EMEA,00E3h000001JaqTEAS,Role,,00D3h000007R1LuEAK,false,true
{type:Group,url:/services/data/v49.0/sobjects/Group/00G3h000001rhfCEAQ},00G3h000001rhfCEAQ,,CIO,00E3h000001JaqQEAS,RoleAndSubordinates,,00D3h000007R1LuEAK,false,true
{type:Group,url:/services/data/v49.0/sobjects/Group/00G3h000001rhfDEAQ},00G3h000001rhfDEAQ,,Sales_WW,00E3h000001JaqREAS,RoleAndSubordinates,,00D3h000007R1LuEAK,false,true
{type:Group,url:/services/data/v49.0/sobjects/Group/00G3h000001rhfEEAQ},00G3h000001rhfEEAQ,,Sales_AMER,00E3h000001JaqSEAS,RoleAndSubordinates,,00D3h000007R1LuEAK,false,true
{type:Group,url:/services/data/v49.0/sobjects/Group/00G3h000001rhfFEAQ},00G3h000001rhfFEAQ,,Sales_EMEA,00E3h000001JaqTEAS,RoleAndSubordinates,,00D3h000007R1LuEAK,false,true
{type:Group,url:/services/data/v49.0/sobjects/Group/00G3h000001rhfGEAQ},00G3h000001rhfGEAQ,,CEOD,00E3h000001JaqUEAS,RoleAndSubordinates,,00D3h000007R1LuEAK,false,true
{type:Group,url:/services/data/v49.0/sobjects/Group/00G3h000001HciTEAS},00G3h000001HciTEAS,,CEO,00E3h000001JaqUEAS,RoleAndSubordinatesInternal,,00D3h000007R1LuEAK,false,true
{type:Group,url:/services/data/v49.0/sobjects/Group/00G3h000001HciUEAS},00G3h000001HciUEAS,,CIO,00E3h000001JaqQEAS,RoleAndSubordinatesInternal,,00D3h000007R1LuEAK,false,true
{type:Group,url:/services/data/v49.0/sobjects/Group/00G3h000001HciVEAS},00G3h000001HciVEAS,,Sales_AMER,00E3h000001JaqSEAS,RoleAndSubordinatesInternal,,00D3h000007R1LuEAK,false,true
{type:Group,url:/services/data/v49.0/sobjects/Group/00G3h000001HciWEAS},00G3h000001HciWEAS,,Sales_EMEA,00E3h000001JaqTEAS,RoleAndSubordinatesInternal,,00D3h000007R1LuEAK,false,true
{type:Group,url:/services/data/v49.0/sobjects/Group/00G3h000001HciXEAS},00G3h000001HciXEAS,,Sales_WW,00E3h000001JaqREAS,RoleAndSubordinatesInternal,,00D3h000007R1LuEAK,false,true
{type:Group,url:/services/data/v49.0/sobjects/Group/00G3h000001HciSEAS},00G3h000001HciSEAS,,AllPartnerUsers,,PRMOrganization,,00D3h000007R1LuEAK,false,true
{type:Group,url:/services/data/v49.0/sobjects/Group/00G3h000001rhf7EAA},00G3h000001rhf7EAA,,AllInternalUsers,,Organization,,00D3h000007R1LuEAK,false,true
{type:Group,url:/services/data/v49.0/sobjects/Group/00G3h000001HciYEAS},00G3h000001HciYEAS,,AllCustomerPortalUsers,,AllCustomerPortal,,00D3h000007R1LuEAK,false,true
{type:Group,url:/services/data/v49.0/sobjects/Group/00G3h000001HcicEAC},00G3h000001HcicEAC,selfservice,selfservice,0053h000002xqUhAAI,GuestUserGroup,,00D3h000007R1LuEAK,false,true

$ cat soql/group.soql 
SELECT
    Id,
    Name,
    DeveloperName,
    RelatedId,
    Type,
    Email,
    OwnerId,
    DoesSendEmailToMembers,
    DoesIncludeBosses
FROM Group

```

### Queue

```
$ bash ./sh/getObjectFields.sh QueueSobject
Id,Queue Sobject ID,id,18
QueueId,Group ID,reference,18
SobjectType,Sobject Type,picklist,40
CreatedById,Created By ID,reference,18
SystemModstamp,System Modstamp,datetime,0

$ sfdx mohanc:data:query -u mohan.chinnappan.n_ea2@gmail.com -q ./soql/queue.soql | sed -e 's/""/"/g' | sed -e 's/"//g'

```
### Organization
```
$ bash ./sh/getObjectFields.sh Organization
Id,Organization ID,id,18
Name,Name,string,80
Division,Division,string,80
Street,Street,textarea,255
City,City,string,40
State,State/Province,string,80
PostalCode,Zip/Postal Code,string,20
Country,Country,string,80
Latitude,Latitude,double,0
Longitude,Longitude,double,0
GeocodeAccuracy,Geocode Accuracy,picklist,40
Address,Address,address,0
Phone,Phone,phone,40
Fax,Fax,phone,40
PrimaryContact,Primary Contact,string,80
DefaultLocaleSidKey,Locale,picklist,40
TimeZoneSidKey,Time Zone,picklist,40
LanguageLocaleKey,Language,picklist,40
ReceivesInfoEmails,Info Emails,boolean,0
ReceivesAdminInfoEmails,Info Emails Admin,boolean,0
PreferencesRequireOpportunityProducts,RequireOpportunityProducts,boolean,0
PreferencesTransactionSecurityPolicy,TransactionSecurityPolicy,boolean,0
PreferencesTerminateOldestSession,TerminateOldestSession,boolean,0
PreferencesConsentManagementEnabled,ConsentManagementEnabled,boolean,0
PreferencesAutoSelectIndividualOnMerge,AutoSelectIndividualOnMerge,boolean,0
PreferencesLightningLoginEnabled,LightningLoginEnabled,boolean,0
PreferencesOnlyLLPermUserAllowed,OnlyLLPermUserAllowed,boolean,0
FiscalYearStartMonth,Fiscal Year Starts In,int,0
UsesStartDateAsFiscalYearName,Fiscal Year Name by Start,boolean,0
DefaultAccountAccess,Default Account Access,picklist,40
DefaultContactAccess,Default Contact Access,picklist,40
DefaultOpportunityAccess,Default Opportunity Access,picklist,40
DefaultLeadAccess,Default Lead Access,picklist,40
DefaultCaseAccess,Default Case Access,picklist,40
DefaultCalendarAccess,Default Calendar Access,picklist,40
DefaultPricebookAccess,Default Price Book Access,picklist,40
DefaultCampaignAccess,Default Campaign Access,picklist,40
SystemModstamp,System Modstamp,datetime,0
ComplianceBccEmail,Compliance BCC Email,email,80
UiSkin,UI Skin,picklist,40
SignupCountryIsoCode,Signup Country,string,2
TrialExpirationDate,Trial Expiration Date,datetime,0
NumKnowledgeService,Knowledge Licenses,int,0
OrganizationType,Edition,picklist,40
NamespacePrefix,Namespace Prefix,string,15
InstanceName,Instance Name,string,5
IsSandbox,Is Sandbox,boolean,0
WebToCaseDefaultOrigin,Web to Cases Default Origin,string,40
MonthlyPageViewsUsed,Monthly Page Views Used,int,0
MonthlyPageViewsEntitlement,Monthly Page Views Allowed,int,0
IsReadOnly,Is Read Only,boolean,0
CreatedDate,Created Date,datetime,0
CreatedById,Created By ID,reference,18
LastModifiedDate,Last Modified Date,datetime,0
LastModifiedById,Last Modified By ID,reference,18
``` 
### User
```
$ bash getObjectFields.sh User
Id,User ID,id,18
Username,Username,string,80
LastName,Last Name,string,80
FirstName,First Name,string,40
Name,Full Name,string,121
CompanyName,Company Name,string,80
Division,Division,string,80
Department,Department,string,80
Title,Title,string,80
Street,Street,textarea,255
City,City,string,40
State,State/Province,string,80
PostalCode,Zip/Postal Code,string,20
Country,Country,string,80
Latitude,Latitude,double,0
Longitude,Longitude,double,0
GeocodeAccuracy,Geocode Accuracy,picklist,40
Address,Address,address,0
Email,Email,email,128
EmailPreferencesAutoBcc,AutoBcc,boolean,0
EmailPreferencesAutoBccStayInTouch,AutoBccStayInTouch,boolean,0
EmailPreferencesStayInTouchReminder,StayInTouchReminder,boolean,0
SenderEmail,Email Sender Address,email,80
SenderName,Email Sender Name,string,80
Signature,Email Signature,textarea,1333
StayInTouchSubject,Stay-in-Touch Email Subject,string,80
StayInTouchSignature,Stay-in-Touch Email Signature,textarea,512
StayInTouchNote,Stay-in-Touch Email Note,string,512
Phone,Phone,phone,40
Fax,Fax,phone,40
MobilePhone,Mobile,phone,40
Alias,Alias,string,8
CommunityNickname,Nickname,string,40
BadgeText,User Photo badge text overlay,string,80
IsActive,Active,boolean,0
TimeZoneSidKey,Time Zone,picklist,40
UserRoleId,Role ID,reference,18
LocaleSidKey,Locale,picklist,40
ReceivesInfoEmails,Info Emails,boolean,0
ReceivesAdminInfoEmails,Admin Info Emails,boolean,0
EmailEncodingKey,Email Encoding,picklist,40
ProfileId,Profile ID,reference,18
UserType,User Type,picklist,40
LanguageLocaleKey,Language,picklist,40
EmployeeNumber,Employee Number,string,20
DelegatedApproverId,Delegated Approver ID,reference,18
ManagerId,Manager ID,reference,18
LastLoginDate,Last Login,datetime,0
LastPasswordChangeDate,Last Password Change or Reset,datetime,0
CreatedDate,Created Date,datetime,0
CreatedById,Created By ID,reference,18
LastModifiedDate,Last Modified Date,datetime,0
LastModifiedById,Last Modified By ID,reference,18
SystemModstamp,System Modstamp,datetime,0
NumberOfFailedLogins,Failed Login Attempts,int,0
OfflineTrialExpirationDate,Offline Edition Trial Expiration Date,datetime,0
OfflinePdaTrialExpirationDate,Sales Anywhere Trial Expiration Date,datetime,0
UserPermissionsMarketingUser,Marketing User,boolean,0
UserPermissionsOfflineUser,Offline User,boolean,0
UserPermissionsCallCenterAutoLogin,Auto-login To Call Center,boolean,0
UserPermissionsSFContentUser,Salesforce CRM Content User,boolean,0
UserPermissionsKnowledgeUser,Knowledge User,boolean,0
UserPermissionsInteractionUser,Flow User,boolean,0
UserPermissionsSupportUser,Service Cloud User,boolean,0
UserPermissionsJigsawProspectingUser,Data.com User,boolean,0
UserPermissionsSiteforceContributorUser,Site.com Contributor User,boolean,0
UserPermissionsSiteforcePublisherUser,Site.com Publisher User,boolean,0
UserPermissionsWorkDotComUserFeature,WDC User,boolean,0
ForecastEnabled,Allow Forecasting,boolean,0
UserPreferencesActivityRemindersPopup,ActivityRemindersPopup,boolean,0
UserPreferencesEventRemindersCheckboxDefault,EventRemindersCheckboxDefault,boolean,0
UserPreferencesTaskRemindersCheckboxDefault,TaskRemindersCheckboxDefault,boolean,0
UserPreferencesReminderSoundOff,ReminderSoundOff,boolean,0
UserPreferencesDisableAllFeedsEmail,DisableAllFeedsEmail,boolean,0
UserPreferencesDisableFollowersEmail,DisableFollowersEmail,boolean,0
UserPreferencesDisableProfilePostEmail,DisableProfilePostEmail,boolean,0
UserPreferencesDisableChangeCommentEmail,DisableChangeCommentEmail,boolean,0
UserPreferencesDisableLaterCommentEmail,DisableLaterCommentEmail,boolean,0
UserPreferencesDisProfPostCommentEmail,DisProfPostCommentEmail,boolean,0
UserPreferencesContentNoEmail,ContentNoEmail,boolean,0
UserPreferencesContentEmailAsAndWhen,ContentEmailAsAndWhen,boolean,0
UserPreferencesApexPagesDeveloperMode,ApexPagesDeveloperMode,boolean,0
UserPreferencesReceiveNoNotificationsAsApprover,ReceiveNoNotificationsAsApprover,boolean,0
UserPreferencesReceiveNotificationsAsDelegatedApprover,ReceiveNotificationsAsDelegatedApprover,boolean,0
UserPreferencesHideCSNGetChatterMobileTask,HideCSNGetChatterMobileTask,boolean,0
UserPreferencesDisableMentionsPostEmail,DisableMentionsPostEmail,boolean,0
UserPreferencesDisMentionsCommentEmail,DisMentionsCommentEmail,boolean,0
UserPreferencesHideCSNDesktopTask,HideCSNDesktopTask,boolean,0
UserPreferencesHideChatterOnboardingSplash,HideChatterOnboardingSplash,boolean,0
UserPreferencesHideSecondChatterOnboardingSplash,HideSecondChatterOnboardingSplash,boolean,0
UserPreferencesDisCommentAfterLikeEmail,DisCommentAfterLikeEmail,boolean,0
UserPreferencesDisableLikeEmail,DisableLikeEmail,boolean,0
UserPreferencesSortFeedByComment,SortFeedByComment,boolean,0
UserPreferencesDisableMessageEmail,DisableMessageEmail,boolean,0
UserPreferencesHideLegacyRetirementModal,HideLegacyRetirementModal,boolean,0
UserPreferencesJigsawListUser,JigsawListUser,boolean,0
UserPreferencesDisableBookmarkEmail,DisableBookmarkEmail,boolean,0
UserPreferencesDisableSharePostEmail,DisableSharePostEmail,boolean,0
UserPreferencesEnableAutoSubForFeeds,EnableAutoSubForFeeds,boolean,0
UserPreferencesDisableFileShareNotificationsForApi,DisableFileShareNotificationsForApi,boolean,0
UserPreferencesShowTitleToExternalUsers,ShowTitleToExternalUsers,boolean,0
UserPreferencesShowManagerToExternalUsers,ShowManagerToExternalUsers,boolean,0
UserPreferencesShowEmailToExternalUsers,ShowEmailToExternalUsers,boolean,0
UserPreferencesShowWorkPhoneToExternalUsers,ShowWorkPhoneToExternalUsers,boolean,0
UserPreferencesShowMobilePhoneToExternalUsers,ShowMobilePhoneToExternalUsers,boolean,0
UserPreferencesShowFaxToExternalUsers,ShowFaxToExternalUsers,boolean,0
UserPreferencesShowStreetAddressToExternalUsers,ShowStreetAddressToExternalUsers,boolean,0
UserPreferencesShowCityToExternalUsers,ShowCityToExternalUsers,boolean,0
UserPreferencesShowStateToExternalUsers,ShowStateToExternalUsers,boolean,0
UserPreferencesShowPostalCodeToExternalUsers,ShowPostalCodeToExternalUsers,boolean,0
UserPreferencesShowCountryToExternalUsers,ShowCountryToExternalUsers,boolean,0
UserPreferencesShowProfilePicToGuestUsers,ShowProfilePicToGuestUsers,boolean,0
UserPreferencesShowTitleToGuestUsers,ShowTitleToGuestUsers,boolean,0
UserPreferencesShowCityToGuestUsers,ShowCityToGuestUsers,boolean,0
UserPreferencesShowStateToGuestUsers,ShowStateToGuestUsers,boolean,0
UserPreferencesShowPostalCodeToGuestUsers,ShowPostalCodeToGuestUsers,boolean,0
UserPreferencesShowCountryToGuestUsers,ShowCountryToGuestUsers,boolean,0
UserPreferencesDisableFeedbackEmail,DisableFeedbackEmail,boolean,0
UserPreferencesDisableWorkEmail,DisableWorkEmail,boolean,0
UserPreferencesPipelineViewHideHelpPopover,PipelineViewHideHelpPopover,boolean,0
UserPreferencesHideS1BrowserUI,HideS1BrowserUI,boolean,0
UserPreferencesDisableEndorsementEmail,DisableEndorsementEmail,boolean,0
UserPreferencesPathAssistantCollapsed,PathAssistantCollapsed,boolean,0
UserPreferencesCacheDiagnostics,CacheDiagnostics,boolean,0
UserPreferencesShowEmailToGuestUsers,ShowEmailToGuestUsers,boolean,0
UserPreferencesShowManagerToGuestUsers,ShowManagerToGuestUsers,boolean,0
UserPreferencesShowWorkPhoneToGuestUsers,ShowWorkPhoneToGuestUsers,boolean,0
UserPreferencesShowMobilePhoneToGuestUsers,ShowMobilePhoneToGuestUsers,boolean,0
UserPreferencesShowFaxToGuestUsers,ShowFaxToGuestUsers,boolean,0
UserPreferencesShowStreetAddressToGuestUsers,ShowStreetAddressToGuestUsers,boolean,0
UserPreferencesLightningExperiencePreferred,LightningExperiencePreferred,boolean,0
UserPreferencesPreviewLightning,PreviewLightning,boolean,0
UserPreferencesHideEndUserOnboardingAssistantModal,HideEndUserOnboardingAssistantModal,boolean,0
UserPreferencesHideLightningMigrationModal,HideLightningMigrationModal,boolean,0
UserPreferencesHideSfxWelcomeMat,HideSfxWelcomeMat,boolean,0
UserPreferencesHideBiggerPhotoCallout,HideBiggerPhotoCallout,boolean,0
UserPreferencesGlobalNavBarWTShown,GlobalNavBarWTShown,boolean,0
UserPreferencesGlobalNavGridMenuWTShown,GlobalNavGridMenuWTShown,boolean,0
UserPreferencesCreateLEXAppsWTShown,CreateLEXAppsWTShown,boolean,0
UserPreferencesFavoritesWTShown,FavoritesWTShown,boolean,0
UserPreferencesRecordHomeSectionCollapseWTShown,RecordHomeSectionCollapseWTShown,boolean,0
UserPreferencesRecordHomeReservedWTShown,RecordHomeReservedWTShown,boolean,0
UserPreferencesFavoritesShowTopFavorites,FavoritesShowTopFavorites,boolean,0
UserPreferencesExcludeMailAppAttachments,ExcludeMailAppAttachments,boolean,0
UserPreferencesSuppressTaskSFXReminders,SuppressTaskSFXReminders,boolean,0
UserPreferencesSuppressEventSFXReminders,SuppressEventSFXReminders,boolean,0
UserPreferencesPreviewCustomTheme,PreviewCustomTheme,boolean,0
UserPreferencesHasCelebrationBadge,HasCelebrationBadge,boolean,0
UserPreferencesUserDebugModePref,UserDebugModePref,boolean,0
UserPreferencesSRHOverrideActivities,SRHOverrideActivities,boolean,0
UserPreferencesNewLightningReportRunPageEnabled,NewLightningReportRunPageEnabled,boolean,0
UserPreferencesNativeEmailClient,NativeEmailClient,boolean,0
ContactId,Contact ID,reference,18
AccountId,Account ID,reference,18
CallCenterId,Call Center ID,reference,18
Extension,Extension,phone,40
PortalRole,Portal Role Level,picklist,40
IsPortalEnabled,Is Portal Enabled,boolean,0
FederationIdentifier,SAML Federation ID,string,512
AboutMe,About Me,textarea,1000
FullPhotoUrl,Url for full-sized Photo,url,1024
SmallPhotoUrl,Photo,url,1024
IsExtIndicatorVisible,Show external indicator,boolean,0
OutOfOfficeMessage,Out of office message,string,40
MediumPhotoUrl,Url for medium profile photo,url,1024
DigestFrequency,Chatter Email Highlights Frequency,picklist,40
DefaultGroupNotificationFrequency,Default Notification Frequency when Joining Groups,picklist,40
JigsawImportLimitOverride,Data.com Monthly Addition Limit,int,0
LastViewedDate,Last Viewed Date,datetime,0
LastReferencedDate,Last Referenced Date,datetime,0
BannerPhotoUrl,Url for banner photo,url,1024
SmallBannerPhotoUrl,Url for IOS banner photo,url,1024
MediumBannerPhotoUrl,Url for Android banner photo,url,1024
IsProfilePhotoActive,Has Profile Photo,boolean,0
IndividualId,Individual ID,reference,18

sfdx mohanc:data:query -u mohan.chinnappan.n_ea2@gmail.com -q ~/bulkapi/dx/soql/user.soql 
"attributes","Id","Name"
"{""type"":""User"",""url"":""/services/data/v49.0/sobjects/User/0053h000003de6cAAA""}","0053h000003de6cAAA","Automated Process"
"{""type"":""User"",""url"":""/services/data/v49.0/sobjects/User/0053h000002xqUhAAI""}","0053h000002xqUhAAI","selfservice Site Guest User"
"{""type"":""User"",""url"":""/services/data/v49.0/sobjects/User/0053h000002xQ5sAAE""}","0053h000002xQ5sAAE","Mohan Chinnappan"
...
```
### Object Permission
```
$ bash getObjectFields.sh ObjectPermissions
Id,ObjectPermissions ID,id,18
ParentId,Parent ID,reference,18
SobjectType,SObject Type Name,picklist,40
PermissionsCreate,Create Records,boolean,0
PermissionsRead,Read Records,boolean,0
PermissionsEdit,Edit Records,boolean,0
PermissionsDelete,Delete Records,boolean,0
PermissionsViewAllRecords,Read All Records,boolean,0
PermissionsModifyAllRecords,Edit All Records,boolean,0
CreatedDate,Created Date,datetime,0
CreatedById,Created By ID,reference,18
LastModifiedDate,Last Modified Date,datetime,0
LastModifiedById,Last Modified By ID,reference,18
SystemModstamp,System Modstamp,datetime,0


$ bash soql/ObjectPermission.sh 0053h000002xQ5sAAE Account  > soql/op_account.soql
$ cat  soql/op_account.soql 

SELECT Id,
    SObjectType,

    PermissionsCreate,
    PermissionsRead,
    PermissionsEdit,
    PermissionsDelete,
    PermissionsViewAllRecords,
    PermissionsModifyAllRecords,

    Parent.label,
    Parent.IsOwnedByProfile 
 FROM ObjectPermissions  
   WHERE (ParentId IN (
                SELECT PermissionSetId                 
                  FROM PermissionSetAssignment  
                  WHERE Assignee.id = '0053h000002xQ5sAAE')
         ) 
      AND
         (SobjectType = 'Account')


$ sfdx mohanc:data:query -u mohan.chinnappan.n_ea2@gmail.com -q soql/op_account.soql | sed -e 's/""/"/g' | sed -e 's/"//g'
attributes,Id,SobjectType,PermissionsCreate,PermissionsRead,PermissionsEdit,PermissionsDelete,PermissionsViewAllRecords,PermissionsModifyAllRecords,Parent
{type:ObjectPermissions,url:/services/data/v49.0/sobjects/ObjectPermissions/1103h00001wg5TMAAY},1103h00001wg5TMAAY,Account,true,true,true,true,true,true,{attributes:{type:PermissionSet,url:/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0},Label:00ex00000018ozh_128_09_04_12_1,IsOwnedByProfile:true}
{type:ObjectPermissions,url:/services/data/v49.0/sobjects/ObjectPermissions/00000002PwNZ001AID},00000002PwNZ001AID,Account,true,true,true,true,true,true,{attributes:{type:PermissionSet,url:/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0},Label:00ex00000018ozh_128_09_04_12_1,IsOwnedByProfile:true}

# column formatting
$ sfdx mohanc:data:query -u mohan.chinnappan.n_ea2@gmail.com -q soql/op_account.soql | sed -e 's/""/"/g' | sed -e 's/"//g' |   column -t -s, | less -S

``` 
### FieldPermissions
```
$ bash soql/FieldPermission.sh 0053h000002xQ5sAAE Account  > soql/fp_account.soql
$ cat  soql/fp_account.soql

SELECT Id,
    SObjectType,
    Field,
    PermissionsRead,
    PermissionsEdit,
    Parent.label,
     Parent.IsOwnedByProfile 
 FROM FieldPermissions  
 WHERE (ParentId IN 
         (SELECT PermissionSetId    
              FROM PermissionSetAssignment
                  WHERE Assignee.id = '0053h000002xQ5sAAE')
      ) 
     AND
       (SobjectType = 'Account') 


$ sfdx mohanc:data:query -u mohan.chinnappan.n_ea2@gmail.com -q soql/fp_account.soql | sed -e 's/""/"/g'
"attributes","Id","SobjectType","Field","PermissionsRead","PermissionsEdit","Parent"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu8132AQA"}","01k3h0000Iu8132AQA","Account","Account.YearStarted",true,false,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu8131AQA"}","01k3h0000Iu8131AQA","Account","Account.Website",true,true,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu8130AQA"}","01k3h0000Iu8130AQA","Account","Account.Type",true,true,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812zAQA"}","01k3h0000Iu812zAQA","Account","Account.Tradestyle",true,false,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812yAQA"}","01k3h0000Iu812yAQA","Account","Account.TickerSymbol",true,true,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812xAQA"}","01k3h0000Iu812xAQA","Account","Account.Site",true,true,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812wAQA"}","01k3h0000Iu812wAQA","Account","Account.SicDesc",true,true,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812vAQA"}","01k3h0000Iu812vAQA","Account","Account.Sic",true,true,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812uAQA"}","01k3h0000Iu812uAQA","Account","Account.ShippingAddress",true,true,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812tAQA"}","01k3h0000Iu812tAQA","Account","Account.Rating",true,true,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812sAQA"}","01k3h0000Iu812sAQA","Account","Account.Phone",true,true,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812rAQA"}","01k3h0000Iu812rAQA","Account","Account.Parent",true,true,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812qAQA"}","01k3h0000Iu812qAQA","Account","Account.Ownership",true,true,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812pAQA"}","01k3h0000Iu812pAQA","Account","Account.NumberOfEmployees",true,true,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812oAQA"}","01k3h0000Iu812oAQA","Account","Account.NaicsDesc",true,false,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812nAQA"}","01k3h0000Iu812nAQA","Account","Account.NaicsCode",true,false,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812mAQA"}","01k3h0000Iu812mAQA","Account","Account.Jigsaw",true,true,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812lAQA"}","01k3h0000Iu812lAQA","Account","Account.Industry",true,true,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812kAQA"}","01k3h0000Iu812kAQA","Account","Account.Fax",true,true,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812jAQA"}","01k3h0000Iu812jAQA","Account","Account.DunsNumber",true,false,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812iAQA"}","01k3h0000Iu812iAQA","Account","Account.Description",true,true,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812fAQA"}","01k3h0000Iu812fAQA","Account","Account.DandbCompany",true,false,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812eAQA"}","01k3h0000Iu812eAQA","Account","Account.CleanStatus",true,false,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812dAQA"}","01k3h0000Iu812dAQA","Account","Account.BillingAddress",true,true,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812cAQA"}","01k3h0000Iu812cAQA","Account","Account.AnnualRevenue",true,true,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812bAQA"}","01k3h0000Iu812bAQA","Account","Account.AccountSource",true,true,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812aAQA"}","01k3h0000Iu812aAQA","Account","Account.AccountNumber",true,true,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812SAQQ"}","01k3h0000Iu812SAQQ","Account","Account.Segment__c",true,true,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812ZAQQ"}","01k3h0000Iu812ZAQQ","Account","Account.UpsellOpportunity__c",true,true,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812YAQQ"}","01k3h0000Iu812YAQQ","Account","Account.SLASerialNumber__c",true,true,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812XAQQ"}","01k3h0000Iu812XAQQ","Account","Account.SLAExpirationDate__c",true,true,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812WAQQ"}","01k3h0000Iu812WAQQ","Account","Account.SLA__c",true,true,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812VAQQ"}","01k3h0000Iu812VAQQ","Account","Account.NumberofLocations__c",true,true,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812UAQQ"}","01k3h0000Iu812UAQQ","Account","Account.CustomerPriority__c",true,true,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
"{"type":"FieldPermissions","url":"/services/data/v49.0/sobjects/FieldPermissions/01k3h0000Iu812TAQQ"}","01k3h0000Iu812TAQQ","Account","Account.Active__c",true,true,"{"attributes":{"type":"PermissionSet","url":"/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"},"Label":"00ex00000018ozh_128_09_04_12_1","IsOwnedByProfile":true}"
```
## Detailed User query

```
$ bash soql/userQuery.soql 0053h000002xQ5sAAE > soql/userQuery.soql
$ cat  soql/userQuery.soql
SELECT Id,
    IsActive,
    ProfileId,
    Profile.Name,
    Profile.UserLicense.Name,
    UserRoleId,
    UserRole.DeveloperName,
    Username,
    Email,
    Name,
    LastLoginDate,
    CreatedBy.Name,
    CreatedDate,
    LastModifiedBy.Name,
    LastModifiedDate,
     (SELECT PermissionSet.Name           
         FROM PermissionSetAssignments          
           WHERE PermissionSet.IsOwnedByProfile = FALSE) 

FROM User WHERE Id = '0053h000002xQ5sAAE'  
LIMIT 1


$ sfdx mohanc:data:query -u mohan.chinnappan.n_ea2@gmail.com -q soql/userQuery.soql | sed -e 's/""/"/g' | sed -e 's/"//g'
attributes,Id,IsActive,ProfileId,Profile,UserRoleId,UserRole,Username,Email,Name,LastLoginDate,CreatedBy,CreatedDate,LastModifiedBy,LastModifiedDate,PermissionSetAssignments
{type:User,url:/services/data/v49.0/sobjects/User/0053h000002xQ5sAAE},0053h000002xQ5sAAE,true,00e3h000001kqJMAAY,{attributes:{type:Profile,url:/services/data/v49.0/sobjects/Profile/00e3h000001kqJMAAY},Name:System Administrator,UserLicense:{attributes:{type:UserLicense,url:/services/data/v49.0/sobjects/UserLicense/1003h000001GeewAAC},Name:Salesforce}},00E3h000001JaqUEAS,{attributes:{type:UserRole,url:/services/data/v49.0/sobjects/UserRole/00E3h000001JaqUEAS},DeveloperName:CEO},mohan.chinnappan.n_ea2@gmail.com,mohan.chinnappan.n@gmail.com,Mohan Chinnappan,2020-08-27T10:25:03.000+0000,{attributes:{type:User,url:/services/data/v49.0/sobjects/User/0053h000002xQ5sAAE},Name:Mohan Chinnappan},2020-07-13T19:30:57.000+0000,{attributes:{type:User,url:/services/data/v49.0/sobjects/User/0053h000002xQ5sAAE},Name:Mohan Chinnappan},2020-08-23T22:09:49.000+0000,{totalSize:4,done:true,records:[{attributes:{type:PermissionSetAssignment,url:/services/data/v49.0/sobjects/PermissionSetAssignment/0Pa3h000002cLFBCA2},PermissionSet:{attributes:{type:PermissionSet,url:/services/data/v49.0/sobjects/PermissionSet/0PS3h000001i9aKGAQ},Name:EinsteinAnalyticsPlusAdmin}},{attributes:{type:PermissionSetAssignment,url:/services/data/v49.0/sobjects/PermissionSetAssignment/0Pa3h000001BwoBCAS},PermissionSet:{attributes:{type:PermissionSet,url:/services/data/v49.0/sobjects/PermissionSet/0PS3h000001iHPpGAM},Name:EA_Plus}},{attributes:{type:PermissionSetAssignment,url:/services/data/v49.0/sobjects/PermissionSetAssignment/0Pa3h000002cLF1CAM},PermissionSet:{attributes:{type:PermissionSet,url:/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwO7GAK},Name:Wave_Analytics_Trailhead_Admin}},{attributes:{type:PermissionSetAssignment,url:/services/data/v49.0/sobjects/PermissionSetAssignment/0Pa3h000002cLF3CAM},PermissionSet:{attributes:{type:PermissionSet,url:/services/data/v49.0/sobjects/PermissionSet/0PS3h000002PwO9GAK},Name:EventMonitoringWaveAdmin}}]}
```

## Group
[User ERD](https://mohan-chinnappan-n.github.io/sfdc/fs-cloud/csv-viewer_fsc.html?f=User)
[Group ERD](https://mohan-chinnappan-n.github.io/sfdc/fs-cloud/csv-viewer_fsc.html?f=Group)
[GroupMember ERD](https://mohan-chinnappan-n.github.io/sfdc/fs-cloud/csv-viewer_fsc.html?f=GroupMember)


```
$ cat ~/tmp/group.soql 
SELECT 
Id,
DeveloperName,
RelatedId,
Type,
Email,
DoesSendEmailToMembers,
DoesIncludeBosses

FROM Group
```
```
$ sfdx mohanc:data:query -u  mohan.chinnappan.n_ea2@gmail.com -q ~/tmp/group.soql  -f json
$ sfdx mohanc:data:query -u  mohan.chinnappan.n_ea2@gmail.com -q ~/tmp/group.soql  -f json 
[
    {
        "attributes": {
            "type": "Group",
            "url": "/services/data/v51.0/sobjects/Group/00G3h000001rhf6EAA"
        },
        "Id": "00G3h000001rhf6EAA",
        "DeveloperName": "Sales_WW",
        "RelatedId": "00E3h000001JaqREAS",
        "Type": "Role",
        "Email": null,
        "DoesSendEmailToMembers": false,
        "DoesIncludeBosses": true
    },
...
]
```
## GroupMember
```
$ cat ~/tmp/groupMember.soql
SELECT
Id,
GroupId,
UserOrGroupId

FROM GroupMember
```

```
$ sfdx mohanc:data:query -u  mohan.chinnappan.n_ea2@gmail.com -q ~/tmp/groupMember.soql  -f json 
[
    {
        "attributes": {
            "type": "GroupMember",
            "url": "/services/data/v51.0/sobjects/GroupMember/0113h0000002627AAA"
        },
        "Id": "0113h0000002627AAA",
        "GroupId": "00G3h000000OtiAEAS",
        "UserOrGroupId": "00G3h000001rhf7EAA"
    }
]
```
## Object Permissions
```
$ cat  ~/tmp/obj-perm.soql
SELECT Id, ParentId, SObjectType,PermissionsCreate,PermissionsRead,PermissionsEdit,PermissionsDelete,PermissionsViewAllRecords,PermissionsModifyAllRecords,Parent.label, Parent.IsOwnedByProfile  FROM ObjectPermissions 
```

```

$ sfdx mohanc:data:query -u mohan.chinnappan.n_ea2@gmail.com -q ~/tmp/obj-perm.soql  -f json
[
...
 {
        "attributes": {
            "type": "ObjectPermissions",
            "url": "/services/data/v51.0/sobjects/ObjectPermissions/00000001i9aL801AAC"
        },
        "Id": "00000001i9aL801AAC",
        "ParentId": "0PS3h000001i9aLGAQ",
        "SobjectType": "Order",
        "PermissionsCreate": true,
        "PermissionsRead": true,
        "PermissionsEdit": true,
        "PermissionsDelete": true,
        "PermissionsViewAllRecords": true,
        "PermissionsModifyAllRecords": true,
        "Parent": {
            "attributes": {
                "type": "PermissionSet",
                "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000001i9aLGAQ"
            },
            "Label": "Salesforce CMS Integration Admin",
            "IsOwnedByProfile": false
        }
    },
...
]
```

## Field Permissions
```
$ cat  ~/tmp/field-perm.soql
SELECT id,SobjectType, Field, PermissionsRead, PermissionsEdit FROM FieldPermissions

```

```
$ sfdx mohanc:data:query -u mohan.chinnappan.n_ea2@gmail.com -q ~/tmp/field-perm.soql  -f json
[
...

 {
        "attributes": {
            "type": "FieldPermissions",
            "url": "/services/data/v51.0/sobjects/FieldPermissions/01k3h0000Iu7ytcAQA"
        },
        "Id": "01k3h0000Iu7ytcAQA",
        "SobjectType": "Event",
        "Field": "Event.Description",
        "PermissionsRead": true,
        "PermissionsEdit": true
    },
...
]

```

