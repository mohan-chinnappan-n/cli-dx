# Community Related CLI command

- Requires 0.0.116 version of the plugin
    - sfdx-mohanc-plugins@0.0.116
    - [How to install the plugin](https://mohan-chinnappan-n.github.io/dx/plugins.html#/1)

## List a community
```
# All
$ sfdx mohanc:community:list -u mohan.chinnappan.n_ea2@gmail.com 
```
```
{
  communities: [
    {
      allowChatterAccessWithoutLogin: false,
      allowMembersToFlag: false,
      description: null,
      guestMemberVisibilityEnabled: false,
      id: '0DB3h00000021GPGAY',
      invitationsEnabled: false,
      knowledgeableEnabled: false,
      loginUrl: 'https://custcomm2020-developer-edition.na111.force.com/login',
      memberVisibilityEnabled: false,
      name: 'selfservice',
      nicknameDisplayEnabled: true,
      privateMessagesEnabled: false,
      reputationEnabled: false,
      sendWelcomeEmail: true,
      siteAsContainerEnabled: true,
      siteUrl: 'https://custcomm2020-developer-edition.na111.force.com',
      status: 'UnderConstruction',
      templateName: 'Help Center',
      url: '/services/data/v50.0/connect/communities/0DB3h00000021GPGAY',
      urlPathPrefix: null
    }
  ],
  total: 1
}
```

- List for a given communityId
```
$ sfdx mohanc:community:list -u mohan.chinnappan.n_ea2@gmail.com -i 0DB3h00000021GPGAY
```
```
{
  allowChatterAccessWithoutLogin: false,
  allowMembersToFlag: false,
  description: null,
  guestMemberVisibilityEnabled: false,
  id: '0DB3h00000021GPGAY',
  invitationsEnabled: false,
  knowledgeableEnabled: false,
  loginUrl: 'https://custcomm2020-developer-edition.na111.force.com/login',
  memberVisibilityEnabled: false,
  name: 'selfservice',
  nicknameDisplayEnabled: true,
  privateMessagesEnabled: false,
  reputationEnabled: false,
  sendWelcomeEmail: true,
  siteAsContainerEnabled: true,
  siteUrl: 'https://custcomm2020-developer-edition.na111.force.com',
  status: 'UnderConstruction',
  templateName: 'Help Center',
  url: '/services/data/v50.0/connect/communities/0DB3h00000021GPGAY',
  urlPathPrefix: null
}
```

## Publish a community
```
$ sfdx mohanc:community:publish -u mohan.chinnappan.n_ea2@gmail.com -i 0DB3h00000021GPGAY
```
```
{
  id: '0DB3h00000021GPGAY',
  message: 'We are publishing your changes now. You will receive an email confirmation when your changes are live.',
  name: 'selfservice',
  url: 'https://custcomm2020-developer-edition.na111.force.com'
}
```

## List Templates available
```
$ sfdx mohanc:community:templates -u mohan.chinnappan.n_ea2@gmail.com 
```
```
{
  templates: [
    { publisher: 'Salesforce', templateName: 'Build Your Own' },
    { publisher: 'Salesforce', templateName: 'Help Center' },
    {
      publisher: 'Salesforce',
      templateName: 'Customer Account Portal'
    },
    { publisher: 'Salesforce', templateName: 'Aloha' },
    { publisher: 'Salesforce', templateName: 'Partner Central' },
    { publisher: 'Salesforce', templateName: 'Customer Service' },
    {
      publisher: 'Salesforce',
      templateName: 'Salesforce Tabs + Visualforce'
    }
  ],
  total: 7
}
```

## List EMA
```
$ sfdx mohanc:community:ema -h
List  Communities Externally Managed Accounts

USAGE
  $ sfdx mohanc:community:ema

OPTIONS
  -i, --cid=cid                                   Community Id
  -u, --targetusername=targetusername             username or alias for the target org; overrides default target org
  --apiversion=apiversion                         override the api version used for api requests made by this command
  --json                                          format output as json
  --loglevel=(trace|debug|info|warn|error|fatal)  logging level for this command invocation

EXAMPLE

              List Communities Externally Managed Accounts
              sfdx mohanc:community:list  -u <username> -i <communityId>

```
- Usage

```
$ sfdx mohanc:community:ema -u mohan.chinnappan.n_ea2@gmail.com -i 0DB3h00000021GPGAY
```
```
[
  {
    errorCode: 'INSUFFICIENT_ACCESS_OR_READONLY',
    message: 'This feature is not currently enabled for this user type or org: [ExternalManagedAccount]'
  }
]
```



