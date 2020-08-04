## How to use DX plugin for getting the query plan

- Requires 0.0.46 version of the plugin
    - sfdx-mohanc-plugins@0.0.46
    - [How to install the plugin](https://mohan-chinnappan-n.github.io/dx/plugins.html#/1)



```
$ sfdx mohanc:data:queryPlan -h
Execute Query Plan for the given SOQL Query

USAGE
  $ sfdx mohanc:data:queryPlan

OPTIONS
  -q, --queryfilename=queryfilename                Input file having SOQL query
  -u, --targetusername=targetusername              username or alias for the target org; overrides default target org
  -v, --targetdevhubusername=targetdevhubusername  username or alias for the dev hub org; overrides default dev hub org
  --apiversion=apiversion                          override the api version used for api requests made by this command
  --json                                           format output as json
  --loglevel=(trace|debug|info|warn|error|fatal)   logging level for this command invocation

EXAMPLE


       ** Execute Query Plan for the given SOQL Query **
      $ sfdx mohanc:data:queryPlan -q /tmp/qp.soql  -u mohan.chinnappan.n_ea2@gmail.com
```

### Query file

``` 
$ cat /tmp/qp.soql 
SELECT Id 
 FROM Account 
 LIMIT 10

```

### Query Plan
```
  $ sfdx mohanc:data:queryPlan -q /tmp/qp.soql  -u mohan.chinnappan.n_ea2@gmail.com

```

### Query Plan Results
- [Query Plan FAQ](https://help.salesforce.com/articleView?id=000334796&type=1&mode=1)
```
{
  plans: [
    {
      cardinality: 10,
      fields: [],
      leadingOperationType: 'Other',
      notes: [Array],
      relativeCost: 0.03333333333333333,
      sobjectCardinality: 1002,
      sobjectType: 'Account'
    },
    {
      cardinality: 501,
      fields: [],
      leadingOperationType: 'TableScan',
      notes: [Array],
      relativeCost: 1.7521666666666669,
      sobjectCardinality: 1002,
      sobjectType: 'Account'
    }
  ],
  sourceQuery: 'SELECT Id \n FROM Account \n LIMIT 10'
}


```
