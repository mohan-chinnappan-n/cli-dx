# JWT flow in java

## Topics
- [Code and Steps](#code)
- [Demo](#demo)
- [Connected App](#capp)



<a name="code"></a>
### Code  and steps
```java


package org.mohansun.jwt;

import org.apache.commons.codec.binary.Base64;
import java.io.*; 
import java.security.*; 
import java.text.MessageFormat;
import java.util.*;

import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.parser.ParseException;
import org.json.simple.parser.JSONParser;
import org.json.simple.JSONValue;


import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.HashMap;
import java.net.URLEncoder;
 

public class App {

  public static void main(String[] args) {

    String header = "{\"alg\":\"RS256\"}";
    String claimTemplate5 = "'{'\"iss\": \"{0}\", \"sub\": \"{1}\", \"aud\": \"{2}\", \"exp\": \"{3}\", \"jti\": \"{4}\"'}'";
    String claimTemplate = "'{'\"iss\": \"{0}\", \"sub\": \"{1}\", \"aud\": \"{2}\", \"exp\": \"{3}\"'}'";


    try {
      StringBuffer token = new StringBuffer();

      //Encode the JWT Header and add it to our string to sign
      token.append(Base64.encodeBase64URLSafeString(header.getBytes("UTF-8")));

      //Separate with a period
      token.append("."); 
      
      Date date = new Date();
      long ms = date.getTime(); 


      //Create the JWT Claims Object
      String[] claimArray = new String[4];
      claimArray[0] = "3MVG9Kip4IKAZQEX4gZDQcUI7ag0sMF7OJIp5gIqWJiSyv7WxbWnnEqdrWI18r0boHvw5KNY05SS3Npc_JUNK"; // Consumer Key
      claimArray[1] = "mohan.chinnappan.n_ea2@gmail.com"; //subject - your user-id
      claimArray[2] = "https://login.salesforce.com"; // or https://test.salesforce.com for sandboxes
      claimArray[3] = Long.toString( ( System.currentTimeMillis()/1000 ) + 300); // expiration
      //claimArray[4]= "JWT" + ms ; //Use of this claim (jti) is OPTIONAL. //UUID can be used

      MessageFormat claims;
      claims = new MessageFormat(claimTemplate);
      String payload = claims.format(claimArray);

      //Add the encoded claims object
      token.append(Base64.encodeBase64URLSafeString(payload.getBytes("UTF-8")));

      //Load the private key from a keystore - put path for the keystore.jks
      KeyStore keystore = KeyStore.getInstance("JKS");
      /*
 -  How to create java keystore (jks)?
        - create mohansun4.jks
            keytool -genkeypair -alias certalias  -keyalg RSA -keysize 2048 -sigalg SHA256withRSA -validity 365 -keystore ~/.jks/mohansun4.jks 
Enter keystore password:  
Re-enter new password: 
What is your first and last name?
  [Unknown]:  mohan chinnappan
What is the name of your organizational unit?
  [Unknown]:  dev
What is the name of your organization?
  [Unknown]:  mohansun
What is the name of your City or Locality?
  [Unknown]:  nashua
What is the name of your State or Province?
  [Unknown]:  nh
What is the two-letter country code for this unit?
  [Unknown]:  us
Is CN=mohan chinnappan, OU=dev, O=mohansun, L=nashua, ST=nh, C=us correct?
  [no]:  yes


 - How to  List it:  
 $ keytool -list -v -keystore ~/.jks/mohansun4.jks 
Enter keystore password:  
Keystore type: PKCS12
Keystore provider: SUN

Your keystore contains 1 entry

Alias name: certalias
Creation date: Sep 14, 2020
Entry type: PrivateKeyEntry
Certificate chain length: 1
Certificate[1]:
Owner: CN=mohan chinnappan, OU=dev, O=mohansun, L=nashua, ST=nh, C=us
Issuer: CN=mohan chinnappan, OU=dev, O=mohansun, L=nashua, ST=nh, C=us
Serial number: 50950c42
Valid from: Mon Sep 14 23:04:52 EDT 2020 until: Tue Sep 14 23:04:52 EDT 2021
Certificate fingerprints:
	 SHA1: 2A:E8:E0:57:E3:2B:47:F2:62:98:DE:77:F4:64:11:A2:22:F7:5E:F2
	 SHA256: 9E:04:AA:77:45:3B:5C:9D:A7:C4:CA:EC:3F:16:5A:AB:35:5A:04:DE:4E:C8:DA:71:44:FC:65:BB:18:16:F5:09
Signature algorithm name: SHA256withRSA
Subject Public Key Algorithm: 2048-bit RSA key
Version: 3

Extensions: 

#1: ObjectId: 2.5.29.14 Criticality=false
SubjectKeyIdentifier [
KeyIdentifier [
0000: 10 80 9E BC B0 0A 5D 4A   6F DC 47 5F D2 A9 5E E7  ......]Jo.G_..^.
0010: 06 74 C8 3A                                        .t.:
]
]



*******************************************
*******************************************

-  How to create cert file out jks
$ keytool -exportcert -alias certalias -keystore ~/.jks/mohansun4.jks -file mohansun4.cer

Note: use this file mohansun4.cer in creating the connected app

- Different format?
    Ref:
    Generate a salesforce compatible JKS from PFX or P12
    https://help.salesforce.com/articleView?id=000313672&language=en_US&type=1&mode=1


      */

      String mypwd = "mypassword!";
      keystore.load(new FileInputStream("/Users/mchinnappan/.jks/mohansun4.jks"), mypwd.toCharArray());
      PrivateKey privateKey = (PrivateKey) keystore.getKey("certalias", mypwd.toCharArray());

      //Sign the JWT Header + "." + JWT Claims Object
      Signature signature = Signature.getInstance("SHA256withRSA");
      signature.initSign(privateKey);
      signature.update(token.toString().getBytes("UTF-8"));
      String signedPayload = Base64.encodeBase64URLSafeString(signature.sign());

      //Separate with a period
      token.append(".");

      //Add the encoded signature
      token.append(signedPayload);

      //System.out.println(token.toString());

    // POST the assertion(token) to get the access token

    HttpClient client = HttpClient.newHttpClient();
    String grantType = "urn:ietf:params:oauth:grant-type:jwt-bearer";
    HttpRequest request = HttpRequest.newBuilder()
            .uri(URI.create("https://login.salesforce.com/services/oauth2/token"))
            .header("Content-Type", "application/x-www-form-urlencoded")
            //.POST(HttpRequest.BodyPublishers.ofString(requestBody))
            .POST(HttpRequest.BodyPublishers.ofString(
              "grant_type=" + URLEncoder.encode(grantType, "UTF-8") +
              "&assertion=" + URLEncoder.encode(token.toString(), "UTF-8") 
             ))
            .build();

    HttpResponse<String> response = client.send(request,
            HttpResponse.BodyHandlers.ofString());

    
    String body = response.body();      
    JSONParser parser = new JSONParser();
    JSONObject obj = (JSONObject) parser.parse(body);		
    String accessToken = (String) obj.get("access_token");
    String instanceUrl = (String) obj.get("instance_url");
    System.out.println(obj);
    //System.out.println(accessToken);
    //System.out.println(instanceUrl);

    // Let use the access token to get the datasets in the EA
    String restServiceURL = instanceUrl + "/services/data/v49.0/wave/datasets";

    HttpRequest getRequest = HttpRequest.newBuilder()
            .uri(URI.create(restServiceURL))
            .header("Authorization", "Bearer " + accessToken)
            .GET()
            .build();

    HttpResponse<String> getResponse = client.send(getRequest,
            HttpResponse.BodyHandlers.ofString());
     System.out.println(getResponse.body());

    





    


    } catch (Exception e ) {
        e.printStackTrace();
    }

    /*
     make executable jar:
     $ mvn clean compile assembly:single
     run:
     $ java -jar target/jwt-1.0-SNAPSHOT-jar-with-dependencies.jar 
     eyJhbGciOiJSUzI1NiJ9.eyJpc3MiOiAiM01WRzk5T3hUeUVNQ1EzZ05wMlBqa3FlWkt4bm1BaUcxeFY0b0hoOUFLTF9yU0suQm9TVlBHWkhRdWtYblZqelJnU3VRcUduNzVOTDd5ZmtRY3l5NyIsICJzdWIiOiAieW91ckBlbWFpbC5jb20iLCAiYXVkIjogImh0dHBzOi8vbG9naW4uc2FsZXNmb3JjZS5jb20iLCAiZXhwIjogIjE2MDAxMzk1MDIiLCAianRpIjogIiJ9.b1ld_2XL8Up3tixwNdMnoFVpY9IekL_i_tUVXZeqdtwk_MYt_FzTPNJhynUXW4W7jkG5TXvhgdryl7ibO-gfvDrCUdBDS94YPCcKkz0UC3zlXOXBsvtVoyKCZKlYQiG0fEVAUa3X-UFQMTbw2ZajzXSqfSYxrL6JHKYPebmaGw5OeCNrri7m1qa_Ii0SX1OCZDWgEsULXxe2_eJy1skUzUj7qxfZRZUYJ-0iFEUtXgTZQWU2VCw4KHQNb53NF5hvd-TUN38HH5c4WwoJGsXUby9rL2_xVdIwoEbL3AIDE4pSqDki0KnhRnFKYteI1sdL_44gb4Q8eJokNf-gPmwKNw


// RUN
$ java -jar target/jwt-1.0-SNAPSHOT-jar-with-dependencies.jar  

References:
 https://help.salesforce.com/articleView?id=remoteaccess_oauth_jwt_flow.htm&type=5

    */
  }
}

```
<a name="demo"></a>

### Demo

```
$ java -jar target/jwt-1.0-SNAPSHOT-jar-with-dependencies.jar  
```

```json
{
  "access_token": "00D3h000007R1Lu!JUNKnxtF_FrKKfJLOx6glLwSaH6LI8UgoedOIgW0embYBrKXoX1a4lQIjGGpOpo04oc7ZX6eUFrdkeJS0vyvn23rQ2K9Es",
  "scope": "web api id",
  "instance_url": "https://mohansun-ea-02-dev-ed.my.salesforce.com",
  "id": "https://login.salesforce.com/id/00D3h000007R1LuEAK/0053h000002xQ5sAAE",
  "token_type": "Bearer"
}
{
  "datasets": [
    {
      "clientShardsUrl": "/services/data/v49.0/wave/datasets/0Fb3h0000005Yz0CAE/shards",
      "createdBy": {
        "id": "0053h000002xQ5sAAE",
        "name": "Mohan Chinnappan",
        "profilePhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/T"
      },
      "createdDate": "2020-08-27T22:02:56.000Z",
      "currentVersionId": "0Fc3h000002umTfCAI",
      "currentVersionUrl": "/services/data/v49.0/wave/datasets/0Fb3h0000005Yz0CAE/versions/0Fc3h000002umTfCAI",
      "dataRefreshDate": "2020-08-27T22:03:18.000Z",
      "datasetType": "default",
      "description": "Created from the ea-s3-r recipe.",
      "folder": {
        "id": "0053h000002xQ5sAAE",
        "label": "Mohan Chinnappan"
      },
      "id": "0Fb3h0000005Yz0CAE",
      "label": "ea-s3-r",
      "lastAccessedDate": "2020-09-04T11:45:12.000Z",
      "lastModifiedBy": {
        "id": "0053h000003de6bAAA",
        "name": "Integration User",
        "profilePhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/T"
      },
      "lastModifiedDate": "2020-08-27T22:03:19.000Z",
      "lastQueriedDate": "2020-08-28T00:02:59.000Z",
      "name": "ea_s3_r",
      "permissions": {
        "create": true,
        "manage": true,
        "modify": true,
        "view": true
      },
      "type": "dataset",
      "url": "/services/data/v49.0/wave/datasets/0Fb3h0000005Yz0CAE",
      "versionsUrl": "/services/data/v49.0/wave/datasets/0Fb3h0000005Yz0CAE/versions"
    },
    {
      "clientShardsUrl": "/services/data/v49.0/wave/datasets/0Fb3h0000008sAECAY/shards",
      "createdBy": {
        "id": "0053h000002xQ5sAAE",
        "name": "Mohan Chinnappan",
        "profilePhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/T"
      },
      "createdDate": "2020-07-14T11:30:41.000Z",
      "currentVersionId": "0Fc3h0000026QMACA2",
      "currentVersionUrl": "/services/data/v49.0/wave/datasets/0Fb3h0000008sAECAY/versions/0Fc3h0000026QMACA2",
      "dataRefreshDate": "2020-07-14T11:31:03.000Z",
      "datasetType": "default",
      "folder": {
        "id": "0053h000002xQ5sAAE",
        "label": "Mohan Chinnappan"
      },
      "id": "0Fb3h0000008sAECAY",
      "label": "fruit-yield-acct",
      "lastAccessedDate": "2020-09-04T11:21:06.000Z",
      "lastModifiedBy": {
        "id": "0053h000003de6bAAA",
        "name": "Integration User",
        "profilePhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/T"
      },
      "lastModifiedDate": "2020-07-14T11:31:04.000Z",
      "lastQueriedDate": "2020-09-04T11:20:31.000Z",
      "name": "fruit_yield_acct",
      "permissions": {
        "create": true,
        "manage": true,
        "modify": true,
        "view": true
      },
      "type": "dataset",
      "url": "/services/data/v49.0/wave/datasets/0Fb3h0000008sAECAY",
      "versionsUrl": "/services/data/v49.0/wave/datasets/0Fb3h0000008sAECAY/versions"
    },
    {
      "clientShardsUrl": "/services/data/v49.0/wave/datasets/0Fb3h0000008spECAQ/shards",
      "createdBy": {
        "id": "0053h000002xQ5sAAE",
        "name": "Mohan Chinnappan",
        "profilePhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/T"
      },
      "createdDate": "2020-07-15T18:10:09.000Z",
      "currentVersionId": "0Fc3h0000026e3aCAA",
      "currentVersionUrl": "/services/data/v49.0/wave/datasets/0Fb3h0000008spECAQ/versions/0Fc3h0000026e3aCAA",
      "dataRefreshDate": "2020-07-15T18:10:31.000Z",
      "datasetType": "default",
      "folder": {
        "id": "0053h000002xQ5sAAE",
        "label": "Mohan Chinnappan"
      },
      "id": "0Fb3h0000008spECAQ",
      "label": "mycustomers",
      "lastAccessedDate": "2020-08-23T18:53:47.000Z",
      "lastModifiedBy": {
        "id": "0053h000003de6bAAA",
        "name": "Integration User",
        "profilePhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/T"
      },
      "lastModifiedDate": "2020-09-15T15:30:18.000Z",
      "lastQueriedDate": "2020-08-23T18:53:48.000Z",
      "name": "mycustomers",
      "permissions": {
        "create": true,
        "manage": true,
        "modify": true,
        "view": true
      },
      "type": "dataset",
      "url": "/services/data/v49.0/wave/datasets/0Fb3h0000008spECAQ",
      "versionsUrl": "/services/data/v49.0/wave/datasets/0Fb3h0000008spECAQ/versions"
    },
    {
      "clientShardsUrl": "/services/data/v49.0/wave/datasets/0Fb3h0000008ryVCAQ/shards",
      "createdBy": {
        "id": "0053h000002xQ5sAAE",
        "name": "Mohan Chinnappan",
        "profilePhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/T"
      },
      "createdDate": "2020-07-13T19:30:57.000Z",
      "currentVersionId": "0Fc3h0000026KlGCAU",
      "currentVersionUrl": "/services/data/v49.0/wave/datasets/0Fb3h0000008ryVCAQ/versions/0Fc3h0000026KlGCAU",
      "dataRefreshDate": "2020-07-15T16:56:26.000Z",
      "datasetType": "default",
      "folder": {
        "id": "00l3h000001NosUAAS",
        "label": "My DTC Sales",
        "name": "My_DTC_Sales",
        "url": "/services/data/v49.0/wave/folders/00l3h000001NosUAAS"
      },
      "id": "0Fb3h0000008ryVCAQ",
      "label": "DTC Opportunity",
      "lastAccessedDate": "2020-07-15T18:10:38.000Z",
      "lastModifiedBy": {
        "id": "0053h000003de6dAAA",
        "name": "Security User",
        "profilePhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/T"
      },
      "lastModifiedDate": "2020-07-15T16:56:26.000Z",
      "lastQueriedDate": "2020-07-15T16:56:26.000Z",
      "name": "DTC_Opportunity_SAMPLE",
      "permissions": {
        "create": true,
        "manage": true,
        "modify": true,
        "view": true
      },
      "type": "dataset",
      "url": "/services/data/v49.0/wave/datasets/0Fb3h0000008ryVCAQ",
      "versionsUrl": "/services/data/v49.0/wave/datasets/0Fb3h0000008ryVCAQ/versions"
    },
    {
      "clientShardsUrl": "/services/data/v49.0/wave/datasets/0Fb3h0000008ryTCAQ/shards",
      "createdBy": {
        "id": "0053h000002xQ5sAAE",
        "name": "Mohan Chinnappan",
        "profilePhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/T"
      },
      "createdDate": "2020-07-13T19:30:57.000Z",
      "currentVersionId": "0Fc3h0000026KlECAU",
      "currentVersionUrl": "/services/data/v49.0/wave/datasets/0Fb3h0000008ryTCAQ/versions/0Fc3h0000026KlECAU",
      "dataRefreshDate": "2020-02-26T21:15:34.000Z",
      "datasetType": "default",
      "folder": {
        "id": "00l3h000001NosRAAS",
        "label": "The Motivator",
        "name": "The_Motivator",
        "url": "/services/data/v49.0/wave/folders/00l3h000001NosRAAS"
      },
      "id": "0Fb3h0000008ryTCAQ",
      "label": "Activities",
      "lastAccessedDate": "2020-07-15T16:55:53.000Z",
      "lastModifiedBy": {
        "id": "0053h000003de6bAAA",
        "name": "Integration User",
        "profilePhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/T"
      },
      "lastModifiedDate": "2020-02-26T21:15:35.000Z",
      "lastQueriedDate": "2020-07-15T16:55:54.000Z",
      "name": "activity",
      "permissions": {
        "create": true,
        "manage": true,
        "modify": true,
        "view": true
      },
      "type": "dataset",
      "url": "/services/data/v49.0/wave/datasets/0Fb3h0000008ryTCAQ",
      "versionsUrl": "/services/data/v49.0/wave/datasets/0Fb3h0000008ryTCAQ/versions"
    },
    {
      "clientShardsUrl": "/services/data/v49.0/wave/datasets/0Fb3h0000008sotCAA/shards",
      "createdBy": {
        "id": "0053h000002xQ5sAAE",
        "name": "Mohan Chinnappan",
        "profilePhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/T"
      },
      "createdDate": "2020-07-15T15:18:17.000Z",
      "currentVersionId": "0Fc3h0000026d2LCAQ",
      "currentVersionUrl": "/services/data/v49.0/wave/datasets/0Fb3h0000008sotCAA/versions/0Fc3h0000026d2LCAQ",
      "dataRefreshDate": "2020-07-15T15:18:39.000Z",
      "datasetType": "default",
      "folder": {
        "id": "0053h000002xQ5sAAE",
        "label": "Mohan Chinnappan"
      },
      "id": "0Fb3h0000008sotCAA",
      "label": "myfruits",
      "lastAccessedDate": "2020-07-15T16:46:59.000Z",
      "lastModifiedBy": {
        "id": "0053h000003de6bAAA",
        "name": "Integration User",
        "profilePhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/T"
      },
      "lastModifiedDate": "2020-07-15T15:18:40.000Z",
      "lastQueriedDate": "2020-07-15T16:47:00.000Z",
      "name": "myfruits",
      "permissions": {
        "create": true,
        "manage": true,
        "modify": true,
        "view": true
      },
      "type": "dataset",
      "url": "/services/data/v49.0/wave/datasets/0Fb3h0000008sotCAA",
      "versionsUrl": "/services/data/v49.0/wave/datasets/0Fb3h0000008sotCAA/versions"
    },
    {
      "clientShardsUrl": "/services/data/v49.0/wave/datasets/0Fb3h0000008s9kCAA/shards",
      "createdBy": {
        "id": "0053h000002xQ5sAAE",
        "name": "Mohan Chinnappan",
        "profilePhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/T"
      },
      "createdDate": "2020-07-14T10:51:37.000Z",
      "currentVersionId": "0Fc3h0000026QBWCA2",
      "currentVersionUrl": "/services/data/v49.0/wave/datasets/0Fb3h0000008s9kCAA/versions/0Fc3h0000026QBWCA2",
      "dataRefreshDate": "2020-07-14T10:52:00.000Z",
      "datasetType": "default",
      "folder": {
        "id": "0053h000002xQ5sAAE",
        "label": "Mohan Chinnappan"
      },
      "id": "0Fb3h0000008s9kCAA",
      "label": "fruit-yield",
      "lastAccessedDate": "2020-07-14T11:14:38.000Z",
      "lastModifiedBy": {
        "id": "0053h000003de6bAAA",
        "name": "Integration User",
        "profilePhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/T"
      },
      "lastModifiedDate": "2020-07-14T10:52:00.000Z",
      "lastQueriedDate": "2020-07-14T11:06:45.000Z",
      "name": "fruit_yield",
      "permissions": {
        "create": true,
        "manage": true,
        "modify": true,
        "view": true
      },
      "type": "dataset",
      "url": "/services/data/v49.0/wave/datasets/0Fb3h0000008s9kCAA",
      "versionsUrl": "/services/data/v49.0/wave/datasets/0Fb3h0000008s9kCAA/versions"
    },
    {
      "clientShardsUrl": "/services/data/v49.0/wave/datasets/0Fb3h0000008s9uCAA/shards",
      "createdBy": {
        "id": "0053h000002xQ5sAAE",
        "name": "Mohan Chinnappan",
        "profilePhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/T"
      },
      "createdDate": "2020-07-14T10:57:37.000Z",
      "dataRefreshDate": "2020-07-14T10:57:37.000Z",
      "datasetType": "default",
      "folder": {
        "id": "00l3h000001NosSAAS",
        "label": "Shared App",
        "name": "SharedApp",
        "url": "/services/data/v49.0/wave/folders/00l3h000001NosSAAS"
      },
      "id": "0Fb3h0000008s9uCAA",
      "label": "regFruitYield",
      "lastAccessedDate": "2020-07-14T11:00:13.000Z",
      "lastModifiedBy": {
        "id": "0053h000002xQ5sAAE",
        "name": "Mohan Chinnappan",
        "profilePhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/T"
      },
      "lastModifiedDate": "2020-07-14T10:57:37.000Z",
      "name": "regFruitYield",
      "permissions": {
        "create": true,
        "manage": true,
        "modify": true,
        "view": true
      },
      "type": "dataset",
      "url": "/services/data/v49.0/wave/datasets/0Fb3h0000008s9uCAA",
      "versionsUrl": "/services/data/v49.0/wave/datasets/0Fb3h0000008s9uCAA/versions"
    },
    {
      "clientShardsUrl": "/services/data/v49.0/wave/datasets/0Fb3h0000008ryhCAA/shards",
      "createdBy": {
        "id": "0053h000002xQ5sAAE",
        "name": "Mohan Chinnappan",
        "profilePhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/T"
      },
      "createdDate": "2020-07-13T19:30:57.000Z",
      "currentVersionId": "0Fc3h0000026KlSCAU",
      "currentVersionUrl": "/services/data/v49.0/wave/datasets/0Fb3h0000008ryhCAA/versions/0Fc3h0000026KlSCAU",
      "dataRefreshDate": "2018-12-05T15:56:00.000Z",
      "datasetType": "default",
      "folder": {
        "id": "00l3h000001NosQAAS",
        "label": "ABC Seed",
        "name": "ABC_Seed",
        "url": "/services/data/v49.0/wave/folders/00l3h000001NosQAAS"
      },
      "id": "0Fb3h0000008ryhCAA",
      "label": "Fundraising Opportunities",
      "lastModifiedBy": {
        "id": "0053h000003de6dAAA",
        "name": "Security User",
        "profilePhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/T"
      },
      "lastModifiedDate": "2018-12-05T16:29:31.000Z",
      "lastQueriedDate": "2020-02-26T20:57:46.000Z",
      "name": "ABC_Seed_Opportunities",
      "permissions": {
        "create": true,
        "manage": true,
        "modify": true,
        "view": true
      },
      "type": "dataset",
      "url": "/services/data/v49.0/wave/datasets/0Fb3h0000008ryhCAA",
      "versionsUrl": "/services/data/v49.0/wave/datasets/0Fb3h0000008ryhCAA/versions"
    },
    {
      "clientShardsUrl": "/services/data/v49.0/wave/datasets/0Fb3h0000008ryUCAQ/shards",
      "createdBy": {
        "id": "0053h000002xQ5sAAE",
        "name": "Mohan Chinnappan",
        "profilePhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/T"
      },
      "createdDate": "2020-07-13T19:30:57.000Z",
      "currentVersionId": "0Fc3h0000026KlFCAU",
      "currentVersionUrl": "/services/data/v49.0/wave/datasets/0Fb3h0000008ryUCAQ/versions/0Fc3h0000026KlFCAU",
      "dataRefreshDate": "2020-02-26T21:15:34.000Z",
      "datasetType": "default",
      "folder": {
        "id": "00l3h000001NosRAAS",
        "label": "The Motivator",
        "name": "The_Motivator",
        "url": "/services/data/v49.0/wave/folders/00l3h000001NosRAAS"
      },
      "id": "0Fb3h0000008ryUCAQ",
      "label": "Users",
      "lastModifiedBy": {
        "id": "0053h000003de6bAAA",
        "name": "Integration User",
        "profilePhotoUrl": "https://mohansun-ea-02-dev-ed--c.documentforce.com/profilephoto/005/T"
      },
      "lastModifiedDate": "2020-02-26T21:15:35.000Z",
      "lastQueriedDate": "2020-02-26T21:18:34.000Z",
      "name": "user",
      "permissions": {
        "create": true,
        "manage": true,
        "modify": true,
        "view": true
      },
      "type": "dataset",
      "url": "/services/data/v49.0/wave/datasets/0Fb3h0000008ryUCAQ",
      "versionsUrl": "/services/data/v49.0/wave/datasets/0Fb3h0000008ryUCAQ/versions"
    }
  ],
  "nextPageUrl": null,
  "totalSize": 10,
  "url": "/services/data/v49.0/wave/datasets"
}
```
<a name='capp'></a>
### Connected App
![connected app](img/jwt-flow-app-2.png)
