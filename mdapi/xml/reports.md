# How to prepare HTML version of package, profile and permset using DX

- Make sure you have the latest version of the plugin - [Refer](https://mohan-chinnappan-n.github.io/dx/plugins.html#/1)

## Topics
- [Profile](#profile)
- [Permset](#permset)
- [Package](#package)
- [PMD Ruleset](#pmd)




<a name='profile'></a>

## Profile
```
sfdx mohanc:xml:transform -i ~/treeprj/force-app/main/default/profiles/Admin.profile-meta.xml  -m profile 
=== Writing the output into file : /Users/mchinnappan/treeprj/force-app/main/default/profiles/Admin.profile-meta.xml.html ===
```
 - ![Sample](img/sample-1.png)

<a name='permset'></a>
## Permset
```
sfdx mohanc:xml:transform -i ~/treeprj/force-app/main/default/permissionsets/sf_devops_InitializeEnvironments.permissionset-meta.xml  -m permset    
=== Writing the output into file : /Users/mchinnappan/treeprj/force-app/main/default/permissionsets/sf_devops_InitializeEnvironments.permissionset-meta.xml.html ===
```
- ![Permset](img/permset-1.webm.gif)

<a name='package'></a>
## package.xml
```
~/xslts [main] >sfdx mohanc:xml:transform -i package.xml  -m package 
=== Writing the output into file : package.xml.html ===

```
- ![package](img/package1.png)

## Using weburl for input xml file

```
sfdx mohanc:xml:transform  -i https://raw.githubusercontent.com/mohan-chinnappan-n/org-compare/main/se2/unpackaged/unpackaged/permissionsets/Experience_Profile_Manager.permissionset -m permset
=== Writing the output into file : output.html ===
```


<a name='pmd'></a>
## PMD Ruleset 
```
sfdx mohanc:xml:transform -i https://raw.githubusercontent.com/mohan-chinnappan-n/cli-dx/master/mdapi/pmd-rules/apex_ruleset.xml -m pmd-ruleset
=== Writing the output into file : output.html ===
```

```
sfdx mohanc:xml:transform -i https://raw.githubusercontent.com/mohan-chinnappan-n/cli-dx/master/mdapi/pmd-rules/apex_ruleset-old.xml -m pmd-ruleset
=== Writing the output into file : output.html ===

```
```
sfdx mohanc:xml:transform -i https://raw.githubusercontent.com/pmd/pmd/master/pmd-apex/src/main/resources/rulesets/apex/quickstart.xml -m pmd-ruleset

=== Writing the output into file : output.html ===
```

- ![pmdRuleset](img/pmd-ruleset-1.png)

### PMD built-in rules are sorted in one of eight categories
```
- Best Practices: These are rules which enforce generally accepted best practices.
- Code Style: These rules enforce a specific coding style.
- Design: Rules that help you discover design issues.
- Documentation: These rules are related to code documentation.
- Error Prone: Rules to detect constructs that are either broken, extremely confusing or prone to runtime errors.
- Multithreading: These are rules that flag issues when dealing with multiple threads of execution.
- Performance: Rules that flag suboptimal code.
- Security: Rules that flag potential security flaws
```

### Script to produce html report for all DEFAULT PMD rulesets
```bash
# Script to render html for the default PMD rules for apex
for ITEM in bestpractices codestyle design documentation errorprone multithreading performance security
do
  echo sfdx mohanc:xml:transform -i https://raw.githubusercontent.com/pmd/pmd/master/pmd-apex/src/main/resources/category/apex/$ITEM.xml -m pmd-ruleset; 
  sfdx mohanc:xml:transform -i https://raw.githubusercontent.com/pmd/pmd/master/pmd-apex/src/main/resources/category/apex/$ITEM.xml -m pmd-ruleset; 
  mv output.html def-${ITEM}.html
done
```
- All the rules are here
	-  [PMD Default Rules](https://mohan-chinnappan-n5.github.io/pmd/def-apex-rulesets.html) 
