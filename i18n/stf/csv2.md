# How to convert CSV file into TSV (Tab Separated Values) or PSV (Pipe Separated Values)

```
cat fruits.csv

name,qty,store
Mango,100,"NY's fruits"
Apple,200,"NY's fruits"
Peach,300,FL
```

## CSV to TSV
```
sfdx mohanc:data:file:csv2 -i fruits.csv -d $'\t'
name	qty	store
Mango	100	NY's fruits
Apple	200	NY's fruits
Peach	300	FL

```

## CSV to PSV 
```
sfdx mohanc:data:file:csv2 -i fruits.csv -d $'|' 

name|qty|store
Mango|100|NY's fruits
Apple|200|NY's fruits
Peach|300|FL

```


