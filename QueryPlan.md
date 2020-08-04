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
