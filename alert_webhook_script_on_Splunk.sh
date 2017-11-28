#!/bin/sh

echo "script started "`date` >> script.log

echo "checking arg 0" >> script.log
if [ -z "$0" ]; then
    echo "Error: No SPLUNK_ARG_0" >> script.log
    exit;
fi
echo "checked arg 0: "$0 >> script.log

echo "checking arg 1" >> script.log
if [ -z "$1" ]; then
    echo "Error: No SPLUNK_ARG_1" >> script.log
    exit;
fi
echo "checked arg 1: "$1 >> script.log

echo "checking arg 2" >> script.log
if [ -z "$2" ]; then
    echo "Error: No SPLUNK_ARG_2" >> script.log
    exit;
fi
echo "checked arg 2: "$2 >> script.log

echo "checking arg 3" >> script.log
if [ -z "$3" ]; then
    echo "Error: No SPLUNK_ARG_3" >> script.log
    exit;
fi
echo "checked arg 3: "$3 >> script.log

echo "checking arg 4" >> script.log
if [ -z "$4" ]; then
    echo "Error: No SPLUNK_ARG_4" >> script.log
    exit;
fi
echo "checked arg 4: "$4 >> script.log

echo "checking arg 5" >> script.log
if [ -z "$5" ]; then
    echo "Error: No SPLUNK_ARG_5" >> script.log
    exit;
fi
echo "checked arg 5: "$5 >> script.log

echo "checking arg 6" >> script.log
if [ -z "$6" ]; then
    echo "Error: No SPLUNK_ARG_6" >> script.log
    exit;
fi
echo "checked arg 6: "$6 >> script.log

script_name=$0
number_of_events=$1
search_terms=$2
query_string=$3
name_of_report=$4
trigger_reason=$5
browser_url=$6

App_Header_Key="X-Script-On-Splunk"
App_Header_Value="xxx"
App_Header=$App_Header_Key":"$App_Header_Value

echo "trying to curl" >> script.log

curl -H "$App_Header" -H "Content-Type:application/json" -d "{'SPLUNK_ARG_0':'$script_name', 'SPLUNK_ARG_1':'$number_of_events', 'SPLUNK_ARG_2':'$search_terms', 'SPLUNK_ARG_3':'$query_string', 'SPLUNK_ARG_4':'$name_of_report', 'SPLUNK_ARG_5':'$trigger_reason', 'SPLUNK_ARG_6':'$browser_url'}" https://stg-csharptestfunction.azurewebsites.net/api/AlertToViber >> script.log 2>&1

echo "curl end" >> script.log

echo "script end "`date` >> script.log
