# Using [openAI](https://openai.com/) GPT-3  based Sentence Completion, Summary, Idea Generation in SFDX CLI



## Topics

- [Signup for OpenAI](#signup)

- [Plugin install](#install)
- [OpenAI Key file](#keyfile)
- [Usage](#usage)
- [Examples](#examples)
    - [Sentence Completion](#completion)
    - [Summary of a paragraph](#tldr)
    - [Idea Generation](#ideagen)
    - [Python code bug fix](#pyfix)

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

 Using OpenAI given a prompt, tool will return one or more predicted completions. Also summary of the prompt if op flag is set to 's'. Also generates Ideas if op flag is to 'i'. Provides the fix for the given python code if op flag is set to 'py_bug_fix

USAGE
  $ sfdx mohanc:ai:openai:completion

OPTIONS
  -i, --inputfilename=inputfilename                Input file name where we have stored to code

  -k, --keyfilename=keyfilename                    Your OpenAI key file json, containing: OpenAI-Organization  and API 
                                                   Key

  -m, --maxtoken=maxtoken                          Max Token parameter to the engine

  -o, --op=op                                      op flag ( s for summary, i for ideas, py_bug_fix for fixing the given 
                                                   python code)

  -p, --prompt=prompt                              Your prompt, tool will complete your prompt

  -v, --targetdevhubusername=targetdevhubusername  username or alias for the dev hub org; overrides default dev hub org

  --apiversion=apiversion                          override the api version used for api requests made by this command

  --json                                           format output as json

  --loglevel=(trace|debug|info|warn|error|fatal)   logging level for this command invocation

EXAMPLE

     ** Using OpenAI given a prompt, tool will return one or more predicted completions. Also summary of the prompt if 
  op flag is set to 's'. Also generates Ideas if op flag is to 'i'. Provides the fix for the given python code if op 
  flag is set to 'py_bug_fix **

      sfdx mohanc:ai:openai:completion -k keyfile.json  -p 'prompt' -o 's or i or py_bug_fix' -m 'max tokens 
  (default:8)'


      Example:

           # Let us complete the given prompt (sentence)
           sfdx mohanc:ai:openai:completion -k myKeyfile.json -p "Once upon a time"
        
           # Let us get Summary the given prompt (sentence)
           sfdx mohanc:ai:openai:completion -k myKeyfile.json -p "Once upon a time...." -o s 

           # Let us get Ideas the given prompt (sentence)
           sfdx mohanc:ai:openai:completion -k myKeyfile.json -p "Once upon a time...." -o i 

           # Let us correct given buggy pythong code file in -i option with 200 max tokens
           sfdx mohanc:ai:openai:completion  -k ~/.openai/keys.json  -o py_bug_fix -i ~/.openai/buggy.py -m 200

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


- About Albert Einstein  
```
sfdx mohanc:ai:openai:completion -k ~/.openai/keys.json -p "Albert Einstein was a German-born theoretical physicist, widely acknowledged to be one of the greatest physicists of all time. Einstein is best known for developing the theory of relativity, but he also made important contributions to the development of the theory of quantum mechanics" -s true

```

```
{
  id: 'cmpl-4Fn2xEypwcfLayuteP85aUAcE0eYo',
  object: 'text_completion',
  created: 1639668803,
  model: 'davinci:2020-05-03',
  choices: [
    {
      text: 'Albert Einstein was a German-born theoretical physicist, widely acknowledged to be one of the greatest physicists of all time. Einstein is best known for developing the theory of relativity, but he also made important contributions to the development of the theory of quantum mechanics\n' +
        '\n' +
        'tl;dr: He contributed to pretty much',
      index: 0,
      logprobs: null,
      finish_reason: 'length'
    }
  ]
}

```

- About Jupiter 

```

sfdx mohanc:ai:openai:completion -k ~/.openai/keys.json -p "Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass one-thousandth that of the Sun, but two-and-a-half times that of all the other planets in the Solar System combined. Jupiter is one of the brightest objects visible to the naked eye in the night sky, and has been known to ancient civilizations since before recorded history. It is named after the Roman god Jupiter.[19] When viewed from Earth, Jupiter can be bright enough for its reflected light to cast visible shadows,[20] and is on average the third-brightest natural object in the night sky after the Moon and Venus.\n\nJupiter is primarily composed of hydrogen with a quarter of its mass being helium, though helium comprises only about a tenth of the number of molecules. It may also have a rocky core of heavier elements,[21] but like the other giant planets, Jupiter lacks a well-defined solid surface. Because of its rapid rotation, the planet's shape is that of an oblate spheroid (it has a slight but noticeable bulge around the equator)" -o s

```

```
====== Summary option selected ======
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

<a name="ideagen"></a>
### Ideas generation

- Garage Sales
```
sfdx mohanc:ai:openai:completion -k ~/.openai/keys.json -p "Taglines for a social network that connects people either looking for or hosting garage sales:" -o i

```


````
====== Idea option selected ======
{
  id: 'cmpl-4FnZ2gqsCAMc9fyXg56Xf0z8Ce9tN',
  object: 'text_completion',
  created: 1639670792,
  model: 'davinci:2020-05-03',
  choices: [
    {
      text: 'Taglines for a social network that connects people either looking for or hosting garage sales:\n' +
        '\n' +
        '1. Startup. Live better',
      index: 0,
      logprobs: null,
      finish_reason: 'length'
    }
  ]
}
```

- Writing a book on cooking

```
sfdx mohanc:ai:openai:completion -k ~/.openai/keys.json -p "Taglines for a social network for writing a book on cooking" -o i
```

```

====== Idea option selected ======
{
  id: 'cmpl-4Fnbw7ickGxn4i4QYicsyN0iye9qc',
  object: 'text_completion',
  created: 1639670972,
  model: 'davinci:2020-05-03',
  choices: [
    {
      text: 'Taglines for a social network for writing a book on cooking\n' +
        '\n' +
        '1. Post your favourite recipes and',
      index: 0,
      logprobs: null,
      finish_reason: 'length'
    }
  ]
}
```

<a name='pyfix'></a>

``` bash
sfdx mohanc:ai:openai:completion  -k ~/.openai/keys.json  -o py_bug_fix -i ~/.openai/buggy.py -m 200
```
====== Python bug fixed option selected ======
{
  prompt: '##### Fix bugs in the below function\n' +
    '\n' +
    '### Buggy Python\n' +
    'import Random\n' +
    'a = random.randint(1,12)\n' +
    'b = random.randint(1,12)\n' +
    'for i in range(10):\n' +
    '    question = "What is "+a+" x "+b+"? "\n' +
    '    answer = input(question)\n' +
    '    if answer = a*b\n' +
    '        print (Well done!)\n' +
    '    else:\n' +
    '        print("No.")\n' +
    '\n' +
    '\n' +
    '        ### Fixed Python\n' +
    '        ',
  max_tokens: 200,
  echo: true,
  stop: [ '###' ]
}
{
  id: 'cmpl-4FoQMYSnRewjypfMgeNFfsi6fZCXc',
  object: 'text_completion',
  created: 1639674098,
  model: 'davinci-codex:2021-08-03',
  choices: [
    {
      text: '##### Fix bugs in the below function\n' +
        '\n' +
        '### Buggy Python\n' +
        'import Random\n' +
        'a = random.randint(1,12)\n' +
        'b = random.randint(1,12)\n' +
        'for i in range(10):\n' +
        '    question = "What is "+a+" x "+b+"? "\n' +
        '    answer = input(question)\n' +
        '    if answer = a*b\n' +
        '        print (Well done!)\n' +
        '    else:\n' +
        '        print("No.")\n' +
        '\n' +
        '\n' +
        '        ### Fixed Python\n' +
        '        import random\n' +
        'a = random.randint(1,9)\n' +
        'b = random.randint(1,9)\n' +
        'for i in range(10):\n' +
        '    question = "What is",str(a),"x",str(b) +"? "\n' +
        '    answer = input(question)\n' +
        '    if a*b == answer:\n' +
        `        print ("That's correct")\n` +
        '    else:\n' +
        '        print ("Make sure you use a * for multiplication")',
      index: 0,
      logprobs: null,
      finish_reason: 'stop'
    }
  ]
}
```




