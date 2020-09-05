## Querying CSV files using SQL

- Requires 0.0.55 version of the plugin
    - sfdx-mohanc-plugins@0.0.55
    - [How to install the plugin](https://mohan-chinnappan-n.github.io/dx/plugins.html#/1)

 

### Usage
```
$ sfdx mohanc:data:query:sql  -h
Runs SQL query 

USAGE
  $ sfdx mohanc:data:query:sql

OPTIONS
  -d, --datafilename=datafilename                 Data file
  -q, --sqlfilename=sqlfilename                   SQL Query file
  --json                                          format output as json
  --loglevel=(trace|debug|info|warn|error|fatal)  logging level for this command invocation

EXAMPLE

       ** Runs SQL query  **

       sfdx mohanc:data:sql -q /tmp/q.sql -d data.csv
```
### Demo        
```

$ sfdx mohanc:data:query:sql  -q fruits.sql  -d fruits-yield.csv 
[{"qty":130,"fruit":"apple"}]

$ cat fruits.sql 
SELECT 
    qty,fruit
    FROM ? 
    WHERE qty > 100 
     AND  fruit ='apple'

$ cat fruits-yield.csv 
fruit,date,qty
apple,01/01/2020,30
mango,01/05/2020,78
jackfruit,02/20/2020,70
peach,03/11/2020,2222
apple,01/07/2019,130
mango,01/09/2019,278
jackfruit,02/11/2019,270
peach,03/09/2019,266


```

