# UI API

## Topics
- [References](#ref)
- [Objects List](#obs)
- [Object Field List](#fields)
- [Layouts](#layouts)

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

<a name='layouts></a>
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
<a name='ref'></a>
## References
[User Interface API Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.uiapi.meta/uiapi/ui_api_quick_start.htm)
