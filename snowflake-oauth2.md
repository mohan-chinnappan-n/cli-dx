# Setting up OAuth2 for snowflake and using it in snowsql and DX

## Topics
- [Setting up](#setup)
- [Using DX with OAuth](#dx)

## Setup
<a name='setup'></a>

```sql
USE role ACCOUNTADMIN;

CREATE SECURITY INTEGRATION tcrmwb_oauth_integration
    TYPE=OAUTH

    oauth_client=CUSTOM
    OAUTH_REDIRECT_URI='https://mohansun-myea.herokuapp.com/'
    OAUTH_CLIENT_TYPE='CONFIDENTIAL'
    oauth_issue_refresh_tokens=true
    oauth_refresh_token_validity=86400

    ENABLED=true
;
```

- view the integration details
```sql
use role ACCOUNTADMIN;
desc integration tcrmwb_oauth_integration;
```

- note: values are mangled in the below list!
```csv
property,property_type,property_value,property_default
ENABLED,Boolean,true,false
OAUTH_REDIRECT_URI,String,https://mohansun-myea.herokuapp.com/,
OAUTH_CLIENT_TYPE,String,CONFIDENTIAL,CONFIDENTIAL
OAUTH_ISSUE_REFRESH_TOKENS,Boolean,true,true
OAUTH_REFRESH_TOKEN_VALIDITY,Integer,86400,7776000
OAUTH_ENFORCE_PKCE,Boolean,false,false
OAUTH_CLIENT_ID,String,1KdLsssFjx1bjx0bMlzHWsf5FAR+0=,
OAUTH_AUTHORIZATION_ENDPOINT,String,https://mwa76434.us-east-1.snowflakecomputing.com/oauth/authorize,
OAUTH_TOKEN_ENDPOINT,String,https://mwa76434.us-east-1.snowflakecomputing.com/oauth/token-request,
PRE_AUTHORIZED_ROLES_LIST,List,,[]
BLOCKED_ROLES_LIST,List,"ACCOUNTADMIN,SECURITYADMIN",[]
OAUTH_ALLOW_NON_TLS_REDIRECT_URI,Boolean,false,false
OAUTH_CLIENT_RSA_PUBLIC_KEY_FP,String,,
OAUTH_CLIENT_RSA_PUBLIC_KEY_2_FP,String,,
NETWORK_POLICY,String,,
```

### client secret

```sql
use role ACCOUNTADMIN;
show INTEGRATIONS;
select system$show_oauth_client_secrets('TCRMWB_OAUTH_INTEGRATION');

```
- You will get the client secret here 

### Getting auth code
```
<OAUTH_AUTHORIZATION_ENDPOINT>?client_id=<encoded value of Client ID>&response_type=code&redirect_uri=<OAUTH_REDIRECT_URI>

https://mwa76434.us-east-1.snowflakecomputing.com/oauth/authorize?client_id=1KdLLFjx1bjx0bMlzHWsf5FAR%2B0%3D&redirect_uri=https%3A%2F%2Fmohansun-myea.herokuapp.com/&response_type=code

```
## Code
```
https://mohansun-myea.herokuapp.com/?code=119E674315AE3FE9EA55B4686695C99FE57DB8BB

```
### Exchange the code for the auth token

```

curl -X POST -H "Content-Type: application/x-www-form-urlencoded;charset=UTF-8" \
--user "<OAUTH_CLIENT_ID not encoded>:<OAUTH_CLIENT_SECRET>" \
--data-urlencode "grant_type=authorization_code" \
--data-urlencode "code=<AUTHORIZATION CODE>" \
--data-urlencode "redirect_uri=<OAUTH_REDIRECT_URI not encoded>" \
<OAUTH_TOKEN_ENDPOINT>

```

```

$ curl -X POST -H "Content-Type: application/x-www-form-urlencoded;charset=UTF-8" \
> --user "1KdLLFjx1bjx0bMlzHWsf5FAR+0=:SB6J8TWZWTVV+VpPJlJvls2xA4zJlDBKbtm4pe1LxRo=" \
> --data-urlencode "grant_type=authorization_code" \
> --data-urlencode "code=119E674315AE3FE9EA55B4686695C99FE57DB8BB" \
> --data-urlencode "redirect_uri=https://mohansun-myea.herokuapp.com/" \
> https://mwa76434.us-east-1.snowflakecomputing.com/oauth/token-request
```
```json
{
  "access_token" : "ETMsDgAAAXmzy5dnABRBRVMvQ0JDL1BLQ1M1UGFkZGluZwEAABAAEL1tiwcVLh9PK6Wd6Np+4UcAAABwXpoRpv9QnTmPY4JO8NKzWQiUedt+OUjZQC4hqHsiLtpH7iBpizTBZ6wjC/5HsJWesezVwwb7WYLD/YBdhy2G67ffTE2HN+aKmkcbSuGcjTkxcGbebw/yZwH5WmjeJc3Cwp6krLue6wjMLKt5iT6c7gAU89Mq0ku2KqmKSm1XDQJy/jWnDTI=",
  "refresh_token" : "ETMsDgAAAXmzy5dnABRBRVMvQ0JDL1BLQ1M1UGFkZGluZwEAABAAECsQMrIU6AiytpfqkFlrpLAAAACAkTmgh+yKhAjF1r01K9hSEAJ89OV3O2y7itJVgT4kGBL1/m0BC4I5VtFXuXUQv8t91OMLzwm5NNG49c1pf+GPzwZXAvKf4fTVnRPl0oq4S5vjlL2aNW/nlJU0IWXOXYRC7V5RZ4AMHVYRzdfv/BIcNNS/gkctnnMjsHRdp8Nw6yYAFMTHKrjHTYf76Dd7gTN6sRpKDP5Y",
  "token_type" : "Bearer",
  "username" : "MOHANCHINNAPPAN",
  "scope" : "refresh_token session:role:SYSADMIN",
  "expires_in" : 599,
  "refresh_token_expires_in" : 86399
}

```

### Using Refresh token to get access token

```
curl -X POST -H "Content-Type: application/x-www-form-urlencoded;charset=UTF-8" \
    --user "<OAUTH_CLIENT_ID not encoded>:<OAUTH_CLIENT_SECRET>" \
    --data-urlencode "grant_type=refresh_token" \
    --data-urlencode "refresh_token=<refresh_token value>" \
    --data-urlencode "redirect_uri=<OAUTH_REDIRECT_URI not encoded>" \
    <OAUTH_TOKEN_ENDPOINT>

curl -X POST -H "Content-Type: application/x-www-form-urlencoded;charset=UTF-8" \
--user "1KdLLFjx1bjx0bMlzHWsf5FAR+0=:SB6J8TWZWTVV+VpPJlJvls2xA4zJlDBKbtm4pe1LxRo=" \
--data-urlencode "grant_type=refresh_token" \
--data-urlencode "refresh_token=ETMsDgAAAXmzy5dnABRBRVMvQ0JDL1BLQ1M1UGFkZGluZwEAABAAECsQMrIU6AiytpfqkFlrpLAAAACAkTmgh+yKhAjF1r01K9hSEAJ89OV3O2y7itJVgT4kGBL1/m0BC4I5VtFXuXUQv8t91OMLzwm5NNG49c1pf+GPzwZXAvKf4fTVnRPl0oq4S5vjlL2aNW/nlJU0IWXOXYRC7V5RZ4AMHVYRzdfv/BIcNNS/gkctnnMjsHRdp8Nw6yYAFMTHKrjHTYf76Dd7gTN6sRpKDP5Y" \
--data-urlencode "redirect_uri=https://mohansun-myea.herokuapp.com/" \
https://mwa76434.us-east-1.snowflakecomputing.com/oauth/token-request



```

```
$ curl -X POST -H "Content-Type: application/x-www-form-urlencoded;charset=UTF-8" \
> --user "1KdLLFjx1bjx0bMlzHWsf5FAR+0=:SB6J8TWZWTVV+VpPJlJvls2xA4zJlDBKbtm4pe1LxRo=" \
> --data-urlencode "grant_type=refresh_token" \
> --data-urlencode "refresh_token=ETMsDgAAAXmzy5dnABRBRVMvQ0JDL1BLQ1M1UGFkZGluZwEAABAAECsQMrIU6AiytpfqkFlrpLAAAACAkTmgh+yKhAjF1r01K9hSEAJ89OV3O2y7itJVgT4kGBL1/m0BC4I5VtFXuXUQv8t91OMLzwm5NNG49c1pf+GPzwZXAvKf4fTVnRPl0oq4S5vjlL2aNW/nlJU0IWXOXYRC7V5RZ4AMHVYRzdfv/BIcNNS/gkctnnMjsHRdp8Nw6yYAFMTHKrjHTYf76Dd7gTN6sRpKDP5Y" \
> --data-urlencode "redirect_uri=https://mohansun-myea.herokuapp.com/" \
> https://mwa76434.us-east-1.snowflakecomputing.com/oauth/token-request
```
```json
{
  "access_token" : "ETMsDgAAAXmz2OszABRBRVMvQ0JDL1BLQ1M1UGFkZGluZwEAABAAEKpFjJkrmCoSvgeR/ZH9kEAAAABwTEEcOfiXAI3NsAEfvk9JLQBgfmCKorAoeCarmQ8r3KaK6foXeLqtCOWnQzfHSJJjnvfCPYgEh61Iq23xILiGOm10Zos3EnVgrmUV4lFtiLUz64FNfEP+S56bdF7kbADmNDOCmLqhu7oN47p1Ltzd/QAUXS7cEVu0onUyPmb2x4bGbGP8lxY=",
  "token_type" : "Bearer",
  "expires_in" : 599
}

```
```
$ cat sf-oauth.sh 
 /Applications/SnowSQL.app/Contents/MacOS/snowsql -a mwa76434.us-east-1 -u  MOHANCHINNAPPAN \
--authenticator oauth \
--token "ETMsDgAAAXmz2OszABRBRVMvQ0JDL1BLQ1M1UGFkZGluZwEAABAAEKpFjJkrmCoSvgeR/ZH9kEAAAABwTEEcOfiXAI3NsAEfvk9JLQBgfmCKorAoeCarmQ8r3KaK6foXeLqtCOWnQzfHSJJjnvfCPYgEh61Iq23xILiGOm10Zos3EnVgrmUV4lFtiLUz64FNfEP+S56bdF7kbADmNDOCmLqhu7oN47p1Ltzd/QAUXS7cEVu0onUyPmb2x4bGbGP8lxY="


```
```
$ bash sf-oauth.sh 
* SnowSQL * v1.2.14
Type SQL statements or !help
MOHANCHINNAPPAN#COMPUTE_WH@(no database).(no schema)>use FRUIT;
+----------------------------------+                                            
| status                           |
|----------------------------------|
| Statement executed successfully. |
+----------------------------------+
1 Row(s) produced. Time Elapsed: 0.177s
MOHANCHINNAPPAN#COMPUTE_WH@FRUIT.PUBLIC>select * from
                                        fruit..Yield;
+-------+-----+------------------+                                              
| NAME  | QTY | COMMENTS         |
|-------+-----+------------------|
| apple | 100 | yellow delicious |
| mango |  77 | sweetie          |
| peach |  24 | eastern          |
+-------+-----+------------------+
3 Row(s) produced. Time Elapsed: 1.188s
MOHANCHINNAPPAN#COMPUTE_WH@FRUIT.PUBLIC>

```
<a name='dx'></a>
## Using DX with OAuth
```
$  sfdx mohanc:snowflake:query -q ~/.snowflake/fruits-query-new.sql -c ~/.snowflake/sfc-connection-new-oauth2.json  -f csv
```
```csv
"NAME","QTY","COMMENTS"
"apple",100,"yellow delicious"
"mango",77,"sweetie"
"peach",24,"eastern"
```

```
$ cat  ~/.snowflake/fruits-query-new.sql 

```

```sql

SELECT name,qty,comments FROM fruit..yield;
```

```
$ cat ~/.snowflake/sfc-connection-new-oauth2.json 
```

- Note: access token here is mangled here
```json
 {
     "username" : "MOHANCHINNAPPAN", 
     "account" : "mwa76434.us-east-1",
     "authenticator" : "OAuth",
     "token" : "ETMsDgAAAXm0+SFwABRBRVMvQ0JDL1BLQ1M1UGFkZGluZwEAABAAEI83/GtDEz8iVicYLnA+7QEAAABwYV4Wq5zqybpZ5lep1R4Jq/zzdEKegNSN4jyXIzJm+SSUDS4dz5UDQCrGsB1UnnHNoPvYO2F/lwKzHiNCHTfqwhOpsUj8DLMhs0Qnj3ILSRcL8Kzu2lfmfbnYFeTiOSLfidfsdffdfsf7YvJb0eG60jCrs2ny9rl7wAUT4lkUwONKuymjKvGjSzyXXqdOms="
}

```

### References
- [Guide](https://snowflakecommunity.force.com/s/article/HOW-TO-OAUTH-TOKEN-GENERATION-USING-SNOWFLAKE-CUSTOM-OAUTH)
- [Article](https://community.snowflake.com/s/article/Using-OAuth-2-0-with-Snowflake)
- [Doc](https://docs.snowflake.com/en/user-guide/oauth-custom.html)


