# Bot Metadata type
- [Metadata - Bot](https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_bot.htm)
## Listing the Bot type
```
sfdx mohanc:mdapi:list -u mohan.chinnappan.n_ea2@gmail.com -t Bot

```
```
{
  result: [
    {
      createdById: '0053h000002xQ5sAAE',
      createdByName: 'Mohan Chinnappan',
      createdDate: 2021-06-03T01:01:58.000Z,
      fileName: 'bots/kovai.bot',
      fullName: 'kovai',
      id: '0Xx3h000000H4T0CAK',
      lastModifiedById: '0053h000002xQ5sAAE',
      lastModifiedByName: 'Mohan Chinnappan',
      lastModifiedDate: 2021-06-03T01:01:58.000Z,
      type: 'Bot'
    }
  ]
}
```

```

sfdx mohanc:mdapi:retrieve -u mohan.chinnappan.n_ea2@gmail.com -t Bot

```

```
{
    "RetrieveRequest": {
        "apiVersion": "51.0",
        "unpackaged": [
            {
                "types": {
                    "members": "*",
                    "name": "Bot"
                }
            }
        ]
    }
}
{ result: { done: false, id: '09S3h000005iAfiEAE', state: 'Queued' } }

```

## checkRetrieveStatus 
```
sfdx mohanc:mdapi:checkRetrieveStatus  -u mohan.chinnappan.n_ea2@gmail.com -i 09S3h000005iAfiEAE 
```
```
[
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2021-06-03T01:01:58.000Z,
    fileName: 'unpackaged/bots/kovai.bot',
    fullName: 'kovai',
    id: '0Xx3h000000H4T0CAK',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-06-03T01:01:58.000Z,
    type: 'Bot'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2021-06-03T13:21:16.040Z,
    fileName: 'unpackaged/package.xml',
    fullName: 'unpackaged/package.xml',
    id: '',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-06-03T13:21:16.040Z,
    manageableState: 'unmanaged',
    type: 'Package'
  }
]
```
```
=== Writing zipFile base64 content to 09S3h000005iAfiEAE.zip.txt ...
=== Writing zipFile binary content to 09S3h000005iAfiEAE.zip ...
```
###  Content of the zip file

```
jar tvf 09S3h000005iAfiEAE.zip
 11557 Thu Jun 03 13:21:16 EDT 2021 unpackaged/bots/kovai.bot
   215 Thu Jun 03 13:21:16 EDT 2021 unpackaged/package.xml

```

