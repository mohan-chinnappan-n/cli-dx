# Org Limits
```
$ sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/limits -f ~/.headers/header_ea.json -m GET > ~/.org/limits.json

$ cat ~/.org/limits.json
```

```json
{
    "AnalyticsExternalDataSizeMB": {
        "Max": 40960,
        "Remaining": 40960
    },
    "BOZosCalloutHourlyLimit": {
        "Max": 20000,
        "Remaining": 20000
    },
    "ConcurrentAsyncGetReportInstances": {
        "Max": 200,
        "Remaining": 200
    },
    "ConcurrentEinsteinDataInsightsStoryCreation": {
        "Max": 5,
        "Remaining": 5
    },
    "ConcurrentEinsteinDiscoveryStoryCreation": {
        "Max": 2,
        "Remaining": 2
    },
    "ConcurrentSyncReportRuns": {
        "Max": 20,
        "Remaining": 20
    },
    "DailyAnalyticsDataflowJobExecutions": {
        "Max": 60,
        "Remaining": 60
    },
    "DailyAnalyticsUploadedFilesSizeMB": {
        "Max": 51200,
        "Remaining": 51200
    },
    "DailyApiRequests": {
        "Max": 15000,
        "Remaining": 14998,
        "Ant Migration Tool": {
            "Max": 0,
            "Remaining": 0
        },
        "Dataloader Bulk": {
            "Max": 0,
            "Remaining": 0
        },
        "Dataloader Partner": {
            "Max": 0,
            "Remaining": 0
        },
        "Force.com IDE": {
            "Max": 0,
            "Remaining": 0
        },
        "JWTTest": {
            "Max": 0,
            "Remaining": 0
        },
        "Salesforce Mobile Dashboards": {
            "Max": 0,
            "Remaining": 0
        },
        "Salesforce Touch": {
            "Max": 0,
            "Remaining": 0
        },
        "Salesforce for Outlook": {
            "Max": 0,
            "Remaining": 0
        },
        "Salesforce_to_SalesforceIQ_Secure_Connected_App": {
            "Max": 0,
            "Remaining": 0
        },
        "Workbench": {
            "Max": 0,
            "Remaining": 0
        },
        "mohansun4ConnApp": {
            "Max": 0,
            "Remaining": 0
        },
        "mohansunCApp": {
            "Max": 0,
            "Remaining": 0
        }
    },
    "DailyAsyncApexExecutions": {
        "Max": 250000,
        "Remaining": 250000
    },
    "DailyBulkApiBatches": {
        "Max": 15000,
        "Remaining": 15000,
        "Ant Migration Tool": {
            "Max": 0,
            "Remaining": 0
        },
        "Dataloader Bulk": {
            "Max": 0,
            "Remaining": 0
        },
        "Dataloader Partner": {
            "Max": 0,
            "Remaining": 0
        },
        "Force.com IDE": {
            "Max": 0,
            "Remaining": 0
        },
        "JWTTest": {
            "Max": 0,
            "Remaining": 0
        },
        "Salesforce Mobile Dashboards": {
            "Max": 0,
            "Remaining": 0
        },
        "Salesforce Touch": {
            "Max": 0,
            "Remaining": 0
        },
        "Salesforce for Outlook": {
            "Max": 0,
            "Remaining": 0
        },
        "Salesforce_to_SalesforceIQ_Secure_Connected_App": {
            "Max": 0,
            "Remaining": 0
        },
        "Workbench": {
            "Max": 0,
            "Remaining": 0
        },
        "mohansun4ConnApp": {
            "Max": 0,
            "Remaining": 0
        },
        "mohansunCApp": {
            "Max": 0,
            "Remaining": 0
        }
    },
    "DailyBulkV2QueryFileStorageMB": {
        "Max": 976562,
        "Remaining": 976562
    },
    "DailyBulkV2QueryJobs": {
        "Max": 10000,
        "Remaining": 10000
    },
    "DailyDurableGenericStreamingApiEvents": {
        "Max": 10000,
        "Remaining": 10000
    },
    "DailyDurableStreamingApiEvents": {
        "Max": 10000,
        "Remaining": 10000
    },
    "DailyEinsteinDataInsightsStoryCreation": {
        "Max": 1000,
        "Remaining": 1000
    },
    "DailyEinsteinDiscoveryPredictAPICalls": {
        "Max": 50000,
        "Remaining": 50000
    },
    "DailyEinsteinDiscoveryPredictionsByCDC": {
        "Max": 500000,
        "Remaining": 500000
    },
    "DailyEinsteinDiscoveryStoryCreation": {
        "Max": 100,
        "Remaining": 100
    },
    "DailyGenericStreamingApiEvents": {
        "Max": 10000,
        "Remaining": 10000,
        "Ant Migration Tool": {
            "Max": 0,
            "Remaining": 0
        },
        "Dataloader Bulk": {
            "Max": 0,
            "Remaining": 0
        },
        "Dataloader Partner": {
            "Max": 0,
            "Remaining": 0
        },
        "Force.com IDE": {
            "Max": 0,
            "Remaining": 0
        },
        "JWTTest": {
            "Max": 0,
            "Remaining": 0
        },
        "Salesforce Mobile Dashboards": {
            "Max": 0,
            "Remaining": 0
        },
        "Salesforce Touch": {
            "Max": 0,
            "Remaining": 0
        },
        "Salesforce for Outlook": {
            "Max": 0,
            "Remaining": 0
        },
        "Salesforce_to_SalesforceIQ_Secure_Connected_App": {
            "Max": 0,
            "Remaining": 0
        },
        "Workbench": {
            "Max": 0,
            "Remaining": 0
        },
        "mohansun4ConnApp": {
            "Max": 0,
            "Remaining": 0
        },
        "mohansunCApp": {
            "Max": 0,
            "Remaining": 0
        }
    },
    "DailyStandardVolumePlatformEvents": {
        "Max": 10000,
        "Remaining": 10000
    },
    "DailyStreamingApiEvents": {
        "Max": 10000,
        "Remaining": 10000,
        "Ant Migration Tool": {
            "Max": 0,
            "Remaining": 0
        },
        "Dataloader Bulk": {
            "Max": 0,
            "Remaining": 0
        },
        "Dataloader Partner": {
            "Max": 0,
            "Remaining": 0
        },
        "Force.com IDE": {
            "Max": 0,
            "Remaining": 0
        },
        "JWTTest": {
            "Max": 0,
            "Remaining": 0
        },
        "Salesforce Mobile Dashboards": {
            "Max": 0,
            "Remaining": 0
        },
        "Salesforce Touch": {
            "Max": 0,
            "Remaining": 0
        },
        "Salesforce for Outlook": {
            "Max": 0,
            "Remaining": 0
        },
        "Salesforce_to_SalesforceIQ_Secure_Connected_App": {
            "Max": 0,
            "Remaining": 0
        },
        "Workbench": {
            "Max": 0,
            "Remaining": 0
        },
        "mohansun4ConnApp": {
            "Max": 0,
            "Remaining": 0
        },
        "mohansunCApp": {
            "Max": 0,
            "Remaining": 0
        }
    },
    "DailyWorkflowEmails": {
        "Max": 405,
        "Remaining": 405
    },
    "DataStorageMB": {
        "Max": 45,
        "Remaining": 14
    },
    "DurableStreamingApiConcurrentClients": {
        "Max": 20,
        "Remaining": 19
    },
    "FileStorageMB": {
        "Max": 20,
        "Remaining": 20
    },
    "HourlyAsyncReportRuns": {
        "Max": 1200,
        "Remaining": 1200
    },
    "HourlyDashboardRefreshes": {
        "Max": 200,
        "Remaining": 200
    },
    "HourlyDashboardResults": {
        "Max": 5000,
        "Remaining": 5000
    },
    "HourlyDashboardStatuses": {
        "Max": 999999999,
        "Remaining": 999999999
    },
    "HourlyLongTermIdMapping": {
        "Max": 100000,
        "Remaining": 100000
    },
    "HourlyODataCallout": {
        "Max": 1000,
        "Remaining": 1000
    },
    "HourlyPublishedPlatformEvents": {
        "Max": 50000,
        "Remaining": 50000
    },
    "HourlyPublishedStandardVolumePlatformEvents": {
        "Max": 1000,
        "Remaining": 1000
    },
    "HourlyShortTermIdMapping": {
        "Max": 100000,
        "Remaining": 100000
    },
    "HourlySyncReportRuns": {
        "Max": 500,
        "Remaining": 500
    },
    "HourlyTimeBasedWorkflow": {
        "Max": 50,
        "Remaining": 50
    },
    "MassEmail": {
        "Max": 10,
        "Remaining": 10
    },
    "MonthlyEinsteinDiscoveryStoryCreation": {
        "Max": 500,
        "Remaining": 500
    },
    "MonthlyPlatformEventsUsageEntitlement": {
        "Max": 0,
        "Remaining": 0
    },
    "Package2VersionCreates": {
        "Max": 6,
        "Remaining": 6
    },
    "Package2VersionCreatesWithoutValidation": {
        "Max": 500,
        "Remaining": 500
    },
    "PermissionSets": {
        "Max": 1500,
        "Remaining": 1497,
        "CreateCustom": {
            "Max": 1000,
            "Remaining": 997
        }
    },
    "SingleEmail": {
        "Max": 15,
        "Remaining": 15
    },
    "StreamingApiConcurrentClients": {
        "Max": 20,
        "Remaining": 20
    }
}
```
### API Requests Limits

