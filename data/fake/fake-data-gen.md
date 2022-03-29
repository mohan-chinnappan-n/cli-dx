# Generating Test Data

## Spec file for data generation

```
cat spec2.json 
```

```csv
{
  "columns": [
    "name.firstName",
    "name.lastName",
    "name.jobArea",
    "phone.phoneNumber",
    "date.weekday",
    "internet.email",
    "random.number",
    "random.uuid",
    "random.word"
  ]
}

```

## Generating
```
sfdx mohanc:data:util:gen:fake -d spec2.json -n 10

```
```
"name.firstName","name.lastName","name.jobArea","phone.phoneNumber","date.weekday","internet.email","random.number","random.uuid","random.word"
"Maverick","Graham","Paradigm","730-979-1203 x14141","Tuesday","Nelson.Schaden34@gmail.com","85347","1f4bc5c3-15c1-4091-99cc-eca5ee06e6a0","architecture"
"Carissa","Morissette","Brand","(912) 975-1323","Thursday","Sandy70@yahoo.com","30727","30a2c45b-e1f7-4014-84cf-d2b51a6c4810","Saint"
"Pinkie","Dach","Factors","(603) 441-8093 x2049","Thursday","Kaylee.Osinski86@hotmail.com","49075","49e3ed75-17fd-4487-bc4d-3512bfa4728d","Loaf"
"Zula","Pfannerstill","Branding","397-340-3478","Tuesday","Jeramy_Steuber21@yahoo.com","22236","3c1cff8d-d0fb-4c18-a5f1-0573898d857b","bypassing"
"Kariane","Corwin","Tactics","546-293-4339 x09105","Wednesday","Edmund99@gmail.com","67200","4ddf3a72-d295-401e-9df4-c57d4a1612d3","Cambridgeshire"
"Jay","Kozey","Mobility","(526) 467-2284 x04040","Friday","Mavis_Brekke27@yahoo.com","86242","55ae7b28-6a3d-46a0-a057-c99ee132785c","Fish"
"Barbara","Kemmer","Program","296.204.5118 x327","Tuesday","Marielle86@yahoo.com","23649","60638db0-6254-4eef-b254-315e0cf59b3b","solid"
"Maye","Steuber","Directives","959.605.8795","Thursday","Kenya51@hotmail.com","41086","d3af95c4-4020-4a68-9cda-b202494abf5b","Granite"
"Jaylin","Aufderhar","Response","1-558-354-4090 x55585","Friday","Adelbert.Nader4@gmail.com","34243","f9175821-0b04-4b1e-9717-49347cb845bd","navigating"
"Alberto","Stanton","Creative","355.618.8884 x894","Sunday","Verda89@hotmail.com","56641","51eb2c96-d2b6-4186-af36-0734011dbb51","gold"

```

![Sample Data](img/genData.png)

## Type of data supported

```
names
addresses
images
animal
vehicle
phone
lorem
internet
git
finance
date
company
commerce
database
datatype
helpers

```

