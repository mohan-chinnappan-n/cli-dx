## loadLarge example
```
$ cat ~/.ea/fruits2.csv
Name,Locaton,Weight
apple,MA,10.2
"Magic ""Fruit"" ",FL,70.38
```


```
$ sfdx mohanc:ea:dataset:loadLarge  -u mohan.chinnappan.n_ea2@gmail.com -d ~/.ea/fruits2.csv -c 2 -a SampleFruitData
=== Finding the data types based on the sample data ...
[ 'Name', 'Locaton', 'Weight' ]
[ 'apple', 'MA', '10.2' ]
[
  {
    fullyQualifiedName: 'SampleFruitData.Name',
    label: 'Name',
    name: 'Name',
    isSystemField: false,
    isUniqueId: false,
    isMultiValue: false,
    multiValueSeparator: 'null',
    type: 'Text'
  },
  {
    fullyQualifiedName: 'SampleFruitData.Locaton',
    label: 'Locaton',
    name: 'Locaton',
    isSystemField: false,
    isUniqueId: false,
    isMultiValue: false,
    multiValueSeparator: 'null',
    type: 'Text'
  },
  {
    fullyQualifiedName: 'SampleFruitData.Weight',
    label: 'Weight',
    name: 'Weight',
    isSystemField: false,
    isUniqueId: false,
    type: 'Numeric',
    defaultValue: '0',
    precision: 18,
    scale: 1
  }
]
=== Preparing for the loading chunkSize: 2097152 ...
{ id: '06V3h0000006NK0EAM', success: true, errors: [] }
=== Loading part 1 of size: 84 ...
=== Loading Complete.
Going to process...

Done.
Time taken: 20.338 seconds
open https://mohansun-ea-02-dev-ed.my.salesforce.com/analytics/dataManager in a web browser to view this job

```

![load Large example](img/loadLarge-2.png)
