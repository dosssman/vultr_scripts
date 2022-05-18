#!/bin/bash
MY_SENDGRID_KEY=$(cat ./SENDGRID_API_KEY)
NEW_SERVER_IP=$1
DEST_EMAIL=$2
curl --request POST \
  --url https://api.sendgrid.com/v3/mail/send \
  --header "Authorization: Bearer ${MY_SENDGRID_KEY}" \
	--header 'Content-Type: application/json' \
	--data '{"personalizations": [{"to": [{"email": "'${DEST_EMAIL}'"}]}],"from": {"email": "doss@bl2server-notifier.org"},"subject": "New BL2 VPN Server @ '${NEW_SERVER_IP}'","content": [{"type": "text/plain", "value": "Greetings Vault Hunter. A new server for Borderlands 2 has been created. \n The IPv4 address is '${NEW_SERVER_IP}'"}]}'
