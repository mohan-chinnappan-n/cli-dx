# Listing Metadata type

## Topics
- [List All](#listall)
- [List only the required items](#list)

----

<a name='listall'></a>
## Listing all in a given metadata type

```
cat listall.json
```
```
[]
```

## Let us get all the custom lablels in the org
```
sfdx mohanc:mdapi:ls -u mohan.chinnappan.n.sel@gmail.com -i listall.json -t CustomLabel
```

```
[]
{
    "createdById": "0054x000006Riv4AAC",
    "createdByName": "mohan chinnappan",
    "createdDate": "2022-09-20T20:49:07.000Z",
    "fileName": "labels/CustomLabels.labels",
    "fullName": "Greeting",
    "id": "1014x00000aiRxGAAU",
    "lastModifiedById": "0054x000006Riv4AAC",
    "lastModifiedByName": "mohan chinnappan",
    "lastModifiedDate": "2022-09-20T20:49:07.000Z",
    "manageableState": "unmanaged",
    "type": "CustomLabel"
}


```

---
<a name='list'></a>
#
## List only required ones
```
cat list.json
```

```json
[
  "Account.AllAccounts", "Opportunity.ClosingNextMonth"
]
```


```
sfdx mohanc:mdapi:ls -u mohan.chinnappan.n.sel@gmail.com -i list.json -t ListView    
```

```
[ 'Account.AllAccounts', 'Opportunity.ClosingNextMonth' ]
[
    {
        "fullName": "Account.AllAccounts",
        "filterScope": "Everything",
        "label": "All Accounts"
    },
    {
        "fullName": "Opportunity.ClosingNextMonth",
        "filterScope": "Everything",
        "filters": [
            {
                "field": "OPPORTUNITY.CLOSED",
                "operation": "equals",
                "value": "0"
            },
            {
                "field": "OPPORTUNITY.CLOSE_DATE",
                "operation": "equals",
                "value": "NEXT_MONTH"
            }
        ],
        "label": "Closing Next Month"
    }
]

```
