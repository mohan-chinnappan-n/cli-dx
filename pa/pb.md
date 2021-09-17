# Process Builder (PB)

```
cat ~/.soql/flow.soql
```

```sql
SELECT
Id
,DefinitionId
,MasterLabel
,ManageableState
,VersionNumber
,Status
,Description
,ProcessType
,CreatedDate
,CreatedById
,LastModifiedDate
,LastModifiedById
,Metadata
,FullName
,IsTemplate
,RunInMode
,ApiVersion

FROM Flow
LIMIT 1
OFFSET 0
```

## Get the details
```
sfdx mohanc:tooling:query -u mohan.chinnappan.n_ea2@gmail.com  -q ~/.soql/flow.soql  -f json
```

```json
[
    {
        "attributes": {
            "type": "Flow",
            "url": "/services/data/v52.0/tooling/sobjects/Flow/3013h000000QhUMAA0"
        },
        "Id": "3013h000000QhUMAA0",
        "DefinitionId": "3003h0000000xm9AAA",
        "MasterLabel": "TemperatureMonitor",
        "ManageableState": "unmanaged",
        "VersionNumber": 1,
        "Status": "Active",
        "Description": "Temperature Monitor subscribes PE Notification__e",
        "ProcessType": "CustomEvent",
        "CreatedDate": "2020-08-23T20:10:10.000+0000",
        "CreatedById": "0053h000002xQ5sAAE",
        "LastModifiedDate": "2020-08-23T20:10:22.000+0000",
        "LastModifiedById": "0053h000002xQ5sAAE",
        "Metadata": {
            "actionCalls": [
                {
                    "actionName": "emailSimple",
                    "actionType": "emailSimple",
                    "connector": null,
                    "dataTypeMappings": [],
                    "description": null,
                    "elementSubtype": null,
                    "faultConnector": null,
                    "flowTransactionModel": null,
                    "inputParameters": [
                        {
                            "name": "emailSubject",
                            "processMetadataValues": [],
                            "value": {
                                "booleanValue": null,
                                "dateTimeValue": null,
                                "dateValue": null,
                                "elementReference": null,
                                "numberValue": null,
                                "stringValue": "Salesforce TemperatureMonitor process didn't start: No matching records found"
                            }
                        },
                        {
                            "name": "emailBody",
                            "processMetadataValues": [],
                            "value": {
                                "booleanValue": null,
                                "dateTimeValue": null,
                                "dateValue": null,
                                "elementReference": "noRecordsFoundTextTemplate",
                                "numberValue": null,
                                "stringValue": null
                            }
                        },
                        {
                            "name": "emailAddresses",
                            "processMetadataValues": [],
                            "value": {
                                "booleanValue": null,
                                "dateTimeValue": null,
                                "dateValue": null,
                                "elementReference": null,
                                "numberValue": null,
                                "stringValue": "mohan.chinnappan.n@gmail.com"
                            }
                        }
                    ],
                    "label": "Context Error Email",
                    "locationX": 0,
                    "locationY": 0,
                    "name": "eventContextErrorEmail",
                    "outputParameters": [],
                    "processMetadataValues": [],
                    "storeOutputAutomatically": null
                },
                {
                    "actionName": "emailSimple",
                    "actionType": "emailSimple",
                    "connector": null,
                    "dataTypeMappings": [],
                    "description": null,
                    "elementSubtype": null,
                    "faultConnector": null,
                    "flowTransactionModel": null,
                    "inputParameters": [
                        {
                            "name": "emailSubject",
                            "processMetadataValues": [],
                            "value": {
                                "booleanValue": null,
                                "dateTimeValue": null,
                                "dateValue": null,
                                "elementReference": null,
                                "numberValue": null,
                                "stringValue": "Salesforce TemperatureMonitor process didn't start: Multiple matching records found"
                            }
                        },
                        {
                            "name": "emailBody",
                            "processMetadataValues": [],
                            "value": {
                                "booleanValue": null,
                                "dateTimeValue": null,
                                "dateValue": null,
                                "elementReference": "multipleRecordsFoundTextTemplate",
                                "numberValue": null,
                                "stringValue": null
                            }
                        },
                        {
                            "name": "emailAddresses",
                            "processMetadataValues": [],
                            "value": {
                                "booleanValue": null,
                                "dateTimeValue": null,
                                "dateValue": null,
                                "elementReference": null,
                                "numberValue": null,
                                "stringValue": "mohan.chinnappan.n@gmail.com"
                            }
                        }
                    ],
                    "label": "Context Error Email",
                    "locationX": 0,
                    "locationY": 0,
                    "name": "eventContextMoreEmail",
                    "outputParameters": [],
                    "processMetadataValues": [],
                    "storeOutputAutomatically": null
                },
                {
                    "actionName": "Asset.Notify_Supervisor_on_Power_Down",
                    "actionType": "emailAlert",
                    "connector": null,
                    "dataTypeMappings": [],
                    "description": null,
                    "elementSubtype": null,
                    "faultConnector": null,
                    "flowTransactionModel": null,
                    "inputParameters": [
                        {
                            "name": "SObjectRowId",
                            "processMetadataValues": [],
                            "value": {
                                "booleanValue": null,
                                "dateTimeValue": null,
                                "dateValue": null,
                                "elementReference": "myVariable_event_context.Id",
                                "numberValue": null,
                                "stringValue": null
                            }
                        }
                    ],
                    "label": "Notify Supervisor",
                    "locationX": 100,
                    "locationY": 200,
                    "name": "myRule_1_A1",
                    "outputParameters": [],
                    "processMetadataValues": [
                        {
                            "name": "emailAlertSelection",
                            "value": {
                                "booleanValue": null,
                                "dateTimeValue": null,
                                "dateValue": null,
                                "elementReference": null,
                                "numberValue": null,
                                "stringValue": "Notify_Supervisor_on_Power_Down"
                            }
                        }
                    ],
                    "storeOutputAutomatically": null
                }
            ],
            "apexPluginCalls": [],
            "apiVersion": 49,
            "assignments": [
                {
                    "assignmentItems": [
                        {
                            "assignToReference": "myVariable_event_record_count",
                            "operator": "Add",
                            "processMetadataValues": [],
                            "value": {
                                "booleanValue": null,
                                "dateTimeValue": null,
                                "dateValue": null,
                                "elementReference": null,
                                "numberValue": 1,
                                "stringValue": null
                            }
                        },
                        {
                            "assignToReference": "myVariable_event_context",
                            "operator": "Assign",
                            "processMetadataValues": [],
                            "value": {
                                "booleanValue": null,
                                "dateTimeValue": null,
                                "dateValue": null,
                                "elementReference": "myVariable_event_current_record",
                                "numberValue": null,
                                "stringValue": null
                            }
                        }
                    ],
                    "connector": {
                        "processMetadataValues": [],
                        "targetReference": "eventContextCheckLoop"
                    },
                    "description": null,
                    "elementSubtype": null,
                    "label": "RecordCountAssignment",
                    "locationX": 0,
                    "locationY": 0,
                    "name": "RecordCountAssignment",
                    "processMetadataValues": []
                }
            ],
            "choices": [],
            "collectionProcessors": [],
            "constants": [],
            "decisions": [
                {
                    "defaultConnector": {
                        "processMetadataValues": [],
                        "targetReference": "myDecision"
                    },
                    "defaultConnectorLabel": "default",
                    "description": null,
                    "elementSubtype": null,
                    "label": "ContextCheckDecision",
                    "locationX": 0,
                    "locationY": 0,
                    "name": "eventContextCheckDecision",
                    "processMetadataValues": [],
                    "rules": [
                        {
                            "conditionLogic": "and",
                            "conditions": [
                                {
                                    "leftValueReference": "myVariable_event_record_count",
                                    "operator": "EqualTo",
                                    "processMetadataValues": [],
                                    "rightValue": {
                                        "booleanValue": null,
                                        "dateTimeValue": null,
                                        "dateValue": null,
                                        "elementReference": null,
                                        "numberValue": 0,
                                        "stringValue": null
                                    }
                                }
                            ],
                            "connector": {
                                "processMetadataValues": [],
                                "targetReference": "eventContextErrorEmail"
                            },
                            "description": null,
                            "doesRequireRecordChangedToMeetCriteria": null,
                            "label": "Context Check Decision - Is Zero",
                            "name": "eventContextCheckRule",
                            "processMetadataValues": []
                        },
                        {
                            "conditionLogic": "and",
                            "conditions": [
                                {
                                    "leftValueReference": "myVariable_event_record_count",
                                    "operator": "GreaterThan",
                                    "processMetadataValues": [],
                                    "rightValue": {
                                        "booleanValue": null,
                                        "dateTimeValue": null,
                                        "dateValue": null,
                                        "elementReference": null,
                                        "numberValue": 1,
                                        "stringValue": null
                                    }
                                }
                            ],
                            "connector": {
                                "processMetadataValues": [],
                                "targetReference": "eventContextMoreEmail"
                            },
                            "description": null,
                            "doesRequireRecordChangedToMeetCriteria": null,
                            "label": "Context Check Decision - Greater than One",
                            "name": "eventContextGtOneCheckRule",
                            "processMetadataValues": []
                        }
                    ]
                },
                {
                    "defaultConnector": null,
                    "defaultConnectorLabel": "default",
                    "description": null,
                    "elementSubtype": null,
                    "label": "myDecision",
                    "locationX": 50,
                    "locationY": 0,
                    "name": "myDecision",
                    "processMetadataValues": [
                        {
                            "name": "index",
                            "value": {
                                "booleanValue": null,
                                "dateTimeValue": null,
                                "dateValue": null,
                                "elementReference": null,
                                "numberValue": 0,
                                "stringValue": null
                            }
                        }
                    ],
                    "rules": [
                        {
                            "conditionLogic": "and",
                            "conditions": [
                                {
                                    "leftValueReference": "myVariable_myEvent.Message__c",
                                    "operator": "EqualTo",
                                    "processMetadataValues": [
                                        {
                                            "name": "inputDataType",
                                            "value": {
                                                "booleanValue": null,
                                                "dateTimeValue": null,
                                                "dateValue": null,
                                                "elementReference": null,
                                                "numberValue": null,
                                                "stringValue": "String"
                                            }
                                        },
                                        {
                                            "name": "inputSourceType",
                                            "value": {
                                                "booleanValue": null,
                                                "dateTimeValue": null,
                                                "dateValue": null,
                                                "elementReference": null,
                                                "numberValue": null,
                                                "stringValue": "customEvent"
                                            }
                                        },
                                        {
                                            "name": "leftHandSideType",
                                            "value": {
                                                "booleanValue": null,
                                                "dateTimeValue": null,
                                                "dateValue": null,
                                                "elementReference": null,
                                                "numberValue": null,
                                                "stringValue": "String"
                                            }
                                        },
                                        {
                                            "name": "operatorDataType",
                                            "value": {
                                                "booleanValue": null,
                                                "dateTimeValue": null,
                                                "dateValue": null,
                                                "elementReference": null,
                                                "numberValue": null,
                                                "stringValue": "String"
                                            }
                                        },
                                        {
                                            "name": "rightHandSideType",
                                            "value": {
                                                "booleanValue": null,
                                                "dateTimeValue": null,
                                                "dateValue": null,
                                                "elementReference": null,
                                                "numberValue": null,
                                                "stringValue": "String"
                                            }
                                        }
                                    ],
                                    "rightValue": {
                                        "booleanValue": null,
                                        "dateTimeValue": null,
                                        "dateValue": null,
                                        "elementReference": null,
                                        "numberValue": null,
                                        "stringValue": "Power Off"
                                    }
                                }
                            ],
                            "connector": {
                                "processMetadataValues": [],
                                "targetReference": "myRule_1_A1"
                            },
                            "description": null,
                            "doesRequireRecordChangedToMeetCriteria": null,
                            "label": "Power Down",
                            "name": "myRule_1",
                            "processMetadataValues": []
                        }
                    ]
                }
            ],
            "description": "Temperature Monitor subscribes PE Notification__e",
            "dynamicChoiceSets": [],
            "formulas": [
                {
                    "dataType": "String",
                    "description": null,
                    "expression": "{!$Organization.Name}",
                    "name": "OrganizationName",
                    "processMetadataValues": [],
                    "scale": null
                }
            ],
            "interviewLabel": "TemperatureMonitor-1_InterviewLabel",
            "isAdditionalPermissionRequiredToRun": null,
            "isTemplate": null,
            "label": "TemperatureMonitor",
            "loops": [
                {
                    "assignNextValueToReference": "myVariable_event_current_record",
                    "collectionReference": "myVariable_event_context_collection",
                    "description": null,
                    "elementSubtype": null,
                    "iterationOrder": "Asc",
                    "label": "ContextCheckLoop",
                    "locationX": 0,
                    "locationY": 0,
                    "name": "eventContextCheckLoop",
                    "nextValueConnector": {
                        "processMetadataValues": [],
                        "targetReference": "RecordCountAssignment"
                    },
                    "noMoreValuesConnector": {
                        "processMetadataValues": [],
                        "targetReference": "eventContextCheckDecision"
                    },
                    "processMetadataValues": []
                }
            ],
            "orchestratedStages": [],
            "processMetadataValues": [
                {
                    "name": "EventType",
                    "value": {
                        "booleanValue": null,
                        "dateTimeValue": null,
                        "dateValue": null,
                        "elementReference": null,
                        "numberValue": null,
                        "stringValue": "Notification__e"
                    }
                },
                {
                    "name": "ObjectType",
                    "value": {
                        "booleanValue": null,
                        "dateTimeValue": null,
                        "dateValue": null,
                        "elementReference": null,
                        "numberValue": null,
                        "stringValue": "Asset"
                    }
                }
            ],
            "processType": "CustomEvent",
            "recordCreates": [],
            "recordDeletes": [],
            "recordLookups": [
                {
                    "assignNullValuesIfNoRecordsFound": false,
                    "connector": {
                        "processMetadataValues": [],
                        "targetReference": "eventContextCheckLoop"
                    },
                    "description": null,
                    "elementSubtype": null,
                    "faultConnector": null,
                    "filterLogic": "and",
                    "filters": [
                        {
                            "field": "Name",
                            "operator": "EqualTo",
                            "processMetadataValues": [
                                {
                                    "name": "implicit",
                                    "value": {
                                        "booleanValue": false,
                                        "dateTimeValue": null,
                                        "dateValue": null,
                                        "elementReference": null,
                                        "numberValue": null,
                                        "stringValue": null
                                    }
                                },
                                {
                                    "name": "inputDataType",
                                    "value": {
                                        "booleanValue": null,
                                        "dateTimeValue": null,
                                        "dateValue": null,
                                        "elementReference": null,
                                        "numberValue": null,
                                        "stringValue": "String"
                                    }
                                },
                                {
                                    "name": "leftHandSideLabel",
                                    "value": {
                                        "booleanValue": null,
                                        "dateTimeValue": null,
                                        "dateValue": null,
                                        "elementReference": null,
                                        "numberValue": null,
                                        "stringValue": "Asset Name"
                                    }
                                },
                                {
                                    "name": "leftHandSideReferenceTo",
                                    "value": {
                                        "booleanValue": null,
                                        "dateTimeValue": null,
                                        "dateValue": null,
                                        "elementReference": null,
                                        "numberValue": null,
                                        "stringValue": ""
                                    }
                                },
                                {
                                    "name": "leftHandSideType",
                                    "value": {
                                        "booleanValue": null,
                                        "dateTimeValue": null,
                                        "dateValue": null,
                                        "elementReference": null,
                                        "numberValue": null,
                                        "stringValue": "String"
                                    }
                                },
                                {
                                    "name": "operatorDataType",
                                    "value": {
                                        "booleanValue": null,
                                        "dateTimeValue": null,
                                        "dateValue": null,
                                        "elementReference": null,
                                        "numberValue": null,
                                        "stringValue": "String"
                                    }
                                },
                                {
                                    "name": "rightHandSideType",
                                    "value": {
                                        "booleanValue": null,
                                        "dateTimeValue": null,
                                        "dateValue": null,
                                        "elementReference": null,
                                        "numberValue": null,
                                        "stringValue": "String"
                                    }
                                }
                            ],
                            "value": {
                                "booleanValue": null,
                                "dateTimeValue": null,
                                "dateValue": null,
                                "elementReference": null,
                                "numberValue": null,
                                "stringValue": "Furnace"
                            }
                        }
                    ],
                    "getFirstRecordOnly": null,
                    "label": "myEventContextRecordLookup",
                    "locationX": 0,
                    "locationY": 0,
                    "name": "myEventContextRecordLookup",
                    "object": "Asset",
                    "outputAssignments": [],
                    "outputReference": "myVariable_event_context_collection",
                    "processMetadataValues": [],
                    "queriedFields": null,
                    "sortField": null,
                    "sortOrder": null,
                    "storeOutputAutomatically": null
                }
            ],
            "recordUpdates": [],
            "rollbacks": [],
            "runInMode": null,
            "screens": [],
            "start": null,
            "startElementReference": "myEventContextRecordLookup",
            "status": "Active",
            "steps": [],
            "subflows": [],
            "textTemplates": [
                {
                    "description": "text template for when multiple records are records found",
                    "isViewedAsPlainText": false,
                    "name": "multipleRecordsFoundTextTemplate",
                    "processMetadataValues": [],
                    "text": "Hello {!OrganizationName} Admin, \n\nThe TemperatureMonitor process is configured to start when a Notification platform event message occurs. A Notification message occurred, but the process didn't start because multiple records in your org match the values specified in the process's Object node.\n\n\n\nTo fix this issue, adjust the matching filters in the process's Object node.\n\nThank you, \nSalesforce Process Automation"
                },
                {
                    "description": "text template for no records found",
                    "isViewedAsPlainText": false,
                    "name": "noRecordsFoundTextTemplate",
                    "processMetadataValues": [],
                    "text": "Hello {!OrganizationName} Admin, \n\nThe TemperatureMonitor process is configured to start when a Notification platform event message occurs. A Notification message occurred, but the process didn't start because no records in your org match the values specified in the process's Object node.\n\n\n\nTo fix this issue, adjust the matching filters in the process's Object node.\n\nThank you, \nSalesforce Process Automation"
                }
            ],
            "urls": null,
            "variables": [
                {
                    "apexClass": null,
                    "dataType": "SObject",
                    "description": null,
                    "isCollection": false,
                    "isInput": true,
                    "isOutput": true,
                    "name": "myVariable_event_context",
                    "objectType": "Asset",
                    "processMetadataValues": [],
                    "scale": null,
                    "value": null
                },
                {
                    "apexClass": null,
                    "dataType": "SObject",
                    "description": null,
                    "isCollection": true,
                    "isInput": true,
                    "isOutput": true,
                    "name": "myVariable_event_context_collection",
                    "objectType": "Asset",
                    "processMetadataValues": [],
                    "scale": null,
                    "value": null
                },
                {
                    "apexClass": null,
                    "dataType": "SObject",
                    "description": null,
                    "isCollection": false,
                    "isInput": true,
                    "isOutput": true,
                    "name": "myVariable_event_current_record",
                    "objectType": "Asset",
                    "processMetadataValues": [],
                    "scale": null,
                    "value": null
                },
                {
                    "apexClass": null,
                    "dataType": "Number",
                    "description": null,
                    "isCollection": false,
                    "isInput": true,
                    "isOutput": true,
                    "name": "myVariable_event_record_count",
                    "objectType": null,
                    "processMetadataValues": [],
                    "scale": 2,
                    "value": {
                        "booleanValue": null,
                        "dateTimeValue": null,
                        "dateValue": null,
                        "elementReference": null,
                        "numberValue": 0,
                        "stringValue": null
                    }
                },
                {
                    "apexClass": null,
                    "dataType": "SObject",
                    "description": null,
                    "isCollection": false,
                    "isInput": true,
                    "isOutput": false,
                    "name": "myVariable_myEvent",
                    "objectType": "Notification__e",
                    "processMetadataValues": [],
                    "scale": null,
                    "value": null
                }
            ],
            "waits": []
        },
        "FullName": "TemperatureMonitor",
        "IsTemplate": false,
        "RunInMode": null,
        "ApiVersion": null
    }
]
```

