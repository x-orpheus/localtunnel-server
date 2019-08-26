#!/usr/bin/env bash

# https://github.com/Neilpang/acme.sh/wiki/dnsapi
# Feel free to modify as needed

if [ $# -eq 0 ]
  then
    echo "Usage: ./gen_ssl.sh <domain>"
    exit 1
fi

DOMAIN=$1

~/.acme.sh/acme.sh --issue --force --dns dns_cf \
-d $DOMAIN \
-d *.$DOMAIN

~/.acme.sh/acme.sh --install-cert \
--key-file ./SSLs/server.key \
--fullchain-file ./SSLs/server.crt \
-d $DOMAIN \
-d *.$DOMAIN