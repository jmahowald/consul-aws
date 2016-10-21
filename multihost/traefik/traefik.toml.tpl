logLevel = "{{.Env.TRAEFIK_LOG_LEVEL}}"
[consulCatalog]
endpoint = "{{.Env.CONSULCATALOG_ENDPOINT}}"
prefix = "traefik"
domain = "{{.Env.CONSULCATALOG_DOMAIN}}"
watch = true
