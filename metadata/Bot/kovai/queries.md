## Label and Names
```
cat kovai.json | jq '.Bot.botMlDomain.label'
"kovai"
```
```
cat kovai.json | jq '.Bot.botMlDomain.name'
"kovai"
```

## Versions
```
cat kovai.json | jq '.Bot.botVersions.fullName'
"v1"
```

## Slots

```
cat kovai.json | jq '.Bot.botMlDomain.mlSlotClasses'
```
```json
{
  "dataType": "Text",
  "description": "Memory size",
  "developerName": "Memory_size",
  "extractionRegex": "[1-9][0-9]*",
  "extractionType": "Pattern",
  "label": "Memory size"
}

```

## Intents
```
 cat kovai.json | jq '.Bot.botMlDomain.mlIntents'
```
```
{
  "developerName": "Transfer_To_Agent",
  "label": "Transfer To Agent"
}
```

## Steps
```
 cat kovai.json | jq '.Bot.botVersions.botDialogs[0].botSteps'
```

```json
[
  {
    "conversationRecordLookup": {
      "SObjectType": "Contact",
      "conditions": {
        "leftOperand": "Contact.LastName",
        "operatorType": "Contains",
        "rightOperandName": "LastName",
        "rightOperandType": "ConversationVariable",
        "sortOrder": 1
      },
      "filterLogic": "And",
      "lookupFields": {
        "fieldName": "Contact.Birthdate"
      },
      "maxLookupResults": 3,
      "targetVariableName": "ListVar"
    },
    "type": "RecordLookup"
  },
  {
    "type": "Wait"
  }
]
```
```
cat kovai.json | jq '.Bot.botVersions.botDialogs[0]'
```

```json
{
  "botSteps": [
    {
      "conversationRecordLookup": {
        "SObjectType": "Contact",
        "conditions": {
          "leftOperand": "Contact.LastName",
          "operatorType": "Contains",
          "rightOperandName": "LastName",
          "rightOperandType": "ConversationVariable",
          "sortOrder": 1
        },
        "filterLogic": "And",
        "lookupFields": {
          "fieldName": "Contact.Birthdate"
        },
        "maxLookupResults": 3,
        "targetVariableName": "ListVar"
      },
      "type": "RecordLookup"
    },
    {
      "type": "Wait"
    }
  ],
  "developerName": "Check_My_Order",
  "label": "Find  Birth Date",
  "showInFooterMenu": false
}

```


```
cat kovai.json | jq '.Bot.botVersions.botDialogs[3]'
```
```json
{
  "botSteps": [
    {
      "botMessages": {
        "message": "Hi, I’m &apos;kovai&apos;, a digital assistant."
      },
      "type": "Message"
    },
    {
      "botNavigation": {
        "botNavigationLinks": {
          "targetBotDialog": "Main_Menu"
        },
        "type": "Redirect"
      },
      "type": "Navigation"
    }
  ],
  "developerName": "Welcome",
  "label": "Welcome",
  "showInFooterMenu": false
}
```
