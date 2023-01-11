# Script for pipeline
# Bails out if count of P1 and P2 are not zero
# -----------------------------------------

# Run the pmd
pmd-run.sh pmd -R ~/.pmd/apex_ruleset.xml -d /tmp/deployment/unpackaged/classes/  -f csv > results.csv

# query the results using SQL
echo 'SELECT COUNT(*) AS CNT   FROM CSV("results.csv", {headers:true}) WHERE Priority < 3' > q.sql
sfdx mohanc:data:query:sql -q q.sql -d results.csv > out.json

# check for the errors
nerrors=`sfdx mohanc:data:jq -f  '.[].CNT'  -i out.json`
echo "nerrors: $nerrors"

if [ "$nerrors" != 0 ]
then
  echo "Number of P1 and P2 issues are:  $nerrors. Stopping the deployment!"
  exit 2
fi
echo "Continue the deployment..."
