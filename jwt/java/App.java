package org.mohansun.jwt;

import org.apache.commons.codec.binary.Base64;
import java.io.*; 
import java.security.*; 
import java.text.MessageFormat;
import java.util.*;



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
    String claimTemplate = "'{'\"iss\": \"{0}\", \"sub\": \"{1}\", \"aud\": \"{2}\", \"exp\": \"{3}\", \"jti\": \"{4}\"'}'";

    try {
      StringBuffer token = new StringBuffer();

      //Encode the JWT Header and add it to our string to sign
      token.append(Base64.encodeBase64URLSafeString(header.getBytes("UTF-8")));

      //Separate with a period
      token.append("."); 
      
      Date date = new Date();
      long ms = date.getTime(); 


      //Create the JWT Claims Object
      String[] claimArray = new String[5];
      claimArray[0] = "3MVG9Kip4IKAZQEX4gZDQcUI7ag0sMF7OJIp5gIqWJiSyv7WxbWnnEqdrWI18r0boHvw5KNY05SS3Npc_XXX"; // Consumer Key
      claimArray[1] = "mohan.chinnappan.n_ea2@gmail.com"; //subject - your user-id
      claimArray[2] = "https://login.salesforce.com"; // or https://test.salesforce.com for sandboxes
      claimArray[3] = Long.toString( ( System.currentTimeMillis()/1000 ) + 300); // expiration
      claimArray[4]= "JWT" + ms ; //Use of this claim (jti) is OPTIONAL. //UUID can be used

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

    
    System.out.println(response.body());
    


    } catch (Exception e ) {
        e.printStackTrace();
    }

    /*
     make executable jar:
     $ mvn clean compile assembly:single
     run:
     $ java -jar target/jwt-1.0-SNAPSHOT-jar-with-dependencies.jar 
     eyJhbGciOiJSUzI1NiJ9.eyJpc3MiOiAiM01WRzk5T3hUeUVNQ1EzZ05wMlBqa3FlWkt4bm1BaUcxeFY0b0hoOUFLTF9yU0suQm9TVlBHWkhRdWtYblZqelJnU3VRcUduNzVOTDd5ZmtRY3l5NyIsICJzdWIiOiAieW91ckBlbWFpbC5jb20iLCAiYXVkIjogImh0dHBzOi8vbG9naW4uc2FsZXNmb3JjZS5jb20iLCAiZXhwIjogIjE2MDAxMzk1MDIiLCAianRpIjogIiJ9.b1ld_2XL8Up3tixwNdMnoFVpY9IekL_i_tUVXZeqdtwk_MYt_FzTPNJhynUXW4W7jkG5TXvhgdryl7ibO-gfvDrCUdBDS94YPCcKkz0UC3zlXOXBsvtVoyKCZKlYQiG0fEVAUa3X-UFQMTbw2ZajzXSqfSYxrL6JHKYPebmaGw5OeCNrri7m1qa_Ii0SX1OCZDWgEsULXxe2_eJy1skUzUj7qxfZRZUYJ-0iFEUtXgTZQWU2VCw4KHQNb53NF5hvd-TUN38HH5c4WwoJGsXUby9rL2_xVdIwoEbL3AIDE4pSqDki0KnhRnFKYteI1sdL_44gb4Q8eJokNf-gPmwKNw


   // Demo
     


$ java -jar target/jwt-1.0-SNAPSHOT-jar-with-dependencies.jar  
{
  "access_token": "00D3h000007R1Lu!AR0AQDnxtF_JUNKKfJLOx6glLwSaH6LI8UgoedOIgW0embYBrKXoX1a4lQIjGGpOpo04oc7ZX6eUFrdkeJS0vyvn23rQ2K9Es",
  "scope": "web api id",
  "instance_url": "https://mohansun-ea-02-dev-ed.my.salesforce.com",
  "id": "https://login.salesforce.com/id/00D3h000007R1LuEAK/0053h000002xQ5sAAE",
  "token_type": "Bearer"
}


NEXT STEP:
Use the access_token  as a bearer token in the Authorization header request to access protected data in Salesforce.

References:
 https://help.salesforce.com/articleView?id=remoteaccess_oauth_jwt_flow.htm&type=5

    */
  }
}
