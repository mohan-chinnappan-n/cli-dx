# Script for pipeline
# Bails out if count of violations are in the below of the given LIMIT 
#------------------------------------
# Run the pmd check 
#-----------------------------------

run_check_pmd() {

  local PMD_PATH="/Users/mchinnappan/pmd/pmd-bin-6.54.0/bin"
  
  echo "==== Running run_check_pmd() ===="
  local CLS_FOLDER="${1:-'.'}" # default is current folder
  local RULESET="${2:-'/Users/mchinnappan/.pmd/apex_ruleset.xml'}"
  local LIMIT="${3:-4}"
  local OUTFILE='/tmp/results.csv'
  local OUTFILE_JSON='/tmp/out.json'



  cmd="run-pmd.sh pmd -R ${RULESET} -d ${CLS_FOLDER}    -f csv > ${OUTFILE}"
  echo "running cmd: ${cmd}"
  
   ${PMD_PATH}/run-pmd.sh pmd -R ${RULESET} -d ${CLS_FOLDER}    -f csv > ${OUTFILE}

  # query the results using SQL
  
  echo  "SELECT COUNT(*) AS CNT   FROM CSV(\"${OUTFILE}\", {headers:true}) WHERE Priority < ${LIMIT} " > /tmp/q.sql
  cat /tmp/q.sql
  sfdx mohanc:data:query:sql -q /tmp/q.sql  > ${OUTFILE_JSON} 

  # check for the errors
  nerrors=`sfdx mohanc:data:jq -f  '.[].CNT'  -i ${OUTFILE_JSON} `
  echo "nerrors: ${nerrors}"

  if [ "$nerrors" != 0 ]
  then
    echo "Number of issues which are upto: $((LIMIT - 1)):  $nerrors. Stopping the deployment!"
    exit 2
  fi
  echo "Continue the deployment..."
}

## Usage
## $1:  Class Folder
## $2: Rulse file
## $3: violoations Priority linmit

# run_check_pmd $1 $2 $3
