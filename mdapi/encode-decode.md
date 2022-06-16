# How encode and decode a file using base64 using DX

```
ls
securityPredicate-1.png
```

## Create a test zip file
```
zip securityPredicate-1.png.zip securityPredicate-1.png 
  adding: securityPredicate-1.png (deflated 4%)
```

## Encode this zip file using base64
```
sfdx mohanc:data:file:encode -d securityPredicate-1.png.zip 
```
```
=== Base64 encoded content of the file securityPredicate-1.png.zip will be written to securityPredicate-1.png.zip.txt ...
```
## View the encoded file

```
cat securityPredicate-1.png.zip.txt 
```

## Check our encoding with decode

```
sfdx mohanc:data:file:decode -d securityPredicate-1.png.zip.txt
```

```
=== Base64 decoded content of the file securityPredicate-1.png.zip.txt will be written to securityPredicate-1.png.zip.txt.dec ...
=== Writing  decoded file content to securityPredicate-1.png.zip.txt.dec ... 
```

## List the files 
```
ls -l
total 1032
-rw-r--r--@ 1 mchinnappan  staff  123316 Jun 16 13:35 securityPredicate-1.png
-rw-r--r--  1 mchinnappan  staff  118437 Jun 16 14:07 securityPredicate-1.png.zip
-rw-r--r--  1 mchinnappan  staff  157916 Jun 16 14:07 securityPredicate-1.png.zip.txt
-rw-r--r--  1 mchinnappan  staff  118437 Jun 16 14:08 securityPredicate-1.png.zip.txt.dec
```

## Check the decoded (zip file)
```
jar tvf securityPredicate-1.png.zip.txt.dec 
123316 Thu Jun 16 13:35:17 EDT 2022 securityPredicate-1.png
```

