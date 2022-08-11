# Getting scratch org info using DX

## Query


```
cat ~/.soql/scratchOrg.soql
```

```sql
SELECT
Name ,
IsDeleted,
CreatedDate,
LastViewedDate,
LastReferencedDate,
Edition,
OrgName,
DurationDays 
FROM ScratchOrgInfo

```


```
sfdx mohanc:data:query -q ~/.soql/scratchOrg.soql -u mohan.chinnappan.n_ea2@gmail.com -f json
```

[
    {
        "attributes": {
            "type": "ScratchOrgInfo",
            "url": "/services/data/v55.0/sobjects/ScratchOrgInfo/2SR3h000000LC85GAG"
        },
        "Name": "00000005",
        "IsDeleted": false,
        "CreatedDate": "2022-05-31T11:26:33.000+0000",
        "LastViewedDate": "2022-05-31T11:26:48.000+0000",
        "LastReferencedDate": "2022-05-31T11:26:48.000+0000",
        "Edition": "Developer",
        "OrgName": "mchinnappan company",
        "DurationDays": null
    },
    {
        "attributes": {
            "type": "ScratchOrgInfo",
            "url": "/services/data/v55.0/sobjects/ScratchOrgInfo/2SR3h000000UPVSGA4"
        },
        "Name": "00000006",
        "IsDeleted": false,
        "CreatedDate": "2022-07-30T00:38:06.000+0000",
        "LastViewedDate": "2022-07-30T00:38:23.000+0000",
        "LastReferencedDate": "2022-07-30T00:38:23.000+0000",
        "Edition": "Developer",
        "OrgName": "az-insurance",
        "DurationDays": null
    },
    {
        "attributes": {
            "type": "ScratchOrgInfo",
            "url": "/services/data/v55.0/sobjects/ScratchOrgInfo/2SR3h000000UPVmGAO"
        },
        "Name": "00000007",
        "IsDeleted": false,
        "CreatedDate": "2022-08-04T12:17:39.000+0000",
        "LastViewedDate": "2022-08-04T12:17:53.000+0000",
        "LastReferencedDate": "2022-08-04T12:17:53.000+0000",
        "Edition": "Developer",
        "OrgName": "az-insurance",
        "DurationDays": null
    },
    {
        "attributes": {
            "type": "ScratchOrgInfo",
            "url": "/services/data/v55.0/sobjects/ScratchOrgInfo/2SR3h000000YAvqGAG"
        },
        "Name": "00000002",
        "IsDeleted": false,
        "CreatedDate": "2021-10-26T16:25:30.000+0000",
        "LastViewedDate": null,
        "LastReferencedDate": null,
        "Edition": "Developer",
        "OrgName": "mchinnappan company",
        "DurationDays": null
    },
    {
        "attributes": {
            "type": "ScratchOrgInfo",
            "url": "/services/data/v55.0/sobjects/ScratchOrgInfo/2SR3h000000YAvvGAG"
        },
        "Name": "00000003",
        "IsDeleted": false,
        "CreatedDate": "2021-10-26T16:27:25.000+0000",
        "LastViewedDate": null,
        "LastReferencedDate": null,
        "Edition": "Developer",
        "OrgName": "mchinnappan company",
        "DurationDays": null
    },
    {
        "attributes": {
            "type": "ScratchOrgInfo",
            "url": "/services/data/v55.0/sobjects/ScratchOrgInfo/2SR3h000000YAvlGAG"
        },
        "Name": "00000001",
        "IsDeleted": false,
        "CreatedDate": "2021-10-26T16:24:33.000+0000",
        "LastViewedDate": null,
        "LastReferencedDate": null,
        "Edition": "Developer",
        "OrgName": "mchinnappan company",
        "DurationDays": null
    }
]
```
