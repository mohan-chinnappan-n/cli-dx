# Installing Oracle DB on Mac using Docker

```
$ docker pull truevoly/oracle-12c
```

## Create folder for the container  to store the database locally.
```
$ mkdir ~/oracle_data
```

## Create the container and mount it in the latest folder using the oracle-12c image

```
$ docker run -d -p 8080:8080 -p 1521:1521 -v ~/oracle_data/:/u01/app/oracle truevoly/oracle-12c

```
## Check the container status

```
$ docker ps
CONTAINER ID        IMAGE                 COMMAND             CREATED             STATUS              PORTS                                            NAMES
5dcf53be26a4        truevoly/oracle-12c   "/entrypoint.sh "   17 hours ago        Up 17 hours         0.0.0.0:1521->1521/tcp, 0.0.0.0:8080->8080/tcp   loving_curran
```


## Where the database data is stored?
```
$ ls  ~/oracle_data/
admin			cfgtoollogs		dbs			fast_recovery_area	product
audit			checkpoints		diag			oradata
```

## Using sqlPlus

### Download and install InstantClient
- [Instant Client Basic](https://download.oracle.com/otn_software/mac/instantclient/198000/instantclient-basic-macos.x64-19.8.0.0.0dbru.zip)
- [Instant Client Sqlplus](https://download.oracle.com/otn_software/mac/instantclient/198000/instantclient-sqlplus-macos.x64-19.8.0.0.0dbru.zip)
- [Instant Client Tools - SQL Loader](https://download.oracle.com/otn_software/mac/instantclient/198000/instantclient-tools-macos.x64-19.8.0.0.0dbru.zip)
```
$ ls
instantclient-basic-macos.x64-19.8.0.0.0dbru.zip	instantclient-sqlplus-macos.x64-19.8.0.0.0dbru.zip	instantclient-tools-macos.x64-19.8.0.0.0dbru.zip
```

## Install by unzipping to a folder say (~/ora)
```
~/ora:
$ tree
.
├── instantclient_19_8
│   ├── BASIC_LICENSE
│   ├── BASIC_README
│   ├── Billing.log
│   ├── SQLPLUS_LICENSE
│   ├── SQLPLUS_README
│   ├── TOOLS_LICENSE
│   ├── TOOLS_README
│   ├── adrci
│   ├── exp
│   ├── expdp
│   ├── genezi
│   ├── glogin.sql
│   ├── imp
│   ├── impdp
│   ├── libclntsh.dylib -> libclntsh.dylib.19.1
│   ├── libclntsh.dylib.10.1 -> libclntsh.dylib.19.1
│   ├── libclntsh.dylib.11.1 -> libclntsh.dylib.19.1
│   ├── libclntsh.dylib.12.1 -> libclntsh.dylib.19.1
│   ├── libclntsh.dylib.18.1 -> libclntsh.dylib.19.1
│   ├── libclntsh.dylib.19.1
│   ├── libclntshcore.dylib.19.1
│   ├── libnfsodm19.dylib
│   ├── libnnz19.dylib
│   ├── libocci.dylib -> libocci.dylib.19.1
│   ├── libocci.dylib.10.1 -> libocci.dylib.19.1
│   ├── libocci.dylib.11.1 -> libocci.dylib.19.1
│   ├── libocci.dylib.12.1 -> libocci.dylib.19.1
│   ├── libocci.dylib.18.1 -> libocci.dylib.19.1
│   ├── libocci.dylib.19.1
│   ├── libociei.dylib
│   ├── libocijdbc19.dylib
│   ├── liboramysql19.dylib
│   ├── libsqlplus.dylib
│   ├── libsqlplusic.dylib
│   ├── network
│   │   └── admin
│   │       └── README
│   ├── ojdbc8.jar
│   ├── sqlldr
│   ├── sqlplus
│   ├── start-sqlldr.sh
│   ├── start-sqlplus.sh
│   ├── ucp.jar
│   ├── uidrvci
│   ├── wrc
│   └── xstreams.jar
└── resources.md
```

## Oracle Version Data
```

SQL> select banner from v$version;

BANNER
--------------------------------------------------------------------------------
Oracle Database 12c Standard Edition Release 12.1.0.2.0 - 64bit Production
PL/SQL Release 12.1.0.2.0 - Production
CORE	12.1.0.2.0	Production
TNS for Linux: Version 12.1.0.2.0 - Production
NLSRTL Version 12.1.0.2.0 - Production

```
## Make symbolic link to libclntsh.dylib.11.1  

```
$ ln -s ~/ora/instantclient_19_8/libclntsh.dylib.11.1 /usr/local/lib/libclntsh.dylib.11.1 
```




```
$ cd ~/ora/instantclient_19_8
$ ./sqlplus un/pwd@//localhost:1521/xe
```

## Using SQL Loader
```
$ cd ~/ora/instantclient_19_8
$ ./sqlldr un/pwd@//localhost:1521/xe control=~/.ora/cusomter_load.ctl log=customer.log
```

## References 
- [How to install Oracle Database on Mac OS Sierra 10.12 or above](https://medium.com/@mfofana/how-to-install-oracle-database-on-mac-os-sierra-10-12-or-above-c0b350fd2f2c)
- [Install Oracle instant client and sqlplus using Homebrew](https://vanwollingen.nl/install-oracle-instant-client-and-sqlplus-using-homebrew-a233ce224bf) 
## Links
- [Instant Client download](https://www.oracle.com/database/technologies/instant-client/macos-intel-x86-downloads.html)
 
