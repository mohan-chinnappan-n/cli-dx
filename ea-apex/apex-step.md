# Apex Step in EA

## Apex WebService code
- [Refer](https://trailhead.salesforce.com/en/content/learn/modules/apex_integration_services/apex_integration_webservices)
```java


@RestResource(urlMapping='/Cases/*')
global with sharing class CaseManager {

    @HttpGet
    global static List<Case> getCaseBySubject() {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String subject = '%' + request.requestURI.substring(
          request.requestURI.lastIndexOf('/')+1) + '%';
        List<Case> result =  [SELECT Id, CaseNumber,Subject,Status,Origin,Priority
                        FROM Case
                        WHERE Subject LIKE :subject LIMIT 2];

                        
                        

        return result;
    }
    
    /*
    @HttpGet
    global static Case getCaseById() {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String caseId = request.requestURI.substring(
          request.requestURI.lastIndexOf('/')+1);
        Case result =  [SELECT CaseNumber,Subject,Status,Origin,Priority
                        FROM Case
                        WHERE Id = :caseId];
        return result;
    }
    */
    @HttpPost
    global static ID createCase(String subject, String status,
        String origin, String priority) {
        Case thisCase = new Case(
            Subject=subject,
            Status=status,
            Origin=origin,
            Priority=priority);
        insert thisCase;
        return thisCase.Id;
    }   
    @HttpDelete
    global static void deleteCase() {
        RestRequest request = RestContext.request;
        String caseId = request.requestURI.substring(
            request.requestURI.lastIndexOf('/')+1);
        Case thisCase = [SELECT Id FROM Case WHERE Id = :caseId];
        delete thisCase;
    }     
    @HttpPut
    global static ID upsertCase(String subject, String status,
        String origin, String priority, String id) {
        Case thisCase = new Case(
                Id=id,
                Subject=subject,
                Status=status,
                Origin=origin,
                Priority=priority);
        // Match case by Id, if present.
        // Otherwise, create new case.
        upsert thisCase;
        // Return the case ID.
        return thisCase.Id;
    }
    @HttpPatch
    global static ID updateCaseFields() {
        RestRequest request = RestContext.request;
        String caseId = request.requestURI.substring(
            request.requestURI.lastIndexOf('/')+1);
        Case thisCase = [SELECT Id FROM Case WHERE Id = :caseId];
        // Deserialize the JSON string into name-value pairs
        Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(request.requestbody.tostring());
        // Iterate through each parameter field and value
        for(String fieldName : params.keySet()) {
            // Set the field and value on the Case sObject
            thisCase.put(fieldName, params.get(fieldName));
        }
        update thisCase;
        return thisCase.Id;
    }    
}
```

## Testing web service
```
$ sfdx mohanc:ws:rest -f ~/.ea/header.json -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/apexrest/Cases/5003h000006f6jXAAQ 
```
```json
$ sfdx mohanc:ws:rest -f ~/.ea/header.json -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/apexrest/Cases/Engine
[
    {
        "attributes": {
            "type": "Case",
            "url": "/services/data/v51.0/sobjects/Case/5003h000005VRefAAG"
        },
        "Id": "5003h000005VRefAAG",
        "CaseNumber": "00028665",
        "Subject": "Engine cylinder has knocking",
        "Status": "New",
        "Priority": "High"
    },
    {
        "attributes": {
            "type": "Case",
            "url": "/services/data/v51.0/sobjects/Case/5003h000005VRdIAAW"
        },
        "Id": "5003h000005VRdIAAW",
        "CaseNumber": "00028653",
        "Subject": "Engine cylinder has knocking",
        "Status": "New",
        "Priority": "High"
   
```
```
$ sfdx mohanc:ws:rest -f ~/.ea/header.json -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/apexrest/Cases/cylinder
```

```json
[
    {
        "attributes": {
            "type": "Case",
            "url": "/services/data/v51.0/sobjects/Case/5003h000005VRefAAG"
        },
        "Id": "5003h000005VRefAAG",
        "CaseNumber": "00028665",
        "Subject": "Engine cylinder has knocking",
        "Status": "New",
        "Priority": "High"
    },
    {
        "attributes": {
            "type": "Case",
            "url": "/services/data/v51.0/sobjects/Case/5003h000005VRdIAAW"
        },
        "Id": "5003h000005VRdIAAW",
        "CaseNumber": "00028653",
        "Subject": "Engine cylinder has knocking",
        "Status": "New",
        "Priority": "High"
    }
]
```
```
 "text_2": {
                "type": "text",
                "parameters": {
                    "content": {
                        "displayTemplate": "{{cell(lens_1.selection, 0, \"fruit\").asString()}}"
                    },
                    "textAlignment": "left",
                    "textColor": "#091A3E",
                    "fontSize": 16,
                    "showActionMenu": true
                }
            }
```

## Resources
[apex Step Type Properties](https://developer.salesforce.com/docs/atlas.en-us.bi_dev_guide_json.meta/bi_dev_guide_json/bi_dbjson_steps_types_apex.htm)
