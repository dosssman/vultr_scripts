#!/bin/bash
MY_SENDGRID_KEY=$(cat ./SENDGRID_API_KEY)
NEW_SERVER_IP=$1
DEST_EMAIL=$2
echo '## DEBUG: Passed Server IP '${NEW_SERVER_IP}
echo '## DEBUG: Passed email ' ${DEST_EMAIL}

curl --request POST \
  --url https://api.sendgrid.com/v3/mail/send \
  --header "Authorization: Bearer ${MY_SENDGRID_KEY}" \
	--header 'Content-Type: application/json' \
	--data '{"personalizations": [{"to": [{"email": "'${DEST_EMAIL}'"}]}],"from": {"email": "doss@bl2server-notifier.org"},"subject": "BL2 VPN Server @ '${NEW_SERVER_IP}' destroyed","content": [{"type": "text/plain", "value": "Greetings Vault Hunter.\n The server for Borderlands 2 located at '"${NEW_SERVER_IP}"' was successfully destroyed. \n\n Till next time."}]}'
