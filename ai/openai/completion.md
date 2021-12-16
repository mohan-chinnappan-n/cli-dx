# Using [openAI](https://openai.com/) GPT-3  based Sentence Completion in SFDX CLI



## Topics

- [Signup for OpenAI](#signup)

- [Plugin install](#install)
- [OpenAI Key file](#keyfile)
- [Usage](#usage)
- [Examples](#examples)
    - [Sentence Completion](#completion)
    - [Summary of a paragraph](#tldr)

<a name='signup'></a>

## OpenAI

OpenAI’s API provides access to GPT-3, which performs a wide variety of natural language tasks, and Codex, which translates natural language to code.

- [OpenAI - Pricing](https://openai.com/api/pricing/)

- Make sure you have signed up for OpenAI and have 
    - API Key
    - Org Id
- This can be found at [Developer quickstart](https://beta.openai.com/docs/developer-quickstart)


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

U   ** Using OpenAI given a prompt, tool will return one or more predicted completions. Also summary of the prompt if summary flag is true **
 

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

<a name='completion'></a>

### Sentence Completion

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


<a name='tldr'></a>

### Summary 

```

sfdx mohanc:ai:openai:completion -k ~/.openai/keys.json -p "Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass one-thousandth that of the Sun, but two-and-a-half times that of all the other planets in the Solar System combined. Jupiter is one of the brightest objects visible to the naked eye in the night sky, and has been known to ancient civilizations since before recorded history. It is named after the Roman god Jupiter.[19] When viewed from Earth, Jupiter can be bright enough for its reflected light to cast visible shadows,[20] and is on average the third-brightest natural object in the night sky after the Moon and Venus.\n\nJupiter is primarily composed of hydrogen with a quarter of its mass being helium, though helium comprises only about a tenth of the number of molecules. It may also have a rocky core of heavier elements,[21] but like the other giant planets, Jupiter lacks a well-defined solid surface. Because of its rapid rotation, the planet's shape is that of an oblate spheroid (it has a slight but noticeable bulge around the equator)" -s true

```

```
{
  id: 'cmpl-4FmjrxWlen6Jg4xtaLMwYHySWcCVX',
  object: 'text_completion',
  created: 1639667619,
  model: 'davinci:2020-05-03',
  choices: [
    {
      text: "Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass one-thousandth that of the Sun, but two-and-a-half times that of all the other planets in the Solar System combined. Jupiter is one of the brightest objects visible to the naked eye in the night sky, and has been known to ancient civilizations since before recorded history. It is named after the Roman god Jupiter.[19] When viewed from Earth, Jupiter can be bright enough for its reflected light to cast visible shadows,[20] and is on average the third-brightest natural object in the night sky after the Moon and Venus.\\n\\nJupiter is primarily composed of hydrogen with a quarter of its mass being helium, though helium comprises only about a tenth of the number of molecules. It may also have a rocky core of heavier elements,[21] but like the other giant planets, Jupiter lacks a well-defined solid surface. Because of its rapid rotation, the planet's shape is that of an oblate spheroid (it has a slight but noticeable bulge around the equator)\n" +
        '\n' +
        'tl;dr: Jupiter is big\n' +
        '\n',
      index: 0,
      logprobs: null,
      finish_reason: 'length'
    }
  ]
}
```



```
