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

## Get the details of the given log item : 07L3h000009Kf7TEAS

```
sfdx force:apex:log:get  -u mohan.chinnappan.n_ea2@gmail.com  -i 07L3h000009Kf7TEAS
```

```
55.0 APEX_CODE,FINEST;APEX_PROFILING,INFO;CALLOUT,INFO;DB,INFO;NBA,INFO;SYSTEM,DEBUG;VALIDATION,INFO;VISUALFORCE,INFO;WAVE,INFO;WORKFLOW,INFO
Execute Anonymous: public with sharing class Teaching {
Execute Anonymous: 
Execute Anonymous:    public  Integer add(Integer a, Integer b) {
Execute Anonymous:      return a + b;
Execute Anonymous:    } 
Execute Anonymous: 
Execute Anonymous: 
Execute Anonymous: }
Execute Anonymous: 
Execute Anonymous: Teaching teach1 = new Teaching();
Execute Anonymous: 
Execute Anonymous: System.debug('Sum of a and b is ' + teach1.add(10,20)) ;
17:50:12.1 (1894895)|USER_INFO|[EXTERNAL]|0053h000002xQ5s|mohan.chinnappan.n_ea2@gmail.com|(GMT-07:00) Pacific Daylight Time (America/Los_Angeles)|GMT-07:00
17:50:12.1 (1941701)|EXECUTION_STARTED
17:50:12.1 (1951010)|CODE_UNIT_STARTED|[EXTERNAL]|execute_anonymous_apex
17:50:12.1 (2768007)|VARIABLE_SCOPE_BEGIN|[10]|teach1|Teaching|true|false
17:50:12.1 (3192484)|HEAP_ALLOCATE|[79]|Bytes:3
17:50:12.1 (3286633)|HEAP_ALLOCATE|[84]|Bytes:152
17:50:12.1 (3314921)|HEAP_ALLOCATE|[399]|Bytes:408
17:50:12.1 (3342517)|HEAP_ALLOCATE|[412]|Bytes:408
17:50:12.1 (3367507)|HEAP_ALLOCATE|[520]|Bytes:48
17:50:12.1 (3411819)|HEAP_ALLOCATE|[139]|Bytes:6
17:50:12.1 (3453805)|HEAP_ALLOCATE|[EXTERNAL]|Bytes:5
17:50:12.1 (3623601)|STATEMENT_EXECUTE|[1]
17:50:12.1 (3627554)|STATEMENT_EXECUTE|[10]
17:50:12.1 (3664340)|HEAP_ALLOCATE|[10]|Bytes:1
17:50:12.1 (32741445)|HEAP_ALLOCATE|[10]|Bytes:4
17:50:12.1 (32943129)|HEAP_ALLOCATE|[52]|Bytes:5
17:50:12.1 (33008823)|HEAP_ALLOCATE|[58]|Bytes:5
17:50:12.1 (33119262)|HEAP_ALLOCATE|[66]|Bytes:7
17:50:12.1 (33270953)|SYSTEM_MODE_ENTER|false
17:50:12.1 (33377418)|HEAP_ALLOCATE|[10]|Bytes:5
17:50:12.1 (33654442)|VARIABLE_SCOPE_BEGIN|[1]|this|Teaching|true|false
17:50:12.1 (35017356)|VARIABLE_ASSIGNMENT|[1]|this|{}|0x4c839645
17:50:12.1 (35070305)|HEAP_ALLOCATE|[EXTERNAL]|Bytes:5
17:50:12.1 (35093876)|HEAP_ALLOCATE|[EXTERNAL]|Bytes:6
17:50:12.1 (38182174)|STATEMENT_EXECUTE|[1]
17:50:12.1 (38215893)|HEAP_ALLOCATE|[EXTERNAL]|Bytes:5
17:50:12.1 (38464659)|SYSTEM_MODE_EXIT|false
17:50:12.1 (38729795)|VARIABLE_ASSIGNMENT|[10]|teach1|{}|0x4c839645
17:50:12.1 (38747243)|STATEMENT_EXECUTE|[12]
17:50:12.1 (38760438)|HEAP_ALLOCATE|[12]|Bytes:18
17:50:12.1 (38947980)|SYSTEM_MODE_ENTER|false
17:50:12.1 (38976389)|HEAP_ALLOCATE|[12]|Bytes:5
17:50:12.1 (40483097)|METHOD_ENTRY|[12]||Teaching.add(Integer, Integer)
17:50:12.1 (41155479)|VARIABLE_SCOPE_BEGIN|[3]|this|Teaching|true|false
17:50:12.1 (41921806)|VARIABLE_ASSIGNMENT|[3]|this|{}|0x4c839645
17:50:12.1 (41951383)|VARIABLE_SCOPE_BEGIN|[3]|a|Integer|false|false
17:50:12.1 (42190654)|VARIABLE_ASSIGNMENT|[3]|a|10
17:50:12.1 (42211091)|VARIABLE_SCOPE_BEGIN|[3]|b|Integer|false|false
17:50:12.1 (42287061)|VARIABLE_ASSIGNMENT|[3]|b|20
17:50:12.1 (42330829)|HEAP_ALLOCATE|[4]|Bytes:5
17:50:12.1 (42346404)|STATEMENT_EXECUTE|[3]
17:50:12.1 (42350109)|STATEMENT_EXECUTE|[4]
17:50:12.1 (42361337)|HEAP_ALLOCATE|[4]|Bytes:4
17:50:12.1 (42529362)|METHOD_EXIT|[12]||Teaching.add(Integer, Integer)
17:50:12.1 (42549792)|HEAP_ALLOCATE|[12]|Bytes:4
17:50:12.1 (42559785)|SYSTEM_MODE_EXIT|false
17:50:12.1 (42657810)|HEAP_ALLOCATE|[12]|Bytes:2
17:50:12.1 (42688832)|HEAP_ALLOCATE|[12]|Bytes:20
17:50:12.1 (42852492)|USER_DEBUG|[12]|DEBUG|Sum of a and b is 30
17:50:12.43 (43390311)|CUMULATIVE_LIMIT_USAGE
17:50:12.43 (43390311)|LIMIT_USAGE_FOR_NS|(default)|
  Number of SOQL queries: 0 out of 100
  Number of query rows: 0 out of 50000
  Number of SOSL queries: 0 out of 20
  Number of DML statements: 0 out of 150
  Number of Publish Immediate DML: 0 out of 150
  Number of DML rows: 0 out of 10000
  Maximum CPU time: 0 out of 10000
  Maximum heap size: 0 out of 6000000
  Number of callouts: 0 out of 100
  Number of Email Invocations: 0 out of 10
  Number of future calls: 0 out of 50
  Number of queueable jobs added to the queue: 0 out of 50
  Number of Mobile Apex push calls: 0 out of 10

17:50:12.43 (43390311)|CUMULATIVE_LIMIT_USAGE_END

17:50:12.1 (43769326)|CODE_UNIT_FINISHED|execute_anonymous_apex
17:50:12.1 (43795901)|EXECUTION_FINISHED
```

