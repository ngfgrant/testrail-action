#!/bin/sh -l

INSTANCE_NAME=$1
PROJECT=$2
TITLE=$3
USERNAME=$4
PASSWORD=$5
REPORT_PATH=$6
GITHUB_WORKSPACE=$7

junitparser merge --glob "$GITHUB_WORKSPACE/$REPORT_PATH/TEST-*" "$GITHUB_WORKSPACE/$REPORT_PATH/junit-report.xml"

output=$(trcli -y \
    -h "https://$INSTANCE_NAME.testrail.io" \
    --project "$PROJECT" \
    --title "$TITLE" \
    --username "$USERNAME"\
    --password "$PASSWORD" \
    parse_junit "$REPORT_PATH/junit-report.xml"
)

echo "::set-output name=out::$output"
