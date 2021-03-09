# Using UI-API (LDS is built on top of this) 


## Performs the following:
- Checks field-level security settings, sharing settings, and perms.
- Makes SOQL queries to get record data.
- Gets object metadata and theme information.
- Gets layout information


## Get results for the given record-id
```
sfdx mohanc:ws:rest -f ~/ea/header.json -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v51.0/ui-api/record-ui/0013h00000Ffg1qAAB 

```

- [Result JSON](./0013h00000Ffg1qAAB.json)


## Get the metadata for the given sObject
```
sfdx mohanc:ws:rest -f ~/ea/header.json -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v51.0/ui-api/object-info/Account

```
- [Result JSON](./Account.json)


## Resources
- [Get Started with User Interface API] (https://developer.salesforce.com/docs/atlas.en-us.uiapi.meta/uiapi/ui_api_get_started.htm)
