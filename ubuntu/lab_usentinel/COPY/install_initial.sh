#!/usr/bin/env bash
set -ex
apt-get update
apt-get upgrade -y
apt-get install -y net-tools ethtool  curl  wget  htop
apt-get install -y zsh zsh-autosuggestions zsh-syntax-highlighting