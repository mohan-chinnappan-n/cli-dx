# Building Vega charts using DX

```
cat ~/.vega/bar.json
```

```json

{
    "$schema": "https://vega.github.io/schema/vega-lite/v5.json",
    "description": "A simple bar chart with embedded data.",
    "data": {
        "values": [
            {
                "a": "A",
                "b": 28
            },
            {
                "a": "B",
                "b": 55
            },
            {
                "a": "C",
                "b": 43
            },
            {
                "a": "D",
                "b": 91
            },
            {
                "a": "E",
                "b": 81
            },
            {
                "a": "F",
                "b": 53
            },
            {
                "a": "G",
                "b": 19
            },
            {
                "a": "H",
                "b": 87
            },
            {
                "a": "I",
                "b": 52
            }
        ]
    },
    "mark": "bar",
    "encoding": {
        "x": {
            "field": "a",
            "type": "ordinal"
        },
        "y": {
            "field": "b",
            "type": "quantitative"
        }
    }
}
```

## Run
```
sfdx mohanc:data:viz:vega -i ~/.vega/bar.json
```
```
Writing visualization in file /Users/mchinnappan/.vega/bar.json.html ...
Visualization done. "open  /Users/mchinnappan/.vega/bar.json.html" in Chrome Browser to view the Visualization

```

## Chart

- ![viz][img/visualization.svg)


