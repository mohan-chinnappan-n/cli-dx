#  How to delete Object or Field using DX

## Plugin version 0.0.204
-  sfdx-mohanc-plugins@0.0.204
- Update it with:
```
sfdx plugins:update
```

## Sample Input JSON file
- Can have multiple delete 
- Example here has 
	-  Deleting Account.Temp1__c and Account.Temp2__c

```
cat  delete.account.fields.json 
```
```json

[
  "Account.Temp1__c",  "Account.Temp2__c"
]

```
## Usage
```
sfdx mohanc:mdapi:del -h
```
```
fdx mohanc:mdapi:del -h
Delete metadata

USAGE
  $ sfdx mohanc:mdapi:del [-i <string>] [-t <string>] [-u <string>] [--apiversion <string>]
    [--json] [--loglevel trace|debug|info|warn|error|fatal|TRACE|DEBUG|INFO|WARN|ERROR|FATAL]

FLAGS
  -i, --input=<value>
      Input JSON file for the metadata type

  -t, --type=<value>
      Metadata type (e.g CustomField or CustomObject)

  -u, --targetusername=<value>
      username or alias for the target org; overrides default target org

  --apiversion=<value>
      override the api version used for api requests made by this command

  --json
      format output as json

  --loglevel=(trace|debug|info|warn|error|fatal|TRACE|DEBUG|INFO|WARN|ERROR|FATAL)
      [default: warn] logging level for this command invocation

DESCRIPTION
  Delete metadata

EXAMPLES
             remove metadata for the given metadata type and delete info 
             sfdx mohanc:mdapi:del  -u <username> -i <inputJSON>  -t <metadataType>
             Example:
             sfdx mohanc:mdapi:del -u mohan.chinnappan.n.sel@gmail.com -i delete.account.fields.json -t CustomField

```

## Demo
```
sfdx mohanc:mdapi:del -u mohan.chinnappan.n.sel@gmail.com -i delete.account.fields.json -t CustomField
```

```
[
  { fullName: 'Account.Temp1__c', success: true },
  { fullName: 'Account.Temp2__c', success: true },
]

```
## Before
![Before Delete](img/delete-field-before-1.png)

## After
![After Delete](img/delete-field-after-1.png)


