# Error Handling in LWC

## Apex
- [Exception Class and Built-In Exceptions](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_classes_exception_methods.htm)
- Unhanlded errors - sent to client


## Execute apex using CLI

### Apex code
```java

public with sharing class Teaching {

   public Integer add(Integer a, Integer b) {
     return a + b;
   } 


}

Teaching teach1 = new Teaching();

System.debug('Sum of a and b is ' + teach1.add(10,70)) ;

```

### Execute

```
sfdx  mohanc:tooling:execute -u mohan.chinnappan.n_ea2@gmail.com -a  ~/.apex/test1.cls 
```

```
apexCode: public with sharing class Teaching {

   public Integer add(Integer a, Integer b) {
     return a + b;
   } 


}

Teaching teach1 = new Teaching();

System.debug('Sum of a and b is ' + teach1.add(10,70)) ;

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
## Get Logs

```
cat ~/.soql/apexlog.soql 
```

```

SELECT

Application,
DurationMilliseconds,
Location,
LogLength,
LogUserId,
Operation,
Request,
RequestIdentifier,

StartTime,
Status

FROM ApexLog
```

### Run apexLog query
```
 sfdx  mohanc:tooling:query  -u mohan.chinnappan.n_ea2@gmail.com -q  ~/.soql/apexlog.soql
```

```
"attributes","Application","DurationMilliseconds","Location","LogLength","LogUserId","Operation","Request","RequestIdentifier","StartTime","Status"
"{""type"":""ApexLog"",""url"":""/services/data/v55.0/tooling/sobjects/ApexLog/07L3h000009JRhLEAW""}","Unknown",518,"SystemLog",4061,"0053h000002xQ5sAAE","/services/data/v55.0/tooling/executeAnonymous/","Api","SLB:15015f1a49ebcd4e028d92e0cc0681e8","2022-06-28T02:45:22.000+0000","Success"
"{""type"":""ApexLog"",""url"":""/services/data/v55.0/tooling/sobjects/ApexLog/07L3h000009JRhQEAW""}","Unknown",364,"SystemLog",4063,"0053h000002xQ5sAAE","/services/data/v55.0/tooling/executeAnonymous/","Api","SLB:09190c2b0b8f311b8c273e85f5e7c302","2022-06-28T02:50:11.000+0000","Attempt to de-reference a null object"
"{""type"":""ApexLog"",""url"":""/services/data/v55.0/tooling/sobjects/ApexLog/07L3h000009JRhpEAG""}","Unknown",2795,"SystemLog",4068,"0053h000002xQ5sAAE","/services/data/v55.0/tooling/executeAnonymous","Api","SLB:1525e7f0217ceb649f22ed56eebc29bd","2022-06-28T02:53:38.000+0000","Success"
"{""type"":""ApexLog"",""url"":""/services/data/v55.0/tooling/sobjects/ApexLog/07L3h000009JRi4EAG""}","Unknown",452,"SystemLog",4060,"0053h000002xQ5sAAE","/services/data/v55.0/tooling/executeAnonymous","Api","SLB:e524dc576180af2273c24ebe994313da","2022-06-28T02:53:55.000+0000","Success"

