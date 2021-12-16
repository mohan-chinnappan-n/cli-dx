# Using [openAI](https://openai.com/) GPT-3  based Classification in SFDX CLI



## Topics

- [Signup for OpenAI](#signup)

- [Plugin install](#install)
- [OpenAI Key file](#keyfile)
- [Usage](#usage)
- [Examples](#examples)

<a name='signup'></a>

## OpenAI

OpenAI’s API provides access to GPT-3, which performs a wide variety of natural language tasks, and Codex, which translates natural language to code.

- [OpenAI - Pricing](https://openai.com/api/pricing/)

- Make sure you have signed up for OpenAI and have 
    - API Key
    - Org Id
- This can be found at [Developer quickstart](https://beta.openai.com/docs/developer-quickstart)


<a name='install'></a>
- Requires 0.0.164 version of the plugin
    - sfdx-mohanc-plugins@0.0.164
    - [How to install the plugin](https://mohan-chinnappan-n.github.io/dx/plugins.html#/1)

 

<a name='keyfile'></a>

## OpenAI Keyfile

```bash
 cat ~/.openai/keys.json 
```

```json
{
  "apiKey":  "YOUR OpenAI API_KEY",
  "openAIOrg": "YOUR OpenAI Org"
}
```
<a name='usage'></a>

## Usage
```bash
sfdx mohanc:ai:openai:classification -h

```

```

Using OpenAI classify a given query and examples  

USAGE
  $ sfdx mohanc:ai:openai:classification

OPTIONS
  -e, --examplefilename=examplefilename            Your example json file

  -k, --keyfilename=keyfilename                    Your OpenAI key file json, containing: OpenAI-Organization  and API 
                                                   Key

  -q, --query=query                                Your query, example: It is a raining day :(

  -v, --targetdevhubusername=targetdevhubusername  username or alias for the dev hub org; overrides default dev hub org

  --apiversion=apiversion                          override the api version used for api requests made by this command

  --json                                           format output as json

  --loglevel=(trace|debug|info|warn|error|fatal)   logging level for this command invocation

EXAMPLE

     ** Using OpenAI classify a given query and examples   **

      sfdx mohanc:ai:openai:classification -k keyfile.json  -e examples.json -q 'query' 

   

      Example:

           # Let us classify based on the given query

           sfdx mohanc:ai:openai:completion -k myKeyfile.json -e examples.json -q "It is a raining day :("

           sample examples.json:

           {
               "examples": [
                   ["A happy moment", "Positive"],
                   ["I am sad.", "Negative"],
                   ["I am feeling awesome", "Positive"]
               ]
           }

    
```
<a name='examples'></a>

## Examples

### Positive 

```bash
sfdx mohanc:ai:openai:classification  -k ~/.openai/keys.json  -q "movie was awesome"

```

```
======Your Query: movie was awesome ======
```

```
{
  completion: 'cmpl-4FlwlHWfF1y99zMEGqEqIHD9ZknUy',
  label: 'Positive',
  model: 'curie:2020-05-03',
  object: 'classification',
  search_model: 'ada',
  selected_examples: [
    { document: 1, label: 'Negative', text: 'I am sad.' },
    { document: 0, label: 'Positive', text: 'A happy moment' },
    { document: 2, label: 'Positive', text: 'I am feeling awesome' }
  ]
}
```

### Negative

```bash
sfdx mohanc:ai:openai:classification  -k ~/.openai/keys.json  -q "customer was upset about the document did not cover the problem"

```

```
======Your Query: customer was upset about the document did not cover the problem ======
```

```
{
  completion: 'cmpl-4FmEDtn434aDvtfwMw7hOmGGky3lO',
  label: 'Negative',
  model: 'curie:2020-05-03',
  object: 'classification',
  search_model: 'ada',
  selected_examples: [
    { document: 1, label: 'Negative', text: 'I am sad.' },
    { document: 0, label: 'Positive', text: 'A happy moment' },
    { document: 2, label: 'Positive', text: 'I am feeling awesome' }
  ]
}
```

