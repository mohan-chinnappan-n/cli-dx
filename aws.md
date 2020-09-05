# AWS access via DX

## List S3 buckets

### Usage

- Make sure that you have aws_access_key_id and aws_secret_access_key are in the file  .aws/credentials as shown below 

```
$ cat ~/.aws/credentials 
[default]
aws_access_key_id =  YOUR_KEY_ID_HERE
aws_secret_access_key = YOUR_SECRET_ACCESS_KEY_HERE


## Windows
$ type C:\Users\USER_NAME\.aws\credentials  
[default]
aws_access_key_id =  YOUR_KEY_ID_HERE
aws_secret_access_key = YOUR_SECRET_ACCESS_KEY_HERE


```


```
$ sfdx mohanc:aws:s3:ls  -h
List AWS S3 buckets, bucket objects 

USAGE
  $ sfdx mohanc:aws:s3:ls

OPTIONS
  -b, --bucketname=bucketname                     Bucket Name
  --json                                          format output as json
  --loglevel=(trace|debug|info|warn|error|fatal)  logging level for this command invocation

EXAMPLE

       ** List AWS S3 buckets, bucket object  **

       sfdx mohanc:aws:s3:ls
       sfdx mohanc:aws:s3:ls -b <bucketname>
```

### Demo

```
$ sfdx mohanc:aws:s3:ls 
[
  { Name: 'bucketea1', CreationDate: 2020-08-27T21:12:09.000Z },
  { Name: 'bucketea2', CreationDate: 2020-09-02T15:48:14.000Z }
  }
]

```
![aws s3 ls](img/aws-s3-ls-1.png)


### Listing bucket objects

```
$ sfdx mohanc:aws:s3:ls  -b bucketea1
{
  IsTruncated: false,
  Marker: '',
  Contents: [
    {
      Key: 'ea_folder1/',
      LastModified: 2020-08-27T21:14:00.000Z,
      ETag: '"d41d8cd98f00b204e9800998ecf8427e"',
      Size: 0,
      StorageClass: 'STANDARD',
      Owner: [Object]
    },
    {
      Key: 'ea_folder1/fruits-yield.csv',
      LastModified: 2020-08-27T21:21:35.000Z,
      ETag: '"b87ae1c23b13eaa624384d4daea044bf"',
      Size: 189,
      StorageClass: 'STANDARD',
      Owner: [Object]
    },
    {
      Key: 'ea_folder1/schema_sample.csv',
      LastModified: 2020-08-27T21:57:55.000Z,
      ETag: '"6fda0df91493bff61859d2ca0d19c962"',
      Size: 35,
      StorageClass: 'STANDARD',
      Owner: [Object]
    }
  ],
  Name: 'bucketea1',
  Prefix: '',
  MaxKeys: 1000,
  CommonPrefixes: []
}

```
