# How to access ui-api resources

## Get object info for all objects
```
sfdx mohanc:ui:uiapi -u mohan.chinnappan.n_ea2@gmail.com -r object-info > object-info.json

```

- [object-info.json](./object-info.json)

## Get object info for 'Account'
```
sfdx mohanc:ui:uiapi -u mohan.chinnappan.n_ea2@gmail.com -r object-info/Account > object-info_Account.json
```
- [object-info_Account.json](./object-info_Account.json)

## record-ui for a given record
```
sfdx mohanc:ui:uiapi -u mohan.chinnappan.n_ea2@gmail.com -r record-ui/0013h00000FfgB5AAJ > record-ui_0013h00000FfgB5AAJ.json
```

- [record-ui_0013h00000FfgB5AAJ.json](./record-ui_0013h00000FfgB5AAJ.json)


## List views

### List views for Account
```
sfdx mohanc:ui:uiapi -u mohan.chinnappan.n_ea2@gmail.com -r list-records/00B3h000008IZY2EAO > Account_listView.json
```
- [Account_listViews.json](./Account_listViews.json)

![account list views](img/account-listviews.png)

- By using List View API name and get Object list-ui  details

```
sfdx mohanc:ui:uiapi -u mohan.chinnappan.n_ea2@gmail.com -r list-ui/Account            
```
{
    "count": 6,
    "currentPageToken": "0",
    "currentPageUrl": "/services/data/v55.0/ui-api/list-ui/Account?pageSize=20&pageToken=0",
    "eTag": "b8c4426f94b74da80d66b53a8c0e21f7",
    "lists": [
        {
            "apiName": "AllAccounts",
            "id": "00B3h000008IZWAEA4",
            "label": "All Accounts",
            "listUiUrl": "/services/data/v55.0/ui-api/list-ui/Account/AllAccounts"
        },
        {
            "apiName": "MyAccounts",
            "id": "00B3h000008IZYAEA4",
            "label": "My Accounts",
            "listUiUrl": "/services/data/v55.0/ui-api/list-ui/Account/MyAccounts"
        },
        {
            "apiName": "NewLastWeek",
            "id": "00B3h000008IZXYEA4",
            "label": "New Last Week",
            "listUiUrl": "/services/data/v55.0/ui-api/list-ui/Account/NewLastWeek"
        },
        {
            "apiName": "NewThisWeek",
            "id": "00B3h000008IZXNEA4",
            "label": "New This Week",
            "listUiUrl": "/services/data/v55.0/ui-api/list-ui/Account/NewThisWeek"
        },
        {
            "apiName": "PlatinumandGoldSLACustomers",
            "id": "00B3h000008IZXoEAO",
            "label": "Platinum and Gold SLA Customers",
            "listUiUrl": "/services/data/v55.0/ui-api/list-ui/Account/PlatinumandGoldSLACustomers"
        },
        {
            "apiName": "RecentlyViewedAccounts",
            "id": "00B3h000008IZY2EAO",
            "label": "Recently Viewed Accounts",
            "listUiUrl": "/services/data/v55.0/ui-api/list-ui/Account/RecentlyViewedAccounts"
        }
    ],
    "nextPageToken": null,
    "nextPageUrl": null,
    "objectApiName": "Account",
    "pageSize": 20,
    "previousPageToken": null,
    "previousPageUrl": null,
    "queryString": null,
    "recentListsOnly": false
}
```
- using apiName for the list view
```

sfdx mohanc:ui:uiapi -u mohan.chinnappan.n_ea2@gmail.com -r list-ui/Account/AllAccounts
```

### List views records for an  Account list view
```
sfdx mohanc:ui:uiapi -u mohan.chinnappan.n_ea2@gmail.com -r list-records/00B3h000008IZY2EAO > Account_listView.json
```
- [Account_listView.json](./Account_listView.json)
![account-listview-records](img/account-listview-records.png)



