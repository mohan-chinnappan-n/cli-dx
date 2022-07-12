# How to delete a Apex Class using DX

- [Refer](https://github.com/mohan-chinnappan-n/cli-dx/blob/master/mdapi/deployment-validation.md)


## Login into the org

```
sfdx force:auth:web:login
Successfully authorized mohan.chinnappan.n_ea2@gmail.com with org ID 00D3h000007R1LuEAK

```


```
sfdx mohanc:mdapi:retrieve -u mohan.chinnappan.n_ea2@gmail.com -t "ApexClass"
```

```
sfdx mohanc:mdapi:checkRetrieveStatus -u mohan.chinnappan.n_ea2@gmail.com -i "09S3h000006DLVCEA4"
```

## Unzip

```
unzip 09S3h000006DLVCEA4.zip
```

## Create a DX Project
```
sfdx force:project:create -n delete_prj
```
```
target dir = /private/tmp/delete
   create delete_prj/config/project-scratch-def.json
   create delete_prj/README.md
   create delete_prj/sfdx-project.json
   create delete_prj/.husky/pre-commit
   create delete_prj/.vscode/extensions.json
   create delete_prj/.vscode/launch.json
   create delete_prj/.vscode/settings.json
   create delete_prj/force-app/main/default/lwc/.eslintrc.json
   create delete_prj/force-app/main/default/aura/.eslintrc.json
   create delete_prj/scripts/soql/account.soql
   create delete_prj/scripts/apex/hello.apex
   create delete_prj/.eslintignore
   create delete_prj/.forceignore
   create delete_prj/.gitignore
   create delete_prj/.prettierignore
   create delete_prj/.prettierrc
   create delete_prj/jest.config.js
   create delete_prj/package.json
```

```
cd delete_prj
```

## Run delete
```
sfdx force:source:delete --sourcepath ../unpackaged/classes/MyHelloWorld.cls  --noprompt  -u  mohan.chinnappan.n_ea2@gmail.com  
```

```
*** Deleting with SOAP API ***
Deploy ID: 0Af3h00000QZQtSCAX

=== Deleted Source

 FULL NAME    TYPE      PROJECT PATH                                    
 ──────────── ───────── ─────────────────────────────────────────────── 
 MyHelloWorld ApexClass ../unpackaged/classes/MyHelloWorld.cls          
 MyHelloWorld ApexClass ../unpackaged/classes/MyHelloWorld.cls-meta.xml 

=== Deleted Source

 FULL NAME    TYPE      PROJECT PATH                                    
 ──────────── ───────── ─────────────────────────────────────────────── 
 MyHelloWorld ApexClass ../unpackaged/classes/MyHelloWorld.cls          
 MyHelloWorld ApexClass ../unpackaged/classes/MyHelloWorld.cls-meta.xml 
Deploy Succeeded.
```
