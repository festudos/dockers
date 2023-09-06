Serviço de DNS
https://hub.docker.com/r/coredns/coredns/
https://github.com/coredns/coredns
https://dev.to/robbmanes/running-coredns-as-a-dns-server-in-a-container-1d0

docker run -d --name coredns --restart=always --volume=/media/butt/Arquivos/Docker/coreDNS/:/root/ -p 53:53/udp coredns/coredns -conf /root/Corefile

version: "3.3"
services:
  coreDNS:
    image: coredns/coredns
    restart: always
    ports:
      - 53:53/udp
    volumes:
      - /media/butt/Arquivos/Docker/coreDNS/:/root/
    command: --log-facility=-
networks:
  default:
    external:
      name: host

FROM --platform=$BUILDPLATFORM debian:stable-slim
SHELL [ "/bin/sh", "-ec" ]

RUN export DEBCONF_NONINTERACTIVE_SEEN=true \
           DEBIAN_FRONTEND=noninteractive \
           DEBIAN_PRIORITY=critical \
           TERM=linux ; \
    apt-get -qq update ; \
    apt-get -yyqq upgrade ; \
    apt-get -yyqq install ca-certificates ; \
    apt-get clean

FROM --platform=$TARGETPLATFORM scratch

COPY --from=0 /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
ADD coredns /coredns

EXPOSE 53 53/udp
ENTRYPOINT ["/coredns"]

 

 

