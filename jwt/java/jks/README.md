# Java Key Store (JKS) Notes

## Question: I have server.key (private key) and server.crt (cert), like to import this into Java Key Store. What are the steps?



1. Let us list server.key and server.key
```
$ ls
-rw-r--r--  1 mchinnappan  wheel  1306 Sep 15 21:15 server.crt
-rw-r--r--@ 1 mchinnappan  wheel  1679 Sep 15 21:14 server.key

```
2. Let us convert the certificate and private key into a PKCS 12 (.p12) file,
```
$ openssl pkcs12 -export -in server.crt -inkey server.key -name mohansun -out server.p12
Enter Export Password:
Verifying - Enter Export Password:

$ ls -l
total 24
-rw-r--r--  1 mchinnappan  wheel  1306 Sep 15 21:15 server.crt
-rw-r--r--@ 1 mchinnappan  wheel  1679 Sep 15 21:14 server.key
-rw-r--r--  1 mchinnappan  wheel  2590 Sep 15 21:16 server.p12
```
3. Import server.p12 into server.jks using keytool
```
$ keytool -importkeystore  -destkeystore server.jks -srckeystore server.p12 -srcstoretype PKCS12
Importing keystore server.p12 to server.jks...
Enter destination keystore password:  
Re-enter new password: 
Enter source keystore password:  
Entry for alias mohansun successfully imported.
Import command completed:  1 entries successfully imported, 0 entries failed or cancelled
```

4. List the content of server.jks
```
$ keytool -list -v -keystore server.jks
Enter keystore password:  
Keystore type: PKCS12
Keystore provider: SUN

Your keystore contains 1 entry

Alias name: mohansun
Creation date: Sep 15, 2020
Entry type: PrivateKeyEntry
Certificate chain length: 1
Certificate[1]:
Owner: EMAILADDRESS=mohan.chinnappan.n@gmail.com, CN=mohansun, OU=dev, O=Mohansun, L=Nashua, ST=NH, C=US
Issuer: EMAILADDRESS=mohan.chinnappan.n@gmail.com, CN=mohansun, OU=dev, O=Mohansun, L=Nashua, ST=NH, C=US
Serial number: cf76a559cfef46cb
Valid from: Wed Sep 02 06:31:07 EDT 2020 until: Thu Sep 02 06:31:07 EDT 2021
Certificate fingerprints:
	 SHA1: CC:7E:84:25:4C:74:BF:FC:D9:57:92:25:C8:37:73:72:D9:22:CC:A3
	 SHA256: F4:91:55:84:21:C8:92:40:42:BB:BB:02:E7:14:45:6E:08:76:66:D9:54:D0:1A:CE:CE:43:02:F5:62:02:1A:71
Signature algorithm name: SHA256withRSA
Subject Public Key Algorithm: 2048-bit RSA key
Version: 1


*******************************************
*******************************************

```
5. How I can access this jks in JWT java code

```java
//...
 keystore.load(new FileInputStream("/Users/mchinnappan/.jks/server.jks"), mypwd.toCharArray());
 PrivateKey privateKey = (PrivateKey) keystore.getKey("mohansun", mypwd.toCharArray());
//...
```
