#!/bin/bash


usage() { echo "Usage: $0 [-e /encypted/directory] [-m /mounted/directory] [-d /data/to/encrypt/][-c category]"; exit 1;} 

ENCRYPT_DIR="/var/lib/navencrypt/encrypted"
MOUNT_DIR="/var/lib/navencrypt/mount"
CATEGORY="testCategory"

while getopts ":e:m:" o; do
	case "${o}" in
		e)
			ENCRYPT_DIR=$OPTARG
			;;
		m)
			MOUNT_DIR=$OPTARG
			;;
		d)
			RAW_DATA=$OPTARG
			;;
		c)
			CATEGORY=$OPTARG
			;;
		*)
			usage
			;;
	esac
done
shift $((OPTIND-1))

sudo mkdir -p $ENCRYPT_DIR $MOUNT_DIR
sudo navencrypt-prepare $ENCRYPT_DIR $MOUNT_DIR

if [ -n "$RAW_DATA" ]; then
	sudo navencrypt-move encrypt @${CATEGORY} ${RAW_DATA} ${MOUNT_DIR}
fi


