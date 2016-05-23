#!/bin/bash
if [ ! -d /etc/secrets/sshd_keys ]
then
  mkdir -p /etc/secrets/sshd_keys
fi

for KEY in rsa dsa ecdsa ed25519 
do
  FILENAME=ssh_host_${KEY}_key
  if [ ! -a /etc/$FILENAME ]
  then
    ssh-keygen -t $KEY -f $FILENAME
  fi
done