# Retrieve Flow using DX

## Login
```
sfdx force:auth:web:login
Successfully authorized mohan.chinnappan.n_ea2@gmail.com with org ID 00D3h000007R1LuEAK
```

```
sfdx mohanc:mdapi:retrieve -u mohan.chinnappan.n_ea2@gmail.com -t "Flow"
```

```
sfdx mohanc:mdapi:checkRetrieveStatus -u mohan.chinnappan.n_ea2@gmail.com -i "09S3h000006DO57EAG"
```

## View zip file content

```
jar tvf 09S3h000006DO57EAG.zip
```

```
  3987 Thu Jul 14 10:44:58 EDT 2022 unpackaged/flows/AccountDelete.flow
  5286 Thu Jul 14 10:44:58 EDT 2022 unpackaged/flows/PA2F_1.flow
  1141 Thu Jul 14 10:44:58 EDT 2022 unpackaged/flows/Notify_Dataflow_State.flow
 14034 Thu Jul 14 10:44:58 EDT 2022 unpackaged/flows/TemperatureMonitor.flow
  5256 Thu Jul 14 10:44:58 EDT 2022 unpackaged/flows/net_promoter_score.flow
  2379 Thu Jul 14 10:44:58 EDT 2022 unpackaged/flows/Account_Delete_Process.flow
 12740 Thu Jul 14 10:44:58 EDT 2022 unpackaged/flows/Simple_1.flow
  2151 Thu Jul 14 10:44:58 EDT 2022 unpackaged/flows/sampleFlow.flow
 22514 Thu Jul 14 10:44:58 EDT 2022 unpackaged/flows/Create_property.flow
  2686 Thu Jul 14 10:44:58 EDT 2022 unpackaged/flows/OpptyUpdate.flow
  6419 Thu Jul 14 10:44:58 EDT 2022 unpackaged/flows/customer_satisfaction.flow
  2376 Thu Jul 14 10:44:58 EDT 2022 unpackaged/flows/Flow_pb2f_1.flow
  2067 Thu Jul 14 10:44:58 EDT 2022 unpackaged/flows/SimpleFlow_1.flow
  3483 Thu Jul 14 10:44:58 EDT 2022 unpackaged/flows/HellowWorld.flow
   216 Thu Jul 14 10:44:58 EDT 2022 unpackaged/package.xml
```



## References
- [Flow](https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_visual_workflow.htm)

