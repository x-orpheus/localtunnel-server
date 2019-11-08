localtunnel-server
---

Deploy [localtunnel](https://github.com/localtunnel/localtunnel) server with docker-compose.

### Usage

> Please install [Docker](https://docs.docker.com/install/) and [docker-compose](https://docs.docker.com/compose/install/) first.

> Make sure that port 3000/80/443 are free

Add A/CNAME record of `your.domain` and `*.your.domain` to your server.

```bash
echo 'DOMAIN=your.domain' > .env
docker-compose up -d
```

```bash
lt -h http(s)://your.domain --port <PORT>
```

### Test in Local

> Powered by [xip.io](http://xip.io/)

> Remove `--secure` option in `docker-compose.yml`

```bash
echo 'DOMAIN=127.0.0.1.xip.io' > .env
docker-compose up -d
```

```bash
lt -h http://127.0.0.1.xip.io --port <PORT>
```

### Optional

Enable HTTPS with Let's Encrypt:

```bash
./gen_ssl.sh -h
```

### License

MIT
