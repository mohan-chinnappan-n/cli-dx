# Using [openAI](https://openai.com/) GPT-3  based Sentence Completion in SFDX CLI



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


<a name='install'></a>
- Requires 0.0.163 version of the plugin
    - sfdx-mohanc-plugins@0.0.163
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
sfdx mohanc:ai:openai:completion -h

```

```

Using OpenAI given a prompt, tool will return one or more predicted completions, and can also return the probabilities of alternative tokens at each position.  

USAGE
  $ sfdx mohanc:ai:openai:completion

OPTIONS
  -k, --keyfilename=keyfilename                    Your OpenAI key file json, containing: OpenAI-Organization  and API 
                                                   Key

  -p, --prompt=prompt                              Your prompt, tool will complete your prompt

  -v, --targetdevhubusername=targetdevhubusername  username or alias for the dev hub org; overrides default dev hub org

  --apiversion=apiversion                          override the api version used for api requests made by this command

  --json                                           format output as json

  --loglevel=(trace|debug|info|warn|error|fatal)   logging level for this command invocation

EXAMPLE

     ** Using OpenAI given a prompt, tool will return one or more predicted completions, and can also return the 
  probabilities of alternative tokens at each position.   **

      sfdx mohanc:ai:openai:completion -k keyfile.json  -p 'prompt'

   

      Example:

           # Let us complete the given prompt (sentence)
           sfdx mohanc:ai:openai:completion -k myKeyfile.json -p "Once upon a time"
```

<a name='examples'></a>

## Examples

```
sfdx mohanc:ai:openai:completion -k ~/.openai/keys.json -p "This is the time for all good men"
```

```
{
  id: 'cmpl-4FmNYOqHk9fYMUTPITQJbqsdSNW4c',
  object: 'text_completion',
  created: 1639666236,
  model: 'davinci:2020-05-03',
  choices: [
    {
      text: 'This is the time for all good men to come to the aid',
      index: 0,
      logprobs: null,
      finish_reason: 'length'
    }
  ]
}
```