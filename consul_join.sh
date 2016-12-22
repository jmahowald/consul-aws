#!/bin/dumb-init /bin/sh
set -e

if [ -z "$CONSUL_SERVER_IP" ]
then
  if [ -z "$CONSUL_HTTP_URL" ]
  then
    echo "You must set either the CONSUL_SERVER_IP or the CONSUL_HTTP_URL"
    exit 1
  else
    echo "will query consul for server"
  fi
  export CONSUL_SERVER_IP=$(curl -q  $CONSUL_HTTP_URL/v1/catalog/service/consul  \
  | jq -r '.[0].Address')
else
  echo "Already have all the addresses"
fi
echo $CONSUL_SERVER_IP

exec /usr/local/bin/docker-entrypoint.sh agent -join $CONSUL_SERVER_IP $@