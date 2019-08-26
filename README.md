localtunnel-server
---

Deploy [localtunnel](https://github.com/localtunnel/localtunnel) server with docker-compose.

### Usage

> Please install [Docker](https://docs.docker.com/install/) and [docker-compose](https://docs.docker.com/compose/install/) first.

```bash
docker-compose up -d
```

```bash
lt -h your.domain --port <PORT>
```


### Optional

 - Custom domain: `echo 'DOMAIN=your.domain' > .env`
 - Generate SSLs with [letsencrypt](https://letsencrypt.org/): `./gen_ssl.sh <domain>`

### License

MIT