```
$ sfdx mohanc:data:jq -i ~/.org/limits.json -f '.DailyApiRequests'
```
```json
{
  "Max": 15000,
  "Remaining": 14997,
  "Ant Migration Tool": {
    "Max": 0,
    "Remaining": 0
  },
  "Dataloader Bulk": {
    "Max": 0,
    "Remaining": 0
  },
  "Dataloader Partner": {
    "Max": 0,
    "Remaining": 0
  },
  "Force.com IDE": {
    "Max": 0,
    "Remaining": 0
  },
  "JWTTest": {
    "Max": 0,
    "Remaining": 0
  },
  "Salesforce Mobile Dashboards": {
    "Max": 0,
    "Remaining": 0
  },
  "Salesforce Touch": {
    "Max": 0,
    "Remaining": 0
  },
  "Salesforce for Outlook": {
    "Max": 0,
    "Remaining": 0
  },
  "Salesforce_to_SalesforceIQ_Secure_Connected_App": {
    "Max": 0,
    "Remaining": 0
  },
  "Workbench": {
    "Max": 0,
    "Remaining": 0
  },
  "mohansun4ConnApp": {
    "Max": 0,
    "Remaining": 0
  },
  "mohansunCApp": {
    "Max": 0,
    "Remaining": 0
  }
}
```
## DailyStandardVolumePlatformEvents 

```
$ sfdx mohanc:data:jq -i ~/.org/limits.json -f '.DailyStandardVolumePlatformEvents'
```
```json
{
  "Max": 10000,
  "Remaining": 10000
}
```

##  DailyAnalyticsDataflowJobExecutions

```
$ sfdx mohanc:data:jq -i ~/.org/limits.json -f '.DailyAnalyticsDataflowJobExecutions'
```
```json
{
  "Max": 60,
  "Remaining": 60
}
```


