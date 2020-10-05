# Lightning related

## Topics
- [Details about users who switched between Salesforce Classic and Lightning Experience](#lfswitch)
- [Return the total number of Lightning Experience and Salesforce Mobile users](#LightningUsageByAppTypeMetrics)
- [What is EPT - Experienced Page Time?](#ept)
- [Get EPT info](#getEPT)
- [EPT, Browser distribution details, for the last 3 months](#EPTdist)
- [Lightning Usage by FlexiPage](#flexipage)

<a name="lfswitch"></a>
## Details about users who switched between Salesforce Classic and Lightning Experience.


```
$ bash ../sh/getObjectRecs.sh LightningToggleMetrics json
```

```json
[
    {
        "attributes": {
            "type": "LightningToggleMetrics",
            "url": "/services/data/v49.0/sobjects/LightningToggleMetrics/1o13h00001XwFYDAA3"
        },
        "Id": "1o13h00001XwFYDAA3",
        "MetricsDate": "2018-10-30",
        "UserId": "0053h000002xQ5sAAE",
        "Action": "switchToLightningDesktop",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCount": 1
    },
    {
        "attributes": {
            "type": "LightningToggleMetrics",
            "url": "/services/data/v49.0/sobjects/LightningToggleMetrics/1o13h00001XwFYEAA3"
        },
        "Id": "1o13h00001XwFYEAA3",
        "MetricsDate": "2018-12-05",
        "UserId": "0053h000002xQ5sAAE",
        "Action": "switchToLightningDesktop",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCount": 1
    },
    {
        "attributes": {
            "type": "LightningToggleMetrics",
            "url": "/services/data/v49.0/sobjects/LightningToggleMetrics/1o13h00001azBKAAA2"
        },
        "Id": "1o13h00001azBKAAA2",
        "MetricsDate": "2020-07-15",
        "UserId": "0053h000002xQ5sAAE",
        "Action": "switchToAloha",
        "SystemModstamp": "2020-07-16T13:12:38.000+0000",
        "RecordCount": 1
    },
    {
        "attributes": {
            "type": "LightningToggleMetrics",
            "url": "/services/data/v49.0/sobjects/LightningToggleMetrics/1o13h00001azBVoAAM"
        },
        "Id": "1o13h00001azBVoAAM",
        "MetricsDate": "2020-07-17",
        "UserId": "0053h000002xQ5sAAE",
        "Action": "switchToAloha",
        "SystemModstamp": "2020-07-18T13:10:43.000+0000",
        "RecordCount": 1
    },
    {
        "attributes": {
            "type": "LightningToggleMetrics",
            "url": "/services/data/v49.0/sobjects/LightningToggleMetrics/1o13h00001azBVpAAM"
        },
        "Id": "1o13h00001azBVpAAM",
        "MetricsDate": "2020-07-17",
        "UserId": "0053h000002xQ5sAAE",
        "Action": "switchToLightningDesktop",
        "SystemModstamp": "2020-07-18T13:10:43.000+0000",
        "RecordCount": 1
    },
    {
        "attributes": {
            "type": "LightningToggleMetrics",
            "url": "/services/data/v49.0/sobjects/LightningToggleMetrics/1o13h00001azEEDAA2"
        },
        "Id": "1o13h00001azEEDAA2",
        "MetricsDate": "2020-07-20",
        "UserId": "0053h000002xQ5sAAE",
        "Action": "switchToAloha",
        "SystemModstamp": "2020-07-24T13:10:15.000+0000",
        "RecordCount": 1
    },
    {
        "attributes": {
            "type": "LightningToggleMetrics",
            "url": "/services/data/v49.0/sobjects/LightningToggleMetrics/1o13h00001azEEEAA2"
        },
        "Id": "1o13h00001azEEEAA2",
        "MetricsDate": "2020-07-20",
        "UserId": "0053h000002xQ5sAAE",
        "Action": "switchToLightningDesktop",
        "SystemModstamp": "2020-07-24T13:10:15.000+0000",
        "RecordCount": 2
    },
    {
        "attributes": {
            "type": "LightningToggleMetrics",
            "url": "/services/data/v49.0/sobjects/LightningToggleMetrics/1o13h00001bVMLAAA4"
        },
        "Id": "1o13h00001bVMLAAA4",
        "MetricsDate": "2020-08-12",
        "UserId": "0053h000002xQ5sAAE",
        "Action": "switchToAloha",
        "SystemModstamp": "2020-08-13T13:18:03.000+0000",
        "RecordCount": 1
    },
    {
        "attributes": {
            "type": "LightningToggleMetrics",
            "url": "/services/data/v49.0/sobjects/LightningToggleMetrics/1o13h00001bVQPIAA4"
        },
        "Id": "1o13h00001bVQPIAA4",
        "MetricsDate": "2020-08-18",
        "UserId": "0053h000002xQ5sAAE",
        "Action": "switchToLightningDesktop",
        "SystemModstamp": "2020-08-19T13:12:08.000+0000",
        "RecordCount": 1
    },
    {
        "attributes": {
            "type": "LightningToggleMetrics",
            "url": "/services/data/v49.0/sobjects/LightningToggleMetrics/1o13h00001bVUU3AAO"
        },
        "Id": "1o13h00001bVUU3AAO",
        "MetricsDate": "2020-08-25",
        "UserId": "0053h000002xQ5sAAE",
        "Action": "switchToAloha",
        "SystemModstamp": "2020-08-26T13:10:44.000+0000",
        "RecordCount": 1
    },
    {
        "attributes": {
            "type": "LightningToggleMetrics",
            "url": "/services/data/v49.0/sobjects/LightningToggleMetrics/1o13h00001bVUYMAA4"
        },
        "Id": "1o13h00001bVUYMAA4",
        "MetricsDate": "2020-08-26",
        "UserId": "0053h000002xQ5sAAE",
        "Action": "switchToLightningDesktop",
        "SystemModstamp": "2020-08-27T13:11:06.000+0000",
        "RecordCount": 1
    },
    {
        "attributes": {
            "type": "LightningToggleMetrics",
            "url": "/services/data/v49.0/sobjects/LightningToggleMetrics/1o13h00001bVe5eAAC"
        },
        "Id": "1o13h00001bVe5eAAC",
        "MetricsDate": "2020-09-10",
        "UserId": "0053h000002xQ5sAAE",
        "Action": "switchToAloha",
        "SystemModstamp": "2020-09-11T13:18:05.000+0000",
        "RecordCount": 1
    },
    {
        "attributes": {
            "type": "LightningToggleMetrics",
            "url": "/services/data/v49.0/sobjects/LightningToggleMetrics/1o13h00001bVgqkAAC"
        },
        "Id": "1o13h00001bVgqkAAC",
        "MetricsDate": "2020-09-14",
        "UserId": "0053h000002xQ5sAAE",
        "Action": "switchToLightningDesktop",
        "SystemModstamp": "2020-09-16T13:11:41.000+0000",
        "RecordCount": 1
    },
    {
        "attributes": {
            "type": "LightningToggleMetrics",
            "url": "/services/data/v49.0/sobjects/LightningToggleMetrics/1o13h00001bVjqRAAS"
        },
        "Id": "1o13h00001bVjqRAAS",
        "MetricsDate": "2020-09-28",
        "UserId": "0053h000002xQ5sAAE",
        "Action": "switchToLightningDesktop",
        "SystemModstamp": "2020-09-29T13:13:06.000+0000",
        "RecordCount": 1
    }
]

```

<a name='LightningUsageByAppTypeMetrics'></a>
## Return the total number of Lightning Experience and Salesforce Mobile users.

```
$ bash ../sh/getObjectRecs.sh LightningUsageByAppTypeMetrics json
```
```json
[
    {
        "attributes": {
            "type": "LightningUsageByAppTypeMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByAppTypeMetrics/62C3h00000o3rkBEAQ"
        },
        "Id": "62C3h00000o3rkBEAQ",
        "MetricsDate": "2018-10-30",
        "UserId": "0053h000002xQ5sAAE",
        "AppExperience": "Lightning Experience",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000"
    }
]
```
<a name="ept"></a>

### EPT
- Experienced Page Time (EPT) is a performance metric Salesforce uses in Lightning to measure page load time. EPT measures how long it takes for a page to load into a state that a user can meaningfully interact with.

- A major difference between Salesforce Classic and Lightning Experience is that pages load progressively in Lightning, while pages in Classic are generated on request by the server. Because of the progressive loading from the client, any loaded component in the page can load more components at any time. Measuring when a page finishes loading in Lightning isn’t straightforward. Many factors can influence the EPT value.

- Client-side and server-side factors both affect EPT. On the client side, the user’s browser, hardware, network quality, and their org’s complexity all affect EPT. On the server side, Apex and API processing and XMLHttpRequests (XHRs) impact EPT. For instance, component implementation details, errors, caching, and user interactions while the page is loading can all increase EPT.

- Other things to consider:

    - Lightning UI is rendered client side, making it sensitive to browser performance.
    - Lightning UI requires many XHRs to render a page, making it sensitive to network latency.
    - Complex pages with many custom fields and components slow page rendering.
    - The EPT is measured as the time from the page start to when no more activity occurs for at least two frames (~33 ms). The two extra frames help to avoid false positives due to asynchronous calls. These calls include any XHR activity, any storage activity, or any user interaction or client-side work of any kind in the main JavaScript thread.
- [Refer: What is EPT](https://help.salesforce.com/articleView?id=technical_requirements_ept.htm&type=5)

<a name="getEPT"></a>
## Return Lightning Experience usage results grouped by browser instance.
### Parameter Description
- Browser:	The browser used.
- EptBin3To5:	Number of times that a page loaded between 3-5 seconds.
- EptBin5To8: Number of times that a page loaded between 5-8 seconds.
- EptBin8To10: Number of times that a page loaded between 8-10 seconds.
- EptBinOver10: Number of times that a page loaded over 10 seconds.
- EptBinUnder3: Number of times that a page loaded under 3 seconds.
- MetricsDate: The date the metric was recorded.
- PageName: The name of the page.
- RecordCountEPT: Number of records for a page/browser where the valid EPT was recorded.
- SumEPT: Sum of the EPT values for page/browser.
- TotalCount: Total records for a page/browser.
```
$ bash ../sh/getObjectRecs.sh LightningUsageByBrowserMetrics json
```

```json
[
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3AmIEAU"
        },
        "Id": "3mK3h00000y3AmIEAU",
        "MetricsDate": "2018-10-30",
        "PageName": "Home",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 0,
        "TotalCount": 1,
        "SumEPT": 0,
        "EptBinUnder3": 0,
        "EptBin3To5": 0,
        "EptBin5To8": 0,
        "EptBin8To10": 0,
        "EptBinOver10": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3AmJEAU"
        },
        "Id": "3mK3h00000y3AmJEAU",
        "MetricsDate": "2018-10-30",
        "PageName": "onesetup:baseHomePage",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 1,
        "TotalCount": 1,
        "SumEPT": 1571,
        "EptBinUnder3": 1,
        "EptBin3To5": 0,
        "EptBin5To8": 0,
        "EptBin8To10": 0,
        "EptBinOver10": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3AmKEAU"
        },
        "Id": "3mK3h00000y3AmKEAU",
        "MetricsDate": "2018-11-27",
        "PageName": "Home",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 0,
        "TotalCount": 2,
        "SumEPT": 0,
        "EptBinUnder3": 0,
        "EptBin3To5": 0,
        "EptBin5To8": 0,
        "EptBin8To10": 0,
        "EptBinOver10": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3AmLEAU"
        },
        "Id": "3mK3h00000y3AmLEAU",
        "MetricsDate": "2018-11-27",
        "PageName": "onesetup:baseHomePage",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 1,
        "TotalCount": 2,
        "SumEPT": 4124,
        "EptBinUnder3": 0,
        "EptBin3To5": 1,
        "EptBin5To8": 0,
        "EptBin8To10": 0,
        "EptBinOver10": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3AmMEAU"
        },
        "Id": "3mK3h00000y3AmMEAU",
        "MetricsDate": "2018-11-27",
        "PageName": "onesetup:setupAlohaPage",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 7,
        "TotalCount": 8,
        "SumEPT": 31418,
        "EptBinUnder3": 2,
        "EptBin3To5": 3,
        "EptBin5To8": 1,
        "EptBin8To10": 1,
        "EptBinOver10": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3AmNEAU"
        },
        "Id": "3mK3h00000y3AmNEAU",
        "MetricsDate": "2018-12-04",
        "PageName": "Home",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 0,
        "TotalCount": 1,
        "SumEPT": 0,
        "EptBinUnder3": 0,
        "EptBin3To5": 0,
        "EptBin5To8": 0,
        "EptBin8To10": 0,
        "EptBinOver10": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3AmOEAU"
        },
        "Id": "3mK3h00000y3AmOEAU",
        "MetricsDate": "2018-12-04",
        "PageName": "onesetup:baseHomePage",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 1,
        "TotalCount": 2,
        "SumEPT": 2996,
        "EptBinUnder3": 1,
        "EptBin3To5": 0,
        "EptBin5To8": 0,
        "EptBin8To10": 0,
        "EptBinOver10": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3AmQEAU"
        },
        "Id": "3mK3h00000y3AmQEAU",
        "MetricsDate": "2018-12-05",
        "PageName": "onesetup:baseHomePage",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 4,
        "TotalCount": 4,
        "SumEPT": 4730,
        "EptBinUnder3": 4,
        "EptBin3To5": 0,
        "EptBin5To8": 0,
        "EptBin8To10": 0,
        "EptBinOver10": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3AmREAU"
        },
        "Id": "3mK3h00000y3AmREAU",
        "MetricsDate": "2018-12-05",
        "PageName": "onesetup:setupAlohaPage",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 10,
        "TotalCount": 13,
        "SumEPT": 23440,
        "EptBinUnder3": 7,
        "EptBin3To5": 2,
        "EptBin5To8": 1,
        "EptBin8To10": 0,
        "EptBinOver10": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3AmPEAU"
        },
        "Id": "3mK3h00000y3AmPEAU",
        "MetricsDate": "2018-12-05",
        "PageName": "unknown unknown",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 0,
        "TotalCount": 1,
        "SumEPT": 0,
        "EptBinUnder3": 0,
        "EptBin3To5": 0,
        "EptBin5To8": 0,
        "EptBin8To10": 0,
        "EptBinOver10": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3AmSEAU"
        },
        "Id": "3mK3h00000y3AmSEAU",
        "MetricsDate": "2018-12-10",
        "PageName": "Home",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 0,
        "TotalCount": 1,
        "SumEPT": 0,
        "EptBinUnder3": 0,
        "EptBin3To5": 0,
        "EptBin5To8": 0,
        "EptBin8To10": 0,
        "EptBinOver10": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3AmTEAU"
        },
        "Id": "3mK3h00000y3AmTEAU",
        "MetricsDate": "2018-12-10",
        "PageName": "onesetup:baseHomePage",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 0,
        "TotalCount": 1,
        "SumEPT": 0,
        "EptBinUnder3": 0,
        "EptBin3To5": 0,
        "EptBin5To8": 0,
        "EptBin8To10": 0,
        "EptBinOver10": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3AmUEAU"
        },
        "Id": "3mK3h00000y3AmUEAU",
        "MetricsDate": "2018-12-13",
        "PageName": "onesetup:baseHomePage",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 3,
        "TotalCount": 6,
        "SumEPT": 4729,
        "EptBinUnder3": 3,
        "EptBin3To5": 0,
        "EptBin5To8": 0,
        "EptBin8To10": 0,
        "EptBinOver10": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3AmVEAU"
        },
        "Id": "3mK3h00000y3AmVEAU",
        "MetricsDate": "2018-12-13",
        "PageName": "onesetup:setupAlohaPage",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 53,
        "TotalCount": 55,
        "SumEPT": 72647,
        "EptBinUnder3": 51,
        "EptBin3To5": 1,
        "EptBin5To8": 1,
        "EptBin8To10": 0,
        "EptBinOver10": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3AmWEAU"
        },
        "Id": "3mK3h00000y3AmWEAU",
        "MetricsDate": "2018-12-14",
        "PageName": "Home",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 0,
        "TotalCount": 1,
        "SumEPT": 0,
        "EptBinUnder3": 0,
        "EptBin3To5": 0,
        "EptBin5To8": 0,
        "EptBin8To10": 0,
        "EptBinOver10": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3AmXEAU"
        },
        "Id": "3mK3h00000y3AmXEAU",
        "MetricsDate": "2018-12-14",
        "PageName": "User Record",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 0,
        "TotalCount": 1,
        "SumEPT": 0,
        "EptBinUnder3": 0,
        "EptBin3To5": 0,
        "EptBin5To8": 0,
        "EptBin8To10": 0,
        "EptBinOver10": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3AmZEAU"
        },
        "Id": "3mK3h00000y3AmZEAU",
        "MetricsDate": "2018-12-14",
        "PageName": "onesetup:baseHomePage",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 4,
        "TotalCount": 4,
        "SumEPT": 9468,
        "EptBinUnder3": 3,
        "EptBin3To5": 1,
        "EptBin5To8": 0,
        "EptBin8To10": 0,
        "EptBinOver10": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3AmaEAE"
        },
        "Id": "3mK3h00000y3AmaEAE",
        "MetricsDate": "2018-12-14",
        "PageName": "onesetup:setupAlohaPage",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 32,
        "TotalCount": 45,
        "SumEPT": 80588,
        "EptBinUnder3": 23,
        "EptBin3To5": 7,
        "EptBin5To8": 2,
        "EptBin8To10": 0,
        "EptBinOver10": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3AmYEAU"
        },
        "Id": "3mK3h00000y3AmYEAU",
        "MetricsDate": "2018-12-14",
        "PageName": "unknown unknown",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 0,
        "TotalCount": 2,
        "SumEPT": 0,
        "EptBinUnder3": 0,
        "EptBin3To5": 0,
        "EptBin5To8": 0,
        "EptBin8To10": 0,
        "EptBinOver10": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3AmbEAE"
        },
        "Id": "3mK3h00000y3AmbEAE",
        "MetricsDate": "2018-12-16",
        "PageName": "onesetup:baseHomePage",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 2,
        "TotalCount": 2,
        "SumEPT": 4856,
        "EptBinUnder3": 1,
        "EptBin3To5": 1,
        "EptBin5To8": 0,
        "EptBin8To10": 0,
        "EptBinOver10": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3AmcEAE"
        },
        "Id": "3mK3h00000y3AmcEAE",
        "MetricsDate": "2018-12-16",
        "PageName": "onesetup:setupAlohaPage",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 15,
        "TotalCount": 15,
        "SumEPT": 31446,
        "EptBinUnder3": 12,
        "EptBin3To5": 2,
        "EptBin5To8": 1,
        "EptBin8To10": 0,
        "EptBinOver10": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3AmdEAE"
        },
        "Id": "3mK3h00000y3AmdEAE",
        "MetricsDate": "2018-12-17",
        "PageName": "onesetup:baseHomePage",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 2,
        "TotalCount": 3,
        "SumEPT": 3878,
        "EptBinUnder3": 2,
        "EptBin3To5": 0,
        "EptBin5To8": 0,
        "EptBin8To10": 0,
        "EptBinOver10": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3AmeEAE"
        },
        "Id": "3mK3h00000y3AmeEAE",
        "MetricsDate": "2018-12-17",
        "PageName": "onesetup:setupAlohaPage",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 12,
        "TotalCount": 12,
        "SumEPT": 29506,
        "EptBinUnder3": 9,
        "EptBin3To5": 2,
        "EptBin5To8": 1,
        "EptBin8To10": 0,
        "EptBinOver10": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3AmgEAE"
        },
        "Id": "3mK3h00000y3AmgEAE",
        "MetricsDate": "2018-12-18",
        "PageName": "onesetup:baseHomePage",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 0,
        "TotalCount": 1,
        "SumEPT": 0,
        "EptBinUnder3": 0,
        "EptBin3To5": 0,
        "EptBin5To8": 0,
        "EptBin8To10": 0,
        "EptBinOver10": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3AmfEAE"
        },
        "Id": "3mK3h00000y3AmfEAE",
        "MetricsDate": "2018-12-18",
        "PageName": "unknown unknown",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 0,
        "TotalCount": 1,
        "SumEPT": 0,
        "EptBinUnder3": 0,
        "EptBin3To5": 0,
        "EptBin5To8": 0,
        "EptBin8To10": 0,
        "EptBinOver10": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3AmhEAE"
        },
        "Id": "3mK3h00000y3AmhEAE",
        "MetricsDate": "2018-12-20",
        "PageName": "onesetup:baseHomePage",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 1,
        "TotalCount": 2,
        "SumEPT": 838,
        "EptBinUnder3": 1,
        "EptBin3To5": 0,
        "EptBin5To8": 0,
        "EptBin8To10": 0,
        "EptBinOver10": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3AmiEAE"
        },
        "Id": "3mK3h00000y3AmiEAE",
        "MetricsDate": "2018-12-30",
        "PageName": "onesetup:baseHomePage",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 0,
        "TotalCount": 1,
        "SumEPT": 0,
        "EptBinUnder3": 0,
        "EptBin3To5": 0,
        "EptBin5To8": 0,
        "EptBin8To10": 0,
        "EptBinOver10": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3AmjEAE"
        },
        "Id": "3mK3h00000y3AmjEAE",
        "MetricsDate": "2018-12-30",
        "PageName": "onesetup:setupAlohaPage",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 1,
        "TotalCount": 1,
        "SumEPT": 3978,
        "EptBinUnder3": 0,
        "EptBin3To5": 1,
        "EptBin5To8": 0,
        "EptBin8To10": 0,
        "EptBinOver10": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3AmkEAE"
        },
        "Id": "3mK3h00000y3AmkEAE",
        "MetricsDate": "2019-02-09",
        "PageName": "onesetup:baseHomePage",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 2,
        "TotalCount": 2,
        "SumEPT": 5623,
        "EptBinUnder3": 1,
        "EptBin3To5": 0,
        "EptBin5To8": 1,
        "EptBin8To10": 0,
        "EptBinOver10": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3AmlEAE"
        },
        "Id": "3mK3h00000y3AmlEAE",
        "MetricsDate": "2019-02-09",
        "PageName": "onesetup:setupAlohaPage",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 7,
        "TotalCount": 7,
        "SumEPT": 14398,
        "EptBinUnder3": 6,
        "EptBin3To5": 0,
        "EptBin5To8": 1,
        "EptBin8To10": 0,
        "EptBinOver10": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByBrowserMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByBrowserMetrics/3mK3h00000y3Am9EAE"
        },
        "Id": "3mK3h00000y3Am9EAE",
        "MetricsDate": "2019-04-05",
        "PageName": "Visualforce Page",
        "Browser": "CHROME",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 1,
        "TotalCount": 1,
        "SumEPT": 737,
        "EptBinUnder3": 1,
        "EptBin3To5": 0,
        "EptBin5To8": 0,
        "EptBin8To10": 0,
        "EptBinOver10": 0
    }
]
```

<a name="EPTdist"></a>
## EPT, Browser distribution details, for the last 3 months.
- Query
```sql

SELECT CALENDAR_MONTH(MetricsDate) MetricsDate, 
      PageName,
      Browser , 
      SUM(EptBinUnder3) EptBinUnder3Count,
      SUM(EptBin3To5) EptBin3To5Count,
      SUM(EptBin5To8) EptBin5To8Count ,
      SUM(EptBin8To10) EptBin8To10Count ,
      SUM(EptBinOver10) EptBinOver10Count

 FROM LightningUsageByBrowserMetrics
 
  WHERE MetricsDate = Last_N_Months:3 AND (NOT Browser like 'OTHER%') 
         GROUP BY 
             CALENDAR_MONTH(MetricsDate),
             Browser,
             PageName
```

- Results
```
$ sfdx mohanc:data:query -q ../soql/ept.soql -u mohan.chinnappan.n_ea2@gmail.com -f json
```
```json
[
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 7,
        "PageName": "Home",
        "Browser": "CHROME",
        "EptBinUnder3Count": 4,
        "EptBin3To5Count": 2,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 7,
        "PageName": "Analytics",
        "Browser": "CHROME",
        "EptBinUnder3Count": 1,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 7,
        "PageName": "Account Record",
        "Browser": "CHROME",
        "EptBinUnder3Count": 12,
        "EptBin3To5Count": 60,
        "EptBin5To8Count": 8,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 7,
        "PageName": "Lightning Page",
        "Browser": "CHROME",
        "EptBinUnder3Count": 3,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 7,
        "PageName": "Lead Record List",
        "Browser": "CHROME",
        "EptBinUnder3Count": 1,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 7,
        "PageName": "Task Record List",
        "Browser": "CHROME",
        "EptBinUnder3Count": 3,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 7,
        "PageName": "Visualforce Page",
        "Browser": "CHROME",
        "EptBinUnder3Count": 2,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 7,
        "PageName": "MyFilter__c Record",
        "Browser": "CHROME",
        "EptBinUnder3Count": 1,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 7,
        "PageName": "Opportunity Record",
        "Browser": "CHROME",
        "EptBinUnder3Count": 4,
        "EptBin3To5Count": 3,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 7,
        "PageName": "Account Record List",
        "Browser": "CHROME",
        "EptBinUnder3Count": 7,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 7,
        "PageName": "ContentDocument Files",
        "Browser": "CHROME",
        "EptBinUnder3Count": 0,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 7,
        "PageName": "e.force:navigateToURL",
        "Browser": "CHROME",
        "EptBinUnder3Count": 0,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 7,
        "PageName": "onesetup:baseHomePage",
        "Browser": "CHROME",
        "EptBinUnder3Count": 21,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 7,
        "PageName": "e.setup:navigateToSetup",
        "Browser": "CHROME",
        "EptBinUnder3Count": 0,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 7,
        "PageName": "MyFilter__c Record List",
        "Browser": "CHROME",
        "EptBinUnder3Count": 0,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 7,
        "PageName": "one:recordActionWrapper",
        "Browser": "CHROME",
        "EptBinUnder3Count": 0,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 7,
        "PageName": "onesetup:setupAlohaPage",
        "Browser": "CHROME",
        "EptBinUnder3Count": 44,
        "EptBin3To5Count": 3,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 7,
        "PageName": "Opportunity Record List",
        "Browser": "CHROME",
        "EptBinUnder3Count": 3,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 7,
        "PageName": "objectManager:objectList",
        "Browser": "CHROME",
        "EptBinUnder3Count": 2,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 7,
        "PageName": "process_home:flowListView",
        "Browser": "CHROME",
        "EptBinUnder3Count": 3,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 7,
        "PageName": "objectManager:setupAlohaPage",
        "Browser": "CHROME",
        "EptBinUnder3Count": 1,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 7,
        "PageName": "objectManager:objectDetailPage",
        "Browser": "CHROME",
        "EptBinUnder3Count": 9,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 7,
        "PageName": "Account objectManager:lookupRedirect",
        "Browser": "CHROME",
        "EptBinUnder3Count": 0,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 7,
        "PageName": "setup_platform_perms:permissionSetGroupsSetupPage",
        "Browser": "CHROME",
        "EptBinUnder3Count": 1,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 8,
        "PageName": "Home",
        "Browser": "CHROME",
        "EptBinUnder3Count": 4,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 8,
        "PageName": "Asset Record",
        "Browser": "CHROME",
        "EptBinUnder3Count": 1,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 8,
        "PageName": "Account Record",
        "Browser": "CHROME",
        "EptBinUnder3Count": 4,
        "EptBin3To5Count": 5,
        "EptBin5To8Count": 1,
        "EptBin8To10Count": 1,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 8,
        "PageName": "Case Record List",
        "Browser": "CHROME",
        "EptBinUnder3Count": 2,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 8,
        "PageName": "Asset Record List",
        "Browser": "CHROME",
        "EptBinUnder3Count": 1,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 8,
        "PageName": "Account Record List",
        "Browser": "CHROME",
        "EptBinUnder3Count": 7,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 8,
        "PageName": "onesetup:baseHomePage",
        "Browser": "CHROME",
        "EptBinUnder3Count": 22,
        "EptBin3To5Count": 1,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 8,
        "PageName": "e.setup:navigateToSetup",
        "Browser": "CHROME",
        "EptBinUnder3Count": 0,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 8,
        "PageName": "one:recordActionWrapper",
        "Browser": "CHROME",
        "EptBinUnder3Count": 1,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 8,
        "PageName": "onesetup:setupAlohaPage",
        "Browser": "CHROME",
        "EptBinUnder3Count": 34,
        "EptBin3To5Count": 1,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 8,
        "PageName": "objectManager:objectDetailPage",
        "Browser": "CHROME",
        "EptBinUnder3Count": 3,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 8,
        "PageName": "Account objectManager:lookupRedirect",
        "Browser": "CHROME",
        "EptBinUnder3Count": 0,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 8,
        "PageName": "runtime_sales_emailtemplateui:templateSetup",
        "Browser": "CHROME",
        "EptBinUnder3Count": 2,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 9,
        "PageName": "Home",
        "Browser": "CHROME",
        "EptBinUnder3Count": 9,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 9,
        "PageName": "Chatter",
        "Browser": "CHROME",
        "EptBinUnder3Count": 8,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 9,
        "PageName": "undefined",
        "Browser": "CHROME",
        "EptBinUnder3Count": 0,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 9,
        "PageName": "Case Record",
        "Browser": "CHROME",
        "EptBinUnder3Count": 2,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 9,
        "PageName": "Account Record",
        "Browser": "CHROME",
        "EptBinUnder3Count": 0,
        "EptBin3To5Count": 3,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 9,
        "PageName": "unknown unknown",
        "Browser": "CHROME",
        "EptBinUnder3Count": 2,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 9,
        "PageName": "Case Record List",
        "Browser": "CHROME",
        "EptBinUnder3Count": 9,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 9,
        "PageName": "Opportunity Record",
        "Browser": "CHROME",
        "EptBinUnder3Count": 0,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 2,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 9,
        "PageName": "Account Record List",
        "Browser": "CHROME",
        "EptBinUnder3Count": 0,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 9,
        "PageName": "setupnav:appManager",
        "Browser": "CHROME",
        "EptBinUnder3Count": 18,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 9,
        "PageName": "ContentDocument Files",
        "Browser": "CHROME",
        "EptBinUnder3Count": 0,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 9,
        "PageName": "onesetup:baseHomePage",
        "Browser": "CHROME",
        "EptBinUnder3Count": 25,
        "EptBin3To5Count": 3,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 9,
        "PageName": "e.setup:navigateToSetup",
        "Browser": "CHROME",
        "EptBinUnder3Count": 0,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 9,
        "PageName": "onesetup:setupAlohaPage",
        "Browser": "CHROME",
        "EptBinUnder3Count": 86,
        "EptBin3To5Count": 2,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 9,
        "PageName": "Opportunity Record List",
        "Browser": "CHROME",
        "EptBinUnder3Count": 1,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 9,
        "PageName": "ContentDocument Record Landing Page",
        "Browser": "CHROME",
        "EptBinUnder3Count": 1,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 9,
        "PageName": "setup_platform_optimizer:optimizerSetupPageLEX",
        "Browser": "CHROME",
        "EptBinUnder3Count": 1,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 9,
        "PageName": "setup_platform_notifications:customNotifications",
        "Browser": "CHROME",
        "EptBinUnder3Count": 1,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 9,
        "PageName": "OrgMetric runtime_platform_optimizer:orgMetricObjectHome",
        "Browser": "CHROME",
        "EptBinUnder3Count": 1,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    },
    {
        "attributes": {
            "type": "AggregateResult"
        },
        "MetricsDate": 9,
        "PageName": "OrgMetric runtime_platform_optimizer:orgMetricRecordHome",
        "Browser": "CHROME",
        "EptBinUnder3Count": 1,
        "EptBin3To5Count": 0,
        "EptBin5To8Count": 0,
        "EptBin8To10Count": 0,
        "EptBinOver10Count": 0
    }
]

```
<a name="flexipage"></a>
## Lightning Usage by FlexiPage
### Parameter	Description
- FlexiPageNameOrId: Namespace and file name, or Page ID of FlexiPage files.
- FlexiPageType: The FlexiPage type. For example, record details are displayed using RecordPage" type.
- MetricsDate: The date the metric was recorded.
- RecordCountEPT: Number of records for a FlexiPage type, where the valid EPT was recorded.
- SumEPT: Sum of the EPT values for a record
- TotalCount: Total records for a type.

```
$ bash ../sh/getObjectRecs.sh LightningUsageByFlexiPageMetrics json
```
```json
[
    {
        "attributes": {
            "type": "LightningUsageByFlexiPageMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByFlexiPageMetrics/7pV3h00000fv6QIEAY"
        },
        "Id": "7pV3h00000fv6QIEAY",
        "MetricsDate": "2018-12-10",
        "FlexiPageType": "HomePage",
        "FlexiPageNameOrId": "home__desktopDefault",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 0,
        "TotalCount": 1,
        "SumEPT": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByFlexiPageMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByFlexiPageMetrics/7pV3h00000fv6QJEAY"
        },
        "Id": "7pV3h00000fv6QJEAY",
        "MetricsDate": "2018-12-14",
        "FlexiPageType": "HomePage",
        "FlexiPageNameOrId": "home__desktopDefault",
        "SystemModstamp": "2020-07-13T19:30:57.000+0000",
        "RecordCountEPT": 0,
        "TotalCount": 1,
        "SumEPT": 0
    },
    {
        "attributes": {
            "type": "LightningUsageByFlexiPageMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByFlexiPageMetrics/7pV3h00000fwhVaEAI"
        },
        "Id": "7pV3h00000fwhVaEAI",
        "MetricsDate": "2020-07-13",
        "FlexiPageType": "RecordPage",
        "FlexiPageNameOrId": "0M03h000003ehOMCAY",
        "SystemModstamp": "2020-07-14T13:15:01.000+0000",
        "RecordCountEPT": 4,
        "TotalCount": 4,
        "SumEPT": 15709
    },
    {
        "attributes": {
            "type": "LightningUsageByFlexiPageMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByFlexiPageMetrics/7pV3h00000fwhVbEAI"
        },
        "Id": "7pV3h00000fwhVbEAI",
        "MetricsDate": "2020-07-13",
        "FlexiPageType": "RecordPage",
        "FlexiPageNameOrId": "0M03h000003ek3eCAA",
        "SystemModstamp": "2020-07-14T13:15:01.000+0000",
        "RecordCountEPT": 2,
        "TotalCount": 2,
        "SumEPT": 9645
    },
    {
        "attributes": {
            "type": "LightningUsageByFlexiPageMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByFlexiPageMetrics/7pV3h00000fwhVeEAI"
        },
        "Id": "7pV3h00000fwhVeEAI",
        "MetricsDate": "2020-07-13",
        "FlexiPageType": "RecordPage",
        "FlexiPageNameOrId": "flexipage__default_rec_L",
        "SystemModstamp": "2020-07-14T13:15:01.000+0000",
        "RecordCountEPT": 1,
        "TotalCount": 1,
        "SumEPT": 1221
    },
    {
        "attributes": {
            "type": "LightningUsageByFlexiPageMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByFlexiPageMetrics/7pV3h00000fwhVcEAI"
        },
        "Id": "7pV3h00000fwhVcEAI",
        "MetricsDate": "2020-07-13",
        "FlexiPageType": "RecordPage",
        "FlexiPageNameOrId": "sfa__Account_rec_L",
        "SystemModstamp": "2020-07-14T13:15:01.000+0000",
        "RecordCountEPT": 2,
        "TotalCount": 2,
        "SumEPT": 3731
    },
    {
        "attributes": {
            "type": "LightningUsageByFlexiPageMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByFlexiPageMetrics/7pV3h00000fwhVdEAI"
        },
        "Id": "7pV3h00000fwhVdEAI",
        "MetricsDate": "2020-07-13",
        "FlexiPageType": "RecordPage",
        "FlexiPageNameOrId": "sfa__Opportunity_rec_L",
        "SystemModstamp": "2020-07-14T13:15:01.000+0000",
        "RecordCountEPT": 3,
        "TotalCount": 3,
        "SumEPT": 3976
    },
    {
        "attributes": {
            "type": "LightningUsageByFlexiPageMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByFlexiPageMetrics/7pV3h00000h14TcEAI"
        },
        "Id": "7pV3h00000h14TcEAI",
        "MetricsDate": "2020-07-14",
        "FlexiPageType": "HomePage",
        "FlexiPageNameOrId": "home__desktopDefault",
        "SystemModstamp": "2020-07-15T13:11:32.000+0000",
        "RecordCountEPT": 1,
        "TotalCount": 1,
        "SumEPT": 1247
    },
    {
        "attributes": {
            "type": "LightningUsageByFlexiPageMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByFlexiPageMetrics/7pV3h00000h14TdEAI"
        },
        "Id": "7pV3h00000h14TdEAI",
        "MetricsDate": "2020-07-14",
        "FlexiPageType": "RecordPage",
        "FlexiPageNameOrId": "0M03h000003ek3eCAA",
        "SystemModstamp": "2020-07-15T13:11:32.000+0000",
        "RecordCountEPT": 23,
        "TotalCount": 23,
        "SumEPT": 86055
    },
    {
        "attributes": {
            "type": "LightningUsageByFlexiPageMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByFlexiPageMetrics/7pV3h00000h1XJ9EAM"
        },
        "Id": "7pV3h00000h1XJ9EAM",
        "MetricsDate": "2020-07-15",
        "FlexiPageType": "HomePage",
        "FlexiPageNameOrId": "home__desktopDefault",
        "SystemModstamp": "2020-07-16T13:14:02.000+0000",
        "RecordCountEPT": 1,
        "TotalCount": 1,
        "SumEPT": 2001
    },
    {
        "attributes": {
            "type": "LightningUsageByFlexiPageMetrics",
            "url": "/services/data/v49.0/sobjects/LightningUsageByFlexiPageMetrics/7pV3h00000h1XJAEA2"
        },
        "Id": "7pV3h00000h1XJAEA2",
        "MetricsDate": "2020-07-15",
        "FlexiPageType": "RecordPage",
        "FlexiPageNameOrId": "0M03h000003ek3eCAA",
        "SystemModstamp": "2020-07-16T13:14:02.000+0000",
        "RecordCountEPT": 19,
        "TotalCount": 23,
        "SumEPT": 69959
    }

]

```
