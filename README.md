localtunnel-server
---

Deploy [localtunnel](https://github.com/localtunnel/localtunnel) server with docker-compose.

### Usage

> Please install [Docker](https://docs.docker.com/install/) and [docker-compose](https://docs.docker.com/compose/install/) first.

Add A/CNAME record of `your.domain` and `*.your.domain` to your server.

```bash
echo 'DOMAIN=your.domain' > .env
docker-compose up -d
```

```bash
lt -h http(s)://your.domain --port <PORT>
```

### Test in Local

Edit `/etc/hosts`

```
127.0.0.1 your.domain
127.0.0.1 test.your.domain
```

```bash
lt -h http://your.domain -s test --port <PORT>
```

### Optional

Enable HTTPS with Let's Encrypt:

```bash
./gen_ssl.sh -h
```

### License

MIT