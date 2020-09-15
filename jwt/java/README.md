## JWT flow in java

### Code  and steps
```java

package org.mohansun.jwt;

import org.apache.commons.codec.binary.Base64;
import java.io.*; 
import java.security.*; 
import java.text.MessageFormat;  

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

      //Create the JWT Claims Object
      String[] claimArray = new String[5];
      claimArray[0] = "3MVG99OxTyEMCQ3gNp2PjkqeZKxnmAiG1xV4oHh9AKL_rSK.BoSVPGZHQukXnVjzRgSuQqGn75NL7yfkQcyy7"; // Consumer Key
      claimArray[1] = "your@email.com"; //subject - your email-id
      claimArray[2] = "https://login.salesforce.com"; // or https://test.salesforce.com for sandboxes
      claimArray[3] = Long.toString( ( System.currentTimeMillis()/1000 ) + 300); // expiration
      claimArray[4]= ""; //Use of this claim (jti) is OPTIONAL.

      MessageFormat claims;
      claims = new MessageFormat(claimTemplate);
      String payload = claims.format(claimArray);

      //Add the encoded claims object
      token.append(Base64.encodeBase64URLSafeString(payload.getBytes("UTF-8")));

      //Load the private key from a keystore - put path for the keystore.jks
      KeyStore keystore = KeyStore.getInstance("JKS");
      /*
        How to create java keystore (jks)?
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

      System.out.println(token.toString());

    } catch (Exception e ) {
        e.printStackTrace();
    }

    /*
     make executable jar:
     $ mvn clean compile assembly:single
     run:
     $ java -jar target/jwt-1.0-SNAPSHOT-jar-with-dependencies.jar 
     eyJhbGciOiJSUzI1NiJ9.eyJpc3MiOiAiM01WRzk5T3hUeUVNQ1EzZ05wMlBqa3FlWkt4bm1BaUcxeFY0b0hoOUFLTF9yU0suQm9TVlBHWkhRdWtYblZqelJnU3VRcUduNzVOTDd5ZmtRY3l5NyIsICJzdWIiOiAieW91ckBlbWFpbC5jb20iLCAiYXVkIjogImh0dHBzOi8vbG9naW4uc2FsZXNmb3JjZS5jb20iLCAiZXhwIjogIjE2MDAxMzk1MDIiLCAianRpIjogIiJ9.b1ld_2XL8Up3tixwNdMnoFVpY9IekL_i_tUVXZeqdtwk_MYt_FzTPNJhynUXW4W7jkG5TXvhgdryl7ibO-gfvDrCUdBDS94YPCcKkz0UC3zlXOXBsvtVoyKCZKlYQiG0fEVAUa3X-UFQMTbw2ZajzXSqfSYxrL6JHKYPebmaGw5OeCNrri7m1qa_Ii0SX1OCZDWgEsULXxe2_eJy1skUzUj7qxfZRZUYJ-0iFEUtXgTZQWU2VCw4KHQNb53NF5hvd-TUN38HH5c4WwoJGsXUby9rL2_xVdIwoEbL3AIDE4pSqDki0KnhRnFKYteI1sdL_44gb4Q8eJokNf-gPmwKNw


    */

    /*
     Next Steps
     
     you got the JWT bearer token as shown above (let us call it JWTBT)

     Now POST it to:  https://login.salesforce.com/services/oauth2/token HTTP/1.1 as shown below:

POST /services/oauth2/token HTTP/1.1
Host: login.salesforce.com
Content-Type: application/x-www-form-urlencoded

grant_type= urn:ietf:params:oauth:grant-type:jwt-bearer&
assertion=JWTBT (that you got from above)

-----

Salesforce will provide response similar to this:

{'access_token': '00D3h000007R1Lu!JUNKGRSTCy.ZrUnaohvV7dc.90kFGJ_aYwoWlPTpRhuM.r6i0x3eN7.weqYjzibxyeZraOoURMo.NpNDIZSp7F6JJy7hym_', 'scope': 'web id api', 'instance_url': 'https://mohansun-ea-02-dev-ed.my.salesforce.com', 'id': 'https://login.salesforce.com/id/00D3h000007R1LuEAK/0053h000002xQ5sAAE', 'token_type': 'Bearer'}


-----

Use the access_token  as a bearer token in the Authorization header request to access protected data in Salesforce.

ref: https://help.salesforce.com/articleView?id=remoteaccess_oauth_jwt_flow.htm&type=5

    */
  }
}

```
