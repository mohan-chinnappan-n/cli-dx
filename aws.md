# AWS access via DX

### Topics
- [List S3 Buckets](#ls)
- [List S3 Bucket Objects](#lsbo)
- [Create S3 Bucket](#mb)
- [Delete S3 Bucket](#rb)
- [Upload a file into S3 Bucket](#upload)


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

<a name="lsbo"></a>
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
Create AWS S3 bucket 

USAGE
  $ sfdx mohanc:aws:s3:mb

OPTIONS
  -b, --bucketname=bucketname                     Bucket Name to create
  --json                                          format output as json
  --loglevel=(trace|debug|info|warn|error|fatal)  logging level for this command invocation

EXAMPLE

       ** Create AWS S3 bucket  **

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

<a name='rb'></a>

## Delete a S3 Bucket
### Usage
```
$ sfdx mohanc:aws:s3:rb -h
Delete AWS S3 bucket 

USAGE
  $ sfdx mohanc:aws:s3:rb

OPTIONS
  -b, --bucketname=bucketname                     Bucket Name to delete
  --json                                          format output as json
  --loglevel=(trace|debug|info|warn|error|fatal)  logging level for this command invocation

EXAMPLE

       ** Delete AWS S3 bucket  **

       sfdx mohanc:aws:s3:rb -b <bucketname>

```

### Demo
```
## List 
$ sfdx mohanc:aws:s3:ls
[
  { Name: 'bucketea1', CreationDate: 2020-08-27T21:12:09.000Z },
  { Name: 'bucketea2', CreationDate: 2020-09-02T15:48:14.000Z },
  {
    Name: 'fruits-790f15af-0986-48f3-8c61-fb5f84a9f9eb',
    CreationDate: 2020-09-05T12:54:54.000Z
  },
  {
    Name: 'veggie-4245ddc6-e5b9-4971-9533-9e98c8d2d96e',
    CreationDate: 2020-09-05T13:03:44.000Z
  }
]

## Delete
$ sfdx mohanc:aws:s3:rb -b veggie-4245ddc6-e5b9-4971-9533-9e98c8d2d96e
delete bucketname: veggie-4245ddc6-e5b9-4971-9533-9e98c8d2d96e
{}

## List again
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

<a name='upload'></a>
## Upload a file into S3 Bucket

### Usage
```
$ sfdx mohanc:aws:s3:upload -h
Upload a file into a AWS S3 bucket 

USAGE
  $ sfdx mohanc:aws:s3:upload

OPTIONS
  -b, --bucketname=bucketname                     Bucket Name
  -f, --foldername=foldername                     Folder Name (optional)
  -i, --inputfilename=inputfilename               Input filename to upload
  --json                                          format output as json
  --loglevel=(trace|debug|info|warn|error|fatal)  logging level for this command invocation

EXAMPLE

       ** Upload a file into a AWS S3 bucket  **

       sfdx mohanc:aws:s3:upload -b <bucketname> -f [folderName] -i <inputFileName> 


     
```

### Demo

```
## List the buckets
$ sfdx mohanc:aws:s3:ls
[
  { Name: 'bucketea1', CreationDate: 2020-08-27T21:12:09.000Z },
  { Name: 'bucketea2', CreationDate: 2020-09-02T15:48:14.000Z },
  {
    Name: 'fruits-790f15af-0986-48f3-8c61-fb5f84a9f9eb',
    CreationDate: 2020-09-05T12:54:54.000Z
  }
]

## Upload into the bucket: fruits-790f15af-0986-48f3-8c61-fb5f84a9f9eb and the folder mydata
$ sfdx mohanc:aws:s3:upload -b fruits-790f15af-0986-48f3-8c61-fb5f84a9f9eb -f mydata -i ~/bulkapi/dx/data/fruits-2.csv 
Upload Success: https://fruits-790f15af-0986-48f3-8c61-fb5f84a9f9eb.s3.amazonaws.com/mydata/fruits-2.csv

## List bucket objects
$ sfdx mohanc:aws:s3:ls -b fruits-790f15af-0986-48f3-8c61-fb5f84a9f9eb
{
  IsTruncated: false,
  Marker: '',
  Contents: [
    {
      Key: 'fruits.csv',
      LastModified: 2020-09-06T00:02:25.000Z,
      ETag: '"4afa7be447a3a57456fdd1a04b9b823a"',
      Size: 53,
      StorageClass: 'STANDARD',
      Owner: [Object]
    },
    {
      Key: 'mydata/fruits-2.csv',
      LastModified: 2020-09-06T00:25:18.000Z,
      ETag: '"2f60af499f0304f33486a267bfc48fa0"',
      Size: 27,
      StorageClass: 'STANDARD',
      Owner: [Object]
    }
  ],
  Name: 'fruits-790f15af-0986-48f3-8c61-fb5f84a9f9eb',
  Prefix: '',
  MaxKeys: 1000,
  CommonPrefixes: []
}
```
![s3 upload](img/s3-upload-1.png)
