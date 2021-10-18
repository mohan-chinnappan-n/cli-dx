# PlatformEventSubscriberConfig

## Create PlatformEventSubscriberConfig

![pe-1](img/pe-config-1.png)


## View configs

```
cat ./soql/pe.sql
```

```sql
SELECT Id,DeveloperName,BatchSize,PlatformEventConsumerId,UserId FROM PlatformEventSubscriberConfig
```

```
sfdx mohanc:tooling:query -q ~/.soql/pe.soql -u mohan.chinnappan.n_ea2@gmail.com -f json
```


```json
[
    {
        "attributes": {
            "type": "PlatformEventSubscriberConfig",
            "url": "/services/data/v53.0/tooling/sobjects/PlatformEventSubscriberConfig/3JK3h000000000aGAA"
        },
        "Id": "3JK3h000000000aGAA",
        "DeveloperName": "OrderEventTriggerConfig",
        "BatchSize": 200,
        "PlatformEventConsumerId": "01q3h000000zVB1AAM",
        "UserId": "0053h000002xQ5sAAE"
    }
]
```


![pe-2](img/pe-config-2.png)

## Docs
- [Configure the User and Batch Size for Your Platform Event Trigger](https://developer.salesforce.com/docs/atlas.en-us.platform_events.meta/platform_events/platform_events_trigger_config.htm)
- [PlatformEventSubscriberConfig](https://developer.salesforce.com/docs/atlas.en-us.234.0.api_tooling.meta/api_tooling/tooling_api_objects_platformeventsubscriberconfig.htm)
