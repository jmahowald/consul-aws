FROM consul:0.7.2

ENV CONSUL_HTTP_URL ""
COPY get_raft_leader.sh /usr/local/bin
ENTRYPOINT /bin/ash
