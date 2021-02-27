## How to get Apex Classes and checking the sharing using DX ?

```
## content of apexClasses.soql
$ cat ~/tmp/apexClasses.soql

SELECT Name,Body FROM
ApexClass

```
```
## Login using
$ sfdx force:auth:web:login

## Run the query
$ sfdx mohanc:data:query -u mohan.chinnappan.n_ea2@gmail.com -q ~/tmp/apexClasses.soql  -f json > ~/tmp/apexClasses.soql.json

```

### Filter out the Body of the Apex Classes
```
$ sfdx mohanc:data:jq -i ~/tmp/apexClasses.soql.json -f '.[].Body'

```
### Let us look at a single class
```
$ sfdx mohanc:data:jq -i ~/tmp/apexClasses.soql.json -f '.[2].Body' 
"/**\n * An apex page controller that supports self registration of users in communities that allow self registration\n */\n@IsTest public with sharing class CommunitiesSelfRegControllerTest {\n    @IsTest(SeeAllData=true) \n    public static void testCommunitiesSelfRegController() {\n        CommunitiesSelfRegController controller = new CommunitiesSelfRegController();\n        controller.firstName = 'FirstName';\n        controller.lastName = 'LastName';\n        controller.email = 'test@force.com';\n        controller.communityNickname = 'test';\n        \n        // registerUser will always return null when the page isn't accessed as a guest user\n        System.assert(controller.registerUser() == null);    \n        \n        controller.password = '*****';\n        controller.confirmPassword = '*****';\n        System.assert(controller.registerUser() == null);  \n    }    \n}"
```

### Check that Apex class has 'public with sharing class' to prepare for community cloud implementation 
```
$ sfdx mohanc:data:jq -i ~/tmp/apexClasses.soql.json -f '.[2].Body'  | grep -irn 'public with sharing class'
(standard input):1:"/**\n * An apex page controller that supports self registration of users in communities that allow self registration\n */\n@IsTest public with sharing class CommunitiesSelfRegControllerTest {\n    @IsTest(SeeAllData=true) \n    public static void testCommunitiesSelfRegController() {\n        CommunitiesSelfRegController controller = new CommunitiesSelfRegController();\n        controller.firstName = 'FirstName';\n        controller.lastName = 'LastName';\n        controller.email = 'test@force.com';\n        controller.communityNickname = 'test';\n        \n        // registerUser will always return null when the page isn't accessed as a guest user\n        System.assert(controller.registerUser() == null);    \n        \n        controller.password = '*****';\n        controller.confirmPassword = '*****';\n        System.assert(controller.registerUser() == null);  \n    }    \n}"
```

### Getting count of all the Apex Classes in the org

```
sfdx mohanc:data:jq -i ~/tmp/apexClasses.soql.json -f '.[].Body' | wc -l
54
```

### Getting count of all the Apex Classes in the org with 'public with sharing class'
```
$ sfdx mohanc:data:jq -i ~/tmp/apexClasses.soql.json -f '.[].Body'  | grep -irn 'public with sharing class' | wc -l 
      20
```
### Getting count of all the Apex Classes in the org without 'public with sharing class'
```
$ sfdx mohanc:data:jq -i ~/tmp/apexClasses.soql.json -f '.[].Body'  | grep -irn 'public class'  | wc -l
      26

```
#### Notes
-  Apex classes can be written using the without sharing keyword should be taken care before going live (community cloud...)
- [Apex class dependency info](MetadataComponentDependency.md)

