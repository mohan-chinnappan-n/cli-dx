## Platform Events  utils with DX

- Login
```
$ sfdx force:auth:web:login 
Successfully authorized mohan.chinnappan.n_ea2@gmail.com with org ID 00D3h000007R1LuEAK
You may now close the browser

# create header.json
sfdx mohanc:hello:myorg -u mohan.chinnappan.n_ea2@gmail.com  > header.json 

```
- Publish a Platform Event *Notification__e*

- [Refer Platform Events Slides for the setup](https://mohan-chinnappan-n.github.io/sfdc/pevents.html#/6)
- [Setting up Process Builder to Subscribe the Event message](https://mohan-chinnappan-n.github.io/sfdc/pevents.html#/18) 
```
$ sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/sobjects/Notification__e  -m POST -f header.json -d pe_msg.json 
{
    "id": "e00xx0000000001AAA",
    "success": true,
    "errors": [
        {
            "statusCode": "OPERATION_ENQUEUED",
            "message": "6da65473-8293-4d5a-a3a6-9522b4037e5f",
            "fields": []
        }
    ]
}

$ cat pe_msg.json 
{ "message__c": "Power Off"}

```
        
<img src='img/pe-pwr-down.png' alt ='PE subscribe process builder email-alert' width='400'/>


### Query EventBusSubscriber

```
sfdx mohanc:data:query -q eventbus.query.soql -u mohan.chinnappan.n_ea2@gmail.com   | sed -e 's/""/"/g' | sed -e 's/"//g'
attributes,Id,ExternalId,Name,Type,Topic,Position,Tip,Retries,LastError,Status
{type:EventBusSubscriber,url:/services/data/v49.0/sobjects/EventBusSubscriber/3013h000000QhUM},000000000000000AAA,3013h000000QhUM,TemperatureMonitor,,Notification__e,102845,-1,0,,Running

$ cat eventbus.query.soql 
SELECT
    Id,
    ExternalId,
    Name,
    Type,
    Topic,
    Position,
    Tip,
    Retries,
    LastError,
    Status

FROM 
EventBusSubscriber
```
