# UI API

## Topics
- [References](#ref)
- [Objects List](#obs)
- [Object Field List](#fields)
- [Layouts](#layouts)
- [Child Records](#childrecs)
- [Actions](#actions)
- [Favorites](#fav)



<a name='objs'></a>
## Get sObjects

```

$ sfdx mohanc:ws:rest -f ~/.headers/header_ea.json -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/ui-api/object-info/  > /tmp/object-info.json

$ sfdx mohanc:data:jq -i /tmp/object-info.json  -f '.objects[].apiName'
"Account"
"AccountBrand"
"AccountPartner"
"AcquiredAccount__c"
"Asset"
"AssetRelationship"
"Campaign"
"CampaignMember"
"Case"
"Contact"
"ContactRequest"
"ContentDocument"
"ContentVersion"
"ContentWorkspace"
"Contract"
"ContractContactRole"
"DeleteEvent"
"Image"
"Individual"
"Lead"
"ListEmail"
"MyFilter__c"
"Note"
"Opportunity"
"OpportunityHistory__c"
"OpportunityLineItem"
"OpportunityPartner"
"Order"
"OrderItem"
"OrgMetric"
"OrgMetricScanResult"
"OrgMetricScanSummary"
"Partner"
"Pricebook2"
"PricebookEntry"
"Product2"
"RecordAction"
"RecordType"
"User"


```


<a name='fields'></a>
## Get Fields


```
$ sfdx mohanc:ws:rest -f ~/.headers/header_ea.json -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/ui-api/object-info/Account  > /tmp/account.json

$ sfdx mohanc:data:jq -i /tmp/account.json  -f '.fields[].apiName'
"AccountNumber"
"AccountSource"
"Active__c"
"AnnualRevenue"
"BillingAddress"
"BillingCity"
"BillingCountry"
"BillingGeocodeAccuracy"
"BillingLatitude"
"BillingLongitude"
"BillingPostalCode"
"BillingState"
"BillingStreet"
"ChannelProgramLevelName"
"ChannelProgramName"
"CleanStatus"
"CloneSourceId"
"CreatedById"
"CreatedDate"
"CustomerPriority__c"
"DandbCompanyId"
"Description"
"DunsNumber"
"Fax"
"Id"
"Industry"
"IsCustomerPortal"
"IsDeleted"
"IsPartner"
"Jigsaw"
"JigsawCompanyId"
"LastActivityDate"
"LastModifiedById"
"LastModifiedDate"
"LastReferencedDate"
"LastViewedDate"
"MasterRecordId"
"NaicsCode"
"NaicsDesc"
"Name"
"NumberOfEmployees"
"NumberofLocations__c"
"OwnerId"
"Ownership"
"ParentId"
"Phone"
"PhotoUrl"
"Rating"
"SLAExpirationDate__c"
"SLASerialNumber__c"
"SLA__c"
"Segment__c"
"ShippingAddress"
"ShippingCity"
"ShippingCountry"
"ShippingGeocodeAccuracy"
"ShippingLatitude"
"ShippingLongitude"
"ShippingPostalCode"
"ShippingState"
"ShippingStreet"
"Sic"
"SicDesc"
"Site"
"SystemModstamp"
"TickerSymbol"
"Tradestyle"
"Type"
"UpsellOpportunity__c"
"Website"
"YearStarted"

$ sfdx mohanc:data:jq -i /tmp/account.json  -f '.fields[] | .apiName  +  "," + (.dataType | tostring) + "," + (.length | tostring) + "," + (.required | tostring)'
"AccountNumber,String,40,false"
"AccountSource,Picklist,255,false"
"Active__c,Picklist,255,false"
"AnnualRevenue,Currency,0,false"
"BillingAddress,Address,0,false"
"BillingCity,String,40,false"
"BillingCountry,String,80,false"
"BillingGeocodeAccuracy,Picklist,40,false"
"BillingLatitude,Double,0,false"
"BillingLongitude,Double,0,false"
"BillingPostalCode,String,20,false"
"BillingState,String,80,false"
"BillingStreet,TextArea,255,false"
"ChannelProgramLevelName,String,255,false"
"ChannelProgramName,String,255,false"
"CleanStatus,Picklist,40,false"
"CloneSourceId,Reference,18,false"
"CreatedById,Reference,18,true"
"CreatedDate,DateTime,0,true"
"CustomerPriority__c,Picklist,255,false"
"DandbCompanyId,Reference,18,false"
"Description,TextArea,32000,false"
"DunsNumber,String,9,false"
"Fax,Phone,40,false"
"Id,String,18,true"
"Industry,Picklist,255,false"
"IsCustomerPortal,Boolean,0,true"
"IsDeleted,Boolean,0,true"
"IsPartner,Boolean,0,true"
"Jigsaw,String,20,false"
"JigsawCompanyId,String,20,false"
"LastActivityDate,Date,0,false"
"LastModifiedById,Reference,18,true"
"LastModifiedDate,DateTime,0,true"
"LastReferencedDate,DateTime,0,false"
"LastViewedDate,DateTime,0,false"
"MasterRecordId,Reference,18,false"
"NaicsCode,String,8,false"
"NaicsDesc,String,120,false"
"Name,String,255,true"
"NumberOfEmployees,Int,0,false"
"NumberofLocations__c,Double,0,false"
"OwnerId,Reference,18,true"
"Ownership,Picklist,255,false"
"ParentId,Reference,18,false"
"Phone,Phone,40,false"
"PhotoUrl,Url,255,false"
"Rating,Picklist,255,false"
"SLAExpirationDate__c,Date,0,false"
"SLASerialNumber__c,String,10,false"
"SLA__c,Picklist,255,false"
"Segment__c,String,25,false"
"ShippingAddress,Address,0,false"
"ShippingCity,String,40,false"
"ShippingCountry,String,80,false"
"ShippingGeocodeAccuracy,Picklist,40,false"
"ShippingLatitude,Double,0,false"
"ShippingLongitude,Double,0,false"
"ShippingPostalCode,String,20,false"
"ShippingState,String,80,false"
"ShippingStreet,TextArea,255,false"
"Sic,String,20,false"
"SicDesc,String,80,false"
"Site,String,80,false"
"SystemModstamp,DateTime,0,true"
"TickerSymbol,String,20,false"
"Tradestyle,String,255,false"
"Type,Picklist,255,false"
"UpsellOpportunity__c,Picklist,255,false"
"Website,Url,255,false"
"YearStarted,String,4,false"

```
## Get RecordTypes
```
$ sfdx mohanc:data:jq -i /tmp/account.json  -f '.recordTypeInfos'
{
  "012000000000000AAA": {
    "available": true,
    "defaultRecordTypeMapping": true,
    "master": true,
    "name": "Master",
    "recordTypeId": "012000000000000AAA"
  }
}

```

<a name='layouts'></a>
- layoutUserStates
    - A map of layout user state IDs to user state information for each layout section
```
$ sfdx mohanc:data:jq -i /tmp/record-info.json -f '.layoutUserStates'
```
```json
{
  "00h3h000004upB0AAI": {
    "id": "00h3h000004upB0AAI",
    "sectionUserStates": {
      "01B3h00000GdP74EAF": {
        "collapsed": false,
        "id": "01B3h00000GdP74EAF"
      },
      "01B3h00000GdP75EAF": {
        "collapsed": false,
        "id": "01B3h00000GdP75EAF"
      },
      "01B3h00000GdP76EAF": {
        "collapsed": false,
        "id": "01B3h00000GdP76EAF"
      },
      "01B3h00000GdP78EAF": {
        "collapsed": false,
        "id": "01B3h00000GdP78EAF"
      },
      "01B3h00000GdP79EAF": {
        "collapsed": false,
        "id": "01B3h00000GdP79EAF"
      },
      "01B3h00000GdP7AEAV": {
        "collapsed": false,
        "id": "01B3h00000GdP7AEAV"
      }
    }
  }
}
```
- layouts
    - A map of object API names to user type layout information for each object
- objectInfos
    - A map of object API names to metadata for each object
- records
    - A map of record IDs to data for each record

```
$ sfdx mohanc:ws:rest -f ~/.headers/header_ea.json -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/ui-api/record-ui/0013h00000Fffx3AAB >/tmp/record-info.json

$ sfdx mohanc:data:jq -i /tmp/record-info.json -f '.layouts'
```
```json
{
  "Account": {
    "012000000000000AAA": {
      "Full": {
        "View": {
          "eTag": "b69680c1dcfad0187315fae818a21309",
          "id": "00h3h000004upB0AAI",
          "layoutType": "Full",
          "mode": "View",
          "objectApiName": "Account",
          "recordTypeId": "012000000000000AAA",
          "sections": [
            {
              "collapsible": false,
              "columns": 2,
              "heading": "Account Information",
              "id": "01B3h00000GdP75EAF",
              "layoutRows": [
                {
                  "layoutItems": [
                    {
                      "editableForNew": false,
                      "editableForUpdate": false,
                      "label": "Account Owner",
                      "layoutComponents": [
                        {
                          "apiName": "OwnerId",
                          "componentType": "Field",
                          "label": "Owner ID"
                        }
                      ],
                      "lookupIdApiName": "OwnerId",
                      "required": false,
                      "sortable": false
                    },
                    {
                      "editableForNew": true,
                      "editableForUpdate": true,
                      "label": "Rating",
                      "layoutComponents": [
                        {
                          "apiName": "Rating",
                          "componentType": "Field",
                          "label": "Account Rating"
                        }
                      ],
                      "lookupIdApiName": null,
                      "required": false,
                      "sortable": false
                    }
                  ]
                },
                {
                  "layoutItems": [
                    {
                      "editableForNew": true,
                      "editableForUpdate": true,
                      "label": "Account Name",
                      "layoutComponents": [
                        {
                          "apiName": "Name",
                          "componentType": "Field",
                          "label": "Account Name"
                        }
                      ],
                      "lookupIdApiName": "Id",
                      "required": true,
                      "sortable": false
                    },
                    {
                      "editableForNew": true,
                      "editableForUpdate": true,
                      "label": "Phone",
                      "layoutComponents": [
                        {
                          "apiName": "Phone",
                          "componentType": "Field",
                          "label": "Account Phone"
                        }
                      ],
                      "lookupIdApiName": null,
                      "required": false,
                      "sortable": false
                    }
                  ]
                },
                {
                  "layoutItems": [
                    {
                      "editableForNew": true,
                      "editableForUpdate": true,
                      "label": "Parent Account",
                      "layoutComponents": [
                        {
                          "apiName": "ParentId",
                          "componentType": "Field",
                          "label": "Parent Account ID"
                        }
                      ],
                      "lookupIdApiName": "ParentId",
                      "required": false,
                      "sortable": false
                    },
                    {
                      "editableForNew": true,
                      "editableForUpdate": true,
                      "label": "Fax",
                      "layoutComponents": [
                        {
                          "apiName": "Fax",
                          "componentType": "Field",
                          "label": "Account Fax"
                        }
                      ],
                      "lookupIdApiName": null,
                      "required": false,
                      "sortable": false
                    }
                  ]
                },
                {
                  "layoutItems": [
                    {
                      "editableForNew": true,
                      "editableForUpdate": true,
                      "label": "Account Number",
                      "layoutComponents": [
                        {
                          "apiName": "AccountNumber",
                          "componentType": "Field",
                          "label": "Account Number"
                        }
                      ],
                      "lookupIdApiName": null,
                      "required": false,
                      "sortable": false
                    },
                    {
                      "editableForNew": true,
                      "editableForUpdate": true,
                      "label": "Website",
                      "layoutComponents": [
                        {
                          "apiName": "Website",
                          "componentType": "Field",
                          "label": "Website"
                        }
                      ],
                      "lookupIdApiName": null,
                      "required": false,
                      "sortable": false
                    }
                  ]
                },
                {
                  "layoutItems": [
                    {
                      "editableForNew": true,
                      "editableForUpdate": true,
                      "label": "Account Site",
                      "layoutComponents": [
                        {
                          "apiName": "Site",
                          "componentType": "Field",
                          "label": "Account Site"
                        }
                      ],
                      "lookupIdApiName": null,
                      "required": false,
                      "sortable": false
                    },
                    {
                      "editableForNew": true,
                      "editableForUpdate": true,
                      "label": "Ticker Symbol",
                      "layoutComponents": [
                        {
                          "apiName": "TickerSymbol",
                          "componentType": "Field",
                          "label": "Ticker Symbol"
                        }
                      ],
                      "lookupIdApiName": null,
                      "required": false,
                      "sortable": false
                    }
                  ]
                },
                {
                  "layoutItems": [
                    {
                      "editableForNew": true,
                      "editableForUpdate": true,
                      "label": "Type",
                      "layoutComponents": [
                        {
                          "apiName": "Type",
                          "componentType": "Field",
                          "label": "Account Type"
                        }
                      ],
                      "lookupIdApiName": null,
                      "required": false,
                      "sortable": false
                    },
                    {
                      "editableForNew": true,
                      "editableForUpdate": true,
                      "label": "Ownership",
                      "layoutComponents": [
                        {
                          "apiName": "Ownership",
                          "componentType": "Field",
                          "label": "Ownership"
                        }
                      ],
                      "lookupIdApiName": null,
                      "required": false,
                      "sortable": false
                    }
                  ]
                },
                {
                  "layoutItems": [
                    {
                      "editableForNew": true,
                      "editableForUpdate": true,
                      "label": "Industry",
                      "layoutComponents": [
                        {
                          "apiName": "Industry",
                          "componentType": "Field",
                          "label": "Industry"
                        }
                      ],
                      "lookupIdApiName": null,
                      "required": false,
                      "sortable": false
                    },
                    {
                      "editableForNew": true,
                      "editableForUpdate": true,
                      "label": "Employees",
                      "layoutComponents": [
                        {
                          "apiName": "NumberOfEmployees",
                          "componentType": "Field",
                          "label": "Employees"
                        }
                      ],
                      "lookupIdApiName": null,
                      "required": false,
                      "sortable": false
                    }
                  ]
                },
                {
                  "layoutItems": [
                    {
                      "editableForNew": true,
                      "editableForUpdate": true,
                      "label": "Annual Revenue",
                      "layoutComponents": [
                        {
                          "apiName": "AnnualRevenue",
                          "componentType": "Field",
                          "label": "Annual Revenue"
                        }
                      ],
                      "lookupIdApiName": null,
                      "required": false,
                      "sortable": false
                    },
                    {
                      "editableForNew": true,
                      "editableForUpdate": true,
                      "label": "SIC Code",
                      "layoutComponents": [
                        {
                          "apiName": "Sic",
                          "componentType": "Field",
                          "label": "SIC Code"
                        }
                      ],
                      "lookupIdApiName": null,
                      "required": false,
                      "sortable": false
                    }
                  ]
                }
              ],
              "rows": 8,
              "useHeading": false
            },
            {
              "collapsible": false,
              "columns": 2,
              "heading": "Address Information",
              "id": "01B3h00000GdP79EAF",
              "layoutRows": [
                {
                  "layoutItems": [
                    {
                      "editableForNew": true,
                      "editableForUpdate": true,
                      "label": "Billing Address",
                      "layoutComponents": [
                        {
                          "apiName": "BillingStreet",
                          "componentType": "Field",
                          "label": "Billing Street"
                        },
                        {
                          "apiName": "BillingCity",
                          "componentType": "Field",
                          "label": "Billing City"
                        },
                        {
                          "apiName": "BillingState",
                          "componentType": "Field",
                          "label": "Billing State/Province"
                        },
                        {
                          "apiName": "BillingPostalCode",
                          "componentType": "Field",
                          "label": "Billing Zip/Postal Code"
                        },
                        {
                          "apiName": "BillingCountry",
                          "componentType": "Field",
                          "label": "Billing Country"
                        }
                      ],
                      "lookupIdApiName": null,
                      "required": false,
                      "sortable": false
                    },
                    {
                      "editableForNew": true,
                      "editableForUpdate": true,
                      "label": "Shipping Address",
                      "layoutComponents": [
                        {
                          "apiName": "ShippingStreet",
                          "componentType": "Field",
                          "label": "Shipping Street"
                        },
                        {
                          "apiName": "ShippingCity",
                          "componentType": "Field",
                          "label": "Shipping City"
                        },
                        {
                          "apiName": "ShippingState",
                          "componentType": "Field",
                          "label": "Shipping State/Province"
                        },
                        {
                          "apiName": "ShippingPostalCode",
                          "componentType": "Field",
                          "label": "Shipping Zip/Postal Code"
                        },
                        {
                          "apiName": "ShippingCountry",
                          "componentType": "Field",
                          "label": "Shipping Country"
                        }
                      ],
                      "lookupIdApiName": null,
                      "required": false,
                      "sortable": false
                    }
                  ]
                }
              ],
              "rows": 1,
              "useHeading": false
            },
            {
              "collapsible": false,
              "columns": 2,
              "heading": "Additional Information",
              "id": "01B3h00000GdP76EAF",
              "layoutRows": [
                {
                  "layoutItems": [
                    {
                      "editableForNew": true,
                      "editableForUpdate": true,
                      "label": "Customer Priority",
                      "layoutComponents": [
                        {
                          "apiName": "CustomerPriority__c",
                          "componentType": "Field",
                          "label": "Customer Priority"
                        }
                      ],
                      "lookupIdApiName": null,
                      "required": false,
                      "sortable": false
                    },
                    {
                      "editableForNew": true,
                      "editableForUpdate": true,
                      "label": "SLA",
                      "layoutComponents": [
                        {
                          "apiName": "SLA__c",
                          "componentType": "Field",
                          "label": "SLA"
                        }
                      ],
                      "lookupIdApiName": null,
                      "required": false,
                      "sortable": false
                    }
                  ]
                },
                {
                  "layoutItems": [
                    {
                      "editableForNew": true,
                      "editableForUpdate": true,
                      "label": "SLA Expiration Date",
                      "layoutComponents": [
                        {
                          "apiName": "SLAExpirationDate__c",
                          "componentType": "Field",
                          "label": "SLA Expiration Date"
                        }
                      ],
                      "lookupIdApiName": null,
                      "required": false,
                      "sortable": false
                    },
                    {
                      "editableForNew": true,
                      "editableForUpdate": true,
                      "label": "SLA Serial Number",
                      "layoutComponents": [
                        {
                          "apiName": "SLASerialNumber__c",
                          "componentType": "Field",
                          "label": "SLA Serial Number"
                        }
                      ],
                      "lookupIdApiName": null,
                      "required": false,
                      "sortable": false
                    }
                  ]
                },
                {
                  "layoutItems": [
                    {
                      "editableForNew": true,
                      "editableForUpdate": true,
                      "label": "Number of Locations",
                      "layoutComponents": [
                        {
                          "apiName": "NumberofLocations__c",
                          "componentType": "Field",
                          "label": "Number of Locations"
                        }
                      ],
                      "lookupIdApiName": null,
                      "required": false,
                      "sortable": false
                    },
                    {
                      "editableForNew": true,
                      "editableForUpdate": true,
                      "label": "Upsell Opportunity",
                      "layoutComponents": [
                        {
                          "apiName": "UpsellOpportunity__c",
                          "componentType": "Field",
                          "label": "Upsell Opportunity"
                        }
                      ],
                      "lookupIdApiName": null,
                      "required": false,
                      "sortable": false
                    }
                  ]
                },
                {
                  "layoutItems": [
                    {
                      "editableForNew": true,
                      "editableForUpdate": true,
                      "label": "Active",
                      "layoutComponents": [
                        {
                          "apiName": "Active__c",
                          "componentType": "Field",
                          "label": "Active"
                        }
                      ],
                      "lookupIdApiName": null,
                      "required": false,
                      "sortable": false
                    },
                    {
                      "editableForNew": false,
                      "editableForUpdate": false,
                      "label": "",
                      "layoutComponents": [
                        {
                          "apiName": null,
                          "componentType": "EmptySpace"
                        }
                      ],
                      "lookupIdApiName": null,
                      "required": false,
                      "sortable": false
                    }
                  ]
                }
              ],
              "rows": 4,
              "useHeading": false
            },
            {
              "collapsible": false,
              "columns": 2,
              "heading": "System Information",
              "id": "01B3h00000GdP78EAF",
              "layoutRows": [
                {
                  "layoutItems": [
                    {
                      "editableForNew": false,
                      "editableForUpdate": false,
                      "label": "Created By",
                      "layoutComponents": [
                        {
                          "apiName": "CreatedById",
                          "componentType": "Field",
                          "label": "Created By ID"
                        },
                        {
                          "apiName": "CreatedDate",
                          "componentType": "Field",
                          "label": "Created Date"
                        }
                      ],
                      "lookupIdApiName": "CreatedById",
                      "required": false,
                      "sortable": false
                    },
                    {
                      "editableForNew": false,
                      "editableForUpdate": false,
                      "label": "Last Modified By",
                      "layoutComponents": [
                        {
                          "apiName": "LastModifiedById",
                          "componentType": "Field",
                          "label": "Last Modified By ID"
                        },
                        {
                          "apiName": "LastModifiedDate",
                          "componentType": "Field",
                          "label": "Last Modified Date"
                        }
                      ],
                      "lookupIdApiName": "LastModifiedById",
                      "required": false,
                      "sortable": false
                    }
                  ]
                }
              ],
              "rows": 1,
              "useHeading": false
            },
            {
              "collapsible": false,
              "columns": 1,
              "heading": "Description Information",
              "id": "01B3h00000GdP7AEAV",
              "layoutRows": [
                {
                  "layoutItems": [
                    {
                      "editableForNew": true,
                      "editableForUpdate": true,
                      "label": "Description",
                      "layoutComponents": [
                        {
                          "apiName": "Description",
                          "componentType": "Field",
                          "label": "Account Description"
                        }
                      ],
                      "lookupIdApiName": null,
                      "required": false,
                      "sortable": false
                    }
                  ]
                }
              ],
              "rows": 1,
              "useHeading": false
            },
            {
              "collapsible": false,
              "columns": 3,
              "heading": "Custom Links",
              "id": "01B3h00000GdP74EAF",
              "layoutRows": [
                {
                  "layoutItems": [
                    {
                      "editableForNew": false,
                      "editableForUpdate": false,
                      "label": "",
                      "layoutComponents": [
                        {
                          "apiName": "Billing",
                          "behavior": "NewWindow",
                          "componentType": "CustomLink",
                          "customLinkUrl": "/servlet/servlet.Integration?lid=00b3h000001U0o2&eid=ENTITY_ID&ic=1",
                          "label": "Billing"
                        }
                      ],
                      "lookupIdApiName": null,
                      "required": false,
                      "sortable": false
                    },
                    {
                      "editableForNew": false,
                      "editableForUpdate": false,
                      "label": "",
                      "layoutComponents": [
                        {
                          "apiName": null,
                          "componentType": "EmptySpace"
                        }
                      ],
                      "lookupIdApiName": null,
                      "required": false,
                      "sortable": false
                    },
                    {
                      "editableForNew": false,
                      "editableForUpdate": false,
                      "label": "",
                      "layoutComponents": [
                        {
                          "apiName": null,
                          "componentType": "EmptySpace"
                        }
                      ],
                      "lookupIdApiName": null,
                      "required": false,
                      "sortable": false
                    }
                  ]
                }
              ],
              "rows": 1,
              "useHeading": false
            }
          ]
        }
      }
    }
  }
}

```
<a name='childrecs'></a>

## Get Child Records
-  Get the Opportunities on an Account record
```
$ sfdx mohanc:ws:rest -f ~/.headers/header_ea.json -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/ui-api/record-ui/0013h00000Fffx3AAB??childRelationships=Account.Opportunities
```
```json
{
  "0013h00000Fffx3AAB": {
    "apiName": "Account",
    "childRelationships": {
      "Opportunities": {
        "count": 1,
        "currentPageToken": "1;5;0013h00000Fffx3AAB;Opportunities;Opportunity.Id,Opportunity.Name;",
        "currentPageUrl": "/services/data/v49.0/ui-api/records/0013h00000Fffx3AAB/child-relationships/Opportunities?fields=Opportunity.Id%2COpportunity.Name&page=1&pageSize=5",
        "nextPageToken": null,
        "nextPageUrl": null,
        "previousPageToken": null,
        "previousPageUrl": null,
        "records": [
          {
            "apiName": "Opportunity",
            "childRelationships": {},
            "eTag": "08e592dc7c4b278bd257d163937290a1",
            "fields": {
              "AccountId": {
                "displayValue": null,
                "value": "0013h00000Fffx3AAB"
              },
              "Id": {
                "displayValue": null,
                "value": "0063h000008wq5kAAA"
              },
              "Name": {
                "displayValue": null,
                "value": "Opportunity for Kelley1593"
              }
            },
            "id": "0063h000008wq5kAAA",
            "lastModifiedById": "0053h000002xQ5sAAE",
            "lastModifiedDate": "2020-07-13T19:30:57.000Z",
            "recordTypeId": "0123h0000019oOEAAY",
            "recordTypeInfo": {
              "available": true,
              "defaultRecordTypeMapping": true,
              "master": false,
              "name": "Record Type",
              "recordTypeId": "0123h0000019oOEAAY"
            },
            "systemModstamp": "2020-07-13T19:30:57.000Z",
            "weakEtag": 1594668657000
          }
        ]
      }
    },
    "eTag": "1f4e39a9c6b55915b1c2b68241fd3618",
    "fields": {
      "AccountNumber": {
        "displayValue": null,
        "value": null
      },
      "Active__c": {
        "displayValue": null,
        "value": null
      },
      "AnnualRevenue": {
        "displayValue": "$1,000,000",
        "value": 1000000
      },
      "BillingCity": {
        "displayValue": null,
        "value": null
      },
      "BillingCountry": {
        "displayValue": null,
        "value": "USA"
      },
      "BillingPostalCode": {
        "displayValue": null,
        "value": null
      },
      "BillingState": {
        "displayValue": null,
        "value": "HI"
      },
      "BillingStreet": {
        "displayValue": null,
        "value": null
      },
      "CreatedBy": {
        "displayValue": "Mohan Chinnappan",
        "value": {
          "apiName": "User",
          "childRelationships": {},
          "eTag": "ba54c78bf72f49799bc7bf6a432edb46",
          "fields": {
            "Id": {
              "displayValue": null,
              "value": "0053h000002xQ5sAAE"
            },
            "Name": {
              "displayValue": null,
              "value": "Mohan Chinnappan"
            }
          },
          "id": "0053h000002xQ5sAAE",
          "lastModifiedById": "0053h000002xQ5sAAE",
          "lastModifiedDate": "2020-09-25T17:15:30.000Z",
          "recordTypeId": null,
          "recordTypeInfo": null,
          "systemModstamp": "2020-09-28T00:52:53.000Z",
          "weakEtag": 1601254373000
        }
      },
      "CreatedById": {
        "displayValue": null,
        "value": "0053h000002xQ5sAAE"
      },
      "CreatedDate": {
        "displayValue": "7/13/2020, 12:30 PM",
        "value": "2020-07-13T19:30:57.000Z"
      },
      "CustomerPriority__c": {
        "displayValue": null,
        "value": null
      },
      "Description": {
        "displayValue": null,
        "value": null
      },
      "Fax": {
        "displayValue": null,
        "value": null
      },
      "Industry": {
        "displayValue": "Consulting",
        "value": "Consulting"
      },
      "LastModifiedBy": {
        "displayValue": "Mohan Chinnappan",
        "value": {
          "apiName": "User",
          "childRelationships": {},
          "eTag": "ba54c78bf72f49799bc7bf6a432edb46",
          "fields": {
            "Id": {
              "displayValue": null,
              "value": "0053h000002xQ5sAAE"
            },
            "Name": {
              "displayValue": null,
              "value": "Mohan Chinnappan"
            }
          },
          "id": "0053h000002xQ5sAAE",
          "lastModifiedById": "0053h000002xQ5sAAE",
          "lastModifiedDate": "2020-09-25T17:15:30.000Z",
          "recordTypeId": null,
          "recordTypeInfo": null,
          "systemModstamp": "2020-09-28T00:52:53.000Z",
          "weakEtag": 1601254373000
        }
      },
      "LastModifiedById": {
        "displayValue": null,
        "value": "0053h000002xQ5sAAE"
      },
      "LastModifiedDate": {
        "displayValue": "7/13/2020, 12:30 PM",
        "value": "2020-07-13T19:30:57.000Z"
      },
      "Name": {
        "displayValue": null,
        "value": "Abbott372 Inc"
      },
      "NumberOfEmployees": {
        "displayValue": null,
        "value": 5000
      },
      "NumberofLocations__c": {
        "displayValue": null,
        "value": null
      },
      "Owner": {
        "displayValue": "Bruce Kennedy",
        "value": {
          "apiName": "User",
          "childRelationships": {},
          "eTag": "2976a4b28b36d1eb6051b08dfaca48b8",
          "fields": {
            "Id": {
              "displayValue": null,
              "value": "0053h000003de6yAAA"
            },
            "Name": {
              "displayValue": null,
              "value": "Bruce Kennedy"
            }
          },
          "id": "0053h000003de6yAAA",
          "lastModifiedById": "0053h000002xQ5sAAE",
          "lastModifiedDate": "2020-07-13T19:30:57.000Z",
          "recordTypeId": null,
          "recordTypeInfo": null,
          "systemModstamp": "2020-07-13T19:34:01.000Z",
          "weakEtag": 1594668841000
        }
      },
      "OwnerId": {
        "displayValue": null,
        "value": "0053h000003de6yAAA"
      },
      "Ownership": {
        "displayValue": null,
        "value": null
      },
      "Parent": {
        "displayValue": null,
        "value": null
      },
      "ParentId": {
        "displayValue": null,
        "value": null
      },
      "Phone": {
        "displayValue": null,
        "value": null
      },
      "Rating": {
        "displayValue": null,
        "value": null
      },
      "SLAExpirationDate__c": {
        "displayValue": null,
        "value": null
      },
      "SLASerialNumber__c": {
        "displayValue": null,
        "value": null
      },
      "SLA__c": {
        "displayValue": null,
        "value": null
      },
      "ShippingCity": {
        "displayValue": null,
        "value": null
      },
      "ShippingCountry": {
        "displayValue": null,
        "value": null
      },
      "ShippingPostalCode": {
        "displayValue": null,
        "value": null
      },
      "ShippingState": {
        "displayValue": null,
        "value": null
      },
      "ShippingStreet": {
        "displayValue": null,
        "value": null
      },
      "Sic": {
        "displayValue": null,
        "value": "47722"
      },
      "Site": {
        "displayValue": null,
        "value": null
      },
      "TickerSymbol": {
        "displayValue": null,
        "value": null
      },
      "Type": {
        "displayValue": "Partner",
        "value": "Partner"
      },
      "UpsellOpportunity__c": {
        "displayValue": null,
        "value": null
      },
      "Website": {
        "displayValue": null,
        "value": null
      }
    },
    "id": "0013h00000Fffx3AAB",
    "lastModifiedById": "0053h000002xQ5sAAE",
    "lastModifiedDate": "2020-07-13T19:30:57.000Z",
    "recordTypeId": "012000000000000AAA",
    "recordTypeInfo": null,
    "systemModstamp": "2020-07-13T19:30:57.000Z",
    "weakEtag": 1594668657000
  }
}

```
<a name='actions'></a>
## Actions
```
$ sfdx mohanc:ws:rest -f ~/.headers/header_ea.json -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/ui-api/actions/record/0013h00000Fffx3AAB
```
```json
{
    "actions": {
        "0013h00000Fffx3AAB": {
            "actions": [
                {
                    "actionListContext": "Chatter",
                    "actionTarget": null,
                    "actionTargetType": "Invoke",
                    "apiName": "Follow",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Chatter:Desktop:StandardButton:Follow",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/action/follow_120.png",
                    "id": "0JV3h0000101429GAA",
                    "isMassAction": "false",
                    "label": "Follow",
                    "primaryColor": "31B9F8",
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "SingleActionLinks",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": null,
                    "targetObject": "Account",
                    "targetUrl": null,
                    "type": "StandardButton"
                },
                {
                    "actionListContext": "Chatter",
                    "actionTarget": null,
                    "actionTargetType": null,
                    "apiName": "FollowInStream",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Chatter:Desktop:StandardButton:FollowInStream",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/action/follow_120.png",
                    "id": "0JV3h0000101430GAA",
                    "isMassAction": "false",
                    "label": "Follow in Stream",
                    "primaryColor": "31B9F8",
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "SingleActionLinks",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": null,
                    "targetObject": "Account",
                    "targetUrl": null,
                    "type": "StandardButton"
                },
                {
                    "actionListContext": "Record",
                    "actionTarget": "/services/data/v49.0/quickActions/NewTask/describe",
                    "actionTargetType": "Describe",
                    "apiName": "Global.NewTask",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Record:Desktop:09D3h0000066UOU",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/action/new_task_120.png",
                    "id": "0JV3h0000101431GAA",
                    "isMassAction": "false",
                    "label": "New Task",
                    "primaryColor": "4BC076",
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "ActivityComposer",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": "Create",
                    "targetObject": "Task",
                    "targetUrl": null,
                    "type": "QuickAction"
                },
                {
                    "actionListContext": "Record",
                    "actionTarget": "/services/data/v49.0/quickActions/NewEvent/describe",
                    "actionTargetType": "Describe",
                    "apiName": "Global.NewEvent",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Record:Desktop:09D3h0000066UOT",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/action/new_event_120.png",
                    "id": "0JV3h0000101432GAA",
                    "isMassAction": "false",
                    "label": "New Event",
                    "primaryColor": "EB7092",
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "ActivityComposer",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": "Create",
                    "targetObject": "Event",
                    "targetUrl": null,
                    "type": "QuickAction"
                },
                {
                    "actionListContext": "Record",
                    "actionTarget": null,
                    "actionTargetType": null,
                    "apiName": "FeedItem.TextPost",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Record:Desktop:FeedItem.TextPost",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/action/share_post_120.png",
                    "id": "0JV3h0000101433GAA",
                    "isMassAction": "false",
                    "label": "Post",
                    "primaryColor": "65CAE4",
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "CollaborateComposer",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": "Post",
                    "targetObject": null,
                    "targetUrl": null,
                    "type": "QuickAction"
                },
                {
                    "actionListContext": "Record",
                    "actionTarget": null,
                    "actionTargetType": "Invoke",
                    "apiName": "Edit",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Record:Desktop:StandardButton:Edit",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/action/edit_120.png",
                    "id": "0JV3h0000101434GAA",
                    "isMassAction": "false",
                    "label": "Edit",
                    "primaryColor": "1DCCBF",
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "Page",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": null,
                    "targetObject": "Account",
                    "targetUrl": null,
                    "type": "StandardButton"
                },
                {
                    "actionListContext": "Record",
                    "actionTarget": null,
                    "actionTargetType": null,
                    "apiName": "FeedItem.ContentPost",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Record:Desktop:FeedItem.ContentPost",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/action/share_file_120.png",
                    "id": "0JV3h0000101435GAA",
                    "isMassAction": "false",
                    "label": "File",
                    "primaryColor": "BAAC93",
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": null,
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": "Post",
                    "targetObject": null,
                    "targetUrl": null,
                    "type": "QuickAction"
                },
                {
                    "actionListContext": "Record",
                    "actionTarget": "/services/data/v49.0/quickActions/NewContact/describe",
                    "actionTargetType": "Describe",
                    "apiName": "Global.NewContact",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Record:Desktop:09D3h0000066UOV",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/action/new_contact_120.png",
                    "id": "0JV3h0000101436GAA",
                    "isMassAction": "false",
                    "label": "New Contact",
                    "primaryColor": "A094ED",
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "Page",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": "Create",
                    "targetObject": "Contact",
                    "targetUrl": null,
                    "type": "QuickAction"
                },
                {
                    "actionListContext": "Record",
                    "actionTarget": "/services/data/v49.0/quickActions/NewCase/describe",
                    "actionTargetType": "Describe",
                    "apiName": "Global.NewCase",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Record:Desktop:09D3h0000066UOY",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/action/new_case_120.png",
                    "id": "0JV3h0000101437GAA",
                    "isMassAction": "false",
                    "label": "New Case",
                    "primaryColor": "F2CF5B",
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "Page",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": "Create",
                    "targetObject": "Case",
                    "targetUrl": null,
                    "type": "QuickAction"
                },
                {
                    "actionListContext": "Record",
                    "actionTarget": "/services/data/v49.0/quickActions/LogACall/describe",
                    "actionTargetType": "Describe",
                    "apiName": "Global.LogACall",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Record:Desktop:09D3h0000066UOW",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/action/log_a_call_120.png",
                    "id": "0JV3h0000101438GAA",
                    "isMassAction": "false",
                    "label": "Log a Call",
                    "primaryColor": "48C3CC",
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "ActivityComposer",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": "LogACall",
                    "targetObject": "Task",
                    "targetUrl": null,
                    "type": "QuickAction"
                },
                {
                    "actionListContext": "Record",
                    "actionTarget": "/services/data/v49.0/quickActions/NewNote/describe",
                    "actionTargetType": "Describe",
                    "apiName": "Global.NewNote",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Record:Desktop:09D3h0000066UOa",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/action/new_note_120.png",
                    "id": "0JV3h0000101439GAA",
                    "isMassAction": "false",
                    "label": "New Note",
                    "primaryColor": "E6D478",
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "Page",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": "Create",
                    "targetObject": "Note",
                    "targetUrl": null,
                    "type": "QuickAction"
                },
                {
                    "actionListContext": "Record",
                    "actionTarget": null,
                    "actionTargetType": null,
                    "apiName": "FeedItem.LinkPost",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Record:Desktop:FeedItem.LinkPost",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/action/share_link_120.png",
                    "id": "0JV3h0000101440GAA",
                    "isMassAction": "false",
                    "label": "Link",
                    "primaryColor": "7A9AE6",
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": null,
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": "Post",
                    "targetObject": null,
                    "targetUrl": null,
                    "type": "QuickAction"
                },
                {
                    "actionListContext": "Record",
                    "actionTarget": null,
                    "actionTargetType": null,
                    "apiName": "FeedItem.PollPost",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Record:Desktop:FeedItem.PollPost",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/action/share_poll_120.png",
                    "id": "0JV3h0000101441GAA",
                    "isMassAction": "false",
                    "label": "Poll",
                    "primaryColor": "699BE1",
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "CollaborateComposer",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": "Post",
                    "targetObject": null,
                    "targetUrl": null,
                    "type": "QuickAction"
                },
                {
                    "actionListContext": "Record",
                    "actionTarget": null,
                    "actionTargetType": null,
                    "apiName": "FeedItem.QuestionPost",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Record:Desktop:FeedItem.QuestionPost",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/action/question_post_action_120.png",
                    "id": "0JV3h0000101442GAA",
                    "isMassAction": "false",
                    "label": "Question",
                    "primaryColor": "32AF5C",
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "CollaborateComposer",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": "Post",
                    "targetObject": null,
                    "targetUrl": null,
                    "type": "QuickAction"
                },
                {
                    "actionListContext": "Record",
                    "actionTarget": "/services/data/v49.0/quickActions/SendEmail/describe",
                    "actionTargetType": "Describe",
                    "apiName": "Global.SendEmail",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Record:Desktop:09D3h0000066UOb",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/action/email_120.png",
                    "id": "0JV3h0000101443GAA",
                    "isMassAction": "false",
                    "label": "Email",
                    "primaryColor": "95AEC5",
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "ActivityComposer",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": "SendEmail",
                    "targetObject": "OutgoingEmail",
                    "targetUrl": null,
                    "type": "QuickAction"
                },
                {
                    "actionListContext": "Record",
                    "actionTarget": null,
                    "actionTargetType": "Invoke",
                    "apiName": "ChangeOwnerOne",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Record:Desktop:StandardButton:ChangeOwnerOne",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/action/change_owner_120.png",
                    "id": "0JV3h0000101444GAA",
                    "isMassAction": "false",
                    "label": "Change Owner",
                    "primaryColor": "0070d2",
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "Page",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": null,
                    "targetObject": "Account",
                    "targetUrl": null,
                    "type": "StandardButton"
                },
                {
                    "actionListContext": "Record",
                    "actionTarget": null,
                    "actionTargetType": "Invoke",
                    "apiName": "Delete",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Record:Desktop:StandardButton:Delete",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/action/delete_120.png",
                    "id": "0JV3h0000101445GAA",
                    "isMassAction": "false",
                    "label": "Delete",
                    "primaryColor": "E6717C",
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "Page",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": null,
                    "targetObject": "Account",
                    "targetUrl": null,
                    "type": "StandardButton"
                },
                {
                    "actionListContext": "Record",
                    "actionTarget": null,
                    "actionTargetType": "Invoke",
                    "apiName": "AccountHierarchy",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Record:Desktop:StandardButton:AccountHierarchy",
                    "iconUrl": "https://community.hulu.com/img/icon/t4v35/action/new_custom19_120.png",
                    "id": "0JV3h0000101446GAA",
                    "isMassAction": "false",
                    "label": "View Account Hierarchy",
                    "primaryColor": null,
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "Page",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": null,
                    "targetObject": "Account",
                    "targetUrl": null,
                    "type": "StandardButton"
                },
                {
                    "actionListContext": "Record",
                    "actionTarget": null,
                    "actionTargetType": "Invoke",
                    "apiName": "Share",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Record:Desktop:StandardButton:Share",
                    "iconUrl": "https://community.hulu.com/img/icon/t4v35/action/new_custom19_120.png",
                    "id": "0JV3h0000101447GAA",
                    "isMassAction": "false",
                    "label": "Sharing",
                    "primaryColor": null,
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "Page",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": null,
                    "targetObject": "Account",
                    "targetUrl": null,
                    "type": "StandardButton"
                },
                {
                    "actionListContext": "Record",
                    "actionTarget": null,
                    "actionTargetType": "Invoke",
                    "apiName": "IncludeOffline",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Record:Desktop:StandardButton:IncludeOffline",
                    "iconUrl": "https://community.hulu.com/img/icon/t4v35/action/new_custom19_120.png",
                    "id": "0JV3h0000101448GAA",
                    "isMassAction": "false",
                    "label": "Include Offline",
                    "primaryColor": null,
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "Page",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": null,
                    "targetObject": "Account",
                    "targetUrl": null,
                    "type": "StandardButton"
                },
                {
                    "actionListContext": "Record",
                    "actionTarget": null,
                    "actionTargetType": "Invoke",
                    "apiName": "EnableAsPartner",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Record:Desktop:StandardButton:EnableAsPartner",
                    "iconUrl": "https://community.hulu.com/img/icon/t4v35/action/new_custom19_120.png",
                    "id": "0JV3h0000101449GAA",
                    "isMassAction": "false",
                    "label": "Enable As Partner",
                    "primaryColor": null,
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "Page",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": null,
                    "targetObject": "Account",
                    "targetUrl": null,
                    "type": "StandardButton"
                },
                {
                    "actionListContext": "Record",
                    "actionTarget": null,
                    "actionTargetType": "Invoke",
                    "apiName": "XClean",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Record:Desktop:StandardButton:XClean",
                    "iconUrl": "https://community.hulu.com/img/icon/t4v35/action/new_custom19_120.png",
                    "id": "0JV3h0000101450GAA",
                    "isMassAction": "false",
                    "label": "Check for New Data",
                    "primaryColor": null,
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "Page",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": null,
                    "targetObject": "Account",
                    "targetUrl": null,
                    "type": "StandardButton"
                },
                {
                    "actionListContext": "Record",
                    "actionTarget": null,
                    "actionTargetType": "Invoke",
                    "apiName": "PrintableView",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Record:Desktop:StandardButton:PrintableView",
                    "iconUrl": "https://community.hulu.com/img/icon/t4v35/action/new_custom19_120.png",
                    "id": "0JV3h0000101451GAA",
                    "isMassAction": "false",
                    "label": "Printable View",
                    "primaryColor": null,
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "Page",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": null,
                    "targetObject": "Account",
                    "targetUrl": null,
                    "type": "StandardButton"
                }
            ],
            "links": [
                "/services/data/v49.0/ui-api/actions/record/0013h00000Fffx3AAB/record-edit",
                "/services/data/v49.0/ui-api/actions/record/0013h00000Fffx3AAB/related-list",
                "/services/data/v49.0/ui-api/actions/record/0013h00000Fffx3AAB/related-list-record/${relatedRecordId}"
            ],
            "url": "/services/data/v49.0/ui-api/actions/record/0013h00000Fffx3AAB"
        }
    },
    "eTag": "093db0af949391a8468b926f677d777c",
    "url": "/services/data/v49.0/ui-api/actions/record/0013h00000Fffx3AAB"
}
```
- Filter a record actions request so that it includes only standard button actions, set the actionTypes parameter to StandardButton
```
$ sfdx mohanc:ws:rest -f ~/.headers/header_ea.json -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/ui-api/actions/record/0013h00000Fffx3AAB?actionTypes=StandardButton
```
```json
{
    "actions": {
        "0013h00000Fffx3AAB": {
            "actions": [
                {
                    "actionListContext": "Chatter",
                    "actionTarget": null,
                    "actionTargetType": "Invoke",
                    "apiName": "Follow",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Chatter:Desktop:StandardButton:Follow",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/action/follow_120.png",
                    "id": "0JV3h0000093994GAA",
                    "isMassAction": "false",
                    "label": "Follow",
                    "primaryColor": "31B9F8",
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "SingleActionLinks",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": null,
                    "targetObject": "Account",
                    "targetUrl": null,
                    "type": "StandardButton"
                },
                {
                    "actionListContext": "Chatter",
                    "actionTarget": null,
                    "actionTargetType": null,
                    "apiName": "FollowInStream",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Chatter:Desktop:StandardButton:FollowInStream",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/action/follow_120.png",
                    "id": "0JV3h0000093995GAA",
                    "isMassAction": "false",
                    "label": "Follow in Stream",
                    "primaryColor": "31B9F8",
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "SingleActionLinks",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": null,
                    "targetObject": "Account",
                    "targetUrl": null,
                    "type": "StandardButton"
                },
                {
                    "actionListContext": "Record",
                    "actionTarget": null,
                    "actionTargetType": "Invoke",
                    "apiName": "Edit",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Record:Desktop:StandardButton:Edit",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/action/edit_120.png",
                    "id": "0JV3h0000093996GAA",
                    "isMassAction": "false",
                    "label": "Edit",
                    "primaryColor": "1DCCBF",
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "Page",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": null,
                    "targetObject": "Account",
                    "targetUrl": null,
                    "type": "StandardButton"
                },
                {
                    "actionListContext": "Record",
                    "actionTarget": null,
                    "actionTargetType": "Invoke",
                    "apiName": "ChangeOwnerOne",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Record:Desktop:StandardButton:ChangeOwnerOne",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/action/change_owner_120.png",
                    "id": "0JV3h0000093997GAA",
                    "isMassAction": "false",
                    "label": "Change Owner",
                    "primaryColor": "0070d2",
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "Page",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": null,
                    "targetObject": "Account",
                    "targetUrl": null,
                    "type": "StandardButton"
                },
                {
                    "actionListContext": "Record",
                    "actionTarget": null,
                    "actionTargetType": "Invoke",
                    "apiName": "Delete",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Record:Desktop:StandardButton:Delete",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/action/delete_120.png",
                    "id": "0JV3h0000093998GAA",
                    "isMassAction": "false",
                    "label": "Delete",
                    "primaryColor": "E6717C",
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "Page",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": null,
                    "targetObject": "Account",
                    "targetUrl": null,
                    "type": "StandardButton"
                },
                {
                    "actionListContext": "Record",
                    "actionTarget": null,
                    "actionTargetType": "Invoke",
                    "apiName": "AccountHierarchy",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Record:Desktop:StandardButton:AccountHierarchy",
                    "iconUrl": "https://community.hulu.com/img/icon/t4v35/action/new_custom19_120.png",
                    "id": "0JV3h0000093999GAA",
                    "isMassAction": "false",
                    "label": "View Account Hierarchy",
                    "primaryColor": null,
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "Page",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": null,
                    "targetObject": "Account",
                    "targetUrl": null,
                    "type": "StandardButton"
                },
                {
                    "actionListContext": "Record",
                    "actionTarget": null,
                    "actionTargetType": "Invoke",
                    "apiName": "Share",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Record:Desktop:StandardButton:Share",
                    "iconUrl": "https://community.hulu.com/img/icon/t4v35/action/new_custom19_120.png",
                    "id": "0JV3h0000094000GAA",
                    "isMassAction": "false",
                    "label": "Sharing",
                    "primaryColor": null,
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "Page",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": null,
                    "targetObject": "Account",
                    "targetUrl": null,
                    "type": "StandardButton"
                },
                {
                    "actionListContext": "Record",
                    "actionTarget": null,
                    "actionTargetType": "Invoke",
                    "apiName": "IncludeOffline",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Record:Desktop:StandardButton:IncludeOffline",
                    "iconUrl": "https://community.hulu.com/img/icon/t4v35/action/new_custom19_120.png",
                    "id": "0JV3h0000094001GAA",
                    "isMassAction": "false",
                    "label": "Include Offline",
                    "primaryColor": null,
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "Page",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": null,
                    "targetObject": "Account",
                    "targetUrl": null,
                    "type": "StandardButton"
                },
                {
                    "actionListContext": "Record",
                    "actionTarget": null,
                    "actionTargetType": "Invoke",
                    "apiName": "EnableAsPartner",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Record:Desktop:StandardButton:EnableAsPartner",
                    "iconUrl": "https://community.hulu.com/img/icon/t4v35/action/new_custom19_120.png",
                    "id": "0JV3h0000094002GAA",
                    "isMassAction": "false",
                    "label": "Enable As Partner",
                    "primaryColor": null,
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "Page",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": null,
                    "targetObject": "Account",
                    "targetUrl": null,
                    "type": "StandardButton"
                },
                {
                    "actionListContext": "Record",
                    "actionTarget": null,
                    "actionTargetType": "Invoke",
                    "apiName": "XClean",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Record:Desktop:StandardButton:XClean",
                    "iconUrl": "https://community.hulu.com/img/icon/t4v35/action/new_custom19_120.png",
                    "id": "0JV3h0000094003GAA",
                    "isMassAction": "false",
                    "label": "Check for New Data",
                    "primaryColor": null,
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "Page",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": null,
                    "targetObject": "Account",
                    "targetUrl": null,
                    "type": "StandardButton"
                },
                {
                    "actionListContext": "Record",
                    "actionTarget": null,
                    "actionTargetType": "Invoke",
                    "apiName": "PrintableView",
                    "externalId": "00D3h000007R1Lu:0013h00000Fffx3AAB::Record:Desktop:StandardButton:PrintableView",
                    "iconUrl": "https://community.hulu.com/img/icon/t4v35/action/new_custom19_120.png",
                    "id": "0JV3h0000094004GAA",
                    "isMassAction": "false",
                    "label": "Printable View",
                    "primaryColor": null,
                    "relatedListRecordId": null,
                    "relatedSourceObject": null,
                    "section": "Page",
                    "sourceObject": "0013h00000Fffx3AAB",
                    "subtype": null,
                    "targetObject": "Account",
                    "targetUrl": null,
                    "type": "StandardButton"
                }
            ],
            "links": [
                "/services/data/v49.0/ui-api/actions/record/0013h00000Fffx3AAB/record-edit",
                "/services/data/v49.0/ui-api/actions/record/0013h00000Fffx3AAB/related-list",
                "/services/data/v49.0/ui-api/actions/record/0013h00000Fffx3AAB/related-list-record/${relatedRecordId}"
            ],
            "url": "/services/data/v49.0/ui-api/actions/record/0013h00000Fffx3AAB?actionTypes=StandardButton"
        }
    },
    "eTag": "2ccf56ed610fc2349cdfabc9c7737ce5",
    "url": "/services/data/v49.0/ui-api/actions/record/0013h00000Fffx3AAB?actionTypes=StandardButton"
}
```
<a name='fav'></a>
## Favorites

```
$ sfdx mohanc:ws:rest -f ~/.headers/header_ea.json -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/ui-api/favorites
```
```json
{
    "favorites": []
}
```

<a name='ref'></a>
## References
[User Interface API Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.uiapi.meta/uiapi/ui_api_quick_start.htm)
