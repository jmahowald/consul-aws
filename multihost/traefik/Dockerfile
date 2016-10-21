FROM containous/traefik
#FROM alpine:3.3

COPY dockerize /dockerize
ARG DOCKERIZE_VERSION=v0.2.0
#RUN mkdir /etc/traefik
COPY traefik.toml.tpl /etc/traefik/

ENV TRAEFIK_LOG_LEVEL INFO

ENTRYPOINT ["/dockerize", "-template","/etc/traefik/traefik.toml.tpl:/etc/traefik/traefik.toml", "/traefik"]
