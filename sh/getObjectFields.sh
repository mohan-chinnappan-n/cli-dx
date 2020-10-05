export uri=https://mohansun-ea-02-dev-ed.my.salesforce.com
sfdx mohanc:ws:rest -f ~/.headers/header_ea.json -r $uri/services/data/v49.0/sobjects/$1/describe -m GET   > $1.json
sfdx mohanc:data:jq -i $1.json -f '.fields[] | .name + "," + .label + "," + .type + "," + (.length | tostring)' | sed -e 's/"//g'
