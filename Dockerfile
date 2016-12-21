FROM consul:0.7.2

ENV CONSUL_HTTP_URL ""
ENV CONSUL_SERVER_IP ""
RUN  apk add --no-cache -U jq

COPY get_consul_server_ip.sh /usr/local/bin
ENTRYPOINT /usr/local/bin/get_consul_server_ip.sh 

CMD ["agent", "-join", "$CONSUL_SERVER_IP"]
