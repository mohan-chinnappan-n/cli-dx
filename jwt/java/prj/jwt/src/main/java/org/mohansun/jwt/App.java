package org.mohansun.jwt;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.cli.*;

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
import java.net.URLEncoder;
 

public class App {
  public static void main(String[] args) {
    String header = "{\"alg\":\"RS256\"}";
    // String claimTemplate5 = "'{'\"iss\": \"{0}\", \"sub\": \"{1}\", \"aud\": \"{2}\", \"exp\": \"{3}\", \"jti\": \"{4}\"'}'";
    String claimTemplate = "'{'\"iss\": \"{0}\", \"sub\": \"{1}\", \"aud\": \"{2}\", \"exp\": \"{3}\"'}'";
  try {

      // let us read the CLI args 
      final Options options = new Options();
      options.addOption(new Option("p", "property", true, "jwt property file"));
      HelpFormatter formatter = new HelpFormatter();
      CommandLineParser cmdParser = new DefaultParser();
      CommandLine cmd = cmdParser.parse( options, args);
      String propertyFile = cmd.getOptionValue("p");
      if(cmd.hasOption("p")) {
         propertyFile = cmd.getOptionValue("p");
      } else {
          formatter.printHelp("jwt", options);
          System.exit(0);
      }
   

    // read jwt.properties file
    FileReader reader=new FileReader(propertyFile);  
    Properties props = new Properties();  
    props.load(reader); 
    String consumerKey = props.getProperty("consumerKey"); 
    String subject = props.getProperty("subject");
    Boolean sandbox = Boolean.parseBoolean(props.getProperty("sandbox")); 
    Integer expiration = Integer.parseInt(props.getProperty("expiration")); 

 
      
    StringBuffer token = new StringBuffer();

    //Encode the JWT Header and add it to our string to sign
    token.append(Base64.encodeBase64URLSafeString(header.getBytes("UTF-8")));

    //Separate with a period
    token.append("."); 
    
    Date date = new Date();
    long ms = date.getTime(); 


    //Create the JWT Claims Object
    String[] claimArray = new String[4];
    claimArray[0] = consumerKey; // Consumer Key from the Salesforce connected app
    claimArray[1] = subject; //subject - your user-id - you should have authorized this user to access the connected app
    claimArray[2] =  sandbox ? "https://test.salesforce.com" : "https://login.salesforce.com"; // or https://test.salesforce.com for sandboxes
    claimArray[3] = Long.toString( ( System.currentTimeMillis()/1000 ) + expiration); // expiration
    //claimArray[4]= "JWT" + ms ; //Use of this claim (jti) is OPTIONAL. //UUID can be used

    MessageFormat claims;
    claims = new MessageFormat(claimTemplate);
    String payload = claims.format(claimArray);

    //Add the encoded claims object
    token.append(Base64.encodeBase64URLSafeString(payload.getBytes("UTF-8")));

    //Load the private key from a keystore - put path for the keystore.jks
    KeyStore keystore = KeyStore.getInstance("JKS");

    String jksPassword = props.getProperty("jksPassword"); 
    String jksFilename = props.getProperty("jksFilename"); 
    String privateKeyAlias = props.getProperty("privateKeyAlias"); 



    // STEP-1: Get JWT Assertion
    keystore.load(new FileInputStream(jksFilename), jksPassword.toCharArray());
    PrivateKey privateKey = (PrivateKey) keystore.getKey(privateKeyAlias, jksPassword.toCharArray());

    //Sign the JWT Header + "." + JWT Claims Object
    Signature signature = Signature.getInstance("SHA256withRSA");
    signature.initSign(privateKey); // sign it with the given privateKey
    signature.update(token.toString().getBytes("UTF-8"));
    String signedPayload = Base64.encodeBase64URLSafeString(signature.sign());
    //Separate with a period
    token.append(".");
    //Add the encoded signature
    token.append(signedPayload);


    // STEP-2:  POST the assertion(token) to get the access token

    HttpClient client = HttpClient.newHttpClient();
    String grantType = "urn:ietf:params:oauth:grant-type:jwt-bearer";
    HttpRequest request = HttpRequest.newBuilder()
            .uri(URI.create(claimArray[2] + "/services/oauth2/token"))
            .header("Content-Type", "application/x-www-form-urlencoded")
            //.POST(HttpRequest.BodyPublishers.ofString(requestBody))
            .POST(HttpRequest.BodyPublishers.ofString(
            "grant_type=" + URLEncoder.encode(grantType, "UTF-8") +
            "&assertion=" + URLEncoder.encode(token.toString(), "UTF-8") 
            ))
            .build();
    HttpResponse<String> response = client.send(request,
            HttpResponse.BodyHandlers.ofString());

    // Parse the response to get access_token and instance_url
    String body = response.body();      
    JSONParser parser = new JSONParser();
    JSONObject obj = (JSONObject) parser.parse(body);		
    String accessToken = (String) obj.get("access_token");
    String instanceUrl = (String) obj.get("instance_url");
    System.out.println(obj);

    // STEP 3: use the access token to access Salesforce protected resource
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

    // POST platform event payload 
    String eventPayload =  "{ \"message__c\": \"Power Off\"}";
    restServiceURL = instanceUrl + "/services/data/v49.0/sobjects/Notification__e";
    getRequest = HttpRequest.newBuilder()
            .uri(URI.create(restServiceURL))
            .headers(
              "Content-Type", "application/json",
              "Authorization", "Bearer " + accessToken
            )
            .POST(HttpRequest.BodyPublishers.ofString(eventPayload ))
            .build();
    getResponse = client.send(getRequest,
            HttpResponse.BodyHandlers.ofString());
    System.out.println(getResponse.body());


    } 
    catch( ParseException exp ) {
        System.err.println( "Parsing failed.  Reason: " + exp.getMessage() );
    }
    catch (Exception e ) {
        e.printStackTrace();
    }

    /*
     make executable jar:
     $ mvn clean compile assembly:single
     run:
     $ java -jar target/jwt-1.0-SNAPSHOT-jar-with-dependencies.jar 
     eyJhbGciOiJSUzI1NiJ9.eyJpc3MiOiAiM01WRzk5T3hUeUVNQ1EzZ05wMlBqa3FlWkt4bm1BaUcxeFY0b0hoOUFLTF9yU0suQm9TVlBHWkhRdWtYblZqelJnU3VRcUduNzVOTDd5ZmtRY3l5NyIsICJzdWIiOiAieW91ckBlbWFpbC5jb20iLCAiYXVkIjogImh0dHBzOi8vbG9naW4uc2FsZXNmb3JjZS5jb20iLCAiZXhwIjogIjE2MDAxMzk1MDIiLCAianRpIjogIiJ9.b1ld_2XL8Up3tixwNdMnoFVpY9IekL_i_tUVXZeqdtwk_MYt_FzTPNJhynUXW4W7jkG5TXvhgdryl7ibO-gfvDrCUdBDS94YPCcKkz0UC3zlXOXBsvtVoyKCZKlYQiG0fEVAUa3X-UFQMTbw2ZajzXSqfSYxrL6JHKYPebmaGw5OeCNrri7m1qa_Ii0SX1OCZDWgEsULXxe2_eJy1skUzUj7qxfZRZUYJ-0iFEUtXgTZQWU2VCw4KHQNb53NF5hvd-TUN38HH5c4WwoJGsXUby9rL2_xVdIwoEbL3AIDE4pSqDki0KnhRnFKYteI1sdL_44gb4Q8eJokNf-gPmwKNw


    // USAGE and RUN
    // usage 
    $ java -jar target/jwt-1.0-SNAPSHOT-jar-with-dependencies.jar 
    usage: jwt
     -p,--property <arg>   jwt property file
  
    // run 
    $ java -jar target/jwt-1.0-SNAPSHOT-jar-with-dependencies.jar  -p <your jwt.properties file>
    References:
    https://help.salesforce.com/articleView?id=remoteaccess_oauth_jwt_flow.htm&type=5

    */
  }
}
