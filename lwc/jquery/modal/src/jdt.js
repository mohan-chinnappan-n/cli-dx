import { LightningElement, track } from 'lwc';
import { loadStyle, loadScript } from 'lightning/platformResourceLoader';

// import jquery & dataTables library from static resource
// get via: curl -O  https://code.jquery.com/jquery-3.6.0.min.js
// store it as jquery360 in static resoures

import jquery360 from '@salesforce/resourceUrl/jquery360';

// get via:  curl -O https://datatables.net/releases/DataTables-1.10.24.zip and
// store it in static resources as jdatatable
import jdataTable from '@salesforce/resourceUrl/jdataTable';

import getOpptys from '@salesforce/apex/Jdt.getOpptys';
const columnHeaders = ['Name' ,'StageName','Amount', 'CloseDate' , 'Type'];


export default class Jdt extends LightningElement {
    opportunities = [];  // array property to store list of Opportunity 
    // The connectedCallback() lifecycle hook fires when a component is inserted into the DOM.

    detailsData = {};

    // model related attributes
    @track openModal = false;
    showModal() {
        this.openModal = true;
    }
    closeModal() {
        this.openModal = false;
    }

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
            columnHeaderHtml += `<th></th>`;
            columnHeaders.forEach(header => {
                columnHeaderHtml += `<th>${header} </th>`;
            });
            columnHeaderHtml += '</tr></thead>';
           // set <thead> element inside table element 
            tableEle.innerHTML = columnHeaderHtml;
           
            const tbody = document.createElement('tbody'); 
            let index = -1;
             this.opportunities.forEach(oppty => {
                 index++;
                 const tr = document.createElement('tr');

                 const td = document.createElement('td');
                 const btn = document.createElement('button');
                 
                 btn.innerHTML = `&#9776;`;
                 btn.addEventListener('click', event => {
                     const el = event.target;
                     const idx =  el.getAttribute('data-index');
                     this.detailsData = this.opportunities[idx];
                     this.openModal = true;

                 })
                 btn.setAttribute('data-index', `${index}`);

                 td.appendChild(btn);
                 tr.appendChild(td); 

                columnHeaders.forEach( col => {
                    const td = document.createElement('td');
                    td.innerHTML = `${oppty[col]}`;
                    tr.appendChild(td);
               });

               tbody.appendChild(tr);

            });
            tableEle.appendChild(tbody);
             // load datatable to tableEle
             let opptyDataTable =  $(tableEle).DataTable();

          

        });
    }
}

