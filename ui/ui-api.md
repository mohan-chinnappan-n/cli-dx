# UI API

## Topics
- [References](#ref)
- [Objects List](#obs)
- [Object Field List](#fields)
- [Layouts](#layouts)
- [Child Records](#childrecs)
- [Actions](#actions)
- [Favorites](#fav)
- [List Views](#listviews)
- [Apps](#apps)
- [Nav Iems](#navitems)
- [Themes](#themes)


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
<a name='listviews'></a>
## Listviews

```
$ sfdx mohanc:ws:rest -f ~/.headers/header_ea.json -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/ui-api/list-ui/Account
```
```json
{
    "count": 6,
    "currentPageToken": "0",
    "currentPageUrl": "/services/data/v49.0/ui-api/list-ui/Account?pageSize=20&pageToken=0",
    "eTag": "56c082ef5d1f4366eda96d419dbb8808",
    "lists": [
        {
            "apiName": "AllAccounts",
            "id": "00B3h000008IZWAEA4",
            "label": "All Accounts",
            "listUiUrl": "/services/data/v49.0/ui-api/list-ui/Account/AllAccounts"
        },
        {
            "apiName": "MyAccounts",
            "id": "00B3h000008IZYAEA4",
            "label": "My Accounts",
            "listUiUrl": "/services/data/v49.0/ui-api/list-ui/Account/MyAccounts"
        },
        {
            "apiName": "NewLastWeek",
            "id": "00B3h000008IZXYEA4",
            "label": "New Last Week",
            "listUiUrl": "/services/data/v49.0/ui-api/list-ui/Account/NewLastWeek"
        },
        {
            "apiName": "NewThisWeek",
            "id": "00B3h000008IZXNEA4",
            "label": "New This Week",
            "listUiUrl": "/services/data/v49.0/ui-api/list-ui/Account/NewThisWeek"
        },
        {
            "apiName": "PlatinumandGoldSLACustomers",
            "id": "00B3h000008IZXoEAO",
            "label": "Platinum and Gold SLA Customers",
            "listUiUrl": "/services/data/v49.0/ui-api/list-ui/Account/PlatinumandGoldSLACustomers"
        },
        {
            "apiName": "RecentlyViewedAccounts",
            "id": "00B3h000008IZY2EAO",
            "label": "Recently Viewed Accounts",
            "listUiUrl": "/services/data/v49.0/ui-api/list-ui/Account/RecentlyViewedAccounts"
        }
    ],
    "nextPageToken": null,
    "nextPageUrl": null,
    "objectApiName": "Account",
    "pageSize": 20,
    "previousPageToken": null,
    "previousPageUrl": null,
    "queryString": null,
    "recentListsOnly": false
}

```
<a name='apps'></a>
## Apps
```
$ sfdx mohanc:ws:rest -f ~/.headers/header_ea.json -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/ui-api/apps?formFactor=Large
```
```json
{
    "apps": [
        {
            "appId": "06m3h000001Mgu8AAC",
            "description": "Build Einstein Analytics dashboards and apps",
            "developerName": "Insights",
            "eTag": "a95008dd47dc870d4f9f644a357af997",
            "formFactors": [
                "Large"
            ],
            "headerColor": "#0070D2",
            "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/logos/Salesforce/Wave/icon.png",
            "isNavAutoTempTabsDisabled": false,
            "isNavPersonalizationDisabled": false,
            "label": "Analytics Studio",
            "logoUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/logos/Salesforce/Wave/logo.png",
            "mobileStartUrl": null,
            "navItems": [],
            "selected": false,
            "startUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/wave/wave.app?tsid=02u3h000001Mgu8",
            "type": "Classic",
            "userNavItems": []
        },
        {
            "appId": "06m3h000001Mgu9AAC",
            "description": "Manage your sales process with accounts, leads, opportunities, and more",
            "developerName": "LightningSales",
            "eTag": "c4ae4a33eb2f8e8d753c4b2c1f240778",
            "formFactors": [
                "Small",
                "Medium",
                "Large"
            ],
            "headerColor": "#0070D2",
            "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/logos/Salesforce/SalesCloud/icon.png",
            "isNavAutoTempTabsDisabled": false,
            "isNavPersonalizationDisabled": false,
            "label": "Sales",
            "logoUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/logos/Salesforce/SalesCloud/logo.png",
            "mobileStartUrl": null,
            "navItems": [
                {
                    "availableInClassic": true,
                    "availableInLightning": true,
                    "color": "EF7EAD",
                    "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/lightning/page/home",
                    "custom": false,
                    "developerName": "standard-home",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/standard/home_120.png",
                    "id": null,
                    "itemType": "Standard",
                    "label": "Home",
                    "objectApiName": "Home",
                    "objectLabel": null,
                    "objectLabelPlural": null,
                    "pageReference": {
                        "attributes": {
                            "pageName": "home"
                        },
                        "state": {},
                        "type": "standard__namedPage"
                    },
                    "standardType": "Home"
                },
                {
                    "availableInClassic": true,
                    "availableInLightning": true,
                    "color": "FCB95B",
                    "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/006/o",
                    "custom": false,
                    "developerName": "standard-Opportunity",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/standard/opportunity_120.png",
                    "id": null,
                    "itemType": "Entity",
                    "label": "Opportunities",
                    "objectApiName": "Opportunity",
                    "objectLabel": "Opportunity",
                    "objectLabelPlural": "Opportunities",
                    "pageReference": {
                        "attributes": {
                            "objectApiName": "Opportunity",
                            "actionName": "home"
                        },
                        "state": {},
                        "type": "standard__objectPage"
                    },
                    "standardType": null
                },
                {
                    "availableInClassic": true,
                    "availableInLightning": true,
                    "color": "F88962",
                    "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/00Q/o",
                    "custom": false,
                    "developerName": "standard-Lead",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/standard/lead_120.png",
                    "id": null,
                    "itemType": "Entity",
                    "label": "Leads",
                    "objectApiName": "Lead",
                    "objectLabel": "Lead",
                    "objectLabelPlural": "Leads",
                    "pageReference": {
                        "attributes": {
                            "objectApiName": "Lead",
                            "actionName": "home"
                        },
                        "state": {},
                        "type": "standard__objectPage"
                    },
                    "standardType": null
                },
                {
                    "availableInClassic": false,
                    "availableInLightning": true,
                    "color": "4BC076",
                    "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/00T/o",
                    "custom": false,
                    "developerName": "standard-Task",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/standard/task_120.png",
                    "id": null,
                    "itemType": "Standard",
                    "label": "Tasks",
                    "objectApiName": "Task",
                    "objectLabel": "Task",
                    "objectLabelPlural": "Tasks",
                    "pageReference": {
                        "attributes": {
                            "objectApiName": "Task",
                            "actionName": "home"
                        },
                        "state": {},
                        "type": "standard__objectPage"
                    },
                    "standardType": "Tasks"
                },
                {
                    "availableInClassic": true,
                    "availableInLightning": true,
                    "color": "BAAC93",
                    "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/_ui/core/chatter/files/FileTabPage",
                    "custom": false,
                    "developerName": "standard-File",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/standard/file_120.png",
                    "id": null,
                    "itemType": "Entity",
                    "label": "Files",
                    "objectApiName": "ContentDocument",
                    "objectLabel": null,
                    "objectLabelPlural": null,
                    "pageReference": {
                        "attributes": {
                            "objectApiName": "ContentDocument",
                            "actionName": "home"
                        },
                        "state": {},
                        "type": "standard__objectPage"
                    },
                    "standardType": null
                },
                {
                    "availableInClassic": true,
                    "availableInLightning": true,
                    "color": "7F8DE1",
                    "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/001/o",
                    "custom": false,
                    "developerName": "standard-Account",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/standard/account_120.png",
                    "id": null,
                    "itemType": "Entity",
                    "label": "Accounts",
                    "objectApiName": "Account",
                    "objectLabel": "Account",
                    "objectLabelPlural": "Accounts",
                    "pageReference": {
                        "attributes": {
                            "objectApiName": "Account",
                            "actionName": "home"
                        },
                        "state": {},
                        "type": "standard__objectPage"
                    },
                    "standardType": null
                },
                {
                    "availableInClassic": true,
                    "availableInLightning": true,
                    "color": "A094ED",
                    "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/003/o",
                    "custom": false,
                    "developerName": "standard-Contact",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/standard/contact_120.png",
                    "id": null,
                    "itemType": "Entity",
                    "label": "Contacts",
                    "objectApiName": "Contact",
                    "objectLabel": "Contact",
                    "objectLabelPlural": "Contacts",
                    "pageReference": {
                        "attributes": {
                            "objectApiName": "Contact",
                            "actionName": "home"
                        },
                        "state": {},
                        "type": "standard__objectPage"
                    },
                    "standardType": null
                },
                {
                    "availableInClassic": true,
                    "availableInLightning": true,
                    "color": "F49756",
                    "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/701/o",
                    "custom": false,
                    "developerName": "standard-Campaign",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/standard/campaign_120.png",
                    "id": null,
                    "itemType": "Entity",
                    "label": "Campaigns",
                    "objectApiName": "Campaign",
                    "objectLabel": "Campaign",
                    "objectLabelPlural": "Campaigns",
                    "pageReference": {
                        "attributes": {
                            "objectApiName": "Campaign",
                            "actionName": "home"
                        },
                        "state": {},
                        "type": "standard__objectPage"
                    },
                    "standardType": null
                },
                {
                    "availableInClassic": true,
                    "availableInLightning": true,
                    "color": "EF6E64",
                    "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/01Z/o",
                    "custom": false,
                    "developerName": "standard-Dashboard",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/standard/dashboard_120.png",
                    "id": null,
                    "itemType": "Standard",
                    "label": "Dashboards",
                    "objectApiName": "Dashboard",
                    "objectLabel": "Dashboard",
                    "objectLabelPlural": "Dashboards",
                    "pageReference": {
                        "attributes": {
                            "objectApiName": "Dashboard",
                            "actionName": "home"
                        },
                        "state": {},
                        "type": "standard__objectPage"
                    },
                    "standardType": "Dashboards"
                },
                {
                    "availableInClassic": true,
                    "availableInLightning": true,
                    "color": "2ECBBE",
                    "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/00O/o",
                    "custom": false,
                    "developerName": "standard-report",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/standard/report_120.png",
                    "id": null,
                    "itemType": "Standard",
                    "label": "Reports",
                    "objectApiName": "Report",
                    "objectLabel": "Report",
                    "objectLabelPlural": "Reports",
                    "pageReference": {
                        "attributes": {
                            "objectApiName": "Report",
                            "actionName": "home"
                        },
                        "state": {},
                        "type": "standard__objectPage"
                    },
                    "standardType": "Reports"
                },
                {
                    "availableInClassic": false,
                    "availableInLightning": true,
                    "color": "489DD0",
                    "content": null,
                    "custom": false,
                    "developerName": "standard-Feed",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/standard/feed_120.png",
                    "id": null,
                    "itemType": "Standard",
                    "label": "Chatter",
                    "objectApiName": "Feed",
                    "objectLabel": null,
                    "objectLabelPlural": null,
                    "pageReference": {
                        "attributes": {
                            "pageName": "chatter"
                        },
                        "state": {},
                        "type": "standard__namedPage"
                    },
                    "standardType": "Feed"
                },
                {
                    "availableInClassic": true,
                    "availableInLightning": true,
                    "color": "83B6FF",
                    "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/_ui/core/chatter/groups/GroupListPage",
                    "custom": false,
                    "developerName": "standard-CollaborationGroup",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/standard/groups_120.png",
                    "id": null,
                    "itemType": "Standard",
                    "label": "Groups",
                    "objectApiName": "CollaborationGroup",
                    "objectLabel": "Group",
                    "objectLabelPlural": "Groups",
                    "pageReference": {
                        "attributes": {
                            "objectApiName": "CollaborationGroup",
                            "actionName": "home"
                        },
                        "state": {},
                        "type": "standard__objectPage"
                    },
                    "standardType": "Groups"
                },
                {
                    "availableInClassic": false,
                    "availableInLightning": true,
                    "color": "EB7092",
                    "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/00U/o",
                    "custom": false,
                    "developerName": "standard-Event",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/standard/event_120.png",
                    "id": null,
                    "itemType": "Standard",
                    "label": "Calendar",
                    "objectApiName": "Event",
                    "objectLabel": "Event",
                    "objectLabelPlural": "Events",
                    "pageReference": {
                        "attributes": {
                            "objectApiName": "Event",
                            "actionName": "home"
                        },
                        "state": {},
                        "type": "standard__objectPage"
                    },
                    "standardType": "Events"
                },
                {
                    "availableInClassic": true,
                    "availableInLightning": true,
                    "color": "65CAE4",
                    "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/_ui/core/chatter/people/PeopleListPage",
                    "custom": false,
                    "developerName": "standard-OtherUserProfile",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/standard/user_120.png",
                    "id": null,
                    "itemType": "Standard",
                    "label": "People",
                    "objectApiName": "User",
                    "objectLabel": "User",
                    "objectLabelPlural": "People",
                    "pageReference": {
                        "attributes": {
                            "objectApiName": "User",
                            "actionName": "home"
                        },
                        "state": {},
                        "type": "standard__objectPage"
                    },
                    "standardType": "People"
                },
                {
                    "availableInClassic": true,
                    "availableInLightning": true,
                    "color": "F2CF5B",
                    "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/500/o",
                    "custom": false,
                    "developerName": "standard-Case",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/standard/case_120.png",
                    "id": null,
                    "itemType": "Entity",
                    "label": "Cases",
                    "objectApiName": "Case",
                    "objectLabel": "Case",
                    "objectLabelPlural": "Cases",
                    "pageReference": {
                        "attributes": {
                            "objectApiName": "Case",
                            "actionName": "home"
                        },
                        "state": {},
                        "type": "standard__objectPage"
                    },
                    "standardType": null
                },
                {
                    "availableInClassic": true,
                    "availableInLightning": true,
                    "color": "4FBE75",
                    "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/_ui/sales/forecasting/ui/ForecastingTabPage",
                    "custom": false,
                    "developerName": "standard-Forecasting3",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/standard/forecasts_120.png",
                    "id": null,
                    "itemType": "Standard",
                    "label": "Forecasts",
                    "objectApiName": "Forecasting3",
                    "objectLabel": null,
                    "objectLabelPlural": null,
                    "pageReference": {
                        "attributes": {
                            "name": "runtime_sales_forecasting:forecastingTab",
                            "attributes": {}
                        },
                        "state": {},
                        "type": "standard__directCmpReference"
                    },
                    "standardType": "Forecasting3"
                },
                {
                    "availableInClassic": false,
                    "availableInLightning": true,
                    "color": "0070D2",
                    "content": null,
                    "custom": false,
                    "developerName": "standard-WaveHomeLightning",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/standard/insightsHome_120.png",
                    "id": null,
                    "itemType": "Standard",
                    "label": "Analytics",
                    "objectApiName": "WaveHomeLightning",
                    "objectLabel": null,
                    "objectLabelPlural": null,
                    "pageReference": {
                        "attributes": {
                            "name": "wave:waveHomeTab",
                            "attributes": {}
                        },
                        "state": {},
                        "type": "standard__directCmpReference"
                    },
                    "standardType": "WaveHomeLightning"
                },
                {
                    "availableInClassic": true,
                    "availableInLightning": true,
                    "color": "eb687f",
                    "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/a02/o",
                    "custom": true,
                    "developerName": "MyFilter__c",
                    "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/icon/t4v35/custom/custom31_120.png",
                    "id": null,
                    "itemType": "Entity",
                    "label": "MyFilters",
                    "objectApiName": "MyFilter__c",
                    "objectLabel": "MyFilter",
                    "objectLabelPlural": "MyFilters",
                    "pageReference": {
                        "attributes": {
                            "objectApiName": "MyFilter__c",
                            "actionName": "home"
                        },
                        "state": {},
                        "type": "standard__objectPage"
                    },
                    "standardType": null
                }
            ],
            "selected": true,
            "startUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/home/home.jsp?tsid=02u3h000001Mgu9",
            "type": "Lightning",
            "userNavItems": []
        },
        {
            "appId": "06m3h000001MgtnAAC",
            "description": "Allows you to have meaningful training data to do the Wave Trails (=tutorials) on Salesforce Trailhead.",
            "developerName": "Trailhead_Data_Manager",
            "eTag": "4e756574b912b59aa2971ec79e6e06c8",
            "formFactors": [
                "Large"
            ],
            "headerColor": "#0070D2",
            "iconUrl": null,
            "isNavAutoTempTabsDisabled": false,
            "isNavPersonalizationDisabled": false,
            "label": "Trailhead Data Manager",
            "logoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/servlet/servlet.ImageServer?id=0153h000001DS8d&oid=00D3h000007R1Lu&lastMod=1594668657000",
            "mobileStartUrl": null,
            "navItems": [],
            "selected": false,
            "startUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/servlet/servlet.Integration?lid=01r3h0000017Acp&ic=1&linkToken=VmpFPSxNakF5TUMweE1DMHdNVlF3TVRvMU5UbzBOaTQzT0RWYSxqaFhHTDNOQVR4ZHpZTWZ5RVpabGtpLFlXWmtNR0po&tsid=02u3h000001Mgtn",
            "type": "Classic",
            "userNavItems": []
        },
        {
            "appId": "06m3h000001MgtsAAC",
            "description": "Best-in-class on-demand marketing automation",
            "developerName": "Marketing",
            "eTag": "539e4d1aedcb2632bc8e4bfa46f1d956",
            "formFactors": [
                "Large"
            ],
            "headerColor": "#0070D2",
            "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/logos/Salesforce/MarketingCloud/icon.png",
            "isNavAutoTempTabsDisabled": false,
            "isNavPersonalizationDisabled": false,
            "label": "Marketing",
            "logoUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/logos/Salesforce/MarketingCloud/logo.png",
            "mobileStartUrl": null,
            "navItems": [],
            "selected": false,
            "startUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/home/home.jsp?tsid=02u3h000001Mgts",
            "type": "Classic",
            "userNavItems": []
        },
        {
            "appId": "06m3h000001MgtyAAC",
            "description": "Salesforce CRM Communities",
            "developerName": "Community",
            "eTag": "60a59c06f40f84ddb4e0bf740aa0da6b",
            "formFactors": [
                "Large"
            ],
            "headerColor": "#0070D2",
            "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/logos/Salesforce/Community/icon.png",
            "isNavAutoTempTabsDisabled": false,
            "isNavPersonalizationDisabled": false,
            "label": "Community",
            "logoUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/logos/Salesforce/Community/logo.png",
            "mobileStartUrl": null,
            "navItems": [],
            "selected": false,
            "startUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/home/home.jsp?tsid=02u3h000001Mgty",
            "type": "Classic",
            "userNavItems": []
        },
        {
            "appId": "06m3h000001MgtrAAC",
            "description": "Manage customer service with accounts, contacts, cases, and more",
            "developerName": "Service",
            "eTag": "a59cd4729d3ad4967291ea842b98970b",
            "formFactors": [
                "Large"
            ],
            "headerColor": "#0070D2",
            "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/logos/Salesforce/ServiceCloud/icon.png",
            "isNavAutoTempTabsDisabled": false,
            "isNavPersonalizationDisabled": false,
            "label": "Service",
            "logoUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/logos/Salesforce/ServiceCloud/logo.png",
            "mobileStartUrl": null,
            "navItems": [],
            "selected": false,
            "startUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/home/home.jsp?tsid=02u3h000001Mgtr",
            "type": "Classic",
            "userNavItems": []
        },
        {
            "appId": "06m3h000001MgtzAAC",
            "description": "Build pixel-perfect, data-rich websites using the drag-and-drop Site.com application, and manage content and published sites.",
            "developerName": "Sites",
            "eTag": "6da6211ee6e27bc90bc88ec820cd3abb",
            "formFactors": [
                "Large"
            ],
            "headerColor": "#0070D2",
            "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/logos/Salesforce/Sites/icon.png",
            "isNavAutoTempTabsDisabled": false,
            "isNavPersonalizationDisabled": false,
            "label": "Site.com",
            "logoUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/logos/app/00D3h000007R1Lu/02u3h000001MgtzAAC",
            "mobileStartUrl": null,
            "navItems": [],
            "selected": false,
            "startUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/home/home.jsp?tsid=02u3h000001Mgtz",
            "type": "Classic",
            "userNavItems": []
        },
        {
            "appId": "06m3h000001Mgu0AAC",
            "description": "The Salesforce Chatter social network, including profiles and feeds",
            "developerName": "Chatter",
            "eTag": "3f653a89469f169f5a025ccc3df39723",
            "formFactors": [
                "Large"
            ],
            "headerColor": "#0070D2",
            "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/logos/Salesforce/Chatter/icon.png",
            "isNavAutoTempTabsDisabled": false,
            "isNavPersonalizationDisabled": false,
            "label": "Salesforce Chatter",
            "logoUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/logos/Standard/feed/logo.svg",
            "mobileStartUrl": null,
            "navItems": [],
            "selected": false,
            "startUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/home/home.jsp?tsid=02u3h000001Mgu0",
            "type": "Classic",
            "userNavItems": []
        },
        {
            "appId": "06m3h000001Mgu5AAC",
            "description": "Salesforce CRM Content",
            "developerName": "Content",
            "eTag": "de3830b970dfb15830c8f0262d495c50",
            "formFactors": [
                "Large"
            ],
            "headerColor": "#0070D2",
            "iconUrl": null,
            "isNavAutoTempTabsDisabled": false,
            "isNavPersonalizationDisabled": false,
            "label": "Content",
            "logoUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/logos/Standard/file/logo.svg",
            "mobileStartUrl": null,
            "navItems": [],
            "selected": false,
            "startUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/home/home.jsp?tsid=02u3h000001Mgu5",
            "type": "Classic",
            "userNavItems": []
        },
        {
            "appId": "06m3h000001MguBAAS",
            "description": "(Lightning Experience) Lets support agents work with multiple records across customer service channels on one screen",
            "developerName": "LightningService",
            "eTag": "4a6d777d66926be05abc287e85317fa1",
            "formFactors": [
                "Small",
                "Large"
            ],
            "headerColor": "#802ABE",
            "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/logos/Salesforce/LightningService/icon.png",
            "isNavAutoTempTabsDisabled": false,
            "isNavPersonalizationDisabled": false,
            "label": "Service Console",
            "logoUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/logos/Salesforce/LightningService/logo.png",
            "mobileStartUrl": null,
            "navItems": [],
            "selected": false,
            "startUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/home/home.jsp?tsid=02u3h000001MguB",
            "type": "Lightning",
            "userNavItems": []
        },
        {
            "appId": "06m3h000001Mgu6AAC",
            "description": "View Adoption and Usage Metrics for Lightning Experience",
            "developerName": "LightningInstrumentation",
            "eTag": "f881e14d618122e19904b2bda0c97329",
            "formFactors": [
                "Large"
            ],
            "headerColor": "#0070D2",
            "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/logos/Salesforce/LightningInstrumentation/icon.png",
            "isNavAutoTempTabsDisabled": false,
            "isNavPersonalizationDisabled": false,
            "label": "Lightning Usage App",
            "logoUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/logos/Salesforce/LightningInstrumentation/logo.png",
            "mobileStartUrl": null,
            "navItems": [],
            "selected": false,
            "startUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/home/home.jsp?tsid=02u3h000001Mgu6",
            "type": "Lightning",
            "userNavItems": []
        },
        {
            "appId": "06m3h000001MgtxAAC",
            "description": "App Launcher tabs",
            "developerName": "AppLauncher",
            "eTag": "54f3104b72af0059aefa6163fe59eb1e",
            "formFactors": [
                "Large"
            ],
            "headerColor": "#0070D2",
            "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/logos/Salesforce/AppLauncher/icon.png",
            "isNavAutoTempTabsDisabled": false,
            "isNavPersonalizationDisabled": false,
            "label": "App Launcher",
            "logoUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/logos/Salesforce/AppLauncher/logo.png",
            "mobileStartUrl": null,
            "navItems": [],
            "selected": false,
            "startUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/app/mgmt/applauncher/appLauncher.apexp?tsid=02u3h000001Mgtx",
            "type": "Classic",
            "userNavItems": []
        },
        {
            "appId": "06m3h000001MguDAAS",
            "description": "Discover and manage business solutions designed for your industry.",
            "developerName": "LightningBolt",
            "eTag": "764a009c330bf331399f08e01996aee0",
            "formFactors": [
                "Large"
            ],
            "headerColor": "#0070D2",
            "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/logos/Salesforce/LightningBolt/icon.png",
            "isNavAutoTempTabsDisabled": false,
            "isNavPersonalizationDisabled": false,
            "label": "Bolt Solutions",
            "logoUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/logos/Salesforce/LightningBolt/logo.png",
            "mobileStartUrl": null,
            "navItems": [],
            "selected": false,
            "startUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/home/home.jsp?tsid=02u3h000001MguD",
            "type": "Lightning",
            "userNavItems": []
        },
        {
            "appId": "06m3h000000yDpCAAU",
            "description": "Manage your store&#39;s products, catalogs, and pricebooks.",
            "developerName": "Commerce",
            "eTag": "a4126c762c8d81b833227e40c49dccbe",
            "formFactors": [
                "Large"
            ],
            "headerColor": "#0070D2",
            "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/logos/Salesforce/Commerce/icon.png",
            "isNavAutoTempTabsDisabled": false,
            "isNavPersonalizationDisabled": false,
            "label": "Commerce",
            "logoUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/logos/Salesforce/Commerce/logo.png",
            "mobileStartUrl": null,
            "navItems": [],
            "selected": false,
            "startUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/home/home.jsp?tsid=02u3h000000yDpC",
            "type": "Lightning",
            "userNavItems": []
        },
        {
            "appId": null,
            "description": null,
            "developerName": "selfservice",
            "eTag": "fdd53c29f13c850547a741361fab53df",
            "formFactors": [
                "Large",
                "Small"
            ],
            "headerColor": null,
            "iconUrl": null,
            "isNavAutoTempTabsDisabled": false,
            "isNavPersonalizationDisabled": false,
            "label": "selfservice",
            "logoUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/logos/Salesforce/Community/logo.png",
            "mobileStartUrl": "https://custcomm2020-developer-edition.na111.force.com",
            "navItems": [],
            "selected": false,
            "startUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/servlet/networks/switch?networkId=0DB3h00000021GP",
            "type": "Community",
            "userNavItems": []
        },
        {
            "appId": "06m3h000000BFJjAAO",
            "description": "See how your company uses certain features, and learn ways you can improve your org.",
            "developerName": "Optimizer",
            "eTag": "55cc34a478581657122b4f33fdafa34e",
            "formFactors": [
                "Large"
            ],
            "headerColor": "#0070D2",
            "iconUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/logos/Salesforce/Optimizer/icon.png",
            "isNavAutoTempTabsDisabled": false,
            "isNavPersonalizationDisabled": false,
            "label": "Salesforce Optimizer",
            "logoUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/logos/Salesforce/Optimizer/logo.png",
            "mobileStartUrl": null,
            "navItems": [],
            "selected": false,
            "startUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/home/home.jsp?tsid=02u3h000000BFJj",
            "type": "Lightning",
            "userNavItems": []
        }
    ],
    "eTag": "e553aa185e5b2429516513e20e016afd"
}
```
<a name='navitems'></a>
## Nav Items
```
$ sfdx mohanc:ws:rest -f ~/.headers/header_ea.json -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/ui-api/nav-items
```

```json
{
    "currentPageUrl": "/services/data/v49.0/ui-api/nav-items?formFactor=Large",
    "eTag": "ae841aeffa2b2cddee762d458491f280",
    "navItems": [
        {
            "availableInClassic": true,
            "availableInLightning": true,
            "color": null,
            "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/0TU/o",
            "custom": false,
            "developerName": "standard-AccountBrand",
            "iconUrl": null,
            "id": null,
            "itemType": "Entity",
            "label": "Account Brands",
            "objectApiName": "AccountBrand",
            "objectLabel": "Account Brand",
            "objectLabelPlural": "Account Brands",
            "pageReference": {
                "attributes": {
                    "objectApiName": "AccountBrand",
                    "actionName": "home"
                },
                "state": {},
                "type": "standard__objectPage"
            },
            "standardType": null
        },
        {
            "availableInClassic": true,
            "availableInLightning": true,
            "color": null,
            "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/001/o",
            "custom": false,
            "developerName": "standard-Account",
            "iconUrl": null,
            "id": null,
            "itemType": "Entity",
            "label": "Accounts",
            "objectApiName": "Account",
            "objectLabel": "Account",
            "objectLabelPlural": "Accounts",
            "pageReference": {
                "attributes": {
                    "objectApiName": "Account",
                    "actionName": "home"
                },
                "state": {},
                "type": "standard__objectPage"
            },
            "standardType": null
        },
        {
            "availableInClassic": false,
            "availableInLightning": true,
            "color": null,
            "content": null,
            "custom": false,
            "developerName": "standard-WaveHomeLightning",
            "iconUrl": null,
            "id": null,
            "itemType": "Standard",
            "label": "Analytics",
            "objectApiName": "WaveHomeLightning",
            "objectLabel": null,
            "objectLabelPlural": null,
            "pageReference": {
                "attributes": {
                    "name": "wave:waveHomeTab",
                    "attributes": {}
                },
                "state": {},
                "type": "standard__directCmpReference"
            },
            "standardType": "WaveHomeLightning"
        },
        {
            "availableInClassic": true,
            "availableInLightning": true,
            "color": null,
            "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/app/mgmt/applauncher/appLauncher.apexp",
            "custom": false,
            "developerName": "standard-AppLauncher",
            "iconUrl": null,
            "id": null,
            "itemType": "Standard",
            "label": "App Launcher",
            "objectApiName": "AppLauncher",
            "objectLabel": null,
            "objectLabelPlural": null,
            "pageReference": {
                "attributes": {
                    "name": "salesforceIdentity:appLauncherDesktopInternal",
                    "attributes": {}
                },
                "state": {},
                "type": "standard__directCmpReference"
            },
            "standardType": "AppLauncher"
        },
        {
            "availableInClassic": false,
            "availableInLightning": true,
            "color": null,
            "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/04i/o",
            "custom": false,
            "developerName": "standard-ProcessInstanceWorkitem",
            "iconUrl": null,
            "id": null,
            "itemType": "Entity",
            "label": "Approval Requests",
            "objectApiName": "ProcessInstanceWorkitem",
            "objectLabel": "Approval Request",
            "objectLabelPlural": "Approval Requests",
            "pageReference": {
                "attributes": {
                    "objectApiName": "ProcessInstanceWorkitem",
                    "actionName": "home"
                },
                "state": {},
                "type": "standard__objectPage"
            },
            "standardType": null
        },
        {
            "availableInClassic": true,
            "availableInLightning": true,
            "color": null,
            "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/02i/o",
            "custom": false,
            "developerName": "standard-Asset",
            "iconUrl": null,
            "id": null,
            "itemType": "Entity",
            "label": "Assets",
            "objectApiName": "Asset",
            "objectLabel": "Asset",
            "objectLabelPlural": "Assets",
            "pageReference": {
                "attributes": {
                    "objectApiName": "Asset",
                    "actionName": "home"
                },
                "state": {},
                "type": "standard__objectPage"
            },
            "standardType": null
        },
        {
            "availableInClassic": true,
            "availableInLightning": true,
            "color": null,
            "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/0cI/o",
            "custom": false,
            "developerName": "standard-AuthorizationForm",
            "iconUrl": null,
            "id": null,
            "itemType": "Entity",
            "label": "Authorization Form",
            "objectApiName": "AuthorizationForm",
            "objectLabel": "Authorization Form",
            "objectLabelPlural": "Authorization Form",
            "pageReference": {
                "attributes": {
                    "objectApiName": "AuthorizationForm",
                    "actionName": "home"
                },
                "state": {},
                "type": "standard__objectPage"
            },
            "standardType": null
        },
        {
            "availableInClassic": true,
            "availableInLightning": true,
            "color": null,
            "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/0cK/o",
            "custom": false,
            "developerName": "standard-AuthorizationFormConsent",
            "iconUrl": null,
            "id": null,
            "itemType": "Entity",
            "label": "Authorization Form Consent",
            "objectApiName": "AuthorizationFormConsent",
            "objectLabel": "Authorization Form Consent",
            "objectLabelPlural": "Authorization Form Consent",
            "pageReference": {
                "attributes": {
                    "objectApiName": "AuthorizationFormConsent",
                    "actionName": "home"
                },
                "state": {},
                "type": "standard__objectPage"
            },
            "standardType": null
        },
        {
            "availableInClassic": true,
            "availableInLightning": true,
            "color": null,
            "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/0cM/o",
            "custom": false,
            "developerName": "standard-AuthorizationFormDataUse",
            "iconUrl": null,
            "id": null,
            "itemType": "Entity",
            "label": "Authorization Form Data Use",
            "objectApiName": "AuthorizationFormDataUse",
            "objectLabel": "Authorization Form Data Use",
            "objectLabelPlural": "Authorization Form Data Use",
            "pageReference": {
                "attributes": {
                    "objectApiName": "AuthorizationFormDataUse",
                    "actionName": "home"
                },
                "state": {},
                "type": "standard__objectPage"
            },
            "standardType": null
        },
        {
            "availableInClassic": true,
            "availableInLightning": true,
            "color": null,
            "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/0cN/o",
            "custom": false,
            "developerName": "standard-AuthorizationFormText",
            "iconUrl": null,
            "id": null,
            "itemType": "Entity",
            "label": "Authorization Form Text",
            "objectApiName": "AuthorizationFormText",
            "objectLabel": "Authorization Form Text",
            "objectLabelPlural": "Authorization Form Text",
            "pageReference": {
                "attributes": {
                    "objectApiName": "AuthorizationFormText",
                    "actionName": "home"
                },
                "state": {},
                "type": "standard__objectPage"
            },
            "standardType": null
        },
        {
            "availableInClassic": false,
            "availableInLightning": true,
            "color": null,
            "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/00U/o",
            "custom": false,
            "developerName": "standard-Event",
            "iconUrl": null,
            "id": null,
            "itemType": "Standard",
            "label": "Calendar",
            "objectApiName": "Event",
            "objectLabel": "Event",
            "objectLabelPlural": "Events",
            "pageReference": {
                "attributes": {
                    "objectApiName": "Event",
                    "actionName": "home"
                },
                "state": {},
                "type": "standard__objectPage"
            },
            "standardType": "Events"
        },
        {
            "availableInClassic": true,
            "availableInLightning": true,
            "color": null,
            "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/701/o",
            "custom": false,
            "developerName": "standard-Campaign",
            "iconUrl": null,
            "id": null,
            "itemType": "Entity",
            "label": "Campaigns",
            "objectApiName": "Campaign",
            "objectLabel": "Campaign",
            "objectLabelPlural": "Campaigns",
            "pageReference": {
                "attributes": {
                    "objectApiName": "Campaign",
                    "actionName": "home"
                },
                "state": {},
                "type": "standard__objectPage"
            },
            "standardType": null
        },
        {
            "availableInClassic": true,
            "availableInLightning": true,
            "color": null,
            "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/03O/o",
            "custom": false,
            "developerName": "standard-CardPaymentMethod",
            "iconUrl": null,
            "id": null,
            "itemType": "Entity",
            "label": "Card Payment Methods",
            "objectApiName": "CardPaymentMethod",
            "objectLabel": "Card Payment Method",
            "objectLabelPlural": "Card Payment Methods",
            "pageReference": {
                "attributes": {
                    "objectApiName": "CardPaymentMethod",
                    "actionName": "home"
                },
                "state": {},
                "type": "standard__objectPage"
            },
            "standardType": null
        },
        {
            "availableInClassic": true,
            "availableInLightning": true,
            "color": null,
            "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/500/o",
            "custom": false,
            "developerName": "standard-Case",
            "iconUrl": null,
            "id": null,
            "itemType": "Entity",
            "label": "Cases",
            "objectApiName": "Case",
            "objectLabel": "Case",
            "objectLabelPlural": "Cases",
            "pageReference": {
                "attributes": {
                    "objectApiName": "Case",
                    "actionName": "home"
                },
                "state": {},
                "type": "standard__objectPage"
            },
            "standardType": null
        },
        {
            "availableInClassic": true,
            "availableInLightning": true,
            "color": null,
            "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/0Pl/o",
            "custom": false,
            "developerName": "standard-ChannelProgramLevel",
            "iconUrl": null,
            "id": null,
            "itemType": "Entity",
            "label": "Channel Program Levels",
            "objectApiName": "ChannelProgramLevel",
            "objectLabel": "Channel Program Level",
            "objectLabelPlural": "Channel Program Levels",
            "pageReference": {
                "attributes": {
                    "objectApiName": "ChannelProgramLevel",
                    "actionName": "home"
                },
                "state": {},
                "type": "standard__objectPage"
            },
            "standardType": null
        },
        {
            "availableInClassic": true,
            "availableInLightning": true,
            "color": null,
            "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/0Pk/o",
            "custom": false,
            "developerName": "standard-ChannelProgram",
            "iconUrl": null,
            "id": null,
            "itemType": "Entity",
            "label": "Channel Programs",
            "objectApiName": "ChannelProgram",
            "objectLabel": "Channel Program",
            "objectLabelPlural": "Channel Programs",
            "pageReference": {
                "attributes": {
                    "objectApiName": "ChannelProgram",
                    "actionName": "home"
                },
                "state": {},
                "type": "standard__objectPage"
            },
            "standardType": null
        },
        {
            "availableInClassic": false,
            "availableInLightning": true,
            "color": null,
            "content": null,
            "custom": false,
            "developerName": "standard-Feed",
            "iconUrl": null,
            "id": null,
            "itemType": "Standard",
            "label": "Chatter",
            "objectApiName": "Feed",
            "objectLabel": null,
            "objectLabelPlural": null,
            "pageReference": {
                "attributes": {
                    "pageName": "chatter"
                },
                "state": {},
                "type": "standard__namedPage"
            },
            "standardType": "Feed"
        },
        {
            "availableInClassic": false,
            "availableInLightning": true,
            "color": null,
            "content": null,
            "custom": false,
            "developerName": "standard-CmsAuthorHome",
            "iconUrl": null,
            "id": null,
            "itemType": "Standard",
            "label": "CMS Home",
            "objectApiName": "CmsAuthorHome",
            "objectLabel": null,
            "objectLabelPlural": null,
            "pageReference": {
                "attributes": {
                    "pageName": "home"
                },
                "state": {},
                "type": "standard__cmsPage"
            },
            "standardType": "CmsAuthorHome"
        },
        {
            "availableInClassic": true,
            "availableInLightning": true,
            "color": null,
            "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/0eB/o",
            "custom": false,
            "developerName": "standard-CommSubscriptionChannelType",
            "iconUrl": null,
            "id": null,
            "itemType": "Entity",
            "label": "Communication Subscription Channel Types",
            "objectApiName": "CommSubscriptionChannelType",
            "objectLabel": "Communication Subscription Channel Type",
            "objectLabelPlural": "Communication Subscription Channel Types",
            "pageReference": {
                "attributes": {
                    "objectApiName": "CommSubscriptionChannelType",
                    "actionName": "home"
                },
                "state": {},
                "type": "standard__objectPage"
            },
            "standardType": null
        },
        {
            "availableInClassic": true,
            "availableInLightning": true,
            "color": null,
            "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/0dY/o",
            "custom": false,
            "developerName": "standard-CommSubscriptionConsent",
            "iconUrl": null,
            "id": null,
            "itemType": "Entity",
            "label": "Communication Subscription Consents",
            "objectApiName": "CommSubscriptionConsent",
            "objectLabel": "Communication Subscription Consent",
            "objectLabelPlural": "Communication Subscription Consents",
            "pageReference": {
                "attributes": {
                    "objectApiName": "CommSubscriptionConsent",
                    "actionName": "home"
                },
                "state": {},
                "type": "standard__objectPage"
            },
            "standardType": null
        },
        {
            "availableInClassic": true,
            "availableInLightning": true,
            "color": null,
            "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/0al/o",
            "custom": false,
            "developerName": "standard-CommSubscriptionTiming",
            "iconUrl": null,
            "id": null,
            "itemType": "Entity",
            "label": "Communication Subscription Timings",
            "objectApiName": "CommSubscriptionTiming",
            "objectLabel": "Communication Subscription Timing",
            "objectLabelPlural": "Communication Subscription Timings",
            "pageReference": {
                "attributes": {
                    "objectApiName": "CommSubscriptionTiming",
                    "actionName": "home"
                },
                "state": {},
                "type": "standard__objectPage"
            },
            "standardType": null
        },
        {
            "availableInClassic": true,
            "availableInLightning": true,
            "color": null,
            "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/0Xl/o",
            "custom": false,
            "developerName": "standard-CommSubscription",
            "iconUrl": null,
            "id": null,
            "itemType": "Entity",
            "label": "Communication Subscriptions",
            "objectApiName": "CommSubscription",
            "objectLabel": "Communication Subscription",
            "objectLabelPlural": "Communication Subscriptions",
            "pageReference": {
                "attributes": {
                    "objectApiName": "CommSubscription",
                    "actionName": "home"
                },
                "state": {},
                "type": "standard__objectPage"
            },
            "standardType": null
        },
        {
            "availableInClassic": true,
            "availableInLightning": true,
            "color": null,
            "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/0Mh/o",
            "custom": false,
            "developerName": "standard-ConsumptionSchedule",
            "iconUrl": null,
            "id": null,
            "itemType": "Entity",
            "label": "Consumption Schedules",
            "objectApiName": "ConsumptionSchedule",
            "objectLabel": "Consumption Schedule",
            "objectLabelPlural": "Consumption Schedules",
            "pageReference": {
                "attributes": {
                    "objectApiName": "ConsumptionSchedule",
                    "actionName": "home"
                },
                "state": {},
                "type": "standard__objectPage"
            },
            "standardType": null
        },
        {
            "availableInClassic": true,
            "availableInLightning": true,
            "color": null,
            "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/0ZX/o",
            "custom": false,
            "developerName": "standard-ContactPointConsent",
            "iconUrl": null,
            "id": null,
            "itemType": "Entity",
            "label": "Contact Point Consent",
            "objectApiName": "ContactPointConsent",
            "objectLabel": "Contact Point Consent",
            "objectLabelPlural": "Contact Point Consent",
            "pageReference": {
                "attributes": {
                    "objectApiName": "ContactPointConsent",
                    "actionName": "home"
                },
                "state": {},
                "type": "standard__objectPage"
            },
            "standardType": null
        },
        {
            "availableInClassic": true,
            "availableInLightning": true,
            "color": null,
            "content": "https://mohansun-ea-02-dev-ed.my.salesforce.com/0ZY/o",
            "custom": false,
            "developerName": "standard-ContactPointTypeConsent",
            "iconUrl": null,
            "id": null,
            "itemType": "Entity",
            "label": "Contact Point Type Consent",
            "objectApiName": "ContactPointTypeConsent",
            "objectLabel": "Contact Point Type Consent",
            "objectLabelPlural": "Contact Point Type Consent",
            "pageReference": {
                "attributes": {
                    "objectApiName": "ContactPointTypeConsent",
                    "actionName": "home"
                },
                "state": {},
                "type": "standard__objectPage"
            },
            "standardType": null
        }
    ],
    "nextPageUrl": "/services/data/v49.0/ui-api/nav-items?formFactor=Large&page=1"
}
```
<a name='themes'></a>
## Themes
```
$ sfdx mohanc:ws:rest -f ~/.headers/header_ea.json -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/ui-api/themes/active
```
```json
{
    "brandColor": "#0070D2",
    "brandImage": {
        "largeUrl": "/_slds/images/themes/lightning_blue/lightning_blue_logo_3x.png",
        "mediumUrl": "/_slds/images/themes/lightning_blue/lightning_blue_logo_2x.png",
        "smallUrl": "/_slds/images/themes/lightning_blue/lightning_blue_logo_1x.png"
    },
    "defaultGroupBanner": {
        "fullSizeUrl": "/_slds/images/themes/lightning_blue/lightning_blue_group.png"
    },
    "defaultGroupImage": {
        "largeUrl": "/_slds/images/themes/lightning_blue/lightning_blue_group_icon_200.png",
        "mediumUrl": "/_slds/images/themes/lightning_blue/lightning_blue_group_icon_160.png",
        "smallUrl": "/_slds/images/themes/lightning_blue/lightning_blue_group_icon_96.png"
    },
    "defaultPageBanner": {
        "fullSizeUrl": "/_slds/images/themes/lightning_blue/lightning_blue_background.png"
    },
    "defaultUserBanner": {
        "fullSizeUrl": "/_slds/images/themes/lightning_blue/lightning_blue_profile.png"
    },
    "defaultUserImage": {
        "largeUrl": "/_slds/images/themes/lightning_blue/lightning_blue_profile_avatar_200.png",
        "mediumUrl": "/_slds/images/themes/lightning_blue/lightning_blue_profile_avatar_160.png",
        "smallUrl": "/_slds/images/themes/lightning_blue/lightning_blue_profile_avatar_96.png"
    },
    "density": "ViewOne",
    "headerColor": "#FFFFFF",
    "linkColor": "rgb(0, 109, 204)",
    "pageColor": "#B0C4DF"
}
```

<a name='ref'></a>
## References
[User Interface API Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.uiapi.meta/uiapi/ui_api_quick_start.htm)
