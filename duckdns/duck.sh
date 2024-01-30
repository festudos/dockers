#!/usr/bin/with-contenv bash
# shellcheck shell=bash

if [ "${LOG_FILE,,}" = "true" ]; then
    DUCK_LOG="/config/duck.log"
    touch "${DUCK_LOG}"
    touch /config/logrotate.status
    /usr/sbin/logrotate -s /config/logrotate.status /app/logrotate.conf
else
    DUCK_LOG="/dev/null"
fi


IPV4_lan=$(hostname -i | awk '{print $1}')
IPV4_wan=$(dig +short ch txt whoami.cloudflare -4 @1.1.1.1 | sed 's/"//g')
IPV6_wan=$(dig +short ch txt whoami.cloudflare -6 @2606:4700:4700::1111 | sed 's/"//g')
IPset='ip='

{
echo "Detecting '$UPDATE_IP' via CloudFlare"
case "${UPDATE_IP}" in
  "lan")        
        IPset="ip=${IPV4_lan}" ;;
  "ipv4")        
        IPset="ip=${IPV4_wan}" ;;
  "ipv6")
        IPset="ipv6=${IPV6_wan}" ;;
  "both")
        IPset="ip=${IPV4_wan}&ipv6=${IPV6_wan}" ;;
  *)
    IPset=${IPset}${UPDATE_IP}
    ;;
esac

RESPONSE=$(curl -sS --max-time 60 "https://www.duckdns.org/update?domains=${SUBDOMAINS}&token=${TOKEN}&${IPset}")

    if [ "${RESPONSE}" = "OK" ]; then
        echo "Your IP was updated at $(date)"
    else
        echo -e "Something went wrong, please check your settings $(date)\nThe response returned was:\n${RESPONSE}"
    fi
} | tee -a "${DUCK_LOG}"


#SUBDOMAINS='dei-djgl2l3-local';
#TOKEN='ad68a933-0ece-445c-ae15-aecfb96c9c5c';
#IPset=$(hostname -I | awk '{print $1}');
#curl -sS --max-time 60 "https://www.duckdns.org/update?domains=${SUBDOMAINS}&tok>&& echo 'nslookup dei-djgl2l3-local.duckdns.org:' && nslookup dei-djgl2l3-local.>
