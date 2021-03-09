# Using UI-API (LDS is built on top of this) 
- Gives data and metadata in a single response.
- Respects CRUD access, field-level security settings, and sharing settings
    - displays only records and fields for which users have CRUD access and FLS visibility.

## Performs the following:
- Checks field-level security settings, sharing settings, and perms.
- Makes SOQL queries to get record data.
- Gets object metadata and theme information.
- Gets layout information

### LDS (Lightning Data Services)
![arch](https://resources.docs.salesforce.com/images/96c6c99f3a530fbd2600a734ee804326.png)

```html
<template>
    <lightning-card title="My Contact Record" icon-name="standard:contact">
        <template if:true={contact.data}>
            <div class="slds-m-around_medium">
                <p>{name}</p>
                <p>{title}</p>
                <p><lightning-formatted-phone value={phone}></lightning-formatted-phone></p>
                <p><lightning-formatted-email value={email}></lightning-formatted-email></p>
            </div>
        </template>
        <template if:true={contact.error}>
            <c-error-panel errors={contact.error}></c-error-panel>
        </template>
    </lightning-card>
</template>
```


```js
import { LightningElement, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

const FIELDS = [
    'Contact.Name',
    'Contact.Title',
    'Contact.Phone',
    'Contact.Email',
];

export default class WireGetRecordDynamicContact extends LightningElement {
    @api recordId;

    // Let’s use the wire service to get record data and display some field names.

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    contact;

    get name() {
        return this.contact.data.fields.Name.value;
    }

    get title() {
        return this.contact.data.fields.Title.value;
    }

    get phone() {
        return this.contact.data.fields.Phone.value;
    }

    get email() {
        return this.contact.data.fields.Email.value;
    }
}

```

## Get results for the given record-id
```
sfdx mohanc:ws:rest -f ~/ea/header.json -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v51.0/ui-api/record-ui/0013h00000Ffg1qAAB 

```

- [Result JSON](./0013h00000Ffg1qAAB.json)


### Caching

- HTTP Caching with ETag (Entity Tag)
    - ETag - contains a hash that identifies a representation
        -  When a representation changes, the web server generates a new ETag.
        - The client saves the ETag and sends it in a header in subsequent requests for the resource: ```If-None-Match: “b9a5cd4fbfcf1b65b03d95a4d9ffa8f4”```. 
            - The web server compares this ETag value with the ETag value of the current version of the representation. 
            - If the values are the same, the browser cache holds the latest version and the web server returns an HTTP status of 304 Not Modified


    - Record responses include a weakEtag property that you can use to compare whether a record is a newer, older, or the same as a record in a previous response.
    - To take advantage of browser caching, User Interface API responses include an ETag field.
    - You can make conditional HTTP requests. 
        - If the browser cache holds the latest version of a representation, the web server returns only HTTP headers.

## Get the metadata for the given sObject
```
sfdx mohanc:ws:rest -f ~/ea/header.json -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v51.0/ui-api/object-info/Account

```
- [Result JSON](./Account.json)


## Resources
- [Get Started with User Interface API](https://developer.salesforce.com/docs/atlas.en-us.uiapi.meta/uiapi/ui_api_get_started.htm)
