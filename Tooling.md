##  SFDX plugin to  Execute Anonymous Apex 

### Usage

```
$ sfdx mohanc:tooling:execute -h
Execute Anonymous Apex

USAGE
  $ sfdx mohanc:tooling:execute

OPTIONS
  -a, --apexcodefilename=apexcodefilename          Apex Code Input File Name
  -u, --targetusername=targetusername              username or alias for the target org; overrides default target org
  -v, --targetdevhubusername=targetdevhubusername  username or alias for the dev hub org; overrides default dev hub org
  --apiversion=apiversion                          override the api version used for api requests made by this command
  --json                                           format output as json
  --loglevel=(trace|debug|info|warn|error|fatal)   logging level for this command invocation

EXAMPLE


     ** Execute Anonymous Apex **
  
     $ sfdx  mohanc:tooling:execute -u TestOrg2 -a apexCode.cls

```

### Demo

- **Apex Code**
``` 
$ cat tooling_update.soql 
Account[] acctsBefore = [SELECT NumberOfEmployees  FROM Account  
                     WHERE Id = '0013h00000Ffg18AAB'
                  ];
System.debug(acctsBefore);
acctsBefore[0].NumberOfEmployees = 12000;
update acctsBefore;

Account[] acctsAfter = [SELECT NumberOfEmployees  FROM Account  
                     WHERE Id = '0013h00000Ffg18AAB'
                  ];
System.debug(acctsAfter);
```

- **Execute**

```  
$ sfdx mohanc:tooling:execute -a tooling_update.soql -u  mohan.chinnappan.n_ea2@gmail.com

apexCode: Account[] acctsBefore = [SELECT NumberOfEmployees  FROM Account  
                     WHERE Id = '0013h00000Ffg18AAB'
                  ];
System.debug(acctsBefore);
acctsBefore[0].NumberOfEmployees = 12000;
update acctsBefore;

Account[] acctsAfter = [SELECT NumberOfEmployees  FROM Account  
                     WHERE Id = '0013h00000Ffg18AAB'
                  ];
System.debug(acctsAfter);

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

### Results
![tooling update](img/tooling-update-1.png)
