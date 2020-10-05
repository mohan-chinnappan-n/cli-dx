# Convert CSV file to pipe-separated-values (PSV) file 

## Input file
```csv
"ID","NAME"
"0013h00000FffwFAAR","Greer122 Inc"
"0013h00000FffwGAAR","Stewart123 Inc"
"0013h00000FffwHAAR","Frank124 Inc"
"0013h00000FffwIAAR","Burke125 Inc"
"0013h00000FffwJAAR","Bates126 Inc"
```

## Command to run

```
$ python csv2psv.py -h

               CSV to PSV converter 
               ------------------- 
               csv2psv.py -i <inputfile> -o <outputfile>

$ python csv2psv.py -i ~/Documents/accounts.csv -o ~/Documents/accounts.psv

```

## output file
```psv

ID|NAME
0013h00000FffwFAAR|Greer122 Inc
0013h00000FffwGAAR|Stewart123 Inc
0013h00000FffwHAAR|Frank124 Inc
0013h00000FffwIAAR|Burke125 Inc
0013h00000FffwJAAR|Bates126 Inc

```

## Script

[source](py/csv2psv.py)
