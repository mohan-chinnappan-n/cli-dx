# gitLogs.sh
# Script to  produce git logs from the current branch
# Run this command when you are in the branch for which you need gitlogs
# mchinnappan

branch="$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')"
echo "=== branch: ${branch} ==="
tsvoutput="${branch}-$(date +"%Y_%m_%d_%I_%M_%p").tsv"
echo "=== Output file: $tsvoutput ==="

git log --pretty='format:%h|%an|%ae|%s' | sed 's/|/\t/g' > "${tsvoutput}"
open "${output}" 
