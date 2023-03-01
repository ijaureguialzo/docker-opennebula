#!/bin/sh

DIRECCION=$(terraform -chdir=/terraform output --json master | jq -r .connection_ip)

ssh -q -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null "root@$DIRECCION"
