# Listing Metadata type

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
