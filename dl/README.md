# CSV to PSV to CSV

## Topics
- [Convert CSV file to pipe-separated-values (PSV) file](#csv2psv)


<a name="csv2psv"></a>
## Convert CSV file to pipe-separated-values (PSV) file 


### Input file
```csv
"ID","NAME"
"0013h00000FffwFAAR","Greer122 Inc"
"0013h00000FffwGAAR","Stewart123 Inc"
"0013h00000FffwHAAR","Frank124 Inc"
"0013h00000FffwIAAR","Burke125 Inc"
"0013h00000FffwJAAR","Bates126 Inc"
```

### Command to run

```
$ python csv2psv.py -h

               CSV to PSV converter 
               ------------------- 
               csv2psv.py -i <inputfile> -o <outputfile>

$ python csv2psv.py -i ~/Documents/accounts.csv -o ~/Documents/accounts.psv

```
### output file

```psv

ID|NAME
0013h00000FffwFAAR|Greer122 Inc
0013h00000FffwGAAR|Stewart123 Inc
0013h00000FffwHAAR|Frank124 Inc
0013h00000FffwIAAR|Burke125 Inc
0013h00000FffwJAAR|Bates126 Inc

```

### Script

[source](py/csv2psv.py)


<a name="psv2csv"></a>
## Convert PSV file to CSV file 


### input file
```psv

ID|NAME
0013h00000FffwFAAR|Greer122, Inc
0013h00000FffwGAAR|Stewart123, Inc
0013h00000FffwHAAR|Frank124 Inc
0013h00000FffwIAAR|Burke125 Inc
0013h00000FffwJAAR|Bates126 Inc
```

### Command to run

```
$ python psv2csv.py -h

               PSV to CSV converter 
               ------------------- 
               psv2cpsv.py -i <inputfile> -o <outputfile>

$ python psv2csv.py -i ~/Documents/accounts.psv -o ~/Documents/accounts_out.csv

```
### output file

```csv


ID,NAME
0013h00000FffwFAAR,"Greer122, Inc"
0013h00000FffwGAAR,"Stewart123, Inc"
0013h00000FffwHAAR,Frank124 Inc
0013h00000FffwIAAR,Burke125 Inc
0013h00000FffwJAAR,Bates126 Inc
```

### Script

[source](py/psv2csv.py)
