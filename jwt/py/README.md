# JWT using Python

## Libs needed
```
$ pip freeze | grep 'cryptography\|requests\|PyJWT' > requirements.txt
$ cat requirements.txt 
cryptography==2.9
PyJWT==1.7.1
requests==2.23.0
requests-oauthlib==1.0.0
requests-toolbelt==0.8.0

```
### Install required libs
```
$ pip install -r requirements.txt
```

## JWT ini file to keep keyfile, issuer, subject info
- store in your home folder for security

```
$ cat /Users/mchinnappan/.jwt/jwt.ini
```

```ini
[JWT]
isSandbox=False
keyfile=server.key
issuer=3MVG9Kip4IKAJUNKDQcUI7albyrfHKO6yYqMW09rBf5JiiqNOx3jgIZdPvBWargyvDKjnXlwrZ4uhR6wmL
subject=mohan.chinnappan.n_ea2@gmail.com

```
## Python code  
- [Latest](jwtflow.py)
```py

from datetime import datetime
import jwt
import time
import requests

ini_file = '/Users/mchinnappan/.jwt/jwt.ini';
# Read jwt.ini file
import configparser
config = configparser.ConfigParser()
config.read(ini_file)

isSandbox = config['JWT']['isSandbox']
## Consumer Key from the Connected App
issuer = config['JWT']['issuer']
## server.key containing the private-key
keyfile = config['JWT']['keyfile']
## your email-id
subject = config['JWT']['subject']


domain = 'test' if isSandbox=='True' else 'login'

print('Loading private key...')
with open(keyfile) as fd:
    privateKey = fd.read()

print('Generating signed JWT assertion...')
### Spec:https://tools.ietf.org/html/rfc7519
## refer: https://pypi.org/project/PyJWT/0.1.7/
### https://github.com/jpadilla/pyjwt
claim = {
    'iss': issuer,
    'exp': int(time.time()) + 300,
    'aud': 'https://{}.salesforce.com'.format(domain),
    'sub': subject,
}
print (claim)
assertion = jwt.encode(claim, privateKey, algorithm='RS256', headers={'alg':'RS256'}).decode('utf8')

print('Making OAuth request...')
r = requests.post('https://{}.salesforce.com/services/oauth2/token'.format(domain), data = {
    'grant_type': 'urn:ietf:params:oauth:grant-type:jwt-bearer',
    'assertion': assertion,
})

print('Status:', r.status_code)
print(r.json())

```

