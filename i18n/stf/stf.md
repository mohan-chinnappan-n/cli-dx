# Using CLI to fill-in Salesforce translation file 

## Update the plugin
- [Refer: Plugin install and update](https://mohan-chinnappan-n.github.io/dx/plugins.html#/1)
```
 sfdx plugins:update

```

### CLI allows progressive filling of stf with translated files
- STEPS

1. Export STF file for a bilingual (using Translation workbench) - say our case it is French (FR) 
    - Our file say: exported.stf
2. You have translated the keys in this STF file and have the translated-1.psv (Pipe Separated Value file)
3. Create the filled value stf file (batch-1.stf) using this command:
```
sfdx mohanc:i18n:stf:fill -i exported.stf -t  translated-1.psv > batch-1.stf

```

4. Now another translation team has provided you translated-2.psv
5. You can apply this translation on top of  batch-1.stf, using this command

```
sfdx mohanc:i18n:stf:fill -i batch-1.stf -t  translated-2.psv > batch-2.stf

```
6. and so on...
7. You can load (import) the final stf file to the org in translation workbench