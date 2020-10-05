export obj=$1
export uri=https://mohansun-ea-02-dev-ed.my.salesforce.com
export un=mohan.chinnappan.n_ea2@gmail.com
sfdx mohanc:ws:rest -f ~/.headers/header_ea.json -r $uri/services/data/v49.0/sobjects/$1/describe -m GET   > $1.json
sfdx mohanc:data:jq -i $1.json -f '.fields[] | .name + "," + .label + "," + .type + "," + (.length | tostring)' | sed -e 's/"//g' \
 |  cut -f1 -d','  | sed 's/^/,/g' | sed 's/^/    /g'   | sed 's/    ,Id/SELECT Id/' | sed '$ a\ 
FROM ' | sed "s/FROM /FROM $obj/"  > $1.soql
sfdx mohanc:data:query -u $un -q $1.soql  -f $2
