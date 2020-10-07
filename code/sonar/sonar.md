
# Sonarqube 

## Download
- Download from [CommunityEdition](https://www.sonarqube.org/downloads/)

- [Clearing the quarantine extended attribute from downloaded applications](https://community.sonarsource.com/t/sonar-cannot-start-once-updated-to-macos-catalina-error-as-wrapper-cannot-be-opened-because-the-developer-cannot-be-verified/16439/2)
```
$   xattr -dr com.apple.quarantine sonarqube-8.4.2.36762

```

## Set up JAVA_HOME
```
$ export JAVA_HOME=`/usr/libexec/java_home -v 11.0.4`
$ java --version
openjdk 11.0.4 2019-07-16 LTS
OpenJDK Runtime Environment Zulu11.33+15-CA (build 11.0.4+11-LTS)
OpenJDK 64-Bit Server VM Zulu11.33+15-CA (build 11.0.4+11-LTS, mixed mode)
```

## Run sonarqube and sonar-scanner 
```
$  sonarqube-8.4.2.36762/bin/macosx-universal-64/sonar.sh start
$ open http://localhost:9000
## Create a project (e.g. eaorg)
## Download and install sonar-scanner
### Apex analysis is available as part of the Enterprise Edition and above.

## Run scanner
 ./sonar-scanner   -Dsonar.projectKey=eaorg   -Dsonar.sources=/Users/mchinnappan/code-extract/cprojApex/force-app/main/default/classes/   -Dsonar.host.url=http://localhost:9000   -Dsonar.login=c0e8f777df1ee5b87d2b7ab07200b1ae702f7dfc

## Open the reports
$ open http://localhost:9000/dashboard?id=eaorg
```

