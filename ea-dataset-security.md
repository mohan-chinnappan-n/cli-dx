## EA Dataset security

```
$ sfdx mohanc:ws:rest -f ~/.ea/headers.json -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v51.0/wave/security/coverage/datasets/0Fb3h0000008sAECAY/versions/0Fc3h0000026QMACA2
{
    "datasetVersion": {
        "dataset": {
            "id": "0Fb3h0000008sAECAY",
            "label": "fruit-yield-acct",
            "name": "fruit_yield_acct",
            "url": "/services/data/v51.0/wave/datasets/0Fb3h0000008sAECAY"
        },
        "id": "0Fc3h0000026QMACA2",
        "url": "/services/data/v51.0/wave/datasets/0Fb3h0000008sAECAY/versions/0Fc3h0000026QMACA2"
    },
    "sources": [],
    "url": "/services/data/v51.0/wave/security/coverage/datasets/0Fb3h0000008sAECAY/versions/0Fc3h0000026QMACA2"
}

```

### References
- [Security Coverage Dataset Version Resource](https://developer.salesforce.com/docs/atlas.en-us.bi_dev_guide_rest.meta/bi_dev_guide_rest/bi_resources_security_coverage_dataset_version.htm)


```
$ sfdx mohanc:ws:rest -f ~/.ea/headers.json -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v51.0/wave/security/coverage/objects/Account
{
    "eligibleSharingSource": true,
    "label": "Account",
    "name": "Account",
    "securityFields": [
        "Id"
    ],
    "url": "/services/data/v51.0/wave/security/coverage/objects/Account"
}


```

### References
- [Security Coverage Object Resource](https://developer.salesforce.com/docs/atlas.en-us.bi_dev_guide_rest.meta/bi_dev_guide_rest/bi_resources_security_coverage_object.htm)
