lumenbox/stellar-well-known a simple HTTP service to host http://\<domain\>/.well-known/stellar.toml
=======================================================
This image is using the [goStatic](https://github.com/PierreZ/goStatic) HTTP server to host only one file: ```/.well-known/stellar.toml```. The image is using [confd](https://github.com/kelseyhightower/confd) to fetch configuration from environment variables.

Features:
* enables CORS by default. CORS is mandatory for the [stellar.toml file](https://www.stellar.org/developers/guides/concepts/stellar-toml.html#enabling-cross-origin-resource-sharing-cors)
* everything can be configured through environment variables so no need for volume or host mount
* thanks to goStatic the container contains really minimalistic web server which makes it more secure
* based on the alpine image so pretty small footprint

Please note that as Stellar requires HTTPS to fetch the stellar.toml file this container must be behind a HTTPS reverse proxy (checkout [trafik](https://traefik.io/) with built-in docker and Let's encrypt support)

ToDo: Currently only the FEDERATION_SERVER entry is supported. Support more key/value pairs in the stellar.toml file

## Supported environment variables
### STELLARWELLKNOWN_CONFIG_PORT (Mandatory)
Default: 8043 (same as default port of goStatic)

The goStatic webserver will listen on this port inside the container

### STELLARWELLKNOWN_STELLAR_TOML_FEDERATION_SERVER (Mandatory)
No default

The value of this environment variable will be included into the /.well-known/stellar.toml file for the FEDERATION_SERVER key.

Example: STELLARWELLKNOWN_STELLAR_TOML_FEDERATION_SERVER=https://\<yourdomain\>/federation

### How to use it
You can run with plain docker:
```
docker run -e STELLARWELLKNOWN_STELLAR_TOML_FEDERATION_SERVER=https://\<yourdomain\>/federation lumenbox/stellar-well-known:latest
```

Or use docker-compose etc.

