# How to use Apex Step in EA (Tableau CRM)

## Topics
- [Using Apex Local REST Service](#local)
- [Using Apex Remote REST Service](#remote)
- [Demo showing how to build this dashboard](#dashboard)

<a name='local'></a>

## Use case
- We have a REST API (```/fruits```) takes in the given fruit name (item)  via HTTP POST, provides its qty (also uppercases the fruit name)
- In the dashboard when the user selects the item in the list box or the pillbox this apex REST service will be called to get the qty (it our case it is a random number between 0 to 100)

## Apex code for  FruitsManager.cls
```java
@RestResource(urlMapping='/fruits')

global with sharing class FuritsManager {

    @HttpPost
    global static String getFruits(String item) {
    
        // here you can make an REST API Call out to get the results for the given item
        // for this example we assume we got the result  as shown below in the result String 
        Integer qty = Integer.valueof(Math.random() * 100);
        String result = '[ {"name": "' + item.toUpperCase()  + '", "qty" : ' + qty + '}]'; // this can be external API callout result

        // let us parse the result string
        JSONParser parser = JSON.createParser(result);
       
        // we are going to get list of Fruits 
        List<Fruit> fruits = new List<Fruit>();
        
        while (parser.nextToken() != null) {
        if (parser.getCurrentToken() == JSONToken.START_ARRAY) {
            while (parser.nextToken() != null) {
               
                if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                    Fruit fruit = (Fruit)parser.readValueAs(Fruit.class);
                    fruits.add(fruit); // add it to the list
            
                    parser.skipChildren();
                }
            }
        }
    }

    // Apex Step in EA requires, metadata and data
    /* example

      {"metadata":{"strings":["name"],"numbers":["qty"],"groups":[]},
       "data\":[{"qty":54.0,"name":"MANGO"}]
      }"

    */

   
    return JSON.serialize(new PackagedReturnItem(fruits));
  }
  
     // Metadata Structure returns alongside Data
    public class ReturnMetadata {
        
        public List<String> strings; // Name of all the columns returned that is considered as text
        public List<String> numbers; // Name of all the columns returned that is considered as numeric
        public List<String> groups;  // Name of all the columns returned that is considered as groups
        
        public ReturnMetadata(List<String> strings, List<String> numbers, List<String> groups) {
            this.strings = strings;
            this.numbers = numbers;
            this.groups = groups;
        }
    }
    
    // Combined Structure of Data and Metadata
    public class PackagedReturnItem {
        
        public List<Fruit> data;
        public ReturnMetadata metadata;
        
        public PackagedReturnItem(List<Fruit> data) {
            this.data = data;
            this.metadata = new ReturnMetadata(new List<String>{'name'}, new List<String>{'qty'}, new List<String>());
        }   
    }  
    
    
 }
```
## Let us test the REST service

```
$ cat fruitData.json
{ "item" : "mango"}
```


```
$ sfdx mohanc:ws:rest -f ~/.ea/header.json -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/apexrest/fruits -m POST -d fruitData.json 
"{\"metadata\":{\"strings\":[\"name\"],\"numbers\":[\"qty\"],\"groups\":[]},\"data\":[{\"qty\":54.0,\"name\":\"MANGO\"}]}"


```

## Let us wire this service into dashboard

### Apex Step code
```json
   "GetFruitData": {
    "query": {
        "body": {
            "item": "{{cell(lens_1.selection, 0, \"fruit\").asString()}}"
        },
        "path": "fruits"
    },
    "type": "apex"
}
```

### Full Dashboard JSON

```json
{
    "label": "ApexStepTest2",
    "mobileDisabled": false,
    "state": {
        "dataSourceLinks": [],
        "filters": [],
        "gridLayouts": [
            {
                "name": "Default",
                "numColumns": 12,
                "pages": [
                    {
                        "label": "Fruits via Apex Step",
                        "name": "83a79639-d0e2-42a8-8c04-5431c81589ba",
                        "navigationHidden": false,
                        "widgets": [
                            {
                                "colspan": 6,
                                "column": 2,
                                "name": "pillbox_1",
                                "row": 1,
                                "rowspan": 1,
                                "widgetStyle": {
                                    "borderEdges": []
                                }
                            },
                            {
                                "colspan": 3,
                                "column": 2,
                                "name": "text_2",
                                "row": 2,
                                "rowspan": 1,
                                "widgetStyle": {
                                    "borderEdges": []
                                }
                            },
                            {
                                "colspan": 4,
                                "column": 8,
                                "name": "listselector_1",
                                "row": 0,
                                "rowspan": 7,
                                "widgetStyle": {
                                    "backgroundColor": "#FFFFFF",
                                    "borderColor": "#E6ECF2",
                                    "borderEdges": [
                                        "all"
                                    ],
                                    "borderRadius": 4,
                                    "borderWidth": 1
                                }
                            },
                            {
                                "colspan": 3,
                                "column": 2,
                                "name": "table_3",
                                "row": 3,
                                "rowspan": 4,
                                "widgetStyle": {
                                    "borderEdges": []
                                }
                            }
                        ]
                    }
                ],
                "rowHeight": "normal",
                "selectors": [],
                "style": {
                    "alignmentX": "left",
                    "alignmentY": "top",
                    "backgroundColor": "#F2F6FA",
                    "cellSpacingX": 8,
                    "cellSpacingY": 8,
                    "fit": "original",
                    "gutterColor": "#C5D3E0"
                },
                "version": 1
            }
        ],
        "layouts": [],
        "steps": {
            "GetFruitData": {
                "query": {
                    "body": {
                        "item": "{{cell(lens_1.selection, 0, \"fruit\").asString()}}"
                    },
                    "path": "fruits"
                },
                "type": "apex"
            },
           "lens_1": {
                "broadcastFacet": true,
                "groups": [],
                "numbers": [],
                "query": "q = load \"fruit_yield\";\nq = group q by fruit;\nq = foreach q generate fruit as 'fruit';\nq = limit q 2000;",
                "receiveFacetSource": {
                    "mode": "all",
                    "steps": []
                },
                "selectMode": "single",
                "strings": [],
                "type": "saql",
                "useGlobal": true,
                "visualizationParameters": {
                    "parameters": {
                        "autoFitMode": "keepLabels",
                        "showValues": true,
                        "bins": {
                            "breakpoints": {
                                "high": 100,
                                "low": 0
                            },
                            "bands": {
                                "high": {
                                    "color": "#008000",
                                    "label": ""
                                },
                                "low": {
                                    "color": "#B22222",
                                    "label": ""
                                },
                                "medium": {
                                    "color": "#ffa500",
                                    "label": ""
                                }
                            }
                        },
                        "legend": {
                            "descOrder": false,
                            "showHeader": true,
                            "show": true,
                            "customSize": "auto",
                            "position": "right-top",
                            "inside": false
                        },
                        "axisMode": "multi",
                        "tooltip": {
                            "showBinLabel": true,
                            "measures": "",
                            "showNullValues": true,
                            "showPercentage": true,
                            "showDimensions": true,
                            "showMeasures": true,
                            "customizeTooltip": false,
                            "dimensions": ""
                        },
                        "visualizationType": "hbar",
                        "title": {
                            "fontSize": 14,
                            "subtitleFontSize": 11,
                            "label": "",
                            "align": "center",
                            "subtitleLabel": ""
                        },
                        "binValues": false,
                        "trellis": {
                            "flipLabels": false,
                            "showGridLines": true,
                            "size": [
                                100,
                                100
                            ],
                            "enable": false,
                            "type": "x",
                            "chartsPerLine": 4
                        },
                        "showActionMenu": true,
                        "measureAxis2": {
                            "sqrtScale": false,
                            "showTitle": true,
                            "showAxis": true,
                            "title": "",
                            "customDomain": {
                                "showDomain": false
                            }
                        },
                        "measureAxis1": {
                            "sqrtScale": false,
                            "showTitle": true,
                            "showAxis": true,
                            "title": "",
                            "customDomain": {
                                "showDomain": false
                            }
                        },
                        "theme": "wave",
                        "dimensionAxis": {
                            "showTitle": true,
                            "customSize": "auto",
                            "showAxis": true,
                            "title": "",
                            "icons": {
                                "useIcons": false,
                                "iconProps": {
                                    "fit": "cover",
                                    "column": "",
                                    "type": "round"
                                }
                            }
                        },
                        "applyConditionalFormatting": true
                    },
                    "type": "chart"
                }
            }
        },
        "widgetStyle": {
            "backgroundColor": "#FFFFFF",
            "borderColor": "#E6ECF2",
            "borderEdges": [],
            "borderRadius": 0,
            "borderWidth": 1
        },
        "widgets": {
            "table_3": {
                "parameters": {
                    "borderColor": "#e0e5ee",
                    "borderWidth": 1,
                    "cell": {
                        "backgroundColor": "#ffffff",
                        "fontColor": "#16325c",
                        "fontSize": 12
                    },
                    "columnProperties": {},
                    "columns": [],
                    "customBulkActions": [],
                    "exploreLink": false,
                    "header": {
                        "backgroundColor": "#f4f6f9",
                        "fontColor": "#16325c",
                        "fontSize": 12
                    },
                    "innerMajorBorderColor": "#a8b7c7",
                    "innerMinorBorderColor": "#e0e5ee",
                    "maxColumnWidth": 300,
                    "minColumnWidth": 40,
                    "mode": "variable",
                    "numberOfLines": 1,
                    "showActionMenu": true,
                    "step": "GetFruitData",
                    "verticalPadding": 8
                },
                "type": "table"
            },
            "pillbox_1": {
                "parameters": {
                    "compact": false,
                    "exploreLink": false,
                    "fontSize": 14,
                    "selectedTab": {
                        "backgroundColor": "#0070D2",
                        "borderColor": "#C6D3E1",
                        "borderEdges": [
                            "all"
                        ],
                        "borderWidth": 1,
                        "textColor": "#FFFFFF"
                    },
                    "showActionMenu": true,
                    "step": "lens_1",
                    "textColor": "#0070D2"
                },
                "type": "pillbox"
            },
            "text_2": {
                "parameters": {
                    "content": {
                        "displayTemplate": "{{cell(lens_1.selection, 0, \"fruit\").asString()}}"
                    },
                    "fontSize": 16,
                    "showActionMenu": true,
                    "textAlignment": "left",
                    "textColor": "#091A3E"
                },
                "type": "text"
            },
            "listselector_1": {
                "parameters": {
                    "compact": false,
                    "displayMode": "filter",
                    "exploreLink": false,
                    "filterStyle": {
                        "titleColor": "#54698D",
                        "valueColor": "#16325C"
                    },
                    "instant": true,
                    "showActionMenu": true,
                    "step": "lens_1",
                    "title": "Select your fruit"
                },
                "type": "listselector"
            }
        }
    },
    "datasets": [
        {
            "id": "0Fb3h0000008s9kCAA",
            "label": "fruit-yield",
            "name": "fruit_yield",
            "url": "/services/data/v51.0/wave/datasets/0Fb3h0000008s9kCAA"
        }
    ]
}
```
## Steps
![Steps-1](img/apex-step-1.png)
![Steps-2](img/apex-step-2.png)


## Demo of the dashboard
![demo-1](img/apexStep-1.gif)


# Another example

```
cat fruitData.json
{ "name": "apple" }
```

```
cat header.json

{
    "Content-Type": "application/json"
}
```
<a name='remote'></a>

## Testing REST API at heroku

### Use case
- We have a REST API (```/fruitsinv```) takes  given fruit name (name)  via HTTP POST, provides its qty (by calling a fruit inventory REST service: https://mohansun-rum.herokuapp.com/fruit )
- In the dashboard when the user selects the item in the list box or the pillbox this apex REST service will be called to get the qty 

```
$  sfdx mohanc:ws:rest -r https://mohansun-rum.herokuapp.com/fruit -m POST -d fruitData.json  -f header.json 
[
    {
        "name": "apple",
        "qty": 0
    }
]

```

## Remote Site Setting

![remote site setting](img/remote-site-settings-1.png)
## Apex class for the /fruitinv service



```java
@RestResource(urlMapping='/fruitinv')

global with sharing class FuritsInv {

    @HttpPost
    global static String getFruits(String name) {
    
        HttpRequest request = new HttpRequest();
        Http http = new Http();
        // make sure that your remote-site setting has this entry: https://mohansun-rum.herokuapp.com
        request.setEndpoint('https://mohansun-rum.herokuapp.com/fruit');
        request.setMethod('POST');
        String body = '{"name": "' + name + '"}';
        System.debug('body: ' + body);

        request.setBody(body);
        request.setHeader('Content-Type', 'application/json');
        
        try {
            HTTPResponse response = http.send(request);
            String resBody = response.getBody();
            System.debug('resBody: ' + resBody);
             
            JSONParser parser = JSON.createParser(resBody);
          
            List<Fruit> fruits = new List<Fruit>();
    
            while (parser.nextToken() != null) {
            if (parser.getCurrentToken() == JSONToken.START_ARRAY) {
                while (parser.nextToken() != null) {
                   
                    if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                        Fruit fruit = (Fruit)parser.readValueAs(Fruit.class);
                        fruits.add(fruit);
                
                        parser.skipChildren();
                    }
                }
              }
           }
           return JSON.serialize(new PackagedReturnItem(fruits));
         }
         catch(Exception exp) {
            System.debug('exception '+exp);
         }
         return '';
  
   
  }
  
     // Metadata Structure returns alongside Data
    public class ReturnMetadata {
        
        public List<String> strings; // Name of all the columns returned that is considered as text
        public List<String> numbers; // Name of all the columns returned that is considered as numeric
        public List<String> groups;  // Name of all the columns returned that is considered as groups
        
        public ReturnMetadata(List<String> strings, List<String> numbers, List<String> groups) {
            this.strings = strings;
            this.numbers = numbers;
            this.groups = groups;
        }
    }
    
    // Combined Structure of Data and Metadata
    public class PackagedReturnItem {
        
        public List<Fruit> data;
        public ReturnMetadata metadata;
        
        public PackagedReturnItem(List<Fruit> data) {
            this.data = data;
            this.metadata = new ReturnMetadata(new List<String>{'name'}, new List<String>{'qty'}, new List<String>());
        }   
    }  
    
    
 }
```

### Testing the Apex REST API

```
$ sfdx mohanc:ws:rest -f ~/.ea/header.json -r https://mohansun-ea-02-dev-ed.my.salesforce.com/services/apexrest/fruitinv -m POST -d fruitData.json 
"{\"metadata\":{\"strings\":[\"name\"],\"numbers\":[\"qty\"],\"groups\":[]},\"data\":[{\"qty\":97.0,\"name\":\"apple\"}]}"


```

### Step code

```json
 "GetFruitInv": {
    "query": {
        "body": {
            "name": "{{cell(lens_1.selection, 0, \"fruit\").asString()}}"
        },
        "path": "fruitinv"
    },
    "type": "apex"
 }

```
### Demo of the dashboard
![demo-2](img/apexStep-2.gif)

<a name='dashboard'></a>
## Demo:How to build this dashboard
![dashboard creation](img/apexStep-creation.gif)


## References
- [apex Step Type Properties](https://developer.salesforce.com/docs/atlas.en-us.bi_dev_guide_json.meta/bi_dev_guide_json/bi_dbjson_steps_types_apex.htm)
