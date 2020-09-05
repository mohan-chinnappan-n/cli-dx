# AWS access via DX

### Topics
- [List S3 Buckets](#ls)
- [List S3 Bucket Objects](#lsbo)
- [Create S3 Bucket](#mb)


<a name="ls"></a>
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

<a name="lbo"></a>
## Listing bucket objects

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
<a name="mb"></a>
## Create a bucket

### Usage
```
Create AWS S3 buckets 

USAGE
  $ sfdx mohanc:aws:s3:mb

OPTIONS
  -b, --bucketname=bucketname                     Bucket Name to create
  --json                                          format output as json
  --loglevel=(trace|debug|info|warn|error|fatal)  logging level for this command invocation

EXAMPLE

       ** Create AWS S3 buckets  **

       sfdx mohanc:aws:s3:mb -b <bucketname>

       if bucketname is empty it will create a bucket in the format:
       mybuk-<UUID>

```

### Demo
```
$ sfdx mohanc:aws:s3:mb -b fruits
bucketname: fruits-790f15af-0986-48f3-8c61-fb5f84a9f9eb
{ Location: '/fruits-790f15af-0986-48f3-8c61-fb5f84a9f9eb' }
~/sfdx/sfdx-mohanc-plugins:
$ sfdx mohanc:aws:s3:ls
[
  { Name: 'bucketea1', CreationDate: 2020-08-27T21:12:09.000Z },
  { Name: 'bucketea2', CreationDate: 2020-09-02T15:48:14.000Z },
  {
    Name: 'fruits-790f15af-0986-48f3-8c61-fb5f84a9f9eb',
    CreationDate: 2020-09-05T12:54:54.000Z
  }
]


```
