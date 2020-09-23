# Using  Connect API

## Topics

- [Getting the user info](#userinfo)

- [References](#ref)


<a name='userinfo'></a>

## Getting about the user: 'me'

```
$ sfdx mohanc:ws:rest -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/chatter/users/me -m GET -f ~/.headers/header_ea.json > /tmp/chatter-me.json

$ cat /tmp/chatter-me.json
```


```json
{
    "aboutMe": null,
    "additionalLabel": null,
    "address": {
        "city": null,
        "country": "US",
        "formattedAddress": "US",
        "state": null,
        "street": null,
        "zip": null
    },
    "bannerPhoto": {
        "bannerPhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/B",
        "bannerPhotoVersionId": null,
        "url": "/services/data/v49.0/connect/user-profiles/0053h000002xQ5sAAE/banner-photo"
    },
    "chatterActivity": {
        "commentCount": 0,
        "commentReceivedCount": 0,
        "likeReceivedCount": 0,
        "postCount": 4
    },
    "chatterInfluence": {
        "percentile": "0.0",
        "rank": 1
    },
    "communityNickname": "User15946686587279553601",
    "companyName": "salesforce",
    "displayName": "Mohan Chinnappan",
    "email": "mohan.chinnappan.n@gmail.com",
    "firstName": "Mohan",
    "followersCount": 0,
    "followingCounts": {
        "people": 0,
        "records": 0,
        "total": 0
    },
    "groupCount": 0,
    "hasChatter": true,
    "id": "0053h000002xQ5sAAE",
    "isActive": true,
    "isInThisCommunity": true,
    "lastName": "Chinnappan",
    "managerId": null,
    "managerName": null,
    "motif": {
        "color": "65CAE4",
        "largeIconUrl": "/img/icon/profile64.png",
        "mediumIconUrl": "/img/icon/profile32.png",
        "smallIconUrl": "/img/icon/profile16.png",
        "svgIconUrl": null
    },
    "mySubscription": null,
    "name": "Mohan Chinnappan",
    "outOfOffice": {
        "message": ""
    },
    "phoneNumbers": [],
    "photo": {
        "fullEmailPhotoUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/userprofile/default_profile_200_v2.png?fromEmail=1",
        "largePhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/F",
        "mediumPhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/M",
        "photoVersionId": null,
        "smallPhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/T",
        "standardEmailPhotoUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com/img/userprofile/default_profile_45_v2.png?fromEmail=1",
        "url": "/services/data/v49.0/connect/user-profiles/0053h000002xQ5sAAE/photo"
    },
    "reputation": null,
    "thanksReceived": null,
    "title": null,
    "type": "User",
    "url": "/services/data/v49.0/chatter/users/0053h000002xQ5sAAE",
    "userType": "Internal",
    "username": "mohan.chinnappan.n_ea2@gmail.com"
}
```

### Getting the address of the user

```
$ sfdx mohanc:data:jq  -i /tmp/chatter-me.json -f '.address'
```
```json
{
  "city": null,
  "country": "US",
  "formattedAddress": "US",
  "state": null,
  "street": null,
  "zip": null
}
```

###  Chatter Activity of the user

```
$ sfdx mohanc:data:jq  -i /tmp/chatter-me.json -f '.chatterActivity'
```

```json
{
  "commentCount": 0,
  "commentReceivedCount": 0,
  "likeReceivedCount": 0,
  "postCount": 4
}
```
### Chattter Influence of the user
```
$ sfdx mohanc:data:jq  -i /tmp/chatter-me.json -f '.chatterInfluence'
```

```json
{
  "percentile": "0.0",
  "rank": 1
}
```
### Company Name of the user

```
$ sfdx mohanc:data:jq  -i /tmp/chatter-me.json -f '.companyName'
"salesforce"
``` 

<a name='ref'></a>
## References
- [Connect REST API Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.chatterapi.meta/chatterapi/intro_understanding_chatter_connect_resources.htm)
