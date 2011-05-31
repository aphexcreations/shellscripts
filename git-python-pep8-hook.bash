#!/bin/bash

##
## Python PEP8 Checker for GIT
##
## Author: Brendon Crawford <brendon@last.vc>
##
## Installing
##   1. Install pep8 checker:
##      `sudo pip install pep8`
##
##   2. Save this file as:
##      /PATH_TO_LOCAL_REPO/.git/hooks/pre-commit
##
##   3. Set permissions, by running:
##      `chmod +x /PATH_TO_LOCAL_REPO/.git/hooks/pre-commit`
##
##   4. If you want to run PEP8 on a specific sub-directory,
##      change the SCAN_DIR variable below to the sub-directory
##      name you wish to scan, without trailing slash.
##

##
## Change this setting if you wish to check a sub-directory.
## Otherwise, leave as "."
##
SCAN_DIR="."

##
## Do not edit below this line
##

repo_dir=$(cd "${GIT_DIR}/../"; pwd)
check_dir="${repo_dir}/${SCAN_DIR}/"
cnt=$(pep8 -qq --count --exclude="tests/,test/,.git/,migrations/,test_*" ${check_dir} 2>&1)
pep_status=${?}
if [ ${pep_status} -ne 0 ]; then
    echo
    echo "CODE IS NOT PEP8 COMPLIANT"
    echo "${cnt} PEP8 VIOLATIONS WERE FOUND"
    echo "FOR MORE INFO, RUN:"
    echo
    echo "> cd ${scan_dir}"
    echo "> pep8 --show-source --exclude=\"tests/,test/,.git/,migrations/,test_*\" ."
    echo
    exit 1
else
    exit 0
fi