```json
[
    {
        "attributes": {
            "type": "Flow",
            "url": "/services/data/v52.0/tooling/sobjects/Flow/3013h000000QymtAAC"
        },
        "Id": "3013h000000QymtAAC",
        "DefinitionId": "3003h000000117hAAA",
        "MasterLabel": "Notify Dataflow State",
        "ManageableState": "unmanaged",
        "VersionNumber": 1,
        "Status": "InvalidDraft",
        "Description": "Notify Dataflow State",
        "ProcessType": "Workflow",
        "CreatedDate": "2021-01-12T15:38:53.000+0000",
        "CreatedById": "0053h000002xQ5sAAE",
        "LastModifiedDate": "2021-01-12T15:38:54.000+0000",
        "LastModifiedById": "0053h000002xQ5sAAE",
        "Metadata": {
            "actionCalls": [],
            "apexPluginCalls": [],
            "apiVersion": 50,
            "assignments": [
                {
                    "assignmentItems": [
                        {
                            "assignToReference": "myUniquelyDummyVariable",
                            "operator": "Assign",
                            "processMetadataValues": [],
                            "value": {
                                "booleanValue": null,
                                "dateTimeValue": null,
                                "dateValue": null,
                                "elementReference": null,
                                "numberValue": null,
                                "stringValue": "fakeVal"
                            }
                        }
                    ],
                    "connector": null,
                    "description": null,
                    "elementSubtype": null,
                    "label": "myUniquelyDummyAssignment",
                    "locationX": 0,
                    "locationY": 0,
                    "name": "myUniquelyDummyAssignment",
                    "processMetadataValues": []
                }
            ],
            "choices": [],
            "collectionProcessors": [],
            "constants": [],
            "decisions": [],
            "description": "Notify Dataflow State",
            "dynamicChoiceSets": [],
            "formulas": [],
            "interviewLabel": "Notify_Dataflow_State-1_InterviewLabel",
            "isAdditionalPermissionRequiredToRun": null,
            "isTemplate": null,
            "label": "Notify Dataflow State",
            "loops": [],
            "orchestratedStages": [],
            "processMetadataValues": null,
            "processType": "Workflow",
            "recordCreates": [],
            "recordDeletes": [],
            "recordLookups": [],
            "recordUpdates": [],
            "rollbacks": [],
            "runInMode": null,
            "screens": [],
            "start": null,
            "startElementReference": "myUniquelyDummyAssignment",
            "status": "InvalidDraft",
            "steps": [],
            "subflows": [],
            "textTemplates": [],
            "urls": null,
            "variables": [
                {
                    "apexClass": null,
                    "dataType": "String",
                    "description": null,
                    "isCollection": false,
                    "isInput": false,
                    "isOutput": false,
                    "name": "myUniquelyDummyVariable",
                    "objectType": null,
                    "processMetadataValues": [],
                    "scale": null,
                    "value": null
                }
            ],
            "waits": []
        },
        "FullName": "Notify_Dataflow_State",
        "IsTemplate": false,
        "RunInMode": null,
        "ApiVersion": 50
    }
]
```

