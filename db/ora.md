# CLI for Querying Oracle 

## Setup

- Create table customer using psql

```sql
CREATE TABLE customer ( 
    name , 
    finance INTEGER
);

```

```
SQL> DESCRIBE customer
 Name					   Null?    Type
 ----------------------------------------- -------- ----------------------------
 NAME						    VARCHAR2(32)
 AMOUNT 					    FLOAT(126)

```


```

## sample data 
```

name,amount
john,100.20
ken,20.30
ritchie,33.43
don,77,29.30
james,80.90

## Load data into customer table  using sqlLoader
```
$ ./sqlldr un/pwd@//localhost:1521/xe control=~/.ora/cusomter_load.ctl log=customer.log
SQL*Loader: Release 19.0.0.0.0 - Production on Thu Nov 12 19:24:59 2020
Version 19.8.0.0.0

Copyright (c) 1982, 2020, Oracle and/or its affiliates.  All rights reserved.

Path used:      Conventional
Commit point reached - logical record count 6

Table CUSTOMER:
  5 Rows successfully loaded.

Check the log file:
  customer.log
for more information about the load.
```

```
SQL> SELECT * FROM customer;

NAME				     AMOUNT
-------------------------------- ----------
john				      100.2
ken				       20.3
ritchie 			      33.43
don					 77
james				       80.9


```

## Query
- Usage
```
$ sfdx mohanc:data:db:ora:query -h
Execute SQL Query on Oracle DB

USAGE
  $ sfdx mohanc:data:db:ora:query

OPTIONS
  -c, --oraconnfilename=oraconnfilename           Oracle DB connection JSON file
  -f, --outputformat=outputformat                 Output format json|csv
  -q, --sqlfilename=sqlfilename                   Input file having SQL query
  --json                                          format output as json
  --loglevel=(trace|debug|info|warn|error|fatal)  logging level for this command invocation

EXAMPLE

       ** Execute SQL Query on Oracle DB **

       sfdx mohanc:data:db:ora:query -q <SQL query File> -c <ORA connection JSON file> -f <Output json|csv>

    
```
- Connection info
```
$ cat ~/.sql/ora.json 
```json

{
    "user"          : "un",
    "password"      : "pwd",
    "connectString" : "localhost:1521/xe"
}
```

- SQL
```
$ cat ~/.sql/customerall.sql
```

```sql

SELECT * FROM customer
```
- Run query

```
sfdx mohanc:data:db:ora:query -q ~/.sql/customerall.sql -c ~/.sql/ora.json -f json
```

```json
[
    {
        "NAME": "john",
        "AMOUNT": 100.2
    },
    {
        "NAME": "ken",
        "AMOUNT": 20.3
    },
    {
        "NAME": "ritchie",
        "AMOUNT": 33.43
    },
    {
        "NAME": "don",
        "AMOUNT": 77
    },
    {
        "NAME": "james",
        "AMOUNT": 80.9
    }
]
```


