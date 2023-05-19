#!/bin/sh -e

### Cloudflare DDNS Script

ZONE="$CLOUDFLARE_DNS_ZONE"
DNS_IPv4="$CLOUDFLARE_DNS_IPV4"
DNS_IPv6="$CLOUDFLARE_DNS_IPV6"
TOKEN="$CLOUDFLARE_TOKEN"

DOMAIN="$CLOUDFLARE_DOMAIN"
TTL="${CLOUDFLARE_TTL:-60}"
PROXIED="${CLOUDFLARE_PROXY:-false}"

while true; do
  echo "[DDNS] Fetching newest IP addresses"

  IPv4=$(curl -s4 https://api64.ipify.org)
  IPv6=$(curl -s6 https://api64.ipify.org)

  echo "[DDNS] Sending Update to Cloudflare"

  # IPv4 Update
  curl -X PUT "https://api.cloudflare.com/client/v4/zones/$ZONE/dns_records/$DNS_IPv4" \
      -H "Content-Type:application/json" \
      -H "Authorization: Bearer $TOKEN" \
      --data '{"type":"A","name":"'$DOMAIN'","content":"'$IPv4'","ttl":'$TTL',"proxied":'$PROXIED'}'

  # IPv6 Update
  curl -X PUT "https://api.cloudflare.com/client/v4/zones/$ZONE/dns_records/$DNS_IPv6" \
      -H "Content-Type:application/json" \
      -H "Authorization: Bearer $TOKEN" \
      --data '{"type":"AAAA","name":"'$DOMAIN'","content":"'$IPv6'","ttl":'$TTL',"proxied":'$PROXIED'}'
  echo " "
  echo "[DDNS] Sleeping for 300 seconds (5 minutes)"
  sleep 300
done
