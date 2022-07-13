# Lead Score sample file creation using DX -  for Einstein Lead Scoring

## Spec file

```
cat ls-spec.json 
```

```json
{
  "columns": [
    "name.firstName",
    "name.lastName",
    "phone.phoneNumber",
    "internet.email",
    "address.zipCode",
    "random.word"
  ]
}
```

## Let us create 10 records 
```
sfdx mohanc:data:util:gen:fake -d ls-spec.json -n 10 
```
```csv
"name.firstName","name.lastName","phone.phoneNumber","internet.email","address.zipCode","random.word"
"Tony","Roberts","609.717.7678 x7590","Maximo3@yahoo.com","78822","Metal"
"Arianna","Wiegand","647.413.4639 x852","Cyril63@yahoo.com","14743-4754","copying"
"Amari","Rogahn","762.851.6543","Mossie.Crona@yahoo.com","15321-3772","Estonia"
"Estefania","Rempel","1-859-251-2085 x61585","Nigel.Gleason@yahoo.com","51550-7441","Dynamic"
"Dovie","Smitham","396-573-4623 x97852","Stefanie_Littel77@gmail.com","63502","Oregon"
"Tod","Parisian","1-250-619-7321","Nestor.Kshlerin11@hotmail.com","87293-1091","transmit"
"Eliane","King","226.467.9034","Richard52@yahoo.com","15837-3836","Costa"
"Zoie","Tremblay","1-809-673-2994","Lindsay39@yahoo.com","94822-4243","back-end"
"Manuel","Bergnaum","740.939.7997 x12033","Magdalen_Hoeger95@gmail.com","15613","payment"
"Nathanial","Daugherty","542-865-1730","Tyshawn85@yahoo.com","82347","Carolina"

```





