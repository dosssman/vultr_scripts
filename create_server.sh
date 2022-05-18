#!/bin/bash
MYKEY=$(cat ./VULTR_API_KEY)
# DCDI = region, Paris=24
# DCID=24 # Region:24: Paris, 25 -> Tokyo, JP
DCID=25
VPSPLANID=201 # Plan: Cheapest 5$ per month
OSID=270 # OS Details: Ubuntu 18.04 x64
SCRIPTID=617519 # Created WebUI, sets up all the requirements for BL2 VPN Node for LAN
SSHKEYID='5d8d8282e63f7,5dbbb33d01198' # SSH key to automatically add
NODENAME='BL2VPNMumbleNode'
DATASTRING='DCID='${DCID}' VPSPLANID='${VPSPLANID}' OSID='${OSID}' SCRIPTID='${SCRIPTID}' SSHKEYID="'${SSHKEYID}'" hostname='${NODENAME}
echo $DATASTRING
# TODO: Check that LAST_SERVER_SUBID is empty and destroy if not
curl -H 'API-Key: '$MYKEY https://api.vultr.com/v1/server/create --data "DCID=${DCID}" --data "OSID=${OSID}" --data "VPSPLANID=${VPSPLANID}" --data "SCRIPTID=${SCRIPTID}" --data "SSHKEYID=${SSHKEYID}" --data "hostname=${NODENAME}" --data "label=${NODENAME}" | jq -r '.SUBID' > LAST_SERVER_SUBID

sleep 20s
NEW_SERVER_IP=$(./get_server_ip.sh)
for DEST_EMAIL in 'doss@ai.cs.kobe-u.ac.jp' 'lazard.dowevi@gmail.com'; do
	echo "Sending Notification to ${DEST_EMAIL}\n"
	/home/z3r0/random/vultrexp/send_create_notif.sh $NEW_SERVER_IP $DEST_EMAIL
done
