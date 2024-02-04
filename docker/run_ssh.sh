#!/bin/sh

USUARIO=root
if [ -n "$1" ]; then
  USUARIO=$1
fi

DIRECCION=$(terraform -chdir=/terraform output --json master | jq -r .connection_ip)

ssh -q -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null "$USUARIO@$DIRECCION"