```

## Read log for this execution -07L3h000009JRhpEAG

```
sfdx mohanc:ws:rest -r  https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v55.0/tooling/sobjects/ApexLog/07L3h000009JRi4EAG/Body  -f ~/.orgs/ea2.json  -m GET
```

```
55.0 APEX_CODE,FINEST;APEX_PROFILING,INFO;CALLOUT,INFO;DB,INFO;NBA,INFO;SYSTEM,DEBUG;VALIDATION,INFO;VISUALFORCE,INFO;WAVE,INFO;WORKFLOW,INFO
Execute Anonymous: public with sharing class Teaching {
Execute Anonymous: 
Execute Anonymous:    public Integer add(Integer a, Integer b) {
Execute Anonymous:      return a + b;
Execute Anonymous:    } 
Execute Anonymous: 
Execute Anonymous: 
Execute Anonymous: }
Execute Anonymous: 
Execute Anonymous: Teaching teach1 = new Teaching();
Execute Anonymous: 
Execute Anonymous: System.debug('Sum of a and b is ' + teach1.add(10,70)) ;
19:53:55.1 (1719392)|USER_INFO|[EXTERNAL]|0053h000002xQ5s|mohan.chinnappan.n_ea2@gmail.com|(GMT-07:00) Pacific Daylight Time (America/Los_Angeles)|GMT-07:00
19:53:55.1 (1774661)|EXECUTION_STARTED
19:53:55.1 (1784352)|CODE_UNIT_STARTED|[EXTERNAL]|execute_anonymous_apex
19:53:55.1 (2363156)|VARIABLE_SCOPE_BEGIN|[10]|teach1|Teaching|true|false
19:53:55.1 (2703532)|HEAP_ALLOCATE|[79]|Bytes:3
19:53:55.1 (2792566)|HEAP_ALLOCATE|[84]|Bytes:152
19:53:55.1 (2811710)|HEAP_ALLOCATE|[399]|Bytes:408
19:53:55.1 (2830652)|HEAP_ALLOCATE|[412]|Bytes:408
19:53:55.1 (2845103)|HEAP_ALLOCATE|[520]|Bytes:48
19:53:55.1 (2875078)|HEAP_ALLOCATE|[139]|Bytes:6
19:53:55.1 (2933658)|HEAP_ALLOCATE|[EXTERNAL]|Bytes:5
19:53:55.1 (3069968)|STATEMENT_EXECUTE|[1]
19:53:55.1 (3076512)|STATEMENT_EXECUTE|[10]
19:53:55.1 (3083121)|HEAP_ALLOCATE|[10]|Bytes:1
19:53:55.1 (3104409)|HEAP_ALLOCATE|[10]|Bytes:4
19:53:55.1 (3190108)|HEAP_ALLOCATE|[52]|Bytes:5
19:53:55.1 (3226600)|HEAP_ALLOCATE|[58]|Bytes:5
19:53:55.1 (3235254)|HEAP_ALLOCATE|[66]|Bytes:7
19:53:55.1 (3264548)|SYSTEM_MODE_ENTER|false
19:53:55.1 (3309933)|HEAP_ALLOCATE|[10]|Bytes:5
19:53:55.1 (3441128)|VARIABLE_SCOPE_BEGIN|[1]|this|Teaching|true|false
19:53:55.1 (3715286)|VARIABLE_ASSIGNMENT|[1]|this|{}|0x26317223
19:53:55.1 (3742112)|HEAP_ALLOCATE|[EXTERNAL]|Bytes:5
19:53:55.1 (3756548)|HEAP_ALLOCATE|[EXTERNAL]|Bytes:6
19:53:55.1 (5672278)|STATEMENT_EXECUTE|[1]
19:53:55.1 (5688133)|HEAP_ALLOCATE|[EXTERNAL]|Bytes:5
19:53:55.1 (5756297)|SYSTEM_MODE_EXIT|false
19:53:55.1 (6117109)|VARIABLE_ASSIGNMENT|[10]|teach1|{}|0x26317223
19:53:55.1 (6137980)|STATEMENT_EXECUTE|[12]
19:53:55.1 (6146085)|HEAP_ALLOCATE|[12]|Bytes:18
19:53:55.1 (6205826)|SYSTEM_MODE_ENTER|false
19:53:55.1 (6225319)|HEAP_ALLOCATE|[12]|Bytes:5
19:53:55.1 (6310342)|METHOD_ENTRY|[12]||Teaching.add(Integer, Integer)
19:53:55.1 (6369338)|VARIABLE_SCOPE_BEGIN|[3]|this|Teaching|true|false
19:53:55.1 (6467092)|VARIABLE_ASSIGNMENT|[3]|this|{}|0x26317223
19:53:55.1 (6486469)|VARIABLE_SCOPE_BEGIN|[3]|a|Integer|false|false
19:53:55.1 (6553410)|VARIABLE_ASSIGNMENT|[3]|a|10
19:53:55.1 (6562066)|VARIABLE_SCOPE_BEGIN|[3]|b|Integer|false|false
19:53:55.1 (6622118)|VARIABLE_ASSIGNMENT|[3]|b|70
19:53:55.1 (6638822)|HEAP_ALLOCATE|[4]|Bytes:5
19:53:55.1 (6646739)|STATEMENT_EXECUTE|[3]
19:53:55.1 (6649269)|STATEMENT_EXECUTE|[4]
19:53:55.1 (6655291)|HEAP_ALLOCATE|[4]|Bytes:4
19:53:55.1 (6694163)|METHOD_EXIT|[12]||Teaching.add(Integer, Integer)
19:53:55.1 (6710246)|HEAP_ALLOCATE|[12]|Bytes:4
19:53:55.1 (6716127)|SYSTEM_MODE_EXIT|false
19:53:55.1 (6776745)|HEAP_ALLOCATE|[12]|Bytes:2
19:53:55.1 (6807708)|HEAP_ALLOCATE|[12]|Bytes:20
19:53:55.1 (6876127)|USER_DEBUG|[12]|DEBUG|Sum of a and b is 80
19:53:55.7 (7012079)|CUMULATIVE_LIMIT_USAGE
19:53:55.7 (7012079)|LIMIT_USAGE_FOR_NS|(default)|
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

19:53:55.7 (7012079)|CUMULATIVE_LIMIT_USAGE_END

19:53:55.1 (7162025)|CODE_UNIT_FINISHED|execute_anonymous_apex
19:53:55.1 (7179465)|EXECUTION_FINISHED


```

## Apex uncompiled code
```
sfdx  mohanc:tooling:execute -u mohan.chinnappan.n_ea2@gmail.com -a  ~/.apex/test2.cls  
apexCode: public with sharing class Teaching {

   public Integer add(Integer a, Integer b) {
     try {
     	return a + b;
     } catch (Exception e) {
	throw new AuraHandledException('Error : ' + e.getMessage() );

    }
   } 

   // no error handling here
   public Integer mul(Integer a, Integer b) {
     	return a *  b;

   } 



}

Teaching teach1 = new Teaching();

System.debug('Sum of a and b is ' + teach1.add(10,'mango')) ;
System.debug('Mul of a and b is ' + teach1.mul(10,'mango')) ;

compiled?: false
executed?: false
{
  line: 24,
  column: 44,
  compiled: false,
  success: false,
  compileProblem: 'Method does not exist or incorrect signature: void add(Integer, String) from the type Teaching',
  exceptionStackTrace: null,
  exceptionMessage: null
}

```


