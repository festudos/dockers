#!/bin/bash
# https://www.kasmweb.com/docs/latest/upgrade/single_server_upgrade.html

KASM_YAML="/opt/kasm/1.13.1/docker/docker-compose.yaml"
PESQUISA="service"
TEXT_TUNNEL="
  tunnel-kasm: # adicionado Manualmente
    image: cloudflare/cloudflared:latest
    container_name: tunnel_net_kasm
    command: tunnel --no-autoupdate run --token eyJhIjoiMjJiZTQwZTM5YzlhMzg4Njg5ZjQ4ZjI4YTc2ZDlkMGYiLCJ0IjoiMjFjZjgwYWUtNWVhNi00MjY0LThiNDAtMDA2ZTY2NzQ2OGM1IiwicyI6Ik1XRTJZMlUyTWpndE16ZGxaaTAwTWprNUxUbGlObUV0TlRRMU9XWTNOek5pTkdOaSJ9
    restart: always
    "

function addicionar() { #[arquivo] [pesquisa] [novo]
  provisorio="$1-provisorio.yaml"
  pesquisa="$2"
  # LER LINHA A LINHA
  while read -r linha; do
      echo $linha >> "$provisorio"
      if [[ "$linha" == *"$pesquisa"* ]]; then echo "$3" >> "$provisorio" ; fi
  done < "$1"
  sudo mv "$1" "$1-bkp"
  sudo mv "$provisorio" "$1"
}
RETORNO=$(pwd)
cd /tmp
curl -O https://kasm-static-content.s3.amazonaws.com/kasm_release_1.13.1.421524.tar.gz
tar -xf kasm_release_1.13.1.421524.tar.gz
sudo bash kasm_release/install.sh 
  # UPGRADE: # sudo bash kasm_release/upgrade.sh --proxy-port 443
sudo /opt/kasm/bin/stop
addicionar $KASM_YAML $PESQUISA $TEXT_TUNNEL
sudo /opt/kasm/bin/start
echo "-- # Verificar TUNNEL # --"
cd "$RETORNO"
# loooong time after: Verificar instalação do TUNNEL cloudflare






