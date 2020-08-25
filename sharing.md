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
