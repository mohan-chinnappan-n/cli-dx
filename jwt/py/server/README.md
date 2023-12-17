
## Python server to provide access_token for the given user using jwt
- uses private key and consumer_key 

- author: mohan chinnappan
-------------------------------------------------------------------

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