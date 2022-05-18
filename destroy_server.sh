#!/bin/bash
MYKEY=$(cat ./VULTR_API_KEY)
LAST_SERVER_SUBID=$(cat ./LAST_SERVER_SUBID)
NEW_SERVER_IP=$(./get_server_ip.sh)
curl -H 'API-Key: '${MYKEY} "https://api.vultr.com/v1/server/destroy" --data "SUBID=${LAST_SERVER_SUBID}"
for DEST_EMAIL in 'doss@ai.cs.kobe-u.ac.jp'; do
	./send_destroy_notif.sh $NEW_SERVER_IP $DEST_EMAIL
done

echo "" > LAST_SERVER_SUBID
