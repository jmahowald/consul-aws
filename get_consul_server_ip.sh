if [ -z ${CONSUL_SERVER_IP+x}] 
then
  if [ -z ${CONSUL_HTTP_URL+x}] 
  then
    echo "You must set either the CONSUL_SERVER_IP or the CONSUL_HTTP_URL" 
    exit -1
  fi
CONSUL_SERVER_IP=$(curl -q  $CONSUL_HTTP_URL/v1/catalog/service/consul  \
  | jq '.[0].Address')
fi

/usr/local/bin/docker-entrypoint.sh $@
