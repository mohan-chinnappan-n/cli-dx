## Ideas

### Data Model
![ideas data model](https://mohan-chinnappan-n.github.io/sfdc/fs-cloud/img/Idea.svg)
![ideas data model table](img/ideas-1.png)

### Classic page
![Ideas classic](img/ideas-2.png)


### Get SOQL for Idea
```
$ bash getObjectSOQL.sh Idea  
SELECT Id
    ,IsDeleted
    ,Title
    ,RecordTypeId
    ,CreatedDate
    ,CreatedById
    ,LastModifiedDate
    ,LastModifiedById
    ,SystemModstamp
    ,LastViewedDate
    ,LastReferencedDate
    ,CommunityId
    ,Body
    ,NumComments
    ,VoteScore
    ,VoteTotal
    ,Categories
    ,Status
    ,LastCommentDate
    ,LastCommentId
    ,ParentIdeaId
    ,IsHtml
    ,IsMerged
    ,CreatorFullPhotoUrl
    ,CreatorSmallPhotoUrl
    ,CreatorName
FROM Idea

```
### Get Idea Records
```
$ bash getObjectRecs.sh Idea  json  
[
    {
        "attributes": {
            "type": "Idea",
            "url": "/services/data/v49.0/sobjects/Idea/0873h000000cYd6AAE"
        },
        "Id": "0873h000000cYd6AAE",
        "IsDeleted": false,
        "Title": "Enabling Einstein Search",
        "RecordTypeId": "0123h0000019oOHAAY",
        "CreatedDate": "2020-07-20T14:59:21.000+0000",
        "CreatedById": "0053h000002xQ5sAAE",
        "LastModifiedDate": "2020-07-20T14:59:21.000+0000",
        "LastModifiedById": "0053h000002xQ5sAAE",
        "SystemModstamp": "2020-07-20T14:59:21.000+0000",
        "LastViewedDate": "2020-07-20T14:59:21.000+0000",
        "LastReferencedDate": "2020-07-20T14:59:21.000+0000",
        "CommunityId": "09a3h000000bD9zAAE",
        "Body": "Enabling Einstein Search will improve the productivity of the Agents",
        "NumComments": 0,
        "VoteScore": 3.64007538489053e-8,
        "VoteTotal": 10,
        "Categories": null,
        "Status": null,
        "LastCommentDate": null,
        "LastCommentId": null,
        "ParentIdeaId": null,
        "IsHtml": true,
        "IsMerged": false,
        "CreatorFullPhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/F",
        "CreatorSmallPhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/T",
        "CreatorName": "Mohan Chinnappan"
    },
    {
        "attributes": {
            "type": "Idea",
            "url": "/services/data/v49.0/sobjects/Idea/0873h000000cYYtAAM"
        },
        "Id": "0873h000000cYYtAAM",
        "IsDeleted": false,
        "Title": "LWC component for Idea",
        "RecordTypeId": "0123h0000019oOHAAY",
        "CreatedDate": "2020-07-18T12:09:44.000+0000",
        "CreatedById": "0053h000002xQ5sAAE",
        "LastModifiedDate": "2020-07-18T12:09:44.000+0000",
        "LastModifiedById": "0053h000002xQ5sAAE",
        "SystemModstamp": "2020-07-18T12:09:44.000+0000",
        "LastViewedDate": "2020-07-20T14:57:56.000+0000",
        "LastReferencedDate": "2020-07-20T14:57:56.000+0000",
        "CommunityId": "09a3h000000bD9zAAE",
        "Body": "Currently, Idea is available only on Classic. This should be an effort provide Idea in Lightning.",
        "NumComments": 0,
        "VoteScore": 1.747241998197377e-8,
        "VoteTotal": 10,
        "Categories": null,
        "Status": null,
        "LastCommentDate": null,
        "LastCommentId": null,
        "ParentIdeaId": null,
        "IsHtml": true,
        "IsMerged": false,
        "CreatorFullPhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/F",
        "CreatorSmallPhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/T",
        "CreatorName": "Mohan Chinnappan"
    },
    {
        "attributes": {
            "type": "Idea",
            "url": "/services/data/v49.0/sobjects/Idea/0873h000000cYdBAAU"
        },
        "Id": "0873h000000cYdBAAU",
        "IsDeleted": false,
        "Title": "RBL 3.0 Pilot",
        "RecordTypeId": "0123h0000019oOHAAY",
        "CreatedDate": "2020-07-20T15:22:02.000+0000",
        "CreatedById": "0053h000002xQ5sAAE",
        "LastModifiedDate": "2020-07-20T15:22:02.000+0000",
        "LastModifiedById": "0053h000002xQ5sAAE",
        "SystemModstamp": "2020-07-20T15:22:02.000+0000",
        "LastViewedDate": "2020-07-20T15:22:02.000+0000",
        "LastReferencedDate": "2020-07-20T15:22:02.000+0000",
        "CommunityId": "09a3h000000bD9zAAE",
        "Body": "RBL 3.0 Pilot will help to provide Rollups for the Financial Account in FSC",
        "NumComments": 0,
        "VoteScore": 3.660002124470581e-8,
        "VoteTotal": 10,
        "Categories": null,
        "Status": null,
        "LastCommentDate": null,
        "LastCommentId": null,
        "ParentIdeaId": null,
        "IsHtml": true,
        "IsMerged": false,
        "CreatorFullPhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/F",
        "CreatorSmallPhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/T",
        "CreatorName": "Mohan Chinnappan"
    },
    {
        "attributes": {
            "type": "Idea",
            "url": "/services/data/v49.0/sobjects/Idea/0873h000000cYdGAAU"
        },
        "Id": "0873h000000cYdGAAU",
        "IsDeleted": false,
        "Title": "License Management app",
        "RecordTypeId": "0123h0000019oOHAAY",
        "CreatedDate": "2020-07-20T18:02:33.000+0000",
        "CreatedById": "0053h000002xQ5sAAE",
        "LastModifiedDate": "2020-07-20T18:02:33.000+0000",
        "LastModifiedById": "0053h000002xQ5sAAE",
        "SystemModstamp": "2020-07-20T18:02:33.000+0000",
        "LastViewedDate": "2020-07-20T18:02:33.000+0000",
        "LastReferencedDate": "2020-07-20T18:02:33.000+0000",
        "CommunityId": "09a3h000000bD9zAAE",
        "Body": "App to show the current licenses and their status",
        "NumComments": 0,
        "VoteScore": 3.804163990949667e-8,
        "VoteTotal": 10,
        "Categories": null,
        "Status": null,
        "LastCommentDate": null,
        "LastCommentId": null,
        "ParentIdeaId": null,
        "IsHtml": true,
        "IsMerged": false,
        "CreatorFullPhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/F",
        "CreatorSmallPhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/T",
        "CreatorName": "Mohan Chinnappan"
    }
]
```
