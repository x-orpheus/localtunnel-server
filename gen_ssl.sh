#!/usr/bin/env bash

# https://github.com/Neilpang/acme.sh/wiki/dnsapi
# https://github.com/Neilpang/acme.sh/wiki/DNS-alias-mode

set -e

function usage
{
    echo "Usage: ./gen_ssl.sh -d DOMAIN [--dns DNS] [-a ALIAS] [-h]"
    echo "   ";
    echo "  --dns                   : DNS provider";
    echo "  -d | --domain           : The domain you want to issue";
    echo "  -a | --alias            : DNS alias for alias mode";
    echo "  -h | --help             : Help message";
}

function parse_args
{
  args=()

  while [ "$1" != "" ]; do
      case "$1" in
          --dns )                       dns="$2";               shift;;
          -d | --domain )               domain="$2";            shift;;
          -a | --alias )                alias="$2";             shift;;
          -h | --help )                 usage;                  exit;;
          * )                           args+=("$1")
      esac
      shift
  done

  if [[ -z "${domain}" ]]; then
      echo "Invalid arguments"
      usage
      exit;
  fi

  if [[ -z "${dns}" ]]; then
      dns="dns_cf";
  fi
}

ACME=~/.acme.sh/acme.sh
if [ ! -f "$ACME" ]; then
    echo -e "\e[31m$ACME does not exist, installing...\e[0m"
    curl https://get.acme.sh | sh
fi

parse_args "$@"

if [[ -n "${alias}" ]]; then
    alias_str="--challenge-alias ${alias}";
fi

$ACME --issue --force --dns $dns $alias_str \
-d $domain \
-d *.$domain

$ACME --install-cert \
--key-file ./SSLs/server.key \
--fullchain-file ./SSLs/server.crt \
-d $domain \
-d *.$domain
