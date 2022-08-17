# How to view the apex logs in DX

## Run apex
```
sfdx mohanc:tooling:execute -u mohan.chinnappan.n_ea2@gmail.com  -a ~/.apex/test1.cls 
```
```
apexCode:
```

```java
 public with sharing class Teaching {
   public Integer add(Integer a, Integer b) {
     return a + b;
   } 
}
Teaching teach1 = new Teaching();
System.debug('Sum of a and b is ' + teach1.add(10,70)) ;

```

```
compiled?: true
executed?: true
{
  line: -1,
  column: -1,
  compiled: true,
  success: true,
  compileProblem: null,
  exceptionStackTrace: null,
  exceptionMessage: null
}
```

## List the apex logs

```
sfdx force:apex:log:list -u mohan.chinnappan.n_ea2@gmail.com                         
```

```
APPLICATION  DURATION (MS)  ID                  LOCATION   SIZE (B)  LOG USER          OPERATION                                       REQUEST  START TIME                STATUS                               
───────────  ─────────────  ──────────────────  ─────────  ────────  ────────────────  ──────────────────────────────────────────────  ───────  ────────────────────────  ─────────────────────────────────────
Unknown      94             07L3h000009Kf7TEAS  SystemLog  4104      Mohan Chinnappan  /services/data/v55.0/tooling/executeAnonymous/  Api      2022-08-17T00:50:12+0000  Success                              
Unknown      48             07L3h000009Kf7OEAS  SystemLog  4063      Mohan Chinnappan  /services/data/v55.0/tooling/executeAnonymous/  Api      2022-08-17T00:49:51+0000  Attempt to de-reference a null object
Unknown      76             07L3h000009Kf7JEAS  SystemLog  4085      Mohan Chinnappan  /services/data/v55.0/tooling/executeAnonymous/  Api      2022-08-17T00:49:33+0000  Attempt to de-reference a null object

```
