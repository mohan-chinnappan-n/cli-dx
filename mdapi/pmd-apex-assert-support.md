# Apex Assert support

## Topics
- [Demo with PMD 6.47.0](#647) 
- [Demo with PMD 6.54.0](#654) 
- [Instructions for setting up  PMD 6.54.0](https://github.com/mohan-chinnappan-n/cli-dx/blob/master/mdapi/pmd-codescan.md)

---

- [PMD 6.54.0](https://github.com/pmd/pmd/releases/tag/pmd_releases%2F6.54.0) has support for  [Assert](https://developer.salesforce.com/docs/atlas.en-us.240.0.apexref.meta/apexref/apex_class_System_Assert.htm#apex_System_Assert_methods) in addition to our new [PMD report format](https://docs.pmd-code.org/latest/report-examples/html-report-v2.html) 

## Demo

```
cat /tmp/asserts/Test.cls
```

```java
@isTest
public with sharing class Test {

	@isTest
	public static void testAssert(){
		String sub = 'abcde'.substring(2);
		Assert.areEqual('cde', sub, 'Expected characters after first two');
	}
}
```
<a name='647'></a>

###  With PMD 6.47.0
```
/Users/mchinnappan/node-pmd/pmd-bin-6.47.0/bin/pmd-run.sh  pmd -R /Users/mchinnappan/.pmd/apex_ruleset.xml -d /tmp/asserts/Test.cls
```

- Output
```
May 20, 2023 6:09:43 AM net.sourceforge.pmd.PMD encourageToUseIncrementalAnalysis
WARNING: This analysis could be faster, please consider using Incremental Analysis: https://pmd.github.io/pmd-6.47.0/pmd_userdocs_incremental_analysis.html
/private/tmp/asserts/Test.cls:5:	ApexUnitTestClassShouldHaveAsserts:	Apex unit test classes should have at least one System.assert() or assertEquals() or AssertNotEquals() call

```

<a name='654'></a>
###  With PMD 6.54.0

```
./pmd-bin-6.54.0/bin/run.sh pmd -R /Users/mchinnappan/.pmd/apex_ruleset.xml -d /tmp/asserts/Test.cls
```

```
May 20, 2023 6:31:22 AM net.sourceforge.pmd.PMD encourageToUseIncrementalAnalysis
WARNING: This analysis could be faster, please consider using Incremental Analysis: https://pmd.github.io/pmd-6.54.0/pmd_userdocs_incremental_analysis.html
```
