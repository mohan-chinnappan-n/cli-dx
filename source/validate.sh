#!/bin/bash
##--------------------------------------##
# validate.sh
# Purpose: Validating the given metadata type(s) from a source org against a target org

# - mohan chinnappan jul-19-2022 - creation
# - mohan chinnappan aug-12-2022 - added apiversion support
# - <your_name> date - <your contributions>
##-------------------------------------##


## Util Functions 
sf_login() {
	case $1 in
		SBX)
		echo "=== login into a Sandbox ... ==="
		sfdx force:auth:web:login -r https://test.salesforce.com
		;;

		PROD)	
		echo "=== login into a PROD or Dev Edition ... ==="
		sfdx force:auth:web:login -r https://login.salesforce.com
		;;
	esac

}


help() {
	if [[ "$1" -ne 7 ]] 
	then
	     echo "=== Validate script ==="
	     echo "usage: ./validate.sh  <SRC PROD|SBX> <PRJ_Name> <SRC_UserName> <MetadataTypes - in command separated> <TARGET PROD|SBX> <TARGET_UserName> <apiversion>"
	     echo "Example: usage: ./validate.sh  PROD validate2 mohan.chinnappan.n_ea2@gmail.com ApexClass PROD mohan.chinnappan.n_ea2@gmail.com 55.0"
	     exit 0 
	fi
}



help $#


mkdir ~/.prj
cd ~/.prj

# Read commandline args
sbx_prod=$1
project=$2
un=$3
mt=$4

tsbx_prod=$5
tun=$6
apiversion=$7



echo "=== Login into the Source org ==="
sf_login $sbx_prod

# Remove the validate2 folder if it is already there
[ -e ~/.prj/validate2 ] && rm -fr  ~/.prj/validate2


echo "=== Creating the the project $project ... ==="
sfdx force:project:create -n $project 

cd validate2
ls -l


echo  "=== Retrieving source for the metadata type(s): $mt ... ==="
sfdx force:source:retrieve -u $un  -m $mt 

ls -l

echo "=== Login into the Target org ==="
sf_login $tsbx_prod



echo  "=== Validating the source for the quick deployment ... ==="

sfdx force:source:deploy -u $tun  -m $mt -c -l RunLocalTests --apiversion $apiversion

echo "=== Opening the org for checking the deployment status ... ==="
sfdx force:org:open -u $tun  -p lightning/setup/DeployStatus/home