## tail the active log

```
sfdx force:apex:log:tail  -u mohan.chinnappan.n_ea2@gmail.com    
```

```
55.0 APEX_CODE,FINEST;APEX_PROFILING,INFO;CALLOUT,INFO;DB,INFO;NBA,INFO;SYSTEM,DEBUG;VALIDATION,INFO;VISUALFORCE,FINER;WAVE,INFO;WORKFLOW,INFO
Execute Anonymous: public with sharing class Teaching {
Execute Anonymous:    public Integer add(Integer a, Integer b) {
Execute Anonymous:      return a + b;
Execute Anonymous:    } 
Execute Anonymous: }
Execute Anonymous: Teaching teach1 = new Teaching();
Execute Anonymous: System.debug('Sum of a and b is ' + teach1.add(10,70)) ;
18:02:58.10 (10205463)|USER_INFO|[EXTERNAL]|0053h000002xQ5s|mohan.chinnappan.n_ea2@gmail.com|(GMT-07:00) Pacific Daylight Time (America/Los_Angeles)|GMT-07:00
18:02:58.10 (10257357)|EXECUTION_STARTED
18:02:58.10 (10266422)|CODE_UNIT_STARTED|[EXTERNAL]|execute_anonymous_apex
18:02:58.10 (11476394)|VARIABLE_SCOPE_BEGIN|[6]|teach1|Teaching|true|false
18:02:58.10 (12129842)|HEAP_ALLOCATE|[79]|Bytes:3
18:02:58.10 (12275785)|HEAP_ALLOCATE|[84]|Bytes:152
18:02:58.10 (12316803)|HEAP_ALLOCATE|[399]|Bytes:408
18:02:58.10 (12397044)|HEAP_ALLOCATE|[412]|Bytes:408
18:02:58.10 (12434554)|HEAP_ALLOCATE|[520]|Bytes:48
18:02:58.10 (12519715)|HEAP_ALLOCATE|[139]|Bytes:6
18:02:58.10 (12578612)|HEAP_ALLOCATE|[EXTERNAL]|Bytes:3
18:02:58.10 (12861556)|STATEMENT_EXECUTE|[1]
18:02:58.10 (12897900)|STATEMENT_EXECUTE|[6]
18:02:58.10 (13229123)|HEAP_ALLOCATE|[6]|Bytes:1
18:02:58.10 (13310813)|HEAP_ALLOCATE|[6]|Bytes:4
18:02:58.10 (13514727)|HEAP_ALLOCATE|[52]|Bytes:5
18:02:58.10 (13657308)|HEAP_ALLOCATE|[58]|Bytes:5
18:02:58.10 (13691959)|HEAP_ALLOCATE|[66]|Bytes:7
18:02:58.10 (13760976)|SYSTEM_MODE_ENTER|false
18:02:58.10 (13828901)|HEAP_ALLOCATE|[6]|Bytes:5
18:02:58.10 (14176805)|VARIABLE_SCOPE_BEGIN|[1]|this|Teaching|true|false
18:02:58.10 (15243946)|VARIABLE_ASSIGNMENT|[1]|this|{}|0x75787971
18:02:58.10 (15304949)|HEAP_ALLOCATE|[EXTERNAL]|Bytes:5
18:02:58.10 (15335431)|HEAP_ALLOCATE|[EXTERNAL]|Bytes:6
18:02:58.10 (20243237)|STATEMENT_EXECUTE|[1]
18:02:58.10 (20299367)|HEAP_ALLOCATE|[EXTERNAL]|Bytes:5
18:02:58.10 (20501271)|SYSTEM_MODE_EXIT|false
18:02:58.10 (23462428)|VARIABLE_ASSIGNMENT|[6]|teach1|{}|0x75787971
18:02:58.10 (23507766)|STATEMENT_EXECUTE|[7]
18:02:58.10 (23530723)|HEAP_ALLOCATE|[7]|Bytes:18
18:02:58.10 (23645461)|SYSTEM_MODE_ENTER|false
18:02:58.10 (23676789)|HEAP_ALLOCATE|[7]|Bytes:5
18:02:58.10 (23999832)|METHOD_ENTRY|[7]||Teaching.add(Integer, Integer)
18:02:58.10 (24126324)|VARIABLE_SCOPE_BEGIN|[2]|this|Teaching|true|false
18:02:58.10 (26721007)|VARIABLE_ASSIGNMENT|[2]|this|{}|0x75787971
18:02:58.10 (26833274)|VARIABLE_SCOPE_BEGIN|[2]|a|Integer|false|false
18:02:58.10 (27038642)|VARIABLE_ASSIGNMENT|[2]|a|10
18:02:58.10 (27078518)|VARIABLE_SCOPE_BEGIN|[2]|b|Integer|false|false
18:02:58.10 (29964058)|VARIABLE_ASSIGNMENT|[2]|b|70
18:02:58.10 (30056028)|HEAP_ALLOCATE|[3]|Bytes:5
18:02:58.10 (30084773)|STATEMENT_EXECUTE|[2]
18:02:58.10 (30090864)|STATEMENT_EXECUTE|[3]
18:02:58.10 (30107752)|HEAP_ALLOCATE|[3]|Bytes:4
18:02:58.10 (30242840)|METHOD_EXIT|[7]||Teaching.add(Integer, Integer)
18:02:58.10 (30361318)|HEAP_ALLOCATE|[7]|Bytes:4
18:02:58.10 (30391786)|SYSTEM_MODE_EXIT|false
18:02:58.10 (30521756)|HEAP_ALLOCATE|[7]|Bytes:2
18:02:58.10 (30586338)|HEAP_ALLOCATE|[7]|Bytes:20
18:02:58.10 (30642848)|USER_DEBUG|[7]|DEBUG|Sum of a and b is 80
18:02:58.30 (30742359)|CUMULATIVE_LIMIT_USAGE
18:02:58.30 (30742359)|LIMIT_USAGE_FOR_NS|(default)|
  Number of SOQL queries: 0 out of 100
  Number of query rows: 0 out of 50000
  Number of SOSL queries: 0 out of 20
  Number of DML statements: 0 out of 150
  Number of Publish Immediate DML: 0 out of 150
  Number of DML rows: 0 out of 10000
  Maximum CPU time: 0 out of 10000
  Maximum heap size: 0 out of 6000000
  Number of callouts: 0 out of 100
  Number of Email Invocations: 0 out of 10
  Number of future calls: 0 out of 50
  Number of queueable jobs added to the queue: 0 out of 50
  Number of Mobile Apex push calls: 0 out of 10

18:02:58.30 (30742359)|CUMULATIVE_LIMIT_USAGE_END

18:02:58.10 (30931988)|CODE_UNIT_FINISHED|execute_anonymous_apex
18:02:58.10 (30964834)|EXECUTION_FINISHED
```

## Apex Replay Debugger for Visual Studio Code
- Apex Replay Debugger simulates a live debugging session using a debug log that is a recording of all interactions in a transaction.
- Presents the logged information similarly to an interactive debugger, so you can debug your Apex code. 
- [Install from MarketPlace](https://marketplace.visualstudio.com/items?itemName=salesforce.salesforcedx-vscode-apex-replay-debugger)
- [Video: Platform Services: Apex Replay Debugger](https://www.youtube.com/watch?v=8GVuMT4MHWc)
