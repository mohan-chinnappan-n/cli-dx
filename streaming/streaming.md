# Subscribing to Salesforce Streaming API

## Topics
- [Install](#install)
- [Push Topics](#pushTopics)
- [Generic Subscriptions](#GenericSubscriptions)

---


<a name='install'>

## Install 
- Requires 0.0.358 version of the plugin
- sfdx plugins:update 
- sfdx-mohanc-plugins@0.0.0.358
- [How to install the plugin](https://mohan-chinnappan-n.github.io/dx/plugins.html#/1)

---

<a name='pushTopics'>

## Push Topics
 
 ### Login to the org (sandbox) to get the user-id
 ```
 sfdx force:auth:web:login -r https://test.salesforce.com

 ```
### Login to the org (PROD or Developer Edition)
 ```
 sfdx force:auth:web:login 

 ```



### Apex code to  create push topic
```java
// apex code to create push topic ( ~/.apex/pushNewAccounts.cls)
  PushTopic pushTopic = new PushTopic();
  pushTopic.Name = 'NewAccounts';
  pushTopic.Query = 'SELECT Id, Name, Phone FROM Account';
  pushTopic.ApiVersion = 58.0;
  pushTopic.NotifyForOperationUpdate = false;
  pushTopic.NotifyForOperationDelete = false;
  pushTopic.NotifyForOperationUndelete = false;

  insert pushTopic;

```

### Run this anonymous apex code:  
```
   sfdx mohanc:tooling:execute -u mohan.chinnappan.n.sel2@gmail.com -a ~/.apex/pushNewAccounts.cls

``` 

### In UI 
- Create a New Account record

### Subscribe this push topic (NewAccounts):

```
 sfdx mohanc:streaming:sub -u mohan.chinnappan.n.sel2@gmail.com -t 'NewAccounts'

```
```json
{
    "event": {
        "createdDate": "2023-11-14T11:03:51.717Z",
        "replayId": 2,
        "type": "created"
    },
    "sobject": {
        "Phone": "1-343-333-4444",
        "Id": "0018W00002UMYXWQA5",
        "Name": "CarbonNeutral"
    }
}  

```


---

<a name='GenericSubscriptions'>

## Generic Subscriptions

```
 sfdx mohanc:streaming:sub -u mohan.chinnappan.n.sel2@gmail.com -t '/event/AccountEvent__e'

```
```json

{
    "schema": "tE5g_mM0KX9CfyI4TjyxTg",
    "payload": {
      ...
    },
    "event": {
        "EventUuid": "25d04728-31fa-4395-9b97-a5e96b7f1835",
        "replayId": 16278341,
        "EventApiName": "AccountEvent__e"
    }
}

```
## Documentation

```
sfdx mohanc:streaming:sub -u mohan.chinnappan.n.sel2@gmail.com --help
Subscribe to stream topic

USAGE
  $ sf mohanc streaming sub -t <string> [-u <string>] [--apiversion <string>] [--json] [--loglevel
    trace|debug|info|warn|error|fatal|TRACE|DEBUG|INFO|WARN|ERROR|FATAL]

FLAGS
  -t, --topic=<value>                                                               (required) Topic to Subscribe
  -u, --targetusername=<value>                                                      username or alias for the target org; overrides default target org
  --apiversion=<value>                                                              override the api version used for api requests made by this command
  --json                                                                            format output as json
  --loglevel=(trace|debug|info|warn|error|fatal|TRACE|DEBUG|INFO|WARN|ERROR|FATAL)  [default: warn] logging level for this command invocation

DESCRIPTION
  Subscribe to stream topic

EXAMPLES
             Subscribe to topic
             sfdx mohanc:streaming:sub  -u <username> -t <topic>
             example:
  // apex code to create push topic ( ~/.apex/pushNewAccounts.cls)
  PushTopic pushTopic = new PushTopic();
  pushTopic.Name = 'NewAccounts';
  pushTopic.Query = 'SELECT Id, Name, Phone FROM Account';
  pushTopic.ApiVersion = 58.0;
  pushTopic.NotifyForOperationUpdate = false;
  pushTopic.NotifyForOperationDelete = false;
  pushTopic.NotifyForOperationUndelete = false;

  insert pushTopic;

  // run it
  $ sfdx mohanc:tooling:execute -u mohan.chinnappan.n.sel2@gmail.com -a ~/.apex/pushNewAccounts.cls
  // in UI create a New Account record
  // subscribe
  $ sfdx mohanc:streaming:sub  -u <username> -t NewAccounts
  // output
  {
      "event": {
          "createdDate": "2023-11-14T10:48:37.079Z",
          "replayId": 1,
          "type": "created"
      },
      "sobject": {
          "Phone": null,
          "Id": "0018W00002UMYPiQAP",
          "Name": "MakeGreenWorld"
      }
  }


```

