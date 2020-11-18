# Provide Dataflow job nodes timing

- Requires 0.0.119 version of the plugin
    - sfdx-mohanc-plugins@0.0.119
    - [How to install the plugin](https://mohan-chinnappan-n.github.io/dx/plugins.html#/1)



## Usage
```
$ sfdx mohanc:ea:dataflow:jobs:timing -h
Lists Dataflow job timing of the given job id  

USAGE
  $ sfdx mohanc:ea:dataflow:jobs:timing

OPTIONS
  -j, --jobid=jobid                               Dataflow job Id

  -u, --targetusername=targetusername             username or alias for the target org; overrides default target 
                                                  org

  --apiversion=apiversion                         override the api version used for api requests made by this 
                                                  command

  --json                                          format output as json

  --loglevel=(trace|debug|info|warn|error|fatal)  logging level for this command invocation

EXAMPLE

              List Dataflow Jobs timing
              sfdx mohanc:ea:dataflow:jobs:timing  -u <username> -j <jobId>


```

## Demo
```
$ sfdx mohanc:ea:dataflow:jobs:timing -u mohan.chinnappan.n_ea2@gmail.com -j 03C3h000002qB0gEAE
[
  {
    duration: 3,
    id: '03L3h00000LpnfEEAR',
    inputRows: { processedCount: 1001 },
    label: 'Extract_Account',
    message: '',
    name: 'Extract_Account',
    nodeType: 'internal',
    outputRows: { failedCount: 0, processedCount: 1001 },
    startDate: '2020-11-18T14:51:27.296Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000LpnfEEAR'
  },
  {
    duration: 4,
    id: '03L3h00000LpnfKEAR',
    inputRows: { processedCount: 241 },
    label: 'Extract_Event',
    message: '',
    name: 'Extract_Event',
    nodeType: 'internal',
    outputRows: { failedCount: 0, processedCount: 241 },
    startDate: '2020-11-18T14:51:30.506Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000LpnfKEAR'
  },
  {
    duration: 3,
    id: '03L3h00000LpneuEAB',
    inputRows: { processedCount: 706 },
    label: 'Extract_Opportunity',
    message: '',
    name: 'Extract_Opportunity',
    nodeType: 'internal',
    outputRows: { failedCount: 0, processedCount: 706 },
    startDate: '2020-11-18T14:51:34.598Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000LpneuEAB'
  },
  {
    duration: 4,
    id: '03L3h00000LpnevEAB',
    inputRows: { processedCount: 2079 },
    label: 'Extract_Task',
    message: '',
    name: 'Extract_Task',
    nodeType: 'internal',
    outputRows: { failedCount: 0, processedCount: 2079 },
    startDate: '2020-11-18T14:51:38.487Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000LpnevEAB'
  },
  {
    duration: 1,
    id: '03L3h00000LpneyEAB',
    inputRows: { processedCount: 27 },
    label: 'Extract_User',
    message: '',
    name: 'Extract_User',
    nodeType: 'internal',
    outputRows: { failedCount: 0, processedCount: 27 },
    startDate: '2020-11-18T14:51:42.621Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000LpneyEAB'
  },
  {
    duration: 3,
    id: '03L3h00000LpnfHEAR',
    inputRows: { processedCount: 5 },
    label: 'Extract_UserRole',
    message: '',
    name: 'Extract_UserRole',
    nodeType: 'internal',
    outputRows: { failedCount: 0, processedCount: 5 },
    startDate: '2020-11-18T14:51:43.972Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000LpnfHEAR'
  },
  {
    duration: 1,
    id: '03L3h00000Lpnf0EAB',
    inputRows: { processedCount: 241 },
    label: 'Add_Fields_To_Event',
    message: '',
    name: 'Add_Fields_To_Event',
    nodeType: 'computeExpression',
    outputRows: { failedCount: 0, processedCount: 241 },
    startDate: '2020-11-18T14:51:47.777Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000Lpnf0EAB'
  },
  {
    duration: 1,
    id: '03L3h00000LpnfFEAR',
    inputRows: { processedCount: 2079 },
    label: 'Add_Fields_To_Task',
    message: '',
    name: 'Add_Fields_To_Task',
    nodeType: 'computeExpression',
    outputRows: { failedCount: 0, processedCount: 2079 },
    startDate: '2020-11-18T14:51:48.969Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000LpnfFEAR'
  },
  {
    duration: 0,
    id: '03L3h00000Lpnf6EAB',
    inputRows: { processedCount: 27 },
    label: 'Filter_User',
    message: '',
    name: 'Filter_User',
    nodeType: 'filter',
    outputRows: { processedCount: 23 },
    startDate: '2020-11-18T14:51:50.509Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000Lpnf6EAB'
  },
  {
    duration: 0,
    id: '03L3h00000LpnfLEAR',
    inputRows: { processedCount: 5 },
    label: 'Flatten_UserRole',
    message: '',
    name: 'Flatten_UserRole',
    nodeType: 'flatten',
    outputRows: { processedCount: 5 },
    startDate: '2020-11-18T14:51:50.534Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000LpnfLEAR'
  },
  {
    duration: 0,
    id: '03L3h00000LpnexEAB',
    inputRows: { processedCount: 2320 },
    label: 'Append_TaskEvent',
    message: '',
    name: 'Append_TaskEvent',
    nodeType: 'append',
    outputRows: { processedCount: 2320 },
    startDate: '2020-11-18T14:51:51.139Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000LpnexEAB'
  },
  {
    duration: 0,
    id: '03L3h00000LpnetEAB',
    inputRows: { processedCount: 23 },
    label: 'Compute_Manager_Unique',
    message: '',
    name: 'Compute_Manager_Unique',
    nodeType: 'computeExpression',
    outputRows: { failedCount: 0, processedCount: 23 },
    startDate: '2020-11-18T14:51:51.188Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000LpnetEAB'
  },
  {
    duration: 0,
    id: '03L3h00000LpnfDEAR',
    inputRows: { failedCount: 0, processedCount: 5 },
    label: 'Augment_ParentName',
    message: '',
    name: 'Augment_ParentName',
    nodeType: 'augment',
    outputRows: { failedCount: 0, processedCount: 5 },
    startDate: '2020-11-18T14:51:51.784Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000LpnfDEAR'
  },
  {
    duration: 0,
    id: '03L3h00000LpnfCEAR',
    inputRows: { processedCount: 5 },
    label: 'Flatten_ParentName',
    message: '',
    name: 'Flatten_ParentName',
    nodeType: 'flatten',
    outputRows: { processedCount: 5 },
    startDate: '2020-11-18T14:51:52.614Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000LpnfCEAR'
  },
  {
    duration: 0,
    id: '03L3h00000Lpnf7EAB',
    inputRows: { processedCount: 5 },
    label: 'Flatten_Hierarchy_Grouping',
    message: '',
    name: 'Flatten_Hierarchy_Grouping',
    nodeType: 'flatten',
    outputRows: { processedCount: 5 },
    startDate: '2020-11-18T14:51:53.146Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000Lpnf7EAB'
  },
  {
    duration: 0,
    id: '03L3h00000LpnfIEAR',
    inputRows: { failedCount: 0, processedCount: 23 },
    label: 'User_with_Roles',
    message: '',
    name: 'User_with_Roles',
    nodeType: 'augment',
    outputRows: { failedCount: 0, processedCount: 23 },
    startDate: '2020-11-18T14:51:53.641Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000LpnfIEAR'
  },
  {
    duration: 1,
    id: '03L3h00000LpnfGEAR',
    inputRows: { failedCount: 0, processedCount: 2320 },
    label: 'Join_ActivityOwner',
    message: '',
    name: 'Join_ActivityOwner',
    nodeType: 'augment',
    outputRows: { failedCount: 0, processedCount: 2320 },
    startDate: '2020-11-18T14:51:54.032Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000LpnfGEAR'
  },
  {
    duration: 0,
    id: '03L3h00000LpnfMEAR',
    inputRows: { failedCount: 0, processedCount: 23 },
    label: 'User_with_Roles_with_Opportunities',
    message: '',
    name: 'User_with_Roles_with_Opportunities',
    nodeType: 'augment',
    outputRows: { failedCount: 0, processedCount: 23 },
    startDate: '2020-11-18T14:51:55.202Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000LpnfMEAR'
  },
  {
    duration: 1,
    id: '03L3h00000Lpnf8EAB',
    inputRows: { failedCount: 0, processedCount: 2320 },
    label: 'Join_ActivityOwner_Product_Opp',
    message: '',
    name: 'Join_ActivityOwner_Product_Opp',
    nodeType: 'augment',
    outputRows: { failedCount: 0, processedCount: 2320 },
    startDate: '2020-11-18T14:51:55.887Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000Lpnf8EAB'
  },
  {
    duration: 0,
    id: '03L3h00000Lpnf3EAB',
    inputRows: { processedCount: 23 },
    label: 'Users_Custom_Filter_Flag',
    message: '',
    name: 'Users_Custom_Filter_Flag',
    nodeType: 'computeExpression',
    outputRows: { failedCount: 0, processedCount: 23 },
    startDate: '2020-11-18T14:51:57.249Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000Lpnf3EAB'
  },
  {
    duration: 1,
    id: '03L3h00000LpnezEAB',
    inputRows: { failedCount: 0, processedCount: 2320 },
    label: 'Join_ActivityOwner_Product_Opp_User',
    message: '',
    name: 'Join_ActivityOwner_Product_Opp_User',
    nodeType: 'augment',
    outputRows: { failedCount: 0, processedCount: 2320 },
    startDate: '2020-11-18T14:51:58.126Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000LpnezEAB'
  },
  {
    duration: 0,
    id: '03L3h00000Lpnf1EAB',
    inputRows: { processedCount: 23 },
    label: 'Filter_UserManager',
    message: '',
    name: 'Filter_UserManager',
    nodeType: 'filter',
    outputRows: { processedCount: 21 },
    startDate: '2020-11-18T14:51:59.870Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000Lpnf1EAB'
  },
  {
    duration: 2,
    id: '03L3h00000Lpnf2EAB',
    inputRows: { failedCount: 0, processedCount: 2320 },
    label: 'Join_ActivityOwner_Product_Opp_User_Account',
    message: '',
    name: 'Join_ActivityOwner_Product_Opp_User_Account',
    nodeType: 'augment',
    outputRows: { failedCount: 0, processedCount: 2320 },
    startDate: '2020-11-18T14:51:59.895Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000Lpnf2EAB'
  },
  {
    duration: 0,
    id: '03L3h00000LpnewEAB',
    inputRows: {},
    label: 'optimize-Register_User',
    message: '',
    name: 'optimize-Register_User',
    nodeType: 'internal',
    outputRows: {},
    startDate: '2020-11-18T14:52:02.046Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000LpnewEAB'
  },
  {
    duration: 2,
    id: '03L3h00000Lpnf9EAB',
    inputRows: { processedCount: 2320 },
    label: 'Compute_Activity_IsOverdue',
    message: '',
    name: 'Compute_Activity_IsOverdue',
    nodeType: 'computeExpression',
    outputRows: { failedCount: 0, processedCount: 2320 },
    startDate: '2020-11-18T14:52:02.193Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000Lpnf9EAB'
  },
  {
    duration: 10,
    id: '03L3h00000Lpnf4EAB',
    inputRows: {},
    label: 'Register_User',
    message: '',
    name: 'Register_User',
    nodeType: 'internal',
    outputRows: {},
    startDate: '2020-11-18T14:52:04.311Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000Lpnf4EAB'
  },
  {
    duration: 2,
    id: '03L3h00000LpnfJEAR',
    inputRows: { processedCount: 2320 },
    label: 'Compute_Activity_Days_Overdue',
    message: '',
    name: 'Compute_Activity_Days_Overdue',
    nodeType: 'computeExpression',
    outputRows: { failedCount: 0, processedCount: 2320 },
    startDate: '2020-11-18T14:52:14.922Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000LpnfJEAR'
  },
  {
    duration: 1,
    id: '03L3h00000LpnfBEAR',
    inputRows: { processedCount: 2320 },
    label: 'Activity_Custom_Filter_Flag',
    message: '',
    name: 'Activity_Custom_Filter_Flag',
    nodeType: 'computeExpression',
    outputRows: { failedCount: 0, processedCount: 2320 },
    startDate: '2020-11-18T14:52:17.186Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000LpnfBEAR'
  },
  {
    duration: 0,
    id: '03L3h00000LpnesEAB',
    inputRows: { processedCount: 2320 },
    label: 'Filter_Activity',
    message: '',
    name: 'Filter_Activity',
    nodeType: 'filter',
    outputRows: { processedCount: 2320 },
    startDate: '2020-11-18T14:52:19.052Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000LpnesEAB'
  },
  {
    duration: 0,
    id: '03L3h00000LpnfAEAR',
    inputRows: {},
    label: 'optimize-Register_Activity',
    message: '',
    name: 'optimize-Register_Activity',
    nodeType: 'internal',
    outputRows: {},
    startDate: '2020-11-18T14:52:19.104Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000LpnfAEAR'
  },
  {
    duration: 18,
    id: '03L3h00000Lpnf5EAB',
    inputRows: {},
    label: 'Register_Activity',
    message: '',
    name: 'Register_Activity',
    nodeType: 'internal',
    outputRows: {},
    startDate: '2020-11-18T14:52:19.575Z',
    status: 'success',
    type: 'dataflowjobnode',
    url: '/services/data/v50.0/wave/dataflowjobs/03C3h000002qB0gEAE/nodes/03L3h00000Lpnf5EAB'
  }
]
```
