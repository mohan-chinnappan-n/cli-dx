##

## Check Manage analytics
```
$ cat soql/ps.soql
```
```sql
SELECT Id, Name, Label FROM PermissionSet WHERE PermissionsInsightsAppAdmin = true
```

```
$ sfdx mohanc:data:query -q soql/ps.soql -u mohan.chinnappan.n_ea2@gmail.com -f json
```
```json
[
    {
        "attributes": {
            "type": "PermissionSet",
            "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000002PwNtGAK"
        },
        "Id": "0PS3h000002PwNtGAK",
        "Name": "X00e61000000hFOWAA2",
        "Label": "00e61000000hFOWAA2"
    },
    {
        "attributes": {
            "type": "PermissionSet",
            "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000002PwNuGAK"
        },
        "Id": "0PS3h000002PwNuGAK",
        "Name": "X00e61000000hFOXAA2",
        "Label": "00e61000000hFOXAA2"
    },
    {
        "attributes": {
            "type": "PermissionSet",
            "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000002PwO7GAK"
        },
        "Id": "0PS3h000002PwO7GAK",
        "Name": "Wave_Analytics_Trailhead_Admin",
        "Label": "Wave Analytics Trailhead Admin"
    },
    {
        "attributes": {
            "type": "PermissionSet",
            "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000001i9aKGAQ"
        },
        "Id": "0PS3h000001i9aKGAQ",
        "Name": "EinsteinAnalyticsPlusAdmin",
        "Label": "Tableau CRM Plus Admin"
    },
    {
        "attributes": {
            "type": "PermissionSet",
            "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000001i9aSGAQ"
        },
        "Id": "0PS3h000001i9aSGAQ",
        "Name": "EinsteinAnalyticsAdmin",
        "Label": "Tableau CRM Platform Admin"
    }
]
```
## Check 

