#!/bin/bash

# author: mohan chinnappan
#----------------------------------------------------------------------------
# script to get a output csv with these fields
# username,frontdoorUrl

# for a given input csv file (users.csv) with  this field
# username

# Example run:
# bash form_login_urls.sh users.csv path/to/privateKey.ket consumerKey output.csv
# Usage: bash form_login_urls.sh <csv_file_path> <keyfile_path> <consumerKey> <output_csv>
# bash form_login_urls.sh users.csv ~/.keys/autoDeploy.key '3MVG9Kip4IKAJUNK4gZDQcUI7albyrfHKO6yYqMW09rBf5JiiqNOx3jgIZdPvBWargyvDKjnXlwrZ4uhR6wmL' loginUrls.csv

# use this app to test with access_token and instance_url:
# https://mohan-chinnappan-n5.github.io/sf/query/app.html
#----------------------------------------------------------------------------


if [ "$#" -ne 4 ]; then
    echo "Usage: bash $0 <csv_file_path> <keyfile_path> <consumerKey> <output_csv>"
    exit 1
fi


csv_file="$1"
keyfile_path="$2"
id="$3"
output_file="$4"

# Initialize an empty array to store user data
declare -a user_data

while IFS=',' read -r username; do
    # Run Salesforce JWT authentication
    sfdx force:auth:jwt:grant -u "$username" -f "$keyfile_path" -i "$id"

    if [ $? -eq 0 ]; then
        # Run  command to get the header.json: 
        # Ref: https://github.com/mohan-chinnappan-n/cli-dx/blob/master/jwt.md
        json_output=$(sfdx mohanc:hello:myorg -u "$username")

        # Extract Authorization string and parse AccessToken
        # e.g: 
        # cat header.json| jq -r '.Authorization' |  awk '{print $2}' 
        # access_token=`cat header.json| jq -r '.Authorization' |  awk '{print $2}'`
        authorization=$(echo "$json_output" | jq -r '.Authorization')
        access_token=$(echo "$authorization" | awk '{print $2}')

        # Extract InstanceUrl from JSON output
        # instance_url=`cat header.json | jq -r '.instanceUrl'`
        instance_url=$(echo "$json_output" | jq -r '.instanceUrl')

        # Form the URL and write to output file
        url="$instance_url/secur/frontdoor.jsp?sid=\"$access_token\""
        
        # Append user data to the array
        user_data+=("$username,$url")

    else
        echo "Authentication failed for user: $username"
    fi
done < "$csv_file"

# Write all user data to the specified output file
printf "%s\n" "${user_data[@]}" > "$output_file"