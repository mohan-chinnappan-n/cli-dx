# Dataflow job analyze

## List dataflow jobs
```
$ sfdx mohanc:ea:dataflow:jobs:list -u mohan.chinnappan.n_ea2@gmail.com  
Id,Label,Status,startDate,executedDate, duration(secs)
03C3h000002pSSeEAM,fieldusage_csvDataset Upload flow - Overwrite,Success,2020-10-24T03:28:19.000Z,2020-10-24T03:28:20.000Z,23
03C3h000002pLrNEAU,Default Salesforce Dataflow,Failure,2020-10-23T02:05:41.000Z,2020-10-23T02:05:41.000Z,4
0303h0000027E82AAE,The_Motivator,Failure,2020-10-23T02:06:23.000Z,undefined,undefined
03C3h000002pLrXEAU,The_Motivator,Success,2020-10-23T02:06:50.000Z,2020-10-23T02:06:51.000Z,72 <===============
03C3h000002pLoREAU,UserRole (Replication),Success,2020-10-23T02:06:03.000Z,2020-10-23T02:06:06.000Z,46
03C3h000002pLoSEAU,Event (Replication),Success,2020-10-23T02:06:03.000Z,2020-10-23T02:06:07.000Z,37
03C3h000002pLoQEAU,Task (Replication),Success,2020-10-23T02:06:03.000Z,2020-10-23T02:06:04.000Z,35
03C3h000002pL9VEAU,Default Salesforce Dataflow,Failure,2020-10-23T00:22:47.000Z,2020-10-23T00:22:47.000Z,3
03C3h000002pL0UEAU,PricebookEntry (Replication),Success,2020-10-23T00:21:35.000Z,2020-10-23T00:22:13.000Z,71
03C3h000002pKwIEAU,OpportunityLineItem (Replication),Success,2020-10-23T00:21:35.000Z,2020-10-23T00:22:12.000Z,71
03C3h000002pL9LEAU,Opportunity (SFDC_LOCAL),Success,2020-10-23T00:21:35.000Z,2020-10-23T00:22:12.000Z,71
03C3h000002pKzTEAU,Product2 (Replication),Success,2020-10-23T00:21:35.000Z,2020-10-23T00:21:39.000Z,37
03C3h000002pKzREAU,Account (SFDC_LOCAL),Success,2020-10-23T00:21:34.000Z,2020-10-23T00:21:37.000Z,36
03C3h000002pKzSEAU,User (SFDC_LOCAL),Success,2020-10-23T00:21:35.000Z,2020-10-23T00:21:38.000Z,36
```
## List dataflows
```
$ sfdx mohanc:ea:dataflow:list -u mohan.chinnappan.n_ea2@gmail.com  
Id,Label
02K3h000000Mu1oEAC,exportOppty2
02K3h000000Mu0vEAC,exportOppty
02K3h000000MtyuEAC,ExportCustomers
02K3h000000MrxWEAS,fruitsdf
02K3h000000Mr7JEAS,The_Motivator  <===============
02K3h000000Mr7KEAS,Default Salesforce Dataflow
```

