# Script for pipeline
# Bails out if count of P1,P2 and P3 are not zero
# -----------------------------------------

#----- configure the following to meet your needs ----
RULESET=~/.pmd/apex_ruleset.xml
MSG="Number of P1,P2 and P3 issues are"
THRESHOLD=4
CODE=/tmp/apex/unpackaged/classes/
#-----------------------------------------------------

# Run the pmd
echo pmd-run.sh pmd -R  $RULESET -d $CODE  -f csv > results.csv
pmd-run.sh pmd -R  $RULESET -d $CODE  -f csv > results.csv


# query the results using SQL
echo "SELECT COUNT(*) AS CNT   FROM CSV(\"results.csv\", {headers:true}) WHERE Priority < $THRESHOLD" > q.sql
cat q.sql
sfdx mohanc:data:query:sql -q q.sql  > out.json

# check for the errors
nerrors=`sfdx mohanc:data:jq -f  '.[].CNT'  -i out.json`
echo "nerrors: $nerrors"

if [ "$nerrors" != 0 ]
then
  echo "$MSG:  $nerrors. Stopping the deployment!"
  exit 2
fi
echo "Continue the deployment..."

