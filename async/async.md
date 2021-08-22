# Asynchronous Apex


```sql


SELECT JobType,ApexClassId,Status,JobItemsProcessed,TotalJobItems,NumberOfErrors,CompletedDate,MethodName,ExtendedStatus,ParentJobId,LastProcessedOffset FROM AsyncApexJob

```


```java

public class AsyncExecutionExample implements Queueable {
    public void execute(QueueableContext context) {
        Account a = new Account(Name='Acme',Phone='(415) 555-1212');
        insert a;        
    }
}

```

```java

ID jobID = System.enqueueJob(new AsyncExecutionExample());

```

## Query Results
![Query Results](./img/async-query-1.png)

```
sfdx mohanc:data:query -q ~/.query/async-jobs.soql -u mohan.chinnappan.n_ea2@gmail.com -f json
```

```json
[
    {
        "attributes": {
            "type": "AsyncApexJob",
            "url": "/services/data/v52.0/sobjects/AsyncApexJob/7073h00003FpnaqAAB"
        },
        "JobType": "Queueable",
        "ApexClassId": "01p3h00000FbzbOAAR",
        "Status": "Completed",
        "JobItemsProcessed": 0,
        "TotalJobItems": 0,
        "NumberOfErrors": 0,
        "CompletedDate": "2021-08-22T00:40:23.000+0000",
        "MethodName": null,
        "ExtendedStatus": null,
        "ParentJobId": null,
        "LastProcessedOffset": null
    }
]

```

``` 
cat ~/.query/async-jobs.soql
```
```sql
 SELECT JobType,ApexClassId,Status,JobItemsProcessed,TotalJobItems,NumberOfErrors,CompletedDate,MethodName,ExtendedStatus,ParentJobId,LastProcessedOffset FROM AsyncApexJob

```

## Checking the job results

```
sfdx mohanc:data:query -q ~/.query/account-added.soql -u mohan.chinnappan.n_ea2@gmail.com -f json 
```

```json
[
    {
        "attributes": {
            "type": "Account",
            "url": "/services/data/v52.0/sobjects/Account/0013h00000FfgCMAAZ"
        },
        "Name": "Acme",
        "Phone": null
    },
    {
        "attributes": {
            "type": "Account",
            "url": "/services/data/v52.0/sobjects/Account/0013h00001C1KE0AAN"
        },
        "Name": "Acme",
        "Phone": "(415) 555-1212"
    }
]


```


```
cat ~/.query/account-added.soql
```

```sql
SELECT Name, PHONE
FROM Account 
WHERE Name ='Acme'
```
