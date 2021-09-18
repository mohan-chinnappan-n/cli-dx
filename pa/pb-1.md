# PB notes

## PB2F-1

### Choose Object and Specify When to Start the Process
	- Account (only one active record-change process per object is recommeded, if multiple active record-change processes are defined for an object, you can't control what **order** process start in)
- Start the process
 	- only when a record is created <-- 
	- when a record is created or edited
- Advanced
	- Recursion - Allow process to evaluate a record multiple times (upto 6 times) in a single save operation?
		- Reevalutes the record if other automation (process action, workflow action,flow, apex trigger,  updates the record within the same save operation
		- No


### Define Criteria for this Action Group
- Criteria Name = **Check Billing Country**
- Criteria for Executing Actions
	- Conditions are met <--
	- Formula evaluates to true
	- No criteria—just execute the actions!
	- #1 [Account].**BillingCountry** **Equals** String **Canada** 

- All of the conditions are met (AND) <--
- Any of the conditions are met (OR)
- Customize the logic - exanple: 1 AND (2 OR 3) 


### Immediate Actions
- Action Type
	- Apex
	- Create a Record 
	- Email Alerts
	- Flows
	- Post to Chatter <--
		- Post to
			- User <--
				- Search for a user (Mohan Chinnappan)
		- Message
			- ``` Account with {![Account].BillingCountry} is created! ```
			- Chatter Group
			- This Record 
	- Processes
	- Quick Actions
	- Quip
	- Send Custom Notification
	- Send Survey Invitation
	- Submit for Approval
	- Update Records
- Action Name = **Post to chatter about the billing country**



### Flow Definition
```
sfdx mohanc:mdapi:retrieve -u mohan.chinnappan.n_ea2@gmail.com  -t Flow                         
```
```
{
    "RetrieveRequest": {
        "apiVersion": "52.0",
        "unpackaged": [
            {
                "types": {
                    "members": "*",
                    "name": "Flow"
                }
            }
        ]
    }
}
{ result: { done: false, id: '09S3h000005jymPEAQ', state: 'Queued' } }
```
```
sfdx mohanc:mdapi:checkRetrieveStatus -u mohan.chinnappan.n_ea2@gmail.com  -i 09S3h000005jymPEAQ
```

```json
[
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2021-05-07T13:29:57.000Z,
    fileName: 'unpackaged/flows/customer_satisfaction.flow',
    fullName: 'customer_satisfaction',
    id: '3013h000000fedqAAA',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-05-07T13:29:58.000Z,
    manageableState: 'unmanaged',
    type: 'Flow'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2021-09-18T11:58:20.000Z,
    fileName: 'unpackaged/flows/PA2F_1.flow',
    fullName: 'PA2F_1',
    id: '3013h000000foCuAAI',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-09-18T11:58:38.000Z,
    manageableState: 'unmanaged',
    type: 'Flow'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-08-23T20:10:10.000Z,
    fileName: 'unpackaged/flows/TemperatureMonitor.flow',
    fullName: 'TemperatureMonitor',
    id: '3013h000000QhUMAA0',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-09-18T03:16:28.000Z,
    manageableState: 'unmanaged',
    type: 'Flow'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2021-01-12T15:38:53.000Z,
    fileName: 'unpackaged/flows/Notify_Dataflow_State.flow',
    fullName: 'Notify_Dataflow_State',
    id: '3013h000000QymtAAC',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-01-12T15:38:54.000Z,
    manageableState: 'unmanaged',
    type: 'Flow'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2021-05-07T13:29:51.000Z,
    fileName: 'unpackaged/flows/net_promoter_score.flow',
    fullName: 'net_promoter_score',
    id: '3013h000000fedkAAA',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-05-07T13:29:56.000Z,
    manageableState: 'unmanaged',
    type: 'Flow'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-07-17T20:22:07.000Z,
    fileName: 'unpackaged/flows/sampleFlow.flow',
    fullName: 'sampleFlow',
    id: '3013h000000ozufAAA',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2020-07-17T20:22:07.000Z,
    manageableState: 'unmanaged',
    type: 'Flow'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2021-09-18T11:59:05.197Z,
    fileName: 'unpackaged/package.xml',
    fullName: 'unpackaged/package.xml',
    id: '',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-09-18T11:59:05.197Z,
    manageableState: 'unmanaged',
    type: 'Package'
  }
]
```
```
=== Writing zipFile base64 content to 09S3h000005jymPEAQ.zip.txt ...
=== Writing zipFile binary content to 09S3h000005jymPEAQ.zip ... 

```

```
 unzip 09S3h000005jymPEAQ.zip
Archive:  09S3h000005jymPEAQ.zip
replace unpackaged/flows/customer_satisfaction.flow? [y]es, [n]o, [A]ll, [N]one, [r]ename: A
  inflating: unpackaged/flows/customer_satisfaction.flow  
  inflating: unpackaged/flows/PA2F_1.flow  
  inflating: unpackaged/flows/TemperatureMonitor.flow  
  inflating: unpackaged/flows/Notify_Dataflow_State.flow  
  inflating: unpackaged/flows/net_promoter_score.flow  
  inflating: unpackaged/flows/sampleFlow.flow  
  inflating: unpackaged/package.xml  

```


```
cat unpackaged/flows/PA2F_1.flow
```


```xml

<?xml version="1.0" encoding="UTF-8"?>
<Flow xmlns="http://soap.sforce.com/2006/04/metadata">
    <actionCalls>
        <processMetadataValues>
            <name>postTarget</name>
            <value>
                <stringValue>Mohan Chinnappan</stringValue>
            </value>
        </processMetadataValues>
        <processMetadataValues>
            <name>postTargetUserType</name>
            <value>
                <stringValue>USER</stringValue>
            </value>
        </processMetadataValues>
        <processMetadataValues>
            <name>textJson</name>
            <value>
                <stringValue>{&quot;mentions&quot;:[],&quot;message&quot;:&quot;Account with {![Account].BillingCountry} is created!&quot;}</stringValue>
            </value>
        </processMetadataValues>
        <name>myRule_1_A1</name>
        <label>Post to chatter about the billing country</label>
        <locationX>100</locationX>
        <locationY>200</locationY>
        <actionName>chatterPost</actionName>
        <actionType>chatterPost</actionType>
        <flowTransactionModel>CurrentTransaction</flowTransactionModel>
        <inputParameters>
            <name>text</name>
            <value>
                <stringValue>Account with {!myVariable_current.BillingCountry} is created!</stringValue>
            </value>
        </inputParameters>
        <inputParameters>
            <name>type</name>
            <value>
                <stringValue>USER</stringValue>
            </value>
        </inputParameters>
        <inputParameters>
            <name>subjectNameOrId</name>
            <value>
                <stringValue>0053h000002xQ5sAAE</stringValue>
            </value>
        </inputParameters>
    </actionCalls>
    <apiVersion>52.0</apiVersion>
    <decisions>
        <processMetadataValues>
            <name>index</name>
            <value>
                <numberValue>0.0</numberValue>
            </value>
        </processMetadataValues>
        <name>myDecision</name>
        <label>myDecision</label>
        <locationX>50</locationX>
        <locationY>0</locationY>
        <defaultConnectorLabel>default</defaultConnectorLabel>
        <rules>
            <name>myRule_1</name>
            <conditionLogic>and</conditionLogic>
            <conditions>
                <processMetadataValues>
                    <name>inputDataType</name>
                    <value>
                        <stringValue>String</stringValue>
                    </value>
                </processMetadataValues>
                <processMetadataValues>
                    <name>leftHandSideType</name>
                    <value>
                        <stringValue>String</stringValue>
                    </value>
                </processMetadataValues>
                <processMetadataValues>
                    <name>operatorDataType</name>
                    <value>
                        <stringValue>String</stringValue>
                    </value>
                </processMetadataValues>
                <processMetadataValues>
                    <name>rightHandSideType</name>
                    <value>
                        <stringValue>String</stringValue>
                    </value>
                </processMetadataValues>
                <leftValueReference>myVariable_current.BillingCountry</leftValueReference>
                <operator>EqualTo</operator>
                <rightValue>
                    <stringValue>Canada</stringValue>
                </rightValue>
            </conditions>
            <connector>
                <targetReference>myRule_1_A1</targetReference>
            </connector>
            <label>Check Billing Country</label>
        </rules>
    </decisions>
    <description>PA to Flow example - 1</description>
    <interviewLabel>PA2F_1-1_InterviewLabel</interviewLabel>
    <label>PA2F-1</label>
    <processMetadataValues>
        <name>ObjectType</name>
        <value>
            <stringValue>Account</stringValue>
        </value>
    </processMetadataValues>
    <processMetadataValues>
        <name>ObjectVariable</name>
        <value>
            <elementReference>myVariable_current</elementReference>
        </value>
    </processMetadataValues>
    <processMetadataValues>
        <name>OldObjectVariable</name>
        <value>
            <elementReference>myVariable_old</elementReference>
        </value>
    </processMetadataValues>
    <processMetadataValues>
        <name>TriggerType</name>
        <value>
            <stringValue>onCreateOnly</stringValue>
        </value>
    </processMetadataValues>
    <processType>Workflow</processType>
    <startElementReference>myDecision</startElementReference>
    <status>Active</status>
    <variables>
        <name>myVariable_current</name>
        <dataType>SObject</dataType>
        <isCollection>false</isCollection>
        <isInput>true</isInput>
        <isOutput>true</isOutput>
        <objectType>Account</objectType>
    </variables>
    <variables>
        <name>myVariable_old</name>
        <dataType>SObject</dataType>
        <isCollection>false</isCollection>
        <isInput>true</isInput>
        <isOutput>false</isOutput>
        <objectType>Account</objectType>
    </variables>
</Flow>
```
