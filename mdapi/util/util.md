# Deployment Util commands

- ![Demo](./img/mdapi-utill--1.webm.gif)

- Needs plugin version 0.0.300

```
sfdx mohanc:mdapi:helper:retrieve  -m Profile -n "Read Only"  -u mohan.chinnappan.n.sel@gmail.com

==== Writing to ./98/unpackaged/profiles/Read Only.profile... ====
==== Writing package.xml into ./98/unpackaged/package.xml... ====
==== Executing zip command:  zip -r 98.zip unpackaged ====
==== RUN:  cd 98; sfdx force:mdapi:deploy -f 98.zip -u mohan.chinnappan.n.sel@gmail.com  -w 1000  --verbose -c ====
```

## Perform any cleanup if required
``` 
/tmp  >cd 98
/tmp/98  >vi unpackaged/profiles/Read\ Only.profile 
/tmp/98  >zip -r 98.zip unpackaged 
updating: unpackaged/ (stored 0%)
updating: unpackaged/package.xml (deflated 24%)
updating: unpackaged/profiles/ (stored 0%)
updating: unpackaged/profiles/Read Only.profile (deflated 94%)
/tmp/98  >jar tvf 98.zip 
     0 Wed Jan 18 09:44:04 EST 2023 unpackaged/
   204 Wed Jan 18 09:44:04 EST 2023 unpackaged/package.xml
     0 Wed Jan 18 09:44:54 EST 2023 unpackaged/profiles/
394841 Wed Jan 18 09:44:54 EST 2023 unpackaged/profiles/Read Only.profile
```

## Deploy
```
/tmp/98  >sfdx force:mdapi:deploy -f 98.zip -u mohan.chinnappan.n.sel@gmail.com  -w 1000  --verbose -c
```

```
Deploying metadata to mohan.chinnappan.n.sel@gmail.com using the v56.0 SOAP API
Deploy ID: 0Af4x00000Y2wuRCAR
DEPLOY PROGRESS | ████████████████████████████████████████ | 1/1 Components

=== Deployed Source

 Type    File                                  Name        Id                 
 ─────── ───────────────────────────────────── ─────────── ────────────────── 
         unpackaged/package.xml                package.xml                    
 Profile unpackaged/profiles/Read Only.profile Read Only   00e4x000002b8JCAAY 


```