```
$ sfdx mohanc:ea:dataflow:jobs:analyze -u mohan.chinnappan.n_ea2@gmail.com -j 03C3h000002pLrXEAU -d 02K3h000000Mr7JEAS
```
## Dataflow Viz 
![df viz](https://raw.githubusercontent.com/mohan-chinnappan-n/cli-dx/master/ea/03C3h000002pLrXEAU.svg)


```json
{
    "createdDate": "2020-10-23T02:06:50.000Z",
    "duration": 72,
    "executedDate": "2020-10-23T02:06:51.000Z",
    "id": "03C3h000002pLrXEAU",
    "jobType": "user",
    "label": "The_Motivator",
    "nodesUrl": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes",
    "progress": 1,
    "startDate": "2020-10-23T02:06:50.000Z",
    "status": "Success",
    "type": "dataflowjob",
    "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU",
    "nodes": [
        {
            "duration": 1,
            "id": "03L3h00000JVz8CEAT",
            "inputRows": {
                "processedCount": 1001
            },
            "label": "Extract_Account",
            "message": "",
            "name": "Extract_Account",
            "nodeType": "internal",
            "outputRows": {
                "failedCount": 0,
                "processedCount": 1001
            },
            "startDate": "2020-10-23T02:06:51.062Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz8CEAT",
            "def": {
                "action": "sfdcDigest",
                "parameters": {
                    "SFDCtoken": "SFDCtoken",
                    "fields": [
                        {
                            "name": "Id"
                        },
                        {
                            "name": "Name"
                        },
                        {
                            "name": "OwnerId"
                        },
                        {
                            "name": "Type"
                        },
                        {
                            "name": "Industry"
                        },
                        {
                            "name": "BillingCountry"
                        },
                        {
                            "fiscalMonthOffset": 6,
                            "firstDayOfWeek": 0,
                            "name": "CreatedDate"
                        }
                    ],
                    "object": "Account"
                }
            }
        },
        {
            "duration": 2,
            "id": "03L3h00000JVz8IEAT",
            "inputRows": {
                "processedCount": 241
            },
            "label": "Extract_Event",
            "message": "",
            "name": "Extract_Event",
            "nodeType": "internal",
            "outputRows": {
                "failedCount": 0,
                "processedCount": 241
            },
            "startDate": "2020-10-23T02:06:52.483Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz8IEAT",
            "def": {
                "schema": {
                    "objects": [
                        {
                            "fields": [
                                {
                                    "name": "CreatedDate",
                                    "label": "CreatedDate"
                                },
                                {
                                    "name": "ActivityDate",
                                    "label": "ActivityDate"
                                }
                            ]
                        }
                    ]
                },
                "action": "sfdcDigest",
                "parameters": {
                    "fields": [
                        {
                            "name": "OwnerId"
                        },
                        {
                            "fiscalMonthOffset": 6,
                            "firstDayOfWeek": 0,
                            "name": "CreatedDate"
                        },
                        {
                            "fiscalMonthOffset": 6,
                            "firstDayOfWeek": 0,
                            "name": "LastModifiedDate"
                        },
                        {
                            "fiscalMonthOffset": 6,
                            "firstDayOfWeek": 0,
                            "name": "ActivityDate"
                        },
                        {
                            "name": "Subject"
                        },
                        {
                            "name": "DurationInMinutes"
                        },
                        {
                            "name": "EventSubtype"
                        },
                        {
                            "name": "WhatId"
                        },
                        {
                            "name": "AccountId"
                        }
                    ],
                    "object": "Event"
                }
            }
        },
        {
            "duration": 2,
            "id": "03L3h00000JVz7sEAD",
            "inputRows": {
                "processedCount": 706
            },
            "label": "Extract_Opportunity",
            "message": "",
            "name": "Extract_Opportunity",
            "nodeType": "internal",
            "outputRows": {
                "failedCount": 0,
                "processedCount": 706
            },
            "startDate": "2020-10-23T02:06:54.717Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz7sEAD",
            "def": {
                "schema": {
                    "objects": [
                        {
                            "fields": [
                                {
                                    "name": "CloseDate",
                                    "label": "CloseDate"
                                }
                            ]
                        }
                    ]
                },
                "action": "sfdcDigest",
                "parameters": {
                    "SFDCtoken": "SFDCtoken",
                    "fields": [
                        {
                            "name": "Id"
                        },
                        {
                            "name": "AccountId"
                        },
                        {
                            "name": "OwnerId"
                        },
                        {
                            "name": "Name"
                        },
                        {
                            "name": "StageName"
                        },
                        {
                            "name": "IsWon"
                        },
                        {
                            "name": "Type"
                        },
                        {
                            "name": "IsClosed"
                        },
                        {
                            "name": "CreatedDate"
                        },
                        {
                            "name": "CloseDate"
                        },
                        {
                            "name": "Amount"
                        },
                        {
                            "name": "LastActivityDate"
                        },
                        {
                            "name": "RecordTypeId"
                        }
                    ],
                    "object": "Opportunity"
                }
            }
        },
        {
            "duration": 2,
            "id": "03L3h00000JVz7tEAD",
            "inputRows": {
                "processedCount": 2079
            },
            "label": "Extract_Task",
            "message": "",
            "name": "Extract_Task",
            "nodeType": "internal",
            "outputRows": {
                "failedCount": 0,
                "processedCount": 2079
            },
            "startDate": "2020-10-23T02:06:57.016Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz7tEAD",
            "def": {
                "schema": {
                    "objects": [
                        {
                            "fields": [
                                {
                                    "name": "CreatedDate",
                                    "label": "CreatedDate"
                                },
                                {
                                    "name": "ActivityDate",
                                    "label": "ActivityDate"
                                }
                            ]
                        }
                    ]
                },
                "action": "sfdcDigest",
                "parameters": {
                    "fields": [
                        {
                            "name": "Id"
                        },
                        {
                            "name": "CallDurationInSeconds"
                        },
                        {
                            "name": "CallDisposition"
                        },
                        {
                            "name": "CallType"
                        },
                        {
                            "name": "OwnerId"
                        },
                        {
                            "name": "Status"
                        },
                        {
                            "name": "Priority"
                        },
                        {
                            "name": "IsClosed"
                        },
                        {
                            "name": "TaskSubtype"
                        },
                        {
                            "fiscalMonthOffset": 6,
                            "firstDayOfWeek": 0,
                            "name": "CreatedDate"
                        },
                        {
                            "fiscalMonthOffset": 6,
                            "firstDayOfWeek": 0,
                            "name": "ActivityDate"
                        },
                        {
                            "fiscalMonthOffset": 6,
                            "firstDayOfWeek": 0,
                            "name": "LastModifiedDate"
                        },
                        {
                            "name": "Subject"
                        },
                        {
                            "name": "WhatId"
                        },
                        {
                            "name": "AccountId"
                        }
                    ],
                    "object": "Task"
                }
            }
        },
        {
            "duration": 0,
            "id": "03L3h00000JVz7wEAD",
            "inputRows": {
                "processedCount": 27
            },
            "label": "Extract_User",
            "message": "",
            "name": "Extract_User",
            "nodeType": "internal",
            "outputRows": {
                "failedCount": 0,
                "processedCount": 27
            },
            "startDate": "2020-10-23T02:06:59.696Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz7wEAD",
            "def": {
                "action": "sfdcDigest",
                "parameters": {
                    "SFDCtoken": "SFDCtoken",
                    "fields": [
                        {
                            "name": "Id"
                        },
                        {
                            "name": "Username"
                        },
                        {
                            "name": "Name"
                        },
                        {
                            "name": "FirstName"
                        },
                        {
                            "name": "LastName"
                        },
                        {
                            "name": "UserRoleId"
                        },
                        {
                            "name": "UserType"
                        },
                        {
                            "name": "IsActive"
                        },
                        {
                            "name": "FullPhotoUrl"
                        },
                        {
                            "name": "SmallPhotoUrl"
                        },
                        {
                            "defaultValue": "N/A",
                            "name": "ManagerId"
                        }
                    ],
                    "object": "User"
                }
            }
        },
        {
            "duration": 1,
            "id": "03L3h00000JVz8FEAT",
            "inputRows": {
                "processedCount": 5
            },
            "label": "Extract_UserRole",
            "message": "",
            "name": "Extract_UserRole",
            "nodeType": "internal",
            "outputRows": {
                "failedCount": 0,
                "processedCount": 5
            },
            "startDate": "2020-10-23T02:07:00.656Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz8FEAT",
            "def": {
                "action": "sfdcDigest",
                "parameters": {
                    "SFDCtoken": "SFDCtoken",
                    "fields": [
                        {
                            "name": "Id"
                        },
                        {
                            "name": "Name"
                        },
                        {
                            "name": "DeveloperName"
                        },
                        {
                            "name": "ParentRoleId"
                        },
                        {
                            "fiscalMonthOffset": 6,
                            "firstDayOfWeek": 0,
                            "name": "LastModifiedDate"
                        },
                        {
                            "name": "LastModifiedById"
                        },
                        {
                            "name": "SystemModstamp"
                        }
                    ],
                    "object": "UserRole"
                }
            }
        },
        {
            "duration": 0,
            "id": "03L3h00000JVz7yEAD",
            "inputRows": {
                "processedCount": 241
            },
            "label": "Add_Fields_To_Event",
            "message": "",
            "name": "Add_Fields_To_Event",
            "nodeType": "computeExpression",
            "outputRows": {
                "failedCount": 0,
                "processedCount": 241
            },
            "startDate": "2020-10-23T02:07:02.493Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz7yEAD",
            "def": {
                "action": "computeExpression",
                "parameters": {
                    "source": "Extract_Event",
                    "mergeWithSource": true,
                    "computedFields": [
                        {
                            "name": "CallDisposition",
                            "saqlExpression": "&quot;Event&quot;",
                            "label": "CallDisposition",
                            "type": "Text"
                        },
                        {
                            "name": "CallType",
                            "saqlExpression": "&quot;Event&quot;",
                            "label": "CallType",
                            "type": "Text"
                        },
                        {
                            "name": "Status",
                            "saqlExpression": "&quot;Event&quot;",
                            "label": "Status",
                            "type": "Text"
                        },
                        {
                            "name": "Priority",
                            "saqlExpression": "&quot;Event&quot;",
                            "label": "Priority",
                            "type": "Text"
                        },
                        {
                            "name": "TaskSubtype",
                            "saqlExpression": "EventSubtype",
                            "label": "TaskSubtype",
                            "type": "Text"
                        },
                        {
                            "defaultValue": "0",
                            "precision": 8,
                            "name": "CallDurationInSeconds",
                            "saqlExpression": "0",
                            "scale": 0,
                            "label": "CallDurationInSeconds",
                            "type": "Numeric"
                        },
                        {
                            "name": "IsClosed",
                            "saqlExpression": "case when daysBetween(toDate(ActivityDate_sec_epoch), now()) &gt;= 0 then &quot;true&quot; else &quot;false&quot; end",
                            "label": "IsClosed",
                            "type": "Text"
                        }
                    ]
                }
            }
        },
        {
            "duration": 1,
            "id": "03L3h00000JVz8DEAT",
            "inputRows": {
                "processedCount": 2079
            },
            "label": "Add_Fields_To_Task",
            "message": "",
            "name": "Add_Fields_To_Task",
            "nodeType": "computeExpression",
            "outputRows": {
                "failedCount": 0,
                "processedCount": 2079
            },
            "startDate": "2020-10-23T02:07:03.403Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz8DEAT",
            "def": {
                "action": "computeExpression",
                "parameters": {
                    "source": "Extract_Task",
                    "mergeWithSource": true,
                    "computedFields": [
                        {
                            "name": "EventSubtype",
                            "saqlExpression": "TaskSubtype",
                            "label": "EventSubtype",
                            "type": "Text"
                        },
                        {
                            "defaultValue": "0",
                            "precision": 8,
                            "name": "DurationInMinutes",
                            "saqlExpression": "0",
                            "scale": 0,
                            "label": "DurationInMinutes",
                            "type": "Numeric"
                        }
                    ]
                }
            }
        },
        {
            "duration": 0,
            "id": "03L3h00000JVz84EAD",
            "inputRows": {
                "processedCount": 27
            },
            "label": "Filter_User",
            "message": "",
            "name": "Filter_User",
            "nodeType": "filter",
            "outputRows": {
                "processedCount": 23
            },
            "startDate": "2020-10-23T02:07:04.599Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz84EAD",
            "def": {
                "action": "filter",
                "parameters": {
                    "filter": "UserType:EQ:Standard|PowerPartner",
                    "source": "Extract_User"
                }
            }
        },
        {
            "duration": 0,
            "id": "03L3h00000JVz8JEAT",
            "inputRows": {
                "processedCount": 5
            },
            "label": "Flatten_UserRole",
            "message": "",
            "name": "Flatten_UserRole",
            "nodeType": "flatten",
            "outputRows": {
                "processedCount": 5
            },
            "startDate": "2020-10-23T02:07:04.616Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz8JEAT",
            "def": {
                "schema": {
                    "objects": [
                        {
                            "fields": [
                                {
                                    "name": "Roles",
                                    "label": "Roles",
                                    "isSystemField": false
                                },
                                {
                                    "name": "RolePath",
                                    "label": "RolePath",
                                    "isSystemField": false
                                }
                            ]
                        }
                    ]
                },
                "action": "flatten",
                "parameters": {
                    "self_field": "Id",
                    "multi_field": "Roles",
                    "parent_field": "ParentRoleId",
                    "path_field": "RolePath",
                    "source": "Extract_UserRole"
                }
            }
        },
        {
            "duration": 0,
            "id": "03L3h00000JVz7vEAD",
            "inputRows": {
                "processedCount": 2320
            },
            "label": "Append_TaskEvent",
            "message": "",
            "name": "Append_TaskEvent",
            "nodeType": "append",
            "outputRows": {
                "processedCount": 2320
            },
            "startDate": "2020-10-23T02:07:05.241Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz7vEAD",
            "def": {
                "action": "append",
                "parameters": {
                    "enableDisjointedSchemaMerge": true,
                    "sources": [
                        "Add_Fields_To_Task",
                        "Add_Fields_To_Event"
                    ]
                }
            }
        },
        {
            "duration": 0,
            "id": "03L3h00000JVz7rEAD",
            "inputRows": {
                "processedCount": 23
            },
            "label": "Compute_Manager_Unique",
            "message": "",
            "name": "Compute_Manager_Unique",
            "nodeType": "computeExpression",
            "outputRows": {
                "failedCount": 0,
                "processedCount": 23
            },
            "startDate": "2020-10-23T02:07:05.265Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz7rEAD",
            "def": {
                "action": "computeExpression",
                "parameters": {
                    "source": "Filter_User",
                    "mergeWithSource": true,
                    "computedFields": [
                        {
                            "name": "UniqueUserName",
                            "saqlExpression": "&#39;Name&#39;",
                            "type": "Text"
                        }
                    ]
                }
            }
        },
        {
            "duration": 0,
            "id": "03L3h00000JVz8BEAT",
            "inputRows": {
                "failedCount": 0,
                "processedCount": 5
            },
            "label": "Augment_ParentName",
            "message": "",
            "name": "Augment_ParentName",
            "nodeType": "augment",
            "outputRows": {
                "failedCount": 0,
                "processedCount": 5
            },
            "startDate": "2020-10-23T02:07:05.802Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz8BEAT",
            "def": {
                "action": "augment",
                "parameters": {
                    "right_key": [
                        "Id"
                    ],
                    "left": "Flatten_UserRole",
                    "left_key": [
                        "ParentRoleId"
                    ],
                    "right_select": [
                        "Name",
                        "DeveloperName",
                        "ParentRoleId"
                    ],
                    "right": "Extract_UserRole",
                    "relationship": "ParentRole"
                }
            }
        },
        {
            "duration": 0,
            "id": "03L3h00000JVz8AEAT",
            "inputRows": {
                "processedCount": 5
            },
            "label": "Flatten_ParentName",
            "message": "",
            "name": "Flatten_ParentName",
            "nodeType": "flatten",
            "outputRows": {
                "processedCount": 5
            },
            "startDate": "2020-10-23T02:07:06.441Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz8AEAT",
            "def": {
                "schema": {
                    "objects": [
                        {
                            "fields": [
                                {
                                    "name": "RoleNames",
                                    "label": "RoleNames",
                                    "isSystemField": false
                                },
                                {
                                    "name": "RoleNamesPath",
                                    "label": "RoleNamesPath",
                                    "isSystemField": false
                                }
                            ]
                        }
                    ]
                },
                "action": "flatten",
                "parameters": {
                    "include_self_id": true,
                    "self_field": "DeveloperName",
                    "multi_field": "RoleNames",
                    "parent_field": "ParentRole.DeveloperName",
                    "path_field": "RoleNamesPath",
                    "source": "Augment_ParentName"
                }
            }
        },
        {
            "duration": 0,
            "id": "03L3h00000JVz85EAD",
            "inputRows": {
                "processedCount": 5
            },
            "label": "Flatten_Hierarchy_Grouping",
            "message": "",
            "name": "Flatten_Hierarchy_Grouping",
            "nodeType": "flatten",
            "outputRows": {
                "processedCount": 5
            },
            "startDate": "2020-10-23T02:07:07.224Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz85EAD",
            "def": {
                "schema": {
                    "objects": [
                        {
                            "fields": [
                                {
                                    "name": "Hierarchy_RoleNames",
                                    "label": "Hierarchy_RoleNames",
                                    "isSystemField": false
                                },
                                {
                                    "name": "Hierarchy_RoleNamesPath",
                                    "label": "Hierarchy_RoleNamesPath",
                                    "isSystemField": false
                                }
                            ]
                        }
                    ]
                },
                "action": "flatten",
                "parameters": {
                    "include_self_id": true,
                    "self_field": "DeveloperName",
                    "multi_field": "Hierarchy_RoleNames",
                    "parent_field": "ParentRole.DeveloperName",
                    "path_field": "Hierarchy_RoleNamesPath",
                    "source": "Flatten_ParentName"
                }
            }
        },
        {
            "duration": 0,
            "id": "03L3h00000JVz8GEAT",
            "inputRows": {
                "failedCount": 0,
                "processedCount": 23
            },
            "label": "User_with_Roles",
            "message": "",
            "name": "User_with_Roles",
            "nodeType": "augment",
            "outputRows": {
                "failedCount": 0,
                "processedCount": 23
            },
            "startDate": "2020-10-23T02:07:08.063Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz8GEAT",
            "def": {
                "action": "augment",
                "parameters": {
                    "right_key": [
                        "Id"
                    ],
                    "left": "Compute_Manager_Unique",
                    "left_key": [
                        "UserRoleId"
                    ],
                    "right_select": [
                        "Name",
                        "DeveloperName",
                        "Roles",
                        "RolePath",
                        "ParentRoleId",
                        "ParentRole.Name",
                        "ParentRole.DeveloperName",
                        "RoleNames",
                        "Hierarchy_RoleNames",
                        "RoleNamesPath"
                    ],
                    "right": "Flatten_Hierarchy_Grouping",
                    "relationship": "Role"
                }
            }
        },
        {
            "duration": 0,
            "id": "03L3h00000JVz8EEAT",
            "inputRows": {
                "failedCount": 0,
                "processedCount": 2320
            },
            "label": "Join_ActivityOwner",
            "message": "",
            "name": "Join_ActivityOwner",
            "nodeType": "augment",
            "outputRows": {
                "failedCount": 0,
                "processedCount": 2320
            },
            "startDate": "2020-10-23T02:07:08.373Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz8EEAT",
            "def": {
                "action": "augment",
                "parameters": {
                    "right_key": [
                        "Id"
                    ],
                    "left": "Append_TaskEvent",
                    "left_key": [
                        "OwnerId"
                    ],
                    "right_select": [
                        "Name",
                        "Username",
                        "UserRoleId",
                        "UniqueUserName",
                        "FullPhotoUrl",
                        "SmallPhotoUrl",
                        "Role.Name",
                        "Role.DeveloperName",
                        "Role.Roles",
                        "Role.RolePath",
                        "Role.ParentRoleId",
                        "Role.ParentRole.Name",
                        "Role.ParentRole.DeveloperName",
                        "Role.RoleNames",
                        "Role.RoleNamesPath",
                        "Role.Hierarchy_RoleNames"
                    ],
                    "right": "User_with_Roles",
                    "relationship": "Owner"
                }
            }
        },
        {
            "duration": 0,
            "id": "03L3h00000JVz8KEAT",
            "inputRows": {
                "failedCount": 0,
                "processedCount": 23
            },
            "label": "User_with_Roles_with_Opportunities",
            "message": "",
            "name": "User_with_Roles_with_Opportunities",
            "nodeType": "augment",
            "outputRows": {
                "failedCount": 0,
                "processedCount": 23
            },
            "startDate": "2020-10-23T02:07:09.195Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz8KEAT",
            "def": {
                "action": "augment",
                "parameters": {
                    "right_key": [
                        "OwnerId"
                    ],
                    "left": "User_with_Roles",
                    "left_key": [
                        "Id"
                    ],
                    "right_select": [
                        "Name"
                    ],
                    "right": "Extract_Opportunity",
                    "relationship": "Opportunity"
                }
            }
        },
        {
            "duration": 1,
            "id": "03L3h00000JVz86EAD",
            "inputRows": {
                "failedCount": 0,
                "processedCount": 2320
            },
            "label": "Join_ActivityOwner_Product_Opp",
            "message": "",
            "name": "Join_ActivityOwner_Product_Opp",
            "nodeType": "augment",
            "outputRows": {
                "failedCount": 0,
                "processedCount": 2320
            },
            "startDate": "2020-10-23T02:07:09.604Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz86EAD",
            "def": {
                "action": "augment",
                "parameters": {
                    "right_key": [
                        "Id"
                    ],
                    "left": "Join_ActivityOwner",
                    "left_key": [
                        "WhatId"
                    ],
                    "right_select": [
                        "Id",
                        "StageName",
                        "Name",
                        "Type",
                        "OwnerId",
                        "AccountId",
                        "CloseDate",
                        "CreatedDate",
                        "RecordTypeId",
                        "IsClosed"
                    ],
                    "right": "Extract_Opportunity",
                    "relationship": "Opportunity"
                }
            }
        },
        {
            "duration": 1,
            "id": "03L3h00000JVz81EAD",
            "inputRows": {
                "processedCount": 23
            },
            "label": "Users_Custom_Filter_Flag",
            "message": "",
            "name": "Users_Custom_Filter_Flag",
            "nodeType": "computeExpression",
            "outputRows": {
                "failedCount": 0,
                "processedCount": 23
            },
            "startDate": "2020-10-23T02:07:11.226Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz81EAD",
            "def": {
                "action": "computeExpression",
                "parameters": {
                    "source": "User_with_Roles_with_Opportunities",
                    "mergeWithSource": true,
                    "computedFields": [
                        {
                            "name": "hasOpportunity",
                            "saqlExpression": "case when &#39;Opportunity.Name&#39; is null then &quot;false&quot; else &quot;true&quot; end",
                            "type": "Text"
                        },
                        {
                            "name": "CustomFilter",
                            "saqlExpression": "case when &#39;Opportunity.Name&#39; is null &amp;&amp; &#39;IsActive&#39; == &quot;false&quot; then &quot;false&quot; else &quot;true&quot; end",
                            "type": "Text"
                        }
                    ]
                }
            }
        },
        {
            "duration": 2,
            "id": "03L3h00000JVz7xEAD",
            "inputRows": {
                "failedCount": 0,
                "processedCount": 2320
            },
            "label": "Join_ActivityOwner_Product_Opp_User",
            "message": "",
            "name": "Join_ActivityOwner_Product_Opp_User",
            "nodeType": "augment",
            "outputRows": {
                "failedCount": 0,
                "processedCount": 2320
            },
            "startDate": "2020-10-23T02:07:12.357Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz7xEAD",
            "def": {
                "action": "augment",
                "parameters": {
                    "right_key": [
                        "Id"
                    ],
                    "left": "Join_ActivityOwner_Product_Opp",
                    "left_key": [
                        "OwnerId"
                    ],
                    "right_select": [
                        "Name",
                        "UniqueUserName"
                    ],
                    "right": "Compute_Manager_Unique",
                    "relationship": "AssignedTo"
                }
            }
        },
        {
            "duration": 0,
            "id": "03L3h00000JVz7zEAD",
            "inputRows": {
                "processedCount": 23
            },
            "label": "Filter_UserManager",
            "message": "",
            "name": "Filter_UserManager",
            "nodeType": "filter",
            "outputRows": {
                "processedCount": 21
            },
            "startDate": "2020-10-23T02:07:14.765Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz7zEAD",
            "def": {
                "action": "filter",
                "parameters": {
                    "filter": "CustomFilter:EQ:true",
                    "source": "Users_Custom_Filter_Flag"
                }
            }
        },
        {
            "duration": 2,
            "id": "03L3h00000JVz80EAD",
            "inputRows": {
                "failedCount": 0,
                "processedCount": 2320
            },
            "label": "Join_ActivityOwner_Product_Opp_User_Account",
            "message": "",
            "name": "Join_ActivityOwner_Product_Opp_User_Account",
            "nodeType": "augment",
            "outputRows": {
                "failedCount": 0,
                "processedCount": 2320
            },
            "startDate": "2020-10-23T02:07:14.786Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz80EAD",
            "def": {
                "action": "augment",
                "parameters": {
                    "right_key": [
                        "Id"
                    ],
                    "left": "Join_ActivityOwner_Product_Opp_User",
                    "left_key": [
                        "AccountId"
                    ],
                    "right_select": [
                        "Name",
                        "OwnerId",
                        "Type",
                        "Industry",
                        "BillingCountry"
                    ],
                    "right": "Extract_Account",
                    "relationship": "Account"
                }
            }
        },
        {
            "duration": 0,
            "id": "03L3h00000JVz7uEAD",
            "inputRows": {},
            "label": "optimize-Register_User",
            "message": "",
            "name": "optimize-Register_User",
            "nodeType": "internal",
            "outputRows": {},
            "startDate": "2020-10-23T02:07:17.164Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz7uEAD"
        },
        {
            "duration": 2,
            "id": "03L3h00000JVz87EAD",
            "inputRows": {
                "processedCount": 2320
            },
            "label": "Compute_Activity_IsOverdue",
            "message": "",
            "name": "Compute_Activity_IsOverdue",
            "nodeType": "computeExpression",
            "outputRows": {
                "failedCount": 0,
                "processedCount": 2320
            },
            "startDate": "2020-10-23T02:07:17.348Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz87EAD",
            "def": {
                "action": "computeExpression",
                "parameters": {
                    "source": "Join_ActivityOwner_Product_Opp_User_Account",
                    "mergeWithSource": true,
                    "computedFields": [
                        {
                            "name": "IsOverdue",
                            "saqlExpression": "case when (&#39;IsClosed&#39; == &quot;false&quot;) &amp;&amp; (daysBetween(toDate(substr(&#39;ActivityDate&#39;, 1, 10), &quot;yyyy-MM-dd&quot;), now()) &gt; 0) then &quot;true&quot; else &quot;false&quot; end",
                            "label": "IsOverdue",
                            "type": "Text"
                        }
                    ]
                }
            }
        },
        {
            "duration": 10,
            "id": "03L3h00000JVz82EAD",
            "inputRows": {},
            "label": "Register_User",
            "message": "",
            "name": "Register_User",
            "nodeType": "internal",
            "outputRows": {},
            "startDate": "2020-10-23T02:07:20.183Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz82EAD",
            "def": {
                "action": "sfdcRegister",
                "parameters": {
                    "SFDCtoken": "SFDCtoken",
                    "rowLevelSecurityFilter": "",
                    "name": "Users",
                    "alias": "user",
                    "source": "Filter_UserManager"
                }
            }
        },
        {
            "duration": 1,
            "id": "03L3h00000JVz8HEAT",
            "inputRows": {
                "processedCount": 2320
            },
            "label": "Compute_Activity_Days_Overdue",
            "message": "",
            "name": "Compute_Activity_Days_Overdue",
            "nodeType": "computeExpression",
            "outputRows": {
                "failedCount": 0,
                "processedCount": 2320
            },
            "startDate": "2020-10-23T02:07:30.852Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz8HEAT",
            "def": {
                "action": "computeExpression",
                "parameters": {
                    "source": "Compute_Activity_IsOverdue",
                    "mergeWithSource": true,
                    "computedFields": [
                        {
                            "defaultValue": "0",
                            "precision": 18,
                            "name": "DaysOverdue",
                            "saqlExpression": "case when &#39;IsOverdue&#39; == &quot;true&quot; then daysBetween(toDate(substr(&#39;ActivityDate&#39;, 1, 10), &quot;yyyy-MM-dd&quot;), now()) else 0 end",
                            "scale": 2,
                            "label": "Days Overdue",
                            "type": "Numeric"
                        }
                    ]
                }
            }
        },
        {
            "duration": 1,
            "id": "03L3h00000JVz89EAD",
            "inputRows": {
                "processedCount": 2320
            },
            "label": "Activity_Custom_Filter_Flag",
            "message": "",
            "name": "Activity_Custom_Filter_Flag",
            "nodeType": "computeExpression",
            "outputRows": {
                "failedCount": 0,
                "processedCount": 2320
            },
            "startDate": "2020-10-23T02:07:32.757Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz89EAD",
            "def": {
                "action": "computeExpression",
                "parameters": {
                    "source": "Compute_Activity_Days_Overdue",
                    "mergeWithSource": true,
                    "computedFields": [
                        {
                            "name": "CustomFilter",
                            "saqlExpression": "&quot;true&quot;",
                            "type": "Text"
                        }
                    ]
                }
            }
        },
        {
            "duration": 0,
            "id": "03L3h00000JVz7qEAD",
            "inputRows": {
                "processedCount": 2320
            },
            "label": "Filter_Activity",
            "message": "",
            "name": "Filter_Activity",
            "nodeType": "filter",
            "outputRows": {
                "processedCount": 2320
            },
            "startDate": "2020-10-23T02:07:34.757Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz7qEAD",
            "def": {
                "action": "filter",
                "parameters": {
                    "filter": "CustomFilter:EQ:true",
                    "source": "Activity_Custom_Filter_Flag"
                }
            }
        },
        {
            "duration": 0,
            "id": "03L3h00000JVz88EAD",
            "inputRows": {},
            "label": "optimize-Register_Activity",
            "message": "",
            "name": "optimize-Register_Activity",
            "nodeType": "internal",
            "outputRows": {},
            "startDate": "2020-10-23T02:07:34.808Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz88EAD"
        },
        {
            "duration": 15,
            "id": "03L3h00000JVz83EAD",
            "inputRows": {},
            "label": "Register_Activity",
            "message": "",
            "name": "Register_Activity",
            "nodeType": "internal",
            "outputRows": {},
            "startDate": "2020-10-23T02:07:35.336Z",
            "status": "success",
            "type": "dataflowjobnode",
            "url": "/services/data/v50.0/wave/dataflowjobs/03C3h000002pLrXEAU/nodes/03L3h00000JVz83EAD",
            "def": {
                "action": "sfdcRegister",
                "parameters": {
                    "SFDCtoken": "SFDCtoken",
                    "rowLevelSecurityFilter": "",
                    "name": "Activities",
                    "alias": "activity",
                    "source": "Filter_Activity"
                }
            }
        }
    ]
}


``
