import org.apache.commons.codec.binary.Base64;
import java.io.*; 
import java.security.*; 
import java.text.MessageFormat;  

public class JWTExample {

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
      claimArray[1] = "my@email.com"; //subject - your email-id
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
      keystore.load(new FileInputStream("./path/to/keystore.jks"), "keystorepassword".toCharArray());
      PrivateKey privateKey = (PrivateKey) keystore.getKey("certalias", "privatekeypassword".toCharArray());

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
  }
}
