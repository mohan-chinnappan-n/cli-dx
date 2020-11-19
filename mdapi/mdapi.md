# Meatadata API related commands

- Requires 0.0.123 version of the plugin
    - sfdx-mohanc-plugins@0.0.123
    - [How to install the plugin](https://mohan-chinnappan-n.github.io/dx/plugins.html#/1)


## Topics

- [List Metadata](#listMetadata)
- [retrieve Metadata](#retrieve)
- [checkRetrieveStatus](#checkRetrieveStatus)
- [deploy](#deploy)
- [checkDeployStatus](#checkDeployStatus)
- [SiteDotDom Examples](#sitedotcom)
- [References](#ref)


- ExperienceBundle based examples
<a name="listMetadata"></a>
## List Metadata

- Usage
```
$ sfdx mohanc:mdapi:list -h
List metadata

USAGE
  $ sfdx mohanc:mdapi:list

OPTIONS
  -t, --type=type                                 Metadata Type to list
  -u, --targetusername=targetusername             username or alias for the target org; overrides default target org
  --apiversion=apiversion                         override the api version used for api requests made by this command
  --json                                          format output as json
  --loglevel=(trace|debug|info|warn|error|fatal)  logging level for this command invocation

EXAMPLE

              List the given metadata type
              sfdx mohanc:mdapi:list  -u <username> -t <type>

              sfdx mohanc:mdapi:list  -u user@mail.com -t ExperienceBundle 
           

```

```
$ sfdx mohanc:mdapi:list -u mohan.chinnappan.n_ea2@gmail.com -t ExperienceBundle
{
  result: [
    {
      createdById: '0053h000002xQ5sAAE',
      createdByName: 'Mohan Chinnappan',
      createdDate: 2020-07-25T10:44:15.000Z,
      fileName: 'experiences/selfservice1',
      fullName: 'selfservice1',
      id: '0DM3h000000227lGAA',
      lastModifiedById: '0053h000002xQ5sAAE',
      lastModifiedByName: 'Mohan Chinnappan',
      lastModifiedDate: 2020-07-25T10:44:15.000Z,
      type: 'ExperienceBundle'
    }
  ]
}
```


<a name="retrieve"></a>
## Retrieve
```
$ sfdx mohanc:mdapi:retrieve -u mohan.chinnappan.n_ea2@gmail.com -t "CustomSite,ExperienceBundle,Network"
{
    "RetrieveRequest": {
        "apiVersion": "50.0",
        "unpackaged": [
            {
                "types": {
                    "members": "*",
                    "name": "CustomSite"
                }
            },
            {
                "types": {
                    "members": "*",
                    "name": "ExperienceBundle"
                }
            },
            {
                "types": {
                    "members": "*",
                    "name": "Network"
                }
            }
        ]
    }
}
{ result: { done: false, id: '09S3h000005TvddEAC', state: 'Queued' } }
```

<a name="checkRetrieveStatus"></a>
## checkRetrieveStatus
```
$  sfdx mohanc:mdapi:checkRetrieveStatus -u mohan.chinnappan.n_ea2@gmail.com -i 09S3h000005TvddEAC
[
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-07-25T10:44:15.000Z,
    fileName: 'unpackaged/networks/selfservice.network',
    fullName: 'selfservice',
    id: '0DB3h00000021GPGAY',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2020-07-25T10:44:21.000Z,
    type: 'Network'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-11-19T19:07:50.312Z,
    fileName: 'unpackaged/package.xml',
    fullName: 'unpackaged/package.xml',
    id: '',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2020-11-19T19:07:50.312Z,
    manageableState: 'unmanaged',
    type: 'Package'
  }
]
=== Writing zipFile base64 content to 09S3h000005TvddEAC.zip.txt ...
=== Writing zipFile binary content to 09S3h000005TvddEAC.zip ... 
```
```
## Zip file contents
$ jar tvf 09S3h000005TvddEAC.zip
  2653 Thu Nov 19 19:07:50 EST 2020 unpackaged/networks/selfservice.network
   219 Thu Nov 19 19:07:50 EST 2020 unpackaged/package.xml

```


<a name="deploy"></a>
## Deploy
```
$ cat ~/.ea/options.json 
```json
{
  "checkOnly": true

}
```
```
$  sfdx mohanc:mdapi:deploy -u mohan.chinnappan.n_ea2@gmail.com -z 09S3h000005TvdYEAS.zip.txt  -o  ~/.ea/options.json
{ checkOnly: true }
{
    "zipFile": "UEsDBBQACAgIAESYc1EAAAAAAAAAAAAAAAAnAAAAdW5wYWNrYWdlZC9uZXR3b3Jrcy9zZWxmc2VydmljZS5uZXR3b3JrjVZtb9owEP7Or0BoX0foNE3TFNIhKFW1tUO8dJ9NcgSrjh3ZDqz/fmecFDtvLZ/g7nken+/Od4S3/zI2PIFUVPDp6GY8GQ2BxyKhPJ2Odtvl5++j22gQPoE+C/kyRDRX09FR6/xHEChB8rE6CBnDOBZZ8GUy+RZMvgYZaJIQTUbRYIifkDAmzg9cg+SE7RTI3yKlPDoQpiAMOrwO9RGyPYa4FUtGUo/meywlPhKewooohSEnW8hyRjREBT9QBsmnvNgzGgdzkWUFp/p17sHvMkJZxQmDDq3yoEpiLRiooLQmVJE9gzXkhSYa07qGGLlzwU2aLxYVaVmg+oegVhVMXBvgCchZkkhQKsoEBjeOj5Rzkuf4lf9MDcqUIgxaCA2lJ5JBpIAdMOknGoPHujhLCjdhzgulRfa8vJNSyBVJ4Q9GKWkCqirJuzhXbkElxPoRA0NIlZFWl8u6L0BpLJnGdvGP9TwNyhJrP4tjkwb3pLqvwbMN9kwV3VOGpW45swFxRR74idra+kzH7sJ/cXHGJk3B/PAZvssl9cfYG94TjV84FnpBFXb2q5ebus/lrSQ94UN4K5F3Yt3pEq+97nMcuwvfHMV5xlg5fjagNQ6m2nEdGE+GapgpfFeaUI7t4V6z7nN5W8JeUGy2F4XeYHh+8zS9HlfkNJ4pRVOeAdfrgtW6vBXQUNgUKebQjgLv2g2vS93lC3Hmz0LXmsixWzgO71ToDw/LpQevDcsOLXtQSvQRpJ0NIHHEaGpuvcA1UYXYB7Ei3NbYtvS9FEVeXvvizaUwUUckySgPg+qnpQad3Eq1ZVS17BMXVfZahMXnCZFJfV+0Ya+6frrasAswzQGyntp+3SNmr1+tC3HVYGYF94t0Qq4qZrWsIV3ZQvTLvY/169i2WPBBYIaEedHuWrvBXnA8Azc2qrT0xlHDXsF58hcYrla4dH35khvmEl2LAIHOyTgqChXtzJLFsYMHFbE5CUHWY2Ga7N0uTOBACqa3ZB+Z8uGfh6vByXjZicZa7sKL7JuxTOJVPDzb8N99+u41r2++zh6EQTmIo8F/UEsHCNDdIfMbAwAAXQoAAFBLAwQUAAgICABEmHNRAAAAAAAAAAAAAAAAFgAAAHVucGFja2FnZWQvcGFja2FnZS54bWxNjs0KwjAQhO95ipCjYDaKisg2vXkUD/oAMV3bUpOUJvjz9pb+oHOaj11mBvO3e/AndbEOPhMrqQQnb0NR+zIT18txuRe5Zng2tjEl8f7bx0xUKbUHgBhMK+M9dJakDQ7WSu1AbcBRMoVJRmjGe2H6tBRHP7Ajd+sr9QJhtr+jN470idIrdA3CQGMK/MXgNFlvlVQIMzGEaalmX1BLBwhjxU//mwAAANsAAABQSwECFAAUAAgICABEmHNR0N0h8xsDAABdCgAAJwAAAAAAAAAAAAAAAAAAAAAAdW5wYWNrYWdlZC9uZXR3b3Jrcy9zZWxmc2VydmljZS5uZXR3b3JrUEsBAhQAFAAICAgARJhzUWPFT/+bAAAA2wAAABYAAAAAAAAAAAAAAAAAcAMAAHVucGFja2FnZWQvcGFja2FnZS54bWxQSwUGAAAAAAIAAgCZAAAATwQAAAAA",
    "DeployOptions": {
        "checkOnly": true
    }
}
{ result: { done: false, id: '0Af3h00000GAz8UCAT', state: 'Queued' } }
```

<a name="checkDeployStatus"></a>
## checkDeployStatus
```

$  sfdx mohanc:mdapi:checkDeployStatus -u mohan.chinnappan.n_ea2@gmail.com -i 0Af3h00000GAz8UCAT
{
  result: {
    checkOnly: true,
    completedDate: 2020-11-19T19:02:46.000Z,
    createdBy: '0053h000002xQ5s',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-11-19T19:02:45.000Z,
    details: null,
    done: true,
    id: '0Af3h00000GAz8UCAT',
    ignoreWarnings: false,
    lastModifiedDate: 2020-11-19T19:02:46.000Z,
    numberComponentErrors: 0,
    numberComponentsDeployed: 1,
    numberComponentsTotal: 1,
    numberTestErrors: 0,
    numberTestsCompleted: 0,
    numberTestsTotal: 0,
    rollbackOnError: false,
    runTestsEnabled: false,
    startDate: 2020-11-19T19:02:45.000Z,
    status: 'Succeeded',
    success: true
  }
}
```
<a name="sitedotcom"></a>
## SiteDotCom Examples
- retrieve
```
$ sfdx mohanc:mdapi:retrieve -u mohan.chinnappan.n_ea2@gmail.com -t "SiteDotCom"
{
    "RetrieveRequest": {
        "apiVersion": "50.0",
        "unpackaged": [
            {
                "types": {
                    "members": "*",
                    "name": "SiteDotCom"
                }
            }
        ]
    }
}
{ result: { done: false, id: '09S3h000005TvdiEAC', state: 'Queued' } }
```

- checkRetrieveStatus
```
$ sfdx mohanc:mdapi:checkRetrieveStatus -u mohan.chinnappan.n_ea2@gmail.com -i 09S3h000005TvdiEAC
[
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-07-25T10:44:15.000Z,
    fileName: 'unpackaged/siteDotComSites/selfservice1.site',
    fullName: 'selfservice1',
    id: '0DM3h000000227lGAA',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2020-07-25T10:44:15.000Z,
    type: 'SiteDotCom'
  },
  {
    createdById: '0053h000002xQ5sAAE',
    createdByName: 'Mohan Chinnappan',
    createdDate: 2020-11-19T19:13:30.733Z,
    fileName: 'unpackaged/package.xml',
    fullName: 'unpackaged/package.xml',
    id: '',
    lastModifiedById: '0053h000002xQ5sAAE',
    lastModifiedByName: 'Mohan Chinnappan',
    lastModifiedDate: 2020-11-19T19:13:30.733Z,
    manageableState: 'unmanaged',
    type: 'Package'
  }
]
=== Writing zipFile base64 content to 09S3h000005TvdiEAC.zip.txt ...
=== Writing zipFile binary content to 09S3h000005TvdiEAC.zip ... 
```

- ZIP file contents
```
$ jar tvf 09S3h000005TvdiEAC.zip
 38702 Thu Nov 19 19:13:30 EST 2020 unpackaged/siteDotComSites/selfservice1.site
   192 Thu Nov 19 19:13:30 EST 2020 unpackaged/siteDotComSites/selfservice1.site-meta.xml
   222 Thu Nov 19 19:13:30 EST 2020 unpackaged/package.xml

```
<a name="ref"></a>
## References
- [ExperenceBundle metadata](https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_experiencebundle.htm?search_text=ExperienceBundle)
- [SiteDotCom metadata ](https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_sitedotcom.htm)
