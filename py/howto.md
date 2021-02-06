# Python script to reorder CSV file columns


## Inputs
```
$ cat cols.txt 
City,Name,State,Age
```

```
$ cat in.csv 
Name,Age,City,State
Ken Thompson,78,Boston,MA
Dennis Ritchie,75,New York,NY
Johnny Seed,87,Nashua,NH
```

## Script

### Usage
```
$ python3 csv_col_reorder.py in.csv -h
usage: csv_col_reorder.py [-h] i c o

Reorder columns in the given CSV file

positional arguments:
  i           Input CSV File
  c           File with the columns needed
  o           Output CSV File

optional arguments:
  -h, --help  show this help message and exit
```
### Demo

```
$ python csv_col_reorder.py in.csv cols.txt output.csv
```

## Output

```
$ cat output.csv 
City,Name,State,Age
Boston,Ken Thompson,MA,78
New York,Dennis Ritchie,NY,75
Nashua,Johnny Seed,NH,87
```
## Download
- [csv_col_reorder.py](https://github.com/mohan-chinnappan-n/cli-dx/blob/master/py/csv_col_reorder.py)
