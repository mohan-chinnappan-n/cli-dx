## How to use OAuth2.0 based JWT flow to login to a Salesforce org using DX

- [Using frontdoor.jsp](#frontdoor)

- We need the following
    - server.key (private key)  aka jwt key file
    - Connected App
        - server.crt  (self-signed cert file in creating Connected App in Salesforce)  

<a name='capp'></a>:
## What is a connected App?
- A connected app is a framework that enables an external application to integrate with Salesforce using APIs and standard protocols, such as SAML, OAuth, and OpenID Connect. Connected apps use these protocols to authenticate, authorize, and provide single sign-on (SSO) for external apps. 
- The external apps that are integrated with Salesforce can run on the customer success platform, other platforms, devices, or SaaS subscriptions. 
    - For example, when you log in to your Salesforce mobile app and see your data from your Salesforce org, you’re using a connected app.


### Main use cases for a connected app
- You can use a connected app to integrate external applications with the Salesforce API, such as a web-based app that pulls in order status data from your Salesforce org. 
- You can also use connected apps to integrate service providers with your Salesforce org, and to set security policies to control what data a third-party app can access from your org. 
- You can configure a connected app to provide authorization for external API gateways, such as API gateways hosted on MuleSoft’s Anypoint Platform.


###  Define Which Users Can Access the Connected App 
![CApp oauth policies](img/capp-oauth-policies-1.png)
- The **Permitted Users policy** defines whether users are pre-authorized to run the connected app. 
    - The **Admin approved users** are pre-authorized option allows:
        -  only users with the associated profile to access the app without first authorizing it. 
    -  The **All Users may self-authorize** option enables:
        -  anyone in the org to authorize the app after **successfully signing in**. 
        - Successfully signed in user will be asked the confirmation using "Allow Access" form as shown below:

![CApp oauth policies - Allow Access](img/capp-oauth-policies-2.png)

####  Admin approved users option
- When you select Admin approved users option
![admin-approved users - alert](img/capp-oauth-policies-3a.png)
![admin-approved users - Policy](img/capp-oauth-policies-3.png)
![admin-approved users - profile](img/capp-oauth-policies-3b.png)
![admin-approved users - permset](img/capp-oauth-policies-3c.png)



### Connected App references
- [Security Guide](https://developer.salesforce.com/docs/atlas.en-us.securityImplGuide.meta/securityImplGuide/connected_apps.htm)
- [Manage OAuth-Enabled Connected Apps Access to Your Data](https://help.salesforce.com/articleView?id=sf.remoteaccess_request_manage.htm&type=5)


### Create required files (server.key and server.crt)

- Generate Private Key and CSR (Certificate Signing Request)


### Generate server.key

- NOTE: I have modified the cert and key files to protect,  so others can't use them!

```
$ openssl genrsa -des3 -passout pass:x -out server.pass.key 2048

Generating RSA private key, 2048 bit long modulus
...........................................................+++
.......+++
e is 65537 (0x10001)
~/sfdx-test/cert:

$ ls -l
total 8
-rw-r--r--  1 mchinnappan  wheel  1751 Sep  2 06:24 server.pass.key

$ cat server.pass.key 
-----BEGIN RSA PRIVATE KEY-----
Proc-Type: 4,ENCRYPTED
DEK-Info: DES-EDE3-CBC,8D530319B5EB377C

f4LsC0cfYB25Cu+VEEkZJCFmRt5Wr+JRNwRovL5K+xHiOIj8RChHwT1BYL2tLJul
Nt4HwynTXNpyUvoLMMHY6DkutcsVtmJAesSO9lzc9fENLWG8Wwa1SMJgV956OsbS
8pPkb4Cyb4EibslTysnwGP/EkNIvqpqvLWpxzKEND/Fpr2dTwsBWuaZcUQ9ZXCq4
xg9QxQvV0ekwOcSSKYvIx3QzcbEB3QxnhtPplXfuHwb+2lm0dZkuqsSWjCHMsS57
5c/Hf7fQdCNTkZ03D+FdQbCwemLNefww12DaMFbZyaYwmMYqK43kc1xX3/vD8Wmp
jp1Aaps4cH0DobG3bJfakrV48El8upXciHnWMB3xgULdg1Ohs3VhOAm6t14jkK8n
ehfzpWeHRlk5SoG1CIpzkDI9l5Q8+rpDXidt857VD2gwk+xx+CzrRhirVUqN8q2b
eMpE4n1pgg1sPPgdM4IapVmggiCaKACmTGhtq14lTXeu8HVEb2isliB33TjlTV7K
0ApWmO8d7wf5s0IZCl1+a0xhWG5SfK6xwoRAE4Er/qUnXWz4HyWYvfpYp0y1dtnw
JAAFR1YhHSMrjLwiGVSEyC5S+KsZbcMahFgdHVfeHkJO61NeexhQi3pr9mlIxOHf
7E4Km2JpAMlYppwtk6IlcDYgo+EJtxe5lShSbIAxMTLGxt/umxRhOKDyUK2eB6wB
6Yl2IBHVYX2JhYrF93OH56wFdhCb7VygxEJJBpSErgiDlzqgZ+pDQhIqJToYCpkh
p3ajQw22egBFS6gIgnOHkBSIQHLd6328CFuHnF7PoLkOF281O90eicLDTMn1G3/8
6i6ioUspUAPSm3tnWDmsIx1nP16YYH+T9RSHlQBOvWujpel/qN3t8PKWzKF2GJ1z
CwpTAe/uwJkvstXKQQfBnvWtOFPtCS99S/4OvoDH95HbFlZ9jjMofAk71rafjzz9
qqyAolhEkFKkMoiSPWlZOyWQxdjo3720c4djvBSiE7ZvqM+mMH6fhPRc0bfNCUKA
uI8DgBbSOmIM7T6UrHilnp20D6Onv+EMkFR0yogrOja0MXOskVqKoQzYgycaoPDd
aWWnDVIjfiEiFRpSfqKhX6gcrq3JA2bYK20j5jTn3Of0snH6EdqHarmNRgWvSkaZ
9OE6ur2Uib5V5PG9hdpMBKXcHErHfsOPqdwXLxxndhnaTMUhCPT7tWgk+lCWcTaR
n0Cn1/UgJhbEns2djKtmDvoLsknTBa5Zy/s06LmHTt27qkk6n28eHgSm81hrHra8
sL/TGa3XdX61omJviir/6mZm5KguiT3olDXqDSGx2L1Uj+unBO1OBIyubOZ4wTmg
ZIrxogntLy2cZFZJHd42Gx5ESCuaHUxRps8gBQ8PZgXz3lqZulbiZu1Q7HOL/8Mc
IKoRdGcl4OKE7/4iXUDemAddffzwgQE6KmcQ/A2N/rukm5Z/WSbiNgbnpHS89Mx4
ywdgcbP9BYtR8Q2kAgZR/rEt6rHguVrzE2nGHwjNc2XAcUQX54A3NUpbgCl4HH49
16hl76D4yFxnnq35Q2Q5M3rgYSFlti+MpgB1KzKPP+5GMg3YGU5bVbXPzQsN+mNt
-----END RSA PRIVATE KEY-----


$ openssl rsa -passin pass:x -in server.pass.key -out server.key

$ cat server.key 
-----BEGIN RSA PRIVATE KEY-----
MIIEpQIBAAKCAQEA1c8uePIm5QEwbvQ+Vi6SV4viBCJl3XLzAFVhu5RuZtSWeAwG
YP6G6QEdR7dPem6Nbr20ItdHDZL8e0idhBn6znHDg8dhfcX5s3TvS2FHNeqHPQQO
Z9gQk1/z3sf6rQv+7dHRScIYm0SvgiVeOkiwuudbfrMBRmUmFi/qENlPhVlhx7k7
o3pCYgRJlM9JZuHnlsq218tcEPgmrWWpP8DPx4jCzJyDZ0X+1c32EBEbBrNdo7xF
7XxVLBG9L8wFsTuYDeRlmkFMCqLnYYJKN8qxBl+nxt6y9nbWTKre0h01ZEpggZlV
Uqz3fYhkY1EdcuywaPHmNNqS3hYuueFmq0QDsQIDAQABAoIBAQDSkq7hXRQjXI13
6ULvnARzBoh9q+cJN6nN/Uk49hHZYqwi5SzvIB58oqVUuVwkZ3cRxvH/kmgfHVFe
lgDUVsXlxrNZOOdyeKXZMWRvqAn7NtUkqbcKXQjOLKVBF1FyVqsnTArEis2zNe1o
zybDXk34dd1tphyuWPYuydfL6kpgN/5zqVvVlRPHyq2BdrsKKbq3FnFe9V0HnUmt
F6G4Fv7EufHC1KYy1s6nsHrBWYz58mRaDcZc16K3QMg2NDrxt48+L35QbZcxX2xD
IGhzWyeukfCFKZSg8M+8voE08tWcdDWggG5+OcjwBiZ6YKUu2X30+CA50BWpF5Iy
KSXcM3N1AoGBAPv3z2ZUz4lT51IKvHXZTcz38dUhB8xQF20mX1FL4cnn+lZFinN0
lSAVY8rvUQH+FomrAczXhvnmnHkl5F1txL0qoR8Jn8GxcOieW/JBrbh4rCSf0e+a
8yfUX4uoU8MgaAy8FaRuLy88zIUoqrMkfVhGJyBpmCd8EknB/Aryvi9LAoGBANk7
DcXwOz4kb+1jo89LMl1iewn7Pelk6GHhWrW7LNU5gu+RkUlqq0+9Tf6eoBC04VLT
WKLzV+AWt9VDF5etTxX6QpBPLkWCwUK4rSEnLk+kGZk/ez06xX2LV9KXn5evc+pG
ap/c6SjBfz0CJpPf2pmGdYKJ+F4///yNdf6Zsi9zAoGBAK4aGTD4QT7+vsOtr3Mu
59dNK8i8vgqq/MTq0sn1yNoedJfQDU6hq7kzjnTWz/60dxZBF0lXU2ixtETxrc3w
3xRmtFYh7EWGOiJB6f6G62af2zKjTAhn5MQMtshlUxts9Ph3reykRe458IfCBdEq
0YGBV9/Jlt0RmgFlDKbz+/3pAoGBAMXGGSUUMavDGtBDfjlVmhYheim9P0HF6Dht
Jtv7/LZodQhOPLtdzXh8vozJuKtdMyPoXXOGH4RayqX0Pn+Of0lgHsgp/tO0VuW7
I4zikixaGCBJBpfZcUJ64ctO1jMQv3UVBTBkvTao7IIL+jl5fhl2rHfby29rz1EN
LddN8Ud3AoGAFcqDH8qAS+c1cYSQ2hDmolmgpS+cLUHSna89+Cu0tE8gSwspeo+1
8Z/oCOzLM0gzDoiUQp20XeApCiFy2GEQu0HF6i337uwX5JIeRfwkzKfnyuEa0tJU
RpMILmatx2dv+1VAa5Qyf39C8fTKuQB9pA1Kmz3UhSyFSY/pzqibLK0=
-----END RSA PRIVATE KEY-----


$ rm server.pass.key

### Generate CSR
$ openssl req -new -key server.key -out server.csr
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:US
State or Province Name (full name) [Some-State]:NH
Locality Name (eg, city) []:Nashua
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Mohansun
Organizational Unit Name (eg, section) []:dev
Common Name (e.g. server FQDN or YOUR name) []:mohansun
Email Address []:youremai@domain.com

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:
An optional company name []:
~/sfdx-test/cert:
$ ls -l
total 16
-rw-r--r--  1 mchinnappan  wheel  1054 Sep  2 06:28 server.csr
-rw-r--r--  1 mchinnappan  wheel  1679 Sep  2 06:25 server.key
~/sfdx-test/cert:
$ cat server.csr 
-----BEGIN CERTIFICATE REQUEST-----
MIIC0jCCAboCAQAwgYwxCzAJBgNVBAYTAlVTMQswCQYDVQQIDAJOSDEPMA0GA1UE
BwwGTmFzaHVhMREwDwYDVQQKDAhNb2hhbnN1bjEMMAoGA1UECwwDZGV2MREwDwYD
VQQDDAhtb2hhbnN1bjErMCkGCSqGSIb3DQEJARYcbW9oYW4uY2hpbm5hcHBhbi5u
QGdtYWlsLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANXPLnjy
JuUBMG70PlYukleL4gQiZd1y8wBVYbuUbmbUlngMBmD+hukBHUe3T3pujW69tCLX
Rw2S/HtInYQZ+s5xw4PHYX3F+bN070thRzXqhz0EDmfYEJNf897H+q0L/u3R0UnC
GJtEr4IlXjpIsLrnW36zAUZlJhYv6hDZT4VZYce5O6N6QmIESZTPSWbh55bKttfL
XBD4Jq1lqT/Az8eIwsycg2dF/tXN9hARGwazXaO8RfF8VSwRvS/MBbE7mA3kZZpB
TAqi52GCSjfKsQZfp8besvZ21kyq3tIdNWRKYIGZVVKs932IZGNRHXLssGjx5jTa
kt4WLrnhZqtEA7ECAwEAAaAAMA0GCSqGSIb3DQEBCwUAA4IBAQCDYVQzWu6eWUTq
iaN4H5dGiNT5NkzfCJGpWmRSmtADl/s16AF6+2qIwCqi1poZlZIb80a/q2s1J7LV
/eVXy7BgIGknY3XwidcINS5uue6F5KR447cfYDGaM9lDfb5m6BDerZBWzORJ8/0Y
uK9f2uHj8x1deyNIQBtIky97bmKgnfbbbdX1Apsz70M+T424a5xLbvPSmL32HUP0
jrk8Sfcu9uo+kQTaNBKpfhTYqeZqg7gJ5a9yN8JM8hxNimBALvLuaB/bf22qzR5A
Iq3BT05mCwuSjNfsvEfZrISBD52QOF/cIu4ZulFVa+RFCr6X5FzAqfElH7rp7UWz
aKWyUme4
-----END CERTIFICATE REQUEST-----

```

### Generate Self-signed SSL Cert (server.crt)

- The self-signed SSL certificate (**server.crt**) is generated from the **server.key** private key and **server.csr** files.

```
$ openssl x509 -req -sha256 -days 365 -in server.csr -signkey server.key -out server.crt
Signature ok
subject=/C=US/ST=NH/L=Nashua/O=Mohansun/OU=dev/CN=mohansun/emailAddress=mohan.chinnappan.n@gmail.com
Getting Private key
~/sfdx-test/cert:
$ ls -l
total 24
-rw-r--r--  1 mchinnappan  wheel  1306 Sep  2 06:31 server.crt
-rw-r--r--  1 mchinnappan  wheel  1054 Sep  2 06:28 server.csr
-rw-r--r--  1 mchinnappan  wheel  1679 Sep  2 06:25 server.key

$ cat server.crt 
-----BEGIN CERTIFICATE-----
MIIDljCCAn4CCQDPdqVZz+9GyzANBgkqhkiG9w0BAQsFADCBjDELMAkGA1UEBhMC
VVMxCzAJBgNVBAgMAk5IMQ8wDQYDVQQHDAZOYXNodWExETAPBgNVBAoMCE1vaGFu
c3VuMQwwCgYDVQQLDANkZXYxETAPBgNVBAMMCG1vaGFuc3VuMSswKQYJKoZIhvcN
AQkBFhxtb2hhbi5jaGlubmFwcGFuLm5AZ21haWwuY29tMB4XDTIwMDkwMjEwMzEw
N1oXDTIxMDkwMjEwMzEwN1owgYwxCzAJBgNVBAYTAlVTMQswCQYDVQQIDAJOSDEP
MA0GA1UEBwwGTmFzaHVhMREwDwYDVQQKDAhNb2hhbnN1bjEMMAoGA1UECwwDZGV2
MREwDwYDVQQDDAhtb2hhbnN1bjErMCkGCSqGSIb3DQEJARYcbW9oYW4uY2hpbm5h
cHBhbi5uQGdtYWlsLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEB
ANXPLnjyJuUBMG70PlYukleL4gQiZd1y8wBVYbuUbmbUlngMBmD+hukBHUe3T3pu
jW69tCLXRw2S/HtInYQZ+s5xw4PHYX3F+bN070thRzXqhz0EDmfYEJNf897H+q0L
/u3R0UnCGJtEr4IlXjpIsLrnW36zAUZlJhYv6hDZT4VZYce5O6N6QmIESZTPSWbh
55bKttfLXBD4Jq1lqT/Az8eIwsycg2dF/tXN9hARGwazXaO8RfF8VSwRvS/MBbE7
mA3kZZpBTAqi52GCSjfKsQZfp8besvZ21kyq3tIdNWRKYIGZVVKs932IZGNRHXLs
sGjx5jTakt4WLrnhZqtEA7ECAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAPAaQPzma
Xea+yi1mkXL3UmcvF4oGzGtQlcU8WRpxyVoM5LwJpPePXcj8xoh9pUpBza2S+9/H
aS7EKTHx02pTXjAGM0gsAAmrDb4pmpVi+b6f6Rv1lLChIIQyYuZox/O7ATA3rLr2
4e8Sk0U2Yt+fESxD4+57HRoCk17I7U0csB2UDZCpGEGOYhst0Wad/4mI9yTFLWet
Doj3V1EGkbZduU1lqEKt3x+qugr73EBYxVvsvPTNRVCh8SPB8Vr8W7WPFE8HvmPS
0tCmYkL/j0WgqshHICpwaqbCaB0jzmp676EFym2kvWl27tsFxku8A6lzgZ0Hwrhb
ngevFR5Da/oXgw==
-----END CERTIFICATE-----

```

- The above **server.key** file contains your private key, 
    - we will be using that as input when signing the JWT bearer token payload.


- Setup the connected app
    - Key attributes required
        - Callback URL:	http://localhost:1717/OauthRedirect
        - Selected OAuth Scopes	
            - Access your basic information (id, profile, email, address, phone)
            - Access and manage your data (api)
            - Provide access to your data via the Web (web)
            - Perform requests on your behalf at any time (refresh_token, offline_access)
        - OAuth Policies
            - Permitted Users:	Admin approved users are pre-authorized
        - Profiles
            - System Administrator
            - Add any other profiles here
        - OR Application Permission Set Assignment
            - Select the appropriate permission sets to choose which users have access to this application.
        - server.crt file

![connect app setup](img/jwt-capp-1.gif)

- Consumer Key from the connected app
    - 3MVG9Kip4IKAJUNK4gZDQcUI7albyrfHKO6yYqMW09rBf5JiiqNOx3jgIZdPvBWargyvDKjnXlwrZ4uhRJUNK


### Login using JWT flow and get access_token

#### Usage
```

$ sfdx mohanc:hello:jwt -h
JWT flow to get access_token

USAGE
  $ sfdx mohanc:hello:jwt

OPTIONS
  -c, --configfilename=configfilename             JWT config json file
  --json                                          format output as json
  --loglevel=(trace|debug|info|warn|error|fatal)  logging level for this command invocation

EXAMPLE

       ** JWT flow to get access_token **

       sfdx mohanc:hello:jwt -c jwt.json
```

### Sample jwt.json

```
$ cat ~/.props/jwt.json
```

```json
{ 
"consumerKey": "3MVG9Kip4IKAZQEX4gZDQcUI7albyrfHKO6yYqMW09rBf5JiiqNOx3jgIZdPvBWargyvDKjnXlwrZ4uhRJUNK",
"subject":"<salesforce user id here>",
"sandbox":false,
"expiresIn":300,
"privateKeyFile":"/Users/mchinnappan/.keys/server.key"
}
```

#### Demo
```
$ sfdx mohanc:hello:jwt -c ~/.props/jwt.json 
```
```json
{
  "access_token": "00D3h000007R1Lu!AR0AQLTCNgMvcSwNZNJv3AH.oJ638c.3XVHJpNtraPPdkkR5N4vCFBzbN5Y3P.fwr8IybqXfpzlL_2s0duVfnqVIskUyJUNK",
  "scope": "web id api",
  "instance_url": "https://mohansun-ea-02-dev-ed.my.salesforce.com",
  "id": "https://login.salesforce.com/id/00D3h000007R1LuEAK/0053h000002xQ5sAAE",
  "token_type": "Bearer",
  "assertion": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJwcm4iOiJtb2hhbi5jaGlubmFwcGFuLm5fZWEyQGdtYWlsLmNvbSIsImlhdCI6MTYwMDM5NjM3MiwiZXhwIjoxNjAwMzk2NjcyLCJhdWQiOiJodHRwczovL2xvZ2luLnNhbGVzZm9yY2UuY29tIiwiaXNzIjoiM01WRzlLaXA0SUtBWlFFWDRnWkRRY1VJN2FsYnlyZkhLTzZ5WXFNVzA5ckJmNUppaXFOT3gzamdJWmRQdkJXYXJneXZES2puWGx3clo0dWhSNndtTCJ9.K4uFnVI7Gswr2Z6GMs6LyYWbdBfGTbCvX74-V8VCQeC4exq7oue8U3UI4ecJ57sO7rWnQ06vYbW8UAWDul9pwmgHya9gSoJKiJehRXGVdygRUZvZh9AOYGoRta87CIQuP6bwv1ff9Ag08vQhYeRJJA7tFeizdx-14H7iApAXeBaGEHkZzDmPwub-pR9uC-jWyHLh3VJiQk5vemnkAEJ0R1u-4S1PVLz48PNlY-1ITg-R_ZdU_Gb-BkQjT-fCpc2deik8cvQd9cKpn4ADYH-zWFA_P7pJksGEeuEhkgvav55CJwVo3rWFQ4041UmOe0Mx3pw5yvZZa3lbbxhJzJUNK"
"instanceUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com",
"Authorization": "Bearer 00D3h000007R1Lu!AR0AQLTCNgMvcSwNZNJv3AH.oJ638c.3XVHJpNtraPPdkkR5N4vCFBzbN5Y3P.fwr8IybqXfpzlL_2s0duVfnqVIskUyJUNK",
"Content-Type": "application/json"
}
```
<hr>

### Login using JWT flow

```

$ sfdx force:auth:jwt:grant -h
authorize an org using the JWT flow

USAGE
  $ sfdx force:auth:jwt:grant -u <string> -f <filepath> -i <string> [-r <url>] [-d] [-s] [-a <string>] [--json] [--loglevel 
  trace|debug|info|warn|error|fatal|TRACE|DEBUG|INFO|WARN|ERROR|FATAL]

OPTIONS
  -a, --setalias=setalias                                                           set an alias for the authenticated org
  -d, --setdefaultdevhubusername                                                    set the authenticated org as the default dev hub org for scratch org creation
  -f, --jwtkeyfile=jwtkeyfile                                                       (required) path to a file containing the private key
  -i, --clientid=clientid                                                           (required) OAuth client ID (sometimes called the consumer key)
  -r, --instanceurl=instanceurl                                                     the login URL of the instance the org lives on
  -s, --setdefaultusername                                                          set the authenticated org as the default username that all commands run against
  -u, --username=username                                                           (required) authentication username
  --json                                                                            format output as json
  --loglevel=(trace|debug|info|warn|error|fatal|TRACE|DEBUG|INFO|WARN|ERROR|FATAL)  [default: warn] logging level for this command invocation

DESCRIPTION
  Authorizes a Salesforce org using a certificate associated with your private key that has been uploaded to a personal connected app.

  If you specify an --instanceurl value, this value overrides the sfdcLoginUrl value in your sfdx-project.json file. To specify a My Domain URL, use the format 
  <yourdomain>.my.salesforce.com (not <yourdomain>.lightning.force.com).

  Examples:
      $ sfdx force:auth:jwt:grant -u me@my.org -f <path to jwt key file> -i <OAuth client id>
      $ sfdx force:auth:jwt:grant -u me@my.org -f <path to jwt key file> -i <OAuth client id> -s -a MyDefaultOrg
      $ sfdx force:auth:jwt:grant -u me@acme.org -f <path to jwt key file> -i <OAuth client id> -r https://acme.my.salesforce.com

```

<a name='frontdoor'></a>
### Login via command line
```
$ sfdx force:auth:jwt:grant -u mohan.chinnappan.n_ea2@gmail.com -f server.key -i 3MVG9Kip4IKAJUNK4gZDQcUI7albyrfHKO6yYqMW09rBf5JiiqNOx3jgIZdPvBWargyvDKjnXlwrZ4uhR6wmL
Successfully authorized mohan.chinnappan.n_ea2@gmail.com with org ID 00D3h000007R1LuEAK
```
### Get header.json 
```
$ sfdx mohanc:hello:myorg -u mohan.chinnappan.n_ea2@gmail.com > header.json
$ cat header.json 
{
    "Content-Type": "application/json",
    "Authorization": "Bearer 00D3h000007R1LuJUNKAR0AQDUpWk6OgwgPwjh8xvhdAVooN_nlnX.nNtWXtReG1Rk5cqyN2HuqCWdhEOY7z3PE1LRkvPbyKuPXOjZ206V7HFlSPFPX",
    "apiVersion": "49.0",
    "instanceUrl": "https://mohansun-ea-02-dev-ed.my.salesforce.com",
    "restAPIUri": "https://mohansun-ea-02-dev-ed.my.salesforce.com/services/data/v49.0/"
}


``` 
## Open with frontdoor.jsp
- Seesion Id: AccessToken (2nd line above header.json, the string after  Bearer)


```
https://instance.salesforce.com/secur/frontdoor.jsp?sid=session_ID
```
example:
```
https://mohansun-ea-02-dev-ed.my.salesforce.com/secur/frontdoor.jsp?sid=session_ID
```

## How to create a csv for login_urls for the given csv file of username
- [Download this script: form_login_urls.sh](jwt/form_login_urls.sh)
- Make sure you have jq installed in your machine
- Create a csv file with list of users in users.csv
- Provide the private key location 
- Provide the consumerKey for the connectedApp

![script](jwt/img/jwt-frondoor.svg)
```bash
bash form_login_urls.sh users.csv ~/.keys/private.key '3MVG9Kip4IKAJUNK4gZDQcUI7albyrfHKO6yYqMW09rBf5JiiqNOx3jgIZdPvBWargyvDKjnXlwrZ4uhR6wmL' loginUrls.csv

```
- This will generate an output csv ```loginUrs.csv``` file with these fields
  - username, frontdoor.jsp_based_url 
- You can read this output csv ```loginUrs.csv``` file to test login to multiple users that you have provided in the input ```users.csv```
-----

## JWT on Ubuntu

### Install
- [Install url](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_install_cli.htm)

```
$ wget https://developer.salesforce.com/media/salesforce-cli/sfdx-linux-amd64.tar.xz
$ mkdir sfdx
$ tar xJf sfdx-linux-amd64.tar.xz -C sfdx --strip-components 1
$ ./sfdx/install

```
### Notes
- sfdx will be installed under  /usr/local/bin/sfdx ( If you receive permission or access errors that you can’t address by using sudo or chmod)
- If you do not have nodejs installed in the system, you use the node binary installed at  /usr/local/bin by sfdx by setting the path to that binary 
 

### Plugin install on Linux

```
$ export NODE_JQ_SKIP_INSTALL_BINARY=true
$ sfdx plugins:install sfdx-mohanc-plugins

```
### Example Usage

```

mohan@kovai:~/jwt$ cat clientid.txt
3MVG9Kip4IKAZQEX4gZDQcUI7ahCsDth_bO..bl7_1n5.5qnhvA.XeflKIXxVt0r0K.l9jeco1.BQrV_VZ.D4

mohan@kovai:~/jwt$ uname -a
Linux kovai.mohanc.com 5.4.0-59-generic #65~18.04.1-Ubuntu SMP Mon Dec 14 15:59:40 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux
mohan@kovai:~/jwt$ ls -l
total 20
-rw-r--r-- 1 mohan mohan   87 Jan  8 11:25 clientid.txt
-rw-r--r-- 1 mohan mohan 1204 Jan  8 11:07 server.crt
-rw-r--r-- 1 mohan mohan  997 Jan  8 11:04 server.csr
-rw------- 1 mohan mohan 1679 Jan  8 11:02 server.key
-rw------- 1 mohan mohan 1751 Jan  8 11:00 server.pass.key
mohan@kovai:~/jwt$ sfdx force:auth:jwt:grant -u mohan.chinnappan.n_ea2@gmail.com -f server.key -i 3MVG9Kip4IKAZQEX4gZDQcUI7ahCsDth_bO..bl7_1n5.5qnhvA.XeflKIXxVt0r0K.l9jeco1.BQrV_VZ.D4
Successfully authorized mohan.chinnappan.n_ea2@gmail.com with org ID 00D3h000007R1LuEAK

# Note if you are access a sandbox the above command should include -r https://test.salesforce.com
## format: 
##     $ sfdx force:auth:jwt:grant -u me@acme.org -f <path to jwt key file> -i <OAuth client id> -r https://acme.my.salesforce.com  


```

### What happens if you pass wrong user to grant command
```
mohan@kovai:~/jwt$ sfdx force:auth:jwt:grant -u wronguser@gmail.com -f server.key -i 3MVG9Kip4IKAZQEX4gZDQcUI7ahCsDth_bO..bl7_1n5.5qnhvA.XeflKIXxVt0r0K.l9jeco1.BQrV_VZ.D4
ERROR running force:auth:jwt:grant:  We encountered a JSON web token error, which is likely not an issue with Salesforce CLI. Here’s the error: user hasn't approved this consumer

```

## How to perform logout

### Examples
```
## log out of all authenticated orgs
$ sfdx force:auth logout -a -p
## log out only a particular org
$ sfdx force:auth logout -u mohan.chinnappan.n_ea2@gmail.com
```

### Help info for logout
```
$ sfdx force:auth:logout -h
log out from authorized orgs

USAGE
  $ sfdx force:auth:logout [-a] [-p] [-u <string>] [--apiversion <string>] [--json] [--loglevel trace|debug|info|warn|error|fatal|TRACE|DEBUG|INFO|WARN|ERROR|FATAL]

OPTIONS
  -a, --all                                                                         include all authenticated orgs
  -p, --noprompt                                                                    do not prompt for confirmation
  -u, --targetusername=targetusername                                               username or alias for the target org; overrides default target org
  --apiversion=apiversion                                                           override the api version used for api requests made by this command
  --json                                                                            format output as json
  --loglevel=(trace|debug|info|warn|error|fatal|TRACE|DEBUG|INFO|WARN|ERROR|FATAL)  [default: warn] logging level for this command invocation

DESCRIPTION
  By default, this command logs you out from your default scratch org.
  Examples:
      $ sfdx force:auth:logout -u me@my.org
      $ sfdx force:auth:logout -a
      $ sfdx force:auth:logout -p
```


### How to check the given server.key (private key) matches a certificate?
```
openssl rsa -check -noout -in ~/key-gen/server.key 
RSA key ok

```

### References
- [Creating a Self-Signed SSL Certificate](https://devcenter.heroku.com/articles/ssl-certificate-self#generate-private-key-and-certificate-signing-request)
- [Using the OAuth 2.0 JWT Bearer Flow to Support the Salesforce DX CLI](http://www.wadewegner.com/2017/04/using-the-oauth-2-jwt-bearer-flow-to-support-the-salesforcedx-cli/)
- [Java - OAuth 2.0 JWT Bearer Flow for Server-to-Server Integration](https://help.salesforce.com/articleView?id=remoteaccess_oauth_jwt_flow.htm&type=5)
    - [Java Example](jwt/java)
- [Using python for JWT flow](https://github.com/mohan-chinnappan-n/bulkapi2-dx/tree/master/jwt/py)
- [Sign in error 'Login Rate Exceeded'](https://help.salesforce.com/articleView?id=000312767&type=1&mode=1)