```

$ cat soql/api.soql
SELECT Id,Name, Label FROM PermissionSet WHERE PermissionsApiEnabled = true

```
```
$ sfdx mohanc:data:query -q soql/api.soql -u mohan.chinnappan.n_ea2@gmail.com -f json
```
```json
[
    {
        "attributes": {
            "type": "PermissionSet",
            "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000001XqQMGA0"
        },
        "Id": "0PS3h000001XqQMGA0",
        "Name": "sfdc_chatbot_service_permset",
        "Label": "sfdc.chatbot.service.permset"
    },
    {
        "attributes": {
            "type": "PermissionSet",
            "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000002PwNRGA0"
        },
        "Id": "0PS3h000002PwNRGA0",
        "Name": "sfdc_aiplatform",
        "Label": "AI Platform"
    },
    {
        "attributes": {
            "type": "PermissionSet",
            "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000002PwNSGA0"
        },
        "Id": "0PS3h000002PwNSGA0",
        "Name": "X00e61000000uUXOAA2",
        "Label": "00e61000000uUXOAA2"
    },
    {
        "attributes": {
            "type": "PermissionSet",
            "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000002PwNUGA0"
        },
        "Id": "0PS3h000002PwNUGA0",
        "Name": "X00ex00000018ozm_128_09_04_12_6",
        "Label": "00ex00000018ozm_128_09_04_12_6"
    },
    {
        "attributes": {
            "type": "PermissionSet",
            "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000002PwNYGA0"
        },
        "Id": "0PS3h000002PwNYGA0",
        "Name": "X00ex00000018ozn_128_09_04_12_7",
        "Label": "00ex00000018ozn_128_09_04_12_7"
    },
    {
        "attributes": {
            "type": "PermissionSet",
            "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"
        },
        "Id": "0PS3h000002PwNZGA0",
        "Name": "X00ex00000018ozh_128_09_04_12_1",
        "Label": "00ex00000018ozh_128_09_04_12_1"
    },
    {
        "attributes": {
            "type": "PermissionSet",
            "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000002PwNdGAK"
        },
        "Id": "0PS3h000002PwNdGAK",
        "Name": "X00ex00000018ozp_128_09_04_12_9",
        "Label": "00ex00000018ozp_128_09_04_12_9"
    },
    {
        "attributes": {
            "type": "PermissionSet",
            "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000002PwNeGAK"
        },
        "Id": "0PS3h000002PwNeGAK",
        "Name": "X00ex00000018ozl_128_09_04_12_5",
        "Label": "00ex00000018ozl_128_09_04_12_5"
    },
    {
        "attributes": {
            "type": "PermissionSet",
            "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000002PwNfGAK"
        },
        "Id": "0PS3h000002PwNfGAK",
        "Name": "X00ex00000018ozk_128_09_04_12_4",
        "Label": "00ex00000018ozk_128_09_04_12_4"
    },
    {
        "attributes": {
            "type": "PermissionSet",
            "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000002PwNgGAK"
        },
        "Id": "0PS3h000002PwNgGAK",
        "Name": "X00ex00000018ozq_128_09_04_12_10",
        "Label": "00ex00000018ozq_128_09_04_12_10"
    },
    {
        "attributes": {
            "type": "PermissionSet",
            "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000002PwNkGAK"
        },
        "Id": "0PS3h000002PwNkGAK",
        "Name": "X00ex00000018ozj_128_09_04_12_3",
        "Label": "00ex00000018ozj_128_09_04_12_3"
    },
    {
        "attributes": {
            "type": "PermissionSet",
            "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000002PwNlGAK"
        },
        "Id": "0PS3h000002PwNlGAK",
        "Name": "X00e1a000000MWaEAAW",
        "Label": "00e1a000000MWaEAAW"
    },
    {
        "attributes": {
            "type": "PermissionSet",
            "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000002PwNoGAK"
        },
        "Id": "0PS3h000002PwNoGAK",
        "Name": "X00ex00000018ozo_128_09_04_12_8",
        "Label": "00ex00000018ozo_128_09_04_12_8"
    },
    {
        "attributes": {
            "type": "PermissionSet",
            "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000002PwNtGAK"
        },
        "Id": "0PS3h000002PwNtGAK",
        "Name": "X00e61000000hFOWAA2",
        "Label": "00e61000000hFOWAA2"
    },
    {
        "attributes": {
            "type": "PermissionSet",
            "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000002PwNuGAK"
        },
        "Id": "0PS3h000002PwNuGAK",
        "Name": "X00e61000000hFOXAA2",
        "Label": "00e61000000hFOXAA2"
    },
    {
        "attributes": {
            "type": "PermissionSet",
            "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000002PwNvGAK"
        },
        "Id": "0PS3h000002PwNvGAK",
        "Name": "X00e1a000000MWa8AAG",
        "Label": "00e1a000000MWa8AAG"
    },
    {
        "attributes": {
            "type": "PermissionSet",
            "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000002PwNwGAK"
        },
        "Id": "0PS3h000002PwNwGAK",
        "Name": "X00e1a000000MWaCAAW",
        "Label": "00e1a000000MWaCAAW"
    },
    {
        "attributes": {
            "type": "PermissionSet",
            "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000002PwNxGAK"
        },
        "Id": "0PS3h000002PwNxGAK",
        "Name": "X00e1a000000MWaKAAW",
        "Label": "00e1a000000MWaKAAW"
    },
    {
        "attributes": {
            "type": "PermissionSet",
            "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000002PwNyGAK"
        },
        "Id": "0PS3h000002PwNyGAK",
        "Name": "X00e1a000000MWaMAAW",
        "Label": "00e1a000000MWaMAAW"
    },
    {
        "attributes": {
            "type": "PermissionSet",
            "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000002PwNzGAK"
        },
        "Id": "0PS3h000002PwNzGAK",
        "Name": "X00e1a000000MWaRAAW",
        "Label": "00e1a000000MWaRAAW"
    },
    {
        "attributes": {
            "type": "PermissionSet",
            "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000002PwO0GAK"
        },
        "Id": "0PS3h000002PwO0GAK",
        "Name": "X00e1a000000MWaSAAW",
        "Label": "00e1a000000MWaSAAW"
    },
    {
        "attributes": {
            "type": "PermissionSet",
            "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000002PwO1GAK"
        },
        "Id": "0PS3h000002PwO1GAK",
        "Name": "X00e1a000000MWaTAAW",
        "Label": "00e1a000000MWaTAAW"
    },
    {
        "attributes": {
            "type": "PermissionSet",
            "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000002PwO2GAK"
        },
        "Id": "0PS3h000002PwO2GAK",
        "Name": "X00e1a000000MWaUAAW",
        "Label": "00e1a000000MWaUAAW"
    },
    {
        "attributes": {
            "type": "PermissionSet",
            "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000001i9aLGAQ"
        },
        "Id": "0PS3h000001i9aLGAQ",
        "Name": "C2CHeadlessCMSAccessPermSet",
        "Label": "Salesforce CMS Integration Admin"
    }
]
```

