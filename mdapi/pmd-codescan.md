# PMD Apex code scan using DX 


## Make sure you have java installed
```
java --version
openjdk 11.0.14.1 2022-02-08
OpenJDK Runtime Environment Homebrew (build 11.0.14.1+0)
OpenJDK 64-Bit Server VM Homebrew (build 11.0.14.1+0, mixed mode)

```

## Download and install pmd distribution - pmd-bin-6.47.0 

- from [pmd-bin-6.47.0](dist/pmd-bin-6.47.0.zip)

- unzip the file pmd-bin-6.47.0.zip

```
jar xvf pmd-bin-6.47.0.zip
```


- go to bin folder of the extracted pmd-bin-6.47.0.zip
- do this copy
```
cd pmd-bin-6.47.0/bin
cp run.sh pmd-run.sh 
```

- put this folder: ```pmd-bin-6.47.0/bin``` in your PATH (```~/.zshrc or ~/.bashrc```)
- make it executable ```chmod +x pmd-run.sh```

## Extract Apex Classes from your Org

### Login into the Org
```
sfdx force:auth:web:login
Successfully authorized mohan.chinnappan.n_ea2@gmail.com with org ID 00D3h000007R1LuEAK

```
### Get the Apex Classes using DX
```
sfdx mohanc:mdapi:retrieve -u mohan.chinnappan.n_ea2@gmail.com -t "ApexClass"

cd /tmp/
/tmp  >mkdir apex
/tmp  >cd apex

/tmp/apex  >sfdx mohanc:mdapi:checkRetrieveStatus -u mohan.chinnappan.n_ea2@gmail.com -i "09S3h000006DK3lEAG"
jar xvf  09S3h000006DK3lEAG.zip


```

## Download the apex_ruleset.xml to your ~/.pmd folder 
- create folder ```mkdir ~/.pmd```
- copy the apex_ruleset.xml from:
	- [apex_ruleset.xml](pmd-rules/apex_ruleset.xml)
	- to the folder ~/.pmd

-----------------

## Run pmd csv output
- your apex class files are at: /tmp/apex/unpackaged/classes/
- csv output
```
pmd-run.sh pmd -R ~/.pmd/apex_ruleset.xml -d /tmp/apex/unpackaged/classes/ -f csv > /tmp/apex/pmd-results.csv
```

## Open the results html file

```
open /tmp/apex/pmd-results.csv

```
- [Sample CSV Ouput](img/pmd-results_s.csv)


## Run pmd html output
- your apex class files are at: /tmp/apex/unpackaged/classes/
- html output
```
pmd-run.sh pmd -R ~/.pmd/apex_ruleset.xml -d /tmp/apex/unpackaged/classes/ -f html > /tmp/apex/pmd-results.html
```

## Open the results html file

```
open /tmp/apex/pmd-results.html

```

![Sample html results](img/pmd-results-1.png)
