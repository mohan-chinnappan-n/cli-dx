# CSV to PSV convertor

## Input
```
cat fruits.csv

name,qty,store
Mango,100,"NY's fruits"
Apple,200,"NY's fruits"
Peach,300,FL
```

## Run

- [csv2psv.py](./csv2psv.py)

```
python csv2psv.py -i fruits.csv -o fruits.csv.psv
```


## Output

```
cat fruits.csv.psv 

name|qty|store
Mango|100|NY's fruits
Apple|200|NY's fruits
Peach|300|FL
```
