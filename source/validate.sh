#!/bin/bash
##--------------------------------------##
# validate.sh
# Purpose: Validating the given metadata type(s) from a source org against a target org

# - mohan chinnappan jul-19-2022 - creation
# - <your_name> date - <your contributions>
##-------------------------------------##


# check for the args
if [[ "$#" -ne 6 ]] 
then
     echo "=== Validate script ==="
     echo "usage: ./validate.sh  <SRC PROD|SBX> <PRJ_Name> <SRC_UserName> <MetadataTypes - in command separated> <TARGET PROD|SBX> <TARGET_UserName>"
     echo "Example: usage: ./validate.sh  PROD validate2 mohan.chinnappan.n_ea2@gmail.com ApexClass PROD mohan.chinnappan.n_ea2@gmail.com "
     exit 0 
fi

mkdir ~/.prj
cd ~/.prj

# Read commandline args
# usage bash validate.sh PROD validate2 mohan.chinnappan.n_ea2@gmail.com ApexClass 
sbx_prod=$1
project=$2
un=$3
mt=$4

tsbx_prod=$5
tun=$6



echo "=== Login into the Source org ==="

if [ ["$sbx_prod" == "SBX"] ] 
then
	sfdx force:auth:web:login -r https://test.salesforce.com
else 
	sfdx force:auth:web:login -r https://login.salesforce.com
fi

echo "=== Creating the the project $project ... ==="
sfdx force:project:create -n $project 

cd validate2
ls -l


echo  "=== Retrieving source for the metadata type(s): $mt ... ==="
sfdx force:source:retrieve -u $un  -m $mt 

ls -l

echo "=== Login into the Target org ==="

if [ ["$tsbx_prod" == "SBX"] ] 
then
	sfdx force:auth:web:login -r https://test.salesforce.com
else 
	sfdx force:auth:web:login -r https://login.salesforce.com
fi


echo  "=== Validating the source for the quick deployment ... ==="

sfdx force:source:deploy -u $tun  -m $mt -c -l RunLocalTests

echo "=== Opening the org for checking the deployment status ... ==="
sfdx force:org:open -u $un  -p lightning/setup/DeployStatus/home