## Content of the kovai.bot
```xml

<?xml version="1.0" encoding="UTF-8"?>
<Bot xmlns="http://soap.sforce.com/2006/04/metadata">
    <botMlDomain>
        <label>kovai</label>
        <mlIntents>
            <developerName>Transfer_To_Agent</developerName>
            <label>Transfer To Agent</label>
        </mlIntents>
        <mlSlotClasses>
            <dataType>Text</dataType>
            <description>Memory size</description>
            <developerName>Memory_size</developerName>
            <extractionRegex>[1-9][0-9]*</extractionRegex>
            <extractionType>Pattern</extractionType>
            <label>Memory size</label>
        </mlSlotClasses>
        <name>kovai</name>
    </botMlDomain>
    <botVersions>
        <fullName>v1</fullName>
        <botDialogs>
            <botSteps>
                <conversationRecordLookup>
                    <SObjectType>Contact</SObjectType>
                    <conditions>
                        <leftOperand>Contact.LastName</leftOperand>
                        <operatorType>Contains</operatorType>
                        <rightOperandName>LastName</rightOperandName>
                        <rightOperandType>ConversationVariable</rightOperandType>
                        <sortOrder>1</sortOrder>
                    </conditions>
                    <filterLogic>And</filterLogic>
                    <lookupFields>
                        <fieldName>Contact.Birthdate</fieldName>
                    </lookupFields>
                    <maxLookupResults>3</maxLookupResults>
                    <targetVariableName>ListVar</targetVariableName>
                </conversationRecordLookup>
                <type>RecordLookup</type>
            </botSteps>
            <botSteps>
                <type>Wait</type>
            </botSteps>
            <developerName>Check_My_Order</developerName>
            <label>Find  Birth Date</label>
            <showInFooterMenu>false</showInFooterMenu>
        </botDialogs>
        <botDialogs>
            <botSteps>
                <botMessages>
                    <message>We will fix it</message>
                </botMessages>
                <type>Message</type>
            </botSteps>
            <botSteps>
                <type>Wait</type>
            </botSteps>
            <developerName>Printer_not_working</developerName>
            <label>Printer not working</label>
            <showInFooterMenu>false</showInFooterMenu>
        </botDialogs>
        <botDialogs>
            <botSteps>
                <botVariableOperation>
                    <askCollectIfSet>false</askCollectIfSet>
                    <botMessages>
                        <message>How much memory</message>
                    </botMessages>
                    <botVariableOperands>
                        <disableAutoFill>true</disableAutoFill>
                        <sourceName>Memory_size</sourceName>
                        <sourceType>MlSlotClass</sourceType>
                        <targetName>Memory_Size</targetName>
                        <targetType>ConversationVariable</targetType>
                    </botVariableOperands>
                    <optionalCollect>false</optionalCollect>
                    <quickReplyWidgetType>Buttons</quickReplyWidgetType>
                    <type>Collect</type>
                </botVariableOperation>
                <type>VariableOperation</type>
            </botSteps>
            <botSteps>
                <type>Wait</type>
            </botSteps>
            <developerName>Find_a_MacBook_Pro</developerName>
            <label>Find a MacBook Pro</label>
            <showInFooterMenu>false</showInFooterMenu>
        </botDialogs>
        <botDialogs>
            <botSteps>
                <botMessages>
                    <message>Hi, I’m &apos;kovai&apos;, a digital assistant.</message>
                </botMessages>
                <type>Message</type>
            </botSteps>
            <botSteps>
                <botNavigation>
                    <botNavigationLinks>
                        <targetBotDialog>Main_Menu</targetBotDialog>
                    </botNavigationLinks>
                    <type>Redirect</type>
                </botNavigation>
                <type>Navigation</type>
            </botSteps>
            <developerName>Welcome</developerName>
            <label>Welcome</label>
            <showInFooterMenu>false</showInFooterMenu>
        </botDialogs>
        <botDialogs>
            <botSteps>
                <botNavigation>
                    <botNavigationLinks>
                        <label>Check My Order</label>
                        <targetBotDialog>Check_My_Order</targetBotDialog>
                    </botNavigationLinks>
                    <botNavigationLinks>
                        <label>Printer not working</label>
                        <targetBotDialog>Printer_not_working</targetBotDialog>
                    </botNavigationLinks>
                    <botNavigationLinks>
                        <label>Find a MacBook Pro</label>
                        <targetBotDialog>Find_a_MacBook_Pro</targetBotDialog>
                    </botNavigationLinks>
                    <type>Redirect</type>
                </botNavigation>
                <type>Navigation</type>
            </botSteps>
            <developerName>Main_Menu</developerName>
            <label>Main Menu</label>
            <showInFooterMenu>false</showInFooterMenu>
        </botDialogs>
        <botDialogs>
            <botSteps>
                <botMessages>
                    <message>Transferring to the  Agent</message>
                </botMessages>
                <type>Message</type>
            </botSteps>
            <botSteps>
                <conversationSystemMessage>
                    <type>Transfer</type>
                </conversationSystemMessage>
                <type>SystemMessage</type>
            </botSteps>
            <developerName>Transfer_To_Agent</developerName>
            <label>Transfer To Agent</label>
            <mlIntent>Transfer_To_Agent</mlIntent>
            <mlIntentTrainingEnabled>false</mlIntentTrainingEnabled>
            <showInFooterMenu>false</showInFooterMenu>
        </botDialogs>
        <botDialogs>
            <botSteps>
                <botMessages>
                    <message>Goodbye! Click the &quot;End Chat&quot; button to end this chat</message>
                </botMessages>
                <type>Message</type>
            </botSteps>
            <botSteps>
                <type>Wait</type>
            </botSteps>
            <developerName>End_Chat</developerName>
            <label>End Chat</label>
            <showInFooterMenu>false</showInFooterMenu>
        </botDialogs>
        <botDialogs>
            <botSteps>
                <botMessages>
                    <message>Sorry, I didn&apos;t understand that.</message>
                </botMessages>
                <type>Message</type>
            </botSteps>
            <botSteps>
                <type>Wait</type>
            </botSteps>
            <developerName>Confused</developerName>
            <label>Confused</label>
            <showInFooterMenu>false</showInFooterMenu>
        </botDialogs>
        <botDialogs>
            <botSteps>
                <botMessages>
                    <message>Unfortunately, there are no agents available at the moment</message>
                </botMessages>
                <type>Message</type>
            </botSteps>
            <botSteps>
                <type>Wait</type>
            </botSteps>
            <developerName>No_Agent_Available</developerName>
            <label>No Agent</label>
            <showInFooterMenu>false</showInFooterMenu>
        </botDialogs>
        <botDialogs>
            <botSteps>
                <botMessages>
                    <message>Unfortunately, a system error occurred. I&apos;ll connect you to an agent who can help.</message>
                </botMessages>
                <type>Message</type>
            </botSteps>
            <botSteps>
                <conversationSystemMessage>
                    <type>Transfer</type>
                </conversationSystemMessage>
                <type>SystemMessage</type>
            </botSteps>
            <developerName>Error_Handling</developerName>
            <label>Error Handler</label>
            <showInFooterMenu>false</showInFooterMenu>
        </botDialogs>
        <conversationSystemDialogs>
            <dialog>Error_Handling</dialog>
            <type>ErrorHandling</type>
        </conversationSystemDialogs>
        <conversationSystemDialogs>
            <dialog>No_Agent_Available</dialog>
            <type>TransferFailed</type>
        </conversationSystemDialogs>
        <conversationVariables>
            <dataType>Text</dataType>
            <developerName>LastName</developerName>
            <label>LastName</label>
        </conversationVariables>
        <conversationVariables>
            <collectionType>List</collectionType>
            <dataType>Object</dataType>
            <developerName>ListVar</developerName>
            <label>ListVar</label>
        </conversationVariables>
        <conversationVariables>
            <dataType>Text</dataType>
            <developerName>Memory_Size</developerName>
            <label>Memory Size</label>
        </conversationVariables>
        <entryDialog>Welcome</entryDialog>
        <mainMenuDialog>Main_Menu</mainMenuDialog>
        <nlpProviders>
            <language>en_US</language>
            <nlpProviderType>EinsteinAi</nlpProviderType>
        </nlpProviders>
    </botVersions>
    <contextVariables>
        <contextVariableMappings>
            <SObjectType>LiveChatTranscript</SObjectType>
            <fieldName>LiveChatTranscript.ChatKey</fieldName>
            <messageType>WebChat</messageType>
        </contextVariableMappings>
        <dataType>Text</dataType>
        <developerName>ChatKey</developerName>
        <label>Chat Key</label>
    </contextVariables>
    <contextVariables>
        <contextVariableMappings>
            <SObjectType>LiveChatTranscript</SObjectType>
            <fieldName>LiveChatTranscript.ContactId</fieldName>
            <messageType>WebChat</messageType>
        </contextVariableMappings>
        <dataType>Id</dataType>
        <developerName>ContactId</developerName>
        <label>Contact Id</label>
    </contextVariables>
    <contextVariables>
        <contextVariableMappings>
            <SObjectType>LiveChatTranscript</SObjectType>
            <fieldName>LiveChatTranscript.LiveChatVisitorId</fieldName>
            <messageType>WebChat</messageType>
        </contextVariableMappings>
        <dataType>Id</dataType>
        <developerName>EndUserId</developerName>
        <label>End User Id</label>
    </contextVariables>
    <contextVariables>
        <contextVariableMappings>
            <SObjectType>LiveChatTranscript</SObjectType>
            <fieldName>LiveChatTranscript.Id</fieldName>
            <messageType>WebChat</messageType>
        </contextVariableMappings>
        <dataType>Id</dataType>
        <developerName>RoutableId</developerName>
        <label>Routable Id</label>
    </contextVariables>
    <conversationChannelProviders>
        <agentRequired>false</agentRequired>
        <chatButtonName>botQueueGroup</chatButtonName>
    </conversationChannelProviders>
    <description>A bot from scratch.</description>
    <label>kovai</label>
    <logPrivateConversationData>false</logPrivateConversationData>
</Bot>

```


