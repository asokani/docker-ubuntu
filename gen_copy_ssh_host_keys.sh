#!/bin/bash
if [ ! -d /etc/secrets/sshd_keys ]
then
  mkdir -p /etc/secrets/sshd_keys
fi

for KEY in rsa dsa ecdsa ed25519 
do
  FILENAME=ssh_host_${KEY}_key
  if [ ! -a /etc/secrets/sshd_keys/$FILENAME ]
  then
    ssh-keygen -N "" -t $KEY -f /etc/secrets/sshd_keys/$FILENAME
  fi
  
  cp /etc/secrets/sshd_keys/ssh_host_* /etc/
done

