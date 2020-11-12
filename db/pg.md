# CLI for Querying Postgres 

## Setup

- Create table customer using psql

```sql
rum1=#CREATE TABLE customer ( 
    phone TEXT, 
    name TEXT, 
    address TEXT, 
    company TEXT, 
    finance INTEGER
);

```

```
rum1# \d customer 
              Table "public.customer"
 Column  |  Type   | Collation | Nullable | Default 
---------+---------+-----------+----------+---------
 phone   | text    |           |          | 
 name    | text    |           |          | 
 address | text    |           |          | 
 company | text    |           |          | 
 finance | integer |           |          | 
```

## Create data 
- [Data generator](https://github.com/mohan-chinnappan-n/cli-dx/blob/master/data-util.md#eaload)

## Load data into customer table 
 COPY customer FROM '/tmp/sampleData.csv' DELIMITER ',' CSV HEADER;
 COPY 10000

rum1=# SELECT COUNT(*) FROM customer ;
 count 
-------
 10000
```

## Query
- Usage
```
$ sfdx mohanc:data:db:pg:query -h
Execute SQL Query on Postgres DB

USAGE
  $ sfdx mohanc:data:db:pg:query

OPTIONS
  -c, --pgconnfilename=pgconnfilename             Postgres DB connection JSON file
  -f, --outputformat=outputformat                 Output format json|csv
  -q, --sqlfilename=sqlfilename                   Input file having SQL query
  --json                                          format output as json
  --loglevel=(trace|debug|info|warn|error|fatal)  logging level for this command invocation

EXAMPLE

       ** Execute SQL Query on Postgres DB **

       sfdx mohanc:data:db:pg:query -q <SQL query File> -c <PG connection JSON file> 

```
- Connection info
```
$ cat ~/.sql/pg.json 
```json
{
  "user": "username",
  "host": "localhost",
  "database": "dbname",
  "password": "yourpassword",
  "port": 5434
}
```

- SQL
```
$ cat ~/.sql/customer.sql
```

```sql
SELECT 
  phone,
  name,
  address,
  company,
  finance
  FROM customer 
  LIMIT 10 
```
- Run query
```

```
```
$ sfdx mohanc:data:db:pg:query -q ~/.sql/customer.sql -c ~/.sql/pg.json -f csv
```
phone,name,address,company,finance
(783) 293-1737 x6657,Sage,North Rheaberg,Schimmel and Sons,48336191
1-896-264-3222,Xavier,West Daren,Kohler - Leannon,76376773
1-899-599-5651,Bonnie,Orenmouth,Grimes - Nitzsche,70665310
797.482.6278,Madison,East Mac,Jerde - Feeney,37384804
494-622-8465 x627,Ciara,Lake Theron,Marvin and Sons,22354412
(639) 322-8947 x557,Darrion,South Mustafa,Russel LLC,30279235
424.419.1106 x00917,Ibrahim,Boscohaven,Mueller - Champlin,69165272
671.498.3532,Ashlynn,Marvinville,Ratke - Labadie,72514112
976.445.4078 x299,Dan,Melanyshire,Pagac Group,1258764
532-326-8613,Estevan,Abdielville,Jerde Inc,73711827
```


