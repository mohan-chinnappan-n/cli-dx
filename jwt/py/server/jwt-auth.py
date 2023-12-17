"""
## Python server to provide access_token for the given user using jwt
- uses private key and consumer_key 

- author: mohan chinnappan
-------------------------------------------------------------------
## Requirements
- pip install pyJWT
- pip install Flask


### Run:
CID=<consumer_key> PK=/tmp/certs/server.key PORT=3000 C_URL='http://localhost:3000/callback' python  jwt-auth.py

### Usage


Example result using web browser:
http://localhost:3000/get_token?username=mohan.chinnappan.n.sel2@gmail.com

```json
{
  "access_token": "xyz",
  "instance_url": "https://d8w000004lymuuac-dev-ed.develop.my.salesforce.com",
  "username": "mohan.chinnappan.n.sel2@gmail.com"
}
```

Example result using curl:

curl http://localhost:3000/get_token\?username\=mohan.chinnappan.n.sel2@gmail.com

```json
{
  "access_token": "xyz",
  "instance_url": "https://d8w000004lymuuac-dev-ed.develop.my.salesforce.com",
  "username": "mohan.chinnappan.n.sel2@gmail.com"
}

```

## Running on cloud (Heroku)
-------------------------------------------------------------------
If you are planning to run this server on a cloud service like Heroku

- At Salesforce org side: change the callback url to match with the cloud service url say : https://somename.herokuapp.com/callback

- At heroku side, put: CID, PK and C_URL as environment variables (config vars)
    - https://devcenter.heroku.com/articles/config-vars#managing-config-vars

-------------------------------------------------------------------


"""



from flask import Flask, request, jsonify
from jwt import encode as jwt_encode
import requests
from datetime import datetime, timedelta
import os

app = Flask(__name__)

# Read key items from env 
PRIVATE_KEY_FILE_PATH = os.environ.get('PK') 
CALLBACK_URL = os.environ.get('C_URL')
CLIENT_ID = os.environ.get('CID')
PORT=os.environ.get('PORT') or 3000 
EXP_TIME = os.environ.get('EXP_TIME') or 240

@app.route('/get_token', methods=['GET'])
def get_token():
    try:
        private_key = read_private_key(PRIVATE_KEY_FILE_PATH)
        username = request.args.get('username')  # Read username from request parameters
        results = generate_access_token(private_key, username)
        #frontdoor_url = f"{results['instance_url']}/secur/frontdoor.jsp?sid={results['access_token']}"
        return jsonify({'access_token': results['access_token'], 'username': username, 'instance_url': results['instance_url'] })

    except Exception as e:
        return jsonify({'error': str(e)}), 500

def read_private_key(file_path):
    try:
        with open(file_path, 'r') as file:
            private_key = file.read()
        return private_key
    except Exception as e:
        raise Exception(f'Failed to read private key from file: {str(e)}')

def generate_access_token(private_key, username):
    now = datetime.utcnow()
    exp_time = now + timedelta(seconds=EXP_TIME)  # Adjust expiration time as needed

    jwt_payload = {
        'iss': CLIENT_ID,
        'sub': username,
        'aud': 'https://login.salesforce.com',
        'exp': exp_time,
        'iat': now,
        'callback_url': CALLBACK_URL,
        'scope': 'refresh_token api'  # Include 'refresh_token' scope in the request
    }
    #print(jwt_payload)

    access_token = jwt_encode(jwt_payload, private_key, algorithm='RS256')
    #print (access_token)

    # Exchange JWT for access token using Salesforce OAuth token endpoint
    token_endpoint = 'https://login.salesforce.com/services/oauth2/token'
    payload = {
        'grant_type': 'urn:ietf:params:oauth:grant-type:jwt-bearer',
        'assertion': access_token
    }

    response = requests.post(token_endpoint, data=payload)

    if response.status_code == 200:
        print(response.json())
        return response.json()
    else:
        raise Exception(f'Failed to get access token. Response: {response.text}')

if __name__ == '__main__':
    app.run(debug=True, port=PORT)