## API enabled

```
$ cat soql/apiEnable.soql

SELECT Id,Name FROM Profile WHERE PermissionsApiEnabled = true

```
```
$ sfdx mohanc:data:query -q soql/apiEnabled.soql -u mohan.chinnappan.n_ea2@gmail.com -f json
```

```json
[
    {
        "attributes": {
            "type": "Profile",
            "url": "/services/data/v51.0/sobjects/Profile/00e3h000001kqJDAAY"
        },
        "Id": "00e3h000001kqJDAAY",
        "Name": "Analytics Cloud Integration User"
    },
    {
        "attributes": {
            "type": "Profile",
            "url": "/services/data/v51.0/sobjects/Profile/00e3h000001kqJFAAY"
        },
        "Id": "00e3h000001kqJFAAY",
        "Name": "Analytics Cloud Security User"
    },
    {
        "attributes": {
            "type": "Profile",
            "url": "/services/data/v51.0/sobjects/Profile/00e3h000001kqJIAAY"
        },
        "Id": "00e3h000001kqJIAAY",
        "Name": "Standard User"
    },
    {
        "attributes": {
            "type": "Profile",
            "url": "/services/data/v51.0/sobjects/Profile/00e3h000001kqJJAAY"
        },
        "Id": "00e3h000001kqJJAAY",
        "Name": "Chatter Free User"
    },
    {
        "attributes": {
            "type": "Profile",
            "url": "/services/data/v51.0/sobjects/Profile/00e3h000001kqJMAAY"
        },
        "Id": "00e3h000001kqJMAAY",
        "Name": "System Administrator"
    },
    {
        "attributes": {
            "type": "Profile",
            "url": "/services/data/v51.0/sobjects/Profile/00e3h000001kqJNAAY"
        },
        "Id": "00e3h000001kqJNAAY",
        "Name": "SalesforceIQ Integration User"
    },
    {
        "attributes": {
            "type": "Profile",
            "url": "/services/data/v51.0/sobjects/Profile/00e3h000001kqJOAAY"
        },
        "Id": "00e3h000001kqJOAAY",
        "Name": "Standard Platform User"
    },
    {
        "attributes": {
            "type": "Profile",
            "url": "/services/data/v51.0/sobjects/Profile/00e3h000001kqJSAAY"
        },
        "Id": "00e3h000001kqJSAAY",
        "Name": "Work.com Only User"
    },
    {
        "attributes": {
            "type": "Profile",
            "url": "/services/data/v51.0/sobjects/Profile/00e3h000001kqJUAAY"
        },
        "Id": "00e3h000001kqJUAAY",
        "Name": "Identity User"
    },
    {
        "attributes": {
            "type": "Profile",
            "url": "/services/data/v51.0/sobjects/Profile/00e3h000001kqJaAAI"
        },
        "Id": "00e3h000001kqJaAAI",
        "Name": "Force.com - App Subscription User"
    },
    {
        "attributes": {
            "type": "Profile",
            "url": "/services/data/v51.0/sobjects/Profile/00e3h000001kqJcAAI"
        },
        "Id": "00e3h000001kqJcAAI",
        "Name": "Partner App Subscription User"
    },
    {
        "attributes": {
            "type": "Profile",
            "url": "/services/data/v51.0/sobjects/Profile/00e3h000001kqJhAAI"
        },
        "Id": "00e3h000001kqJhAAI",
        "Name": "Force.com - Free User"
    },
    {
        "attributes": {
            "type": "Profile",
            "url": "/services/data/v51.0/sobjects/Profile/00e3h000001kqJiAAI"
        },
        "Id": "00e3h000001kqJiAAI",
        "Name": "Solution Manager"
    },
    {
        "attributes": {
            "type": "Profile",
            "url": "/services/data/v51.0/sobjects/Profile/00e3h000001kqJjAAI"
        },
        "Id": "00e3h000001kqJjAAI",
        "Name": "Read Only"
    },
    {
        "attributes": {
            "type": "Profile",
            "url": "/services/data/v51.0/sobjects/Profile/00e3h000001kqJkAAI"
        },
        "Id": "00e3h000001kqJkAAI",
        "Name": "Custom: Sales Profile"
    },
    {
        "attributes": {
            "type": "Profile",
            "url": "/services/data/v51.0/sobjects/Profile/00e3h000001kqJlAAI"
        },
        "Id": "00e3h000001kqJlAAI",
        "Name": "Custom: Marketing Profile"
    },
    {
        "attributes": {
            "type": "Profile",
            "url": "/services/data/v51.0/sobjects/Profile/00e3h000001kqJmAAI"
        },
        "Id": "00e3h000001kqJmAAI",
        "Name": "Custom: Support Profile"
    },
    {
        "attributes": {
            "type": "Profile",
            "url": "/services/data/v51.0/sobjects/Profile/00e3h000001kqJnAAI"
        },
        "Id": "00e3h000001kqJnAAI",
        "Name": "Marketing User"
    },
    {
        "attributes": {
            "type": "Profile",
            "url": "/services/data/v51.0/sobjects/Profile/00e3h000001kqJoAAI"
        },
        "Id": "00e3h000001kqJoAAI",
        "Name": "Contract Manager"
    },
    {
        "attributes": {
            "type": "Profile",
            "url": "/services/data/v51.0/sobjects/Profile/00e3h000001kqJpAAI"
        },
        "Id": "00e3h000001kqJpAAI",
        "Name": "Chatter Moderator User"
    },
    {
        "attributes": {
            "type": "Profile",
            "url": "/services/data/v51.0/sobjects/Profile/00e3h000001kqJqAAI"
        },
        "Id": "00e3h000001kqJqAAI",
        "Name": "Chatter External User"
    }
]
```

## Modify all data
```
$ sfdx mohanc:data:query -q soql/modifyData.soql -u mohan.chinnappan.n_ea2@gmail.com -f json
```

```json
[
    {
        "attributes": {
            "type": "PermissionSet",
            "url": "/services/data/v51.0/sobjects/PermissionSet/0PS3h000002PwNZGA0"
        },
        "Id": "0PS3h000002PwNZGA0",
        "Label": "00ex00000018ozh_128_09_04_12_1",
        "Name": "X00ex00000018ozh_128_09_04_12_1"
    }
]

```

```
$ sfdx mohanc:data:query -q soql/modifyDataProfile.soql -u mohan.chinnappan.n_ea2@gmail.com -f json
```

```json
[
    {
        "attributes": {
            "type": "Profile",
            "url": "/services/data/v51.0/sobjects/Profile/00e3h000001kqJMAAY"
        },
        "Id": "00e3h000001kqJMAAY",
        "Name": "System Administrator"
    }
]

```
