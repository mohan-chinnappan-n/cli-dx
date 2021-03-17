### LightningComponentBundle 

```
$ sfdx mohanc:mdapi:retrieve -u mohan.chinnappan.n_ea2@gmail.com -t LightningComponentBundle
{
    "RetrieveRequest": {
        "apiVersion": "51.0",
        "unpackaged": [
            {
                "types": {
                    "members": "*",
                    "name": "LightningComponentBundle"
                }
            }
        ]
    }
}
{ result: { done: false, id: '09S3h000005gknzEAA', state: 'Queued' } }
```


```
$ sfdx mohanc:mdapi:checkRetrieveStatus  -u mohan.chinnappan.n_ea2@gmail.com -i 09S3h000005gknzEAA
```

```
[
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-07-21T11:26:23.000Z,
    fileName: 'unpackaged/lwc/rower/rower.js',
    fullName: 'rower/rower.js',
    id: '0Rd3h000000XPw2CAG',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2020-07-21T13:33:04.000Z,
    manageableState: 'unmanaged',
    type: 'LightningComponentBundle'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-07-21T11:26:23.000Z,
    fileName: 'unpackaged/lwc/rower/rower.html',
    fullName: 'rower/rower.html',
    id: '0Rd3h000000XPw3CAG',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2020-07-21T13:33:04.000Z,
    manageableState: 'unmanaged',
    type: 'LightningComponentBundle'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-12-14T19:37:17.000Z,
    fileName: 'unpackaged/lwc/ideaComment/ideaComment.css',
    fullName: 'ideaComment/ideaComment.css',
    id: '0Rd3h000000zdkECAQ',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-01-25T18:04:05.000Z,
    manageableState: 'unmanaged',
    type: 'LightningComponentBundle'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-12-07T13:41:44.000Z,
    fileName: 'unpackaged/lwc/ideaComment/ideaComment.html',
    fullName: 'ideaComment/ideaComment.html',
    id: '0Rd3h000000zd3lCAA',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-01-25T18:04:05.000Z,
    manageableState: 'unmanaged',
    type: 'LightningComponentBundle'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-12-07T13:41:44.000Z,
    fileName: 'unpackaged/lwc/ideaComment/ideaComment.js',
    fullName: 'ideaComment/ideaComment.js',
    id: '0Rd3h000000zd3nCAA',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-01-25T18:04:18.000Z,
    manageableState: 'unmanaged',
    type: 'LightningComponentBundle'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-12-09T22:43:08.000Z,
    fileName: 'unpackaged/lwc/ideaItem/ideaItem.html',
    fullName: 'ideaItem/ideaItem.html',
    id: '0Rd3h000000zd87CAA',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-01-25T18:04:18.000Z,
    manageableState: 'unmanaged',
    type: 'LightningComponentBundle'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-12-09T22:43:08.000Z,
    fileName: 'unpackaged/lwc/ideaItem/ideaItem.js',
    fullName: 'ideaItem/ideaItem.js',
    id: '0Rd3h000000zd88CAA',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-01-25T18:04:05.000Z,
    manageableState: 'unmanaged',
    type: 'LightningComponentBundle'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-12-10T11:44:22.000Z,
    fileName: 'unpackaged/lwc/libsD3/libsD3.js',
    fullName: 'libsD3/libsD3.js',
    id: '0Rd3h000000zd91CAA',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-01-25T18:04:18.000Z,
    manageableState: 'unmanaged',
    type: 'LightningComponentBundle'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-12-10T11:44:22.000Z,
    fileName: 'unpackaged/lwc/libsD3/libsD3.html',
    fullName: 'libsD3/libsD3.html',
    id: '0Rd3h000000zd93CAA',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-01-25T18:04:05.000Z,
    manageableState: 'unmanaged',
    type: 'LightningComponentBundle'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-12-10T11:44:22.000Z,
    fileName: 'unpackaged/lwc/libsD3/data.js',
    fullName: 'libsD3/data.js',
    id: '0Rd3h000000zd94CAA',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-01-25T18:04:05.000Z,
    manageableState: 'unmanaged',
    type: 'LightningComponentBundle'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-07-20T19:17:45.000Z,
    fileName: 'unpackaged/lwc/ideaList/ideaList.js',
    fullName: 'ideaList/ideaList.js',
    id: '0Rd3h000000XPu9CAG',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2020-07-21T13:33:17.000Z,
    manageableState: 'unmanaged',
    type: 'LightningComponentBundle'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-07-20T19:17:45.000Z,
    fileName: 'unpackaged/lwc/ideaList/ideaList.html',
    fullName: 'ideaList/ideaList.html',
    id: '0Rd3h000000XPuACAW',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2020-07-21T13:33:17.000Z,
    manageableState: 'unmanaged',
    type: 'LightningComponentBundle'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-12-09T13:47:28.000Z,
    fileName: 'unpackaged/lwc/datatable/datatable.html',
    fullName: 'datatable/datatable.html',
    id: '0Rd3h000000zd71CAA',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-01-25T18:04:05.000Z,
    manageableState: 'unmanaged',
    type: 'LightningComponentBundle'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-12-09T13:47:28.000Z,
    fileName: 'unpackaged/lwc/datatable/datatable.js',
    fullName: 'datatable/datatable.js',
    id: '0Rd3h000000zd72CAA',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-01-25T18:04:18.000Z,
    manageableState: 'unmanaged',
    type: 'LightningComponentBundle'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-12-10T12:08:26.000Z,
    fileName: 'unpackaged/lwc/libsVega/libsVega.js',
    fullName: 'libsVega/libsVega.js',
    id: '0Rd3h000000zd96CAA',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-01-25T18:04:18.000Z,
    manageableState: 'unmanaged',
    type: 'LightningComponentBundle'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-12-10T12:08:26.000Z,
    fileName: 'unpackaged/lwc/libsVega/libsVega.html',
    fullName: 'libsVega/libsVega.html',
    id: '0Rd3h000000zd97CAA',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-01-25T18:04:05.000Z,
    manageableState: 'unmanaged',
    type: 'LightningComponentBundle'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-12-08T18:21:31.000Z,
    fileName: 'unpackaged/lwc/ideaNew/ideaNew.js',
    fullName: 'ideaNew/ideaNew.js',
    id: '0Rd3h000000zd6SCAQ',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-01-25T18:04:18.000Z,
    manageableState: 'unmanaged',
    type: 'LightningComponentBundle'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-12-08T18:21:31.000Z,
    fileName: 'unpackaged/lwc/ideaNew/ideaNew.html',
    fullName: 'ideaNew/ideaNew.html',
    id: '0Rd3h000000zd6TCAQ',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-01-25T18:04:05.000Z,
    manageableState: 'unmanaged',
    type: 'LightningComponentBundle'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-07-20T11:52:06.000Z,
    fileName: 'unpackaged/lwc/ideaMgmt/ideaMgmt.js',
    fullName: 'ideaMgmt/ideaMgmt.js',
    id: '0Rd3h000000XPIMCA4',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2020-07-21T13:33:11.000Z,
    manageableState: 'unmanaged',
    type: 'LightningComponentBundle'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-07-20T11:52:06.000Z,
    fileName: 'unpackaged/lwc/ideaMgmt/ideaMgmt.html',
    fullName: 'ideaMgmt/ideaMgmt.html',
    id: '0Rd3h000000XPINCA4',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2020-07-21T13:33:11.000Z,
    manageableState: 'unmanaged',
    type: 'LightningComponentBundle'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-12-15T00:03:46.000Z,
    fileName: 'unpackaged/lwc/ideaVote/ideaVote.html',
    fullName: 'ideaVote/ideaVote.html',
    id: '0Rd3h000000zdkJCAQ',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-01-25T18:04:05.000Z,
    manageableState: 'unmanaged',
    type: 'LightningComponentBundle'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-12-15T00:03:46.000Z,
    fileName: 'unpackaged/lwc/ideaVote/ideaVote.js',
    fullName: 'ideaVote/ideaVote.js',
    id: '0Rd3h000000zdkLCAQ',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-01-25T18:04:05.000Z,
    manageableState: 'unmanaged',
    type: 'LightningComponentBundle'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-12-07T19:25:05.000Z,
    fileName: 'unpackaged/lwc/ideaCommentUtil/ideaCommentUtil.js',
    fullName: 'ideaCommentUtil/ideaCommentUtil.js',
    id: '0Rd3h000000zd45CAA',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-01-25T18:04:18.000Z,
    manageableState: 'unmanaged',
    type: 'LightningComponentBundle'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-12-07T19:25:05.000Z,
    fileName: 'unpackaged/lwc/ideaCommentUtil/ideaCommentUtil.html',
    fullName: 'ideaCommentUtil/ideaCommentUtil.html',
    id: '0Rd3h000000zd46CAA',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-01-25T18:04:05.000Z,
    manageableState: 'unmanaged',
    type: 'LightningComponentBundle'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-12-10T13:12:45.000Z,
    fileName: 'unpackaged/lwc/charts/charts.html',
    fullName: 'charts/charts.html',
    id: '0Rd3h000000zd9CCAQ',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-01-25T18:04:05.000Z,
    manageableState: 'unmanaged',
    type: 'LightningComponentBundle'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-12-10T13:12:45.000Z,
    fileName: 'unpackaged/lwc/charts/charts.js',
    fullName: 'charts/charts.js',
    id: '0Rd3h000000zd9DCAQ',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-01-25T18:04:18.000Z,
    manageableState: 'unmanaged',
    type: 'LightningComponentBundle'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-12-09T01:21:50.000Z,
    fileName: 'unpackaged/lwc/ideasComp/ideasComp.css',
    fullName: 'ideasComp/ideasComp.css',
    id: '0Rd3h000000zd6hCAA',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-01-25T18:04:18.000Z,
    manageableState: 'unmanaged',
    type: 'LightningComponentBundle'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-12-06T13:03:48.000Z,
    fileName: 'unpackaged/lwc/ideasComp/ideasComp.html',
    fullName: 'ideasComp/ideasComp.html',
    id: '0Rd3h000000zd26CAA',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-01-25T18:04:18.000Z,
    manageableState: 'unmanaged',
    type: 'LightningComponentBundle'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-12-06T13:03:48.000Z,
    fileName: 'unpackaged/lwc/ideasComp/ideasComp.js',
    fullName: 'ideasComp/ideasComp.js',
    id: '0Rd3h000000zd24CAA',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-01-25T18:04:18.000Z,
    manageableState: 'unmanaged',
    type: 'LightningComponentBundle'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2021-03-16T13:29:05.422Z,
    fileName: 'unpackaged/package.xml',
    fullName: 'unpackaged/package.xml',
    id: '',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2021-03-16T13:29:05.422Z,
    manageableState: 'unmanaged',
    type: 'Package'
  }
]
=== Writing zipFile base64 content to 09S3h000005gknzEAA.zip.txt ...
=== Writing zipFile binary content to 09S3h000005gknzEAA.zip ... 
```

```
$ jar tvf 09S3h000005gknzEAA.zip
...
   367 Tue Mar 16 13:29:04 EDT 2021 unpackaged/lwc/rower/rower.js-meta.xml
   281 Tue Mar 16 13:29:04 EDT 2021 unpackaged/lwc/rower/rower.js
   266 Tue Mar 16 13:29:04 EDT 2021 unpackaged/lwc/rower/rower.html
   236 Tue Mar 16 13:29:04 EDT 2021 unpackaged/package.xml
...

```
