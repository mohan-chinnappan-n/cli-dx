# Using JQuery based [Datatable](https://datatables.net/) in lwc

## Demo
![Demo jdatable in lwc](lwc-jq-datatable-1.gif)


## Code
### Markup: jdt.html
```html
<template>
    <lightning-card  title="Opportunity Data using JQuery Datatable">
            <div class="slds-m-around_medium">
                <!--- lwc:dom="manual" allows us query this dom element-->
                <table lwc:dom="manual"
                       class="tableCls slds-table slds-table_cell-buffer slds-table_bordered" 
                       style="width:100%">
                </table>
            </div>        
    </lightning-card>
    
</template>


```

### jdt.js
```
import { LightningElement } from 'lwc';
import { loadStyle, loadScript } from 'lightning/platformResourceLoader';

// import jquery & dataTables library from static resource
import jquery360 from '@salesforce/resourceUrl/jquery360';
// get via  curl -O https://datatables.net/releases/DataTables-1.10.24.zip and
// store it in static resources as jdatatable

// credits:  based on the example:
// https://lwcfactory.com/jquery-datatable-salesforce-lightning-web-component/

import jdataTable from '@salesforce/resourceUrl/jdataTable';

import getOpptys from '@salesforce/apex/Jdt.getOpptys';

const columnHeaders = ['Name' ,'StageName','Amount', 'CloseDate' , 'Type'];




export default class Jdt extends LightningElement {
    opportunities = [];  // array property to store list of Opportunity 
    // The connectedCallback() lifecycle hook fires when a component is inserted into the DOM.
    async connectedCallback() {
       // call apex class method which will return the list<Opportunity>
       // assign returned list of records to ‘recordsQueried’ property       
        this.opportunities = await getOpptys();

      // load required jquery and datatable from org's static resources
        Promise.all([
            loadScript(this, jquery360 ),
            loadScript(this, jdataTable + '/DataTables-1.10.24/media/js/jquery.dataTables.min.js'),
            loadStyle(this, jdataTable + '/DataTables-1.10.24/media/css/jquery.dataTables.min.css')
        ])
        .then(() => { 
            // below is possible since we have lwc:dom='manual' in the markup
            const tableEle = this.template.querySelector('.tableCls');

            // table headers <thead>
            let columnHeaderHtml = '<thead> <tr>';
            columnHeaders.forEach(header => {
                columnHeaderHtml += `<th>${header} </th>`;
            });
            columnHeaderHtml += '</tr></thead>';
           // set <thead> element inside table element 
           tableEle.innerHTML = columnHeaderHtml;
           
            // load datatable to tableEle
            let opptyDataTable =  $(tableEle).DataTable();
           
           // process all Opportunity records in a for loop and generate table row        
            this.opportunities.forEach(oppty => {
                const tableRow = []; 
                // hyperlink for the given oppty
                let sUrl = '/lightning/r/Opportunity/' + oppty.Id + '/view'; 
                 tableRow.push(`<a href="${sUrl}">${oppty.Name}</a>`);
                 // if any field value is undefined then set blank string to avoid errors
                 tableRow.push(oppty.StageName != undefined ? oppty.StageName : '');
                 tableRow.push(oppty.Amount != undefined ? oppty.Amount : '');  
                 tableRow.push(oppty.CloseDate != undefined ? oppty.CloseDate : '');  
                 tableRow.push(oppty.Type != undefined ? oppty.Type : '');  
                 opptyDataTable.row.add(tableRow);
            });
           // use DataTables plugin draw function to reflect your data changes on UI
           opptyDataTable.draw();
        });
    }
}
```
### metadata jdt.js-meta.xml
```xml

<?xml version="1.0" encoding="UTF-8"?>
<LightningComponentBundle xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>51.0</apiVersion>
    
    <isExposed>true</isExposed>
    <targets>
        <target>lightning__AppPage</target>
        <target>lightning__RecordPage</target>
        <target>lightning__HomePage</target>
        <target>lightningCommunity__Default</target>
        <target>lightningCommunity__Page</target>
        <target>lightning__Tab</target>
        <target>lightning__Inbox</target>
    </targets>


</LightningComponentBundle>

```

### Apex class Jdt.cls

```java
public with sharing class Jdt {
    @AuraEnabled 
    public static list <Opportunity> getOpptys() {
       return [SELECT Name,Type,StageName,Amount,CloseDate
               FROM Opportunity LIMIT 500];
     }
}


```
