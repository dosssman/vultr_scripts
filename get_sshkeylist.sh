#!/bin/bash
MYKEY=$(cat ./VULTR_API_KEY)

curl -H 'API-Key: '${MYKEY} "https://api.vultr.com/v1/sshkey/list"
