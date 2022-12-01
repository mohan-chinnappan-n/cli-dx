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
- example in ~/.zshrc
```

# PMD env var holds the location of your PMD install
export PMD="/Users/mchinnappan/node-pmd/pmd-bin-6.47.0"
# let us put the bin folder of the PMD in path
export PATH="$PATH:$PMD/bin"

```
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

<a name='suppress'></a>
## Check for @SuppressWarning annotations in the code 

```bash
grep -irn '@SuppressWarnings' unpackaged/classes 
```
```
unpackaged/classes/GeocodingService.cls:1:@SuppressWarnings('PMD.ExcessiveParameterList')

```
------------------
## Run pmd csv output
- your apex class files are at: /tmp/apex/unpackaged/classes/
- csv output
```
pmd-run.sh pmd -R ~/.pmd/apex_ruleset.xml -d /tmp/apex/unpackaged/classes/ -f csv > /tmp/apex/pmd-results.csv
```

### Open the results csv file

```
open /tmp/apex/pmd-results.csv

```
- [Sample CSV Ouput](img/pmd-results_s.csv)

-----------------
## Run pmd html output
- your apex class files are at: /tmp/apex/unpackaged/classes/
- html output
```
pmd-run.sh pmd -R ~/.pmd/apex_ruleset.xml -d /tmp/apex/unpackaged/classes/ -f html > /tmp/apex/pmd-results.html
```

### Open the results html file

```
open /tmp/apex/pmd-results.html

```

![Sample html results](img/pmd-results-1.png)

-------
## Run pmd enhanced html output

```
pmd-run.sh pmd -R ~/.pmd/apex_ruleset.xml -d ./unpackaged/classes -f xslt -property xsltFilename=pmd-report-v2.xslt > pmd-report.html

```
- [pmd-report-v2.xslt](https://raw.githubusercontent.com/mohan-chinnappan-n/pmd/master/pmd-core/etc/xslt/pmd-report-v2.xslt)


### Screenshot
- ![PMD report screenshot](img/pmd-report-2.1.png )


### Demo
![New HTML Report demo](https://raw.githubusercontent.com/mohan-chinnappan-n/kural-docs/master/img/new_pmd-report-1.gif)


