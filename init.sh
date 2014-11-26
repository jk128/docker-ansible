#!/bin/bash
set -e

ssh_setup() {
  echo "setting up ssh keys/config ..."
  mkdir -p /root/.ssh
  chmod 700 /root/.ssh
  echo "$SSH_PRIVATE_KEY"|base64 -d> /root/.ssh/id_rsa
  chmod 600 /root/.ssh/id_rsa
  cat > /root/.ssh/config <<CONF
  Host *
    StrictHostKeyChecking no
    UserKnownHostsFile=/dev/null
CONF
  chmod 700 /root/.ssh/config
  echo "DONE."
}

echo "SSH_PRIVATE_KEY: $SSH_PRIVATE_KEY"

if [ ! -z "$SSH_PRIVATE_KEY" ];
then
    echo "Configuring ssh key..."
    ssh_setup;
else
    echo "No ssh configuration needed"
fi

exec "$@"
