#!/bin/bash
MYKEY=$(cat ./VULTR_API_KEY)
LAST_SERVER_SUBID=$(cat ./LAST_SERVER_SUBID)
#curl -H 'API-Key: '${MYKEY} "https://api.vultr.com/v1/server/list_ipv4?SUBID=${LAST_SERVER_SUBID}"

curl -H 'API-Key: '${MYKEY} "https://api.vultr.com/v1/server/list_ipv4?SUBID=${LAST_SERVER_SUBID}" | python -c "import sys, json; print( json.load(sys.stdin)['${LAST_SERVER_SUBID}'][0]['ip'])"
