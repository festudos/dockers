#!/usr/bin/env bash
#set -ex
sudo apt-get update > /dev/null 2>&1
sudo apt --fix-broken install -y  > /dev/null 2>&1
sudo apt install --fix-missing -y  > /dev/null 2>&1
sudo apt-get update  > /dev/null 2>&1
sudo apt upgrade -y  > /dev/null 2>&1
sudo apt -y autoremove  > /dev/null 2>&1
sudo apt-get -y clean  > /dev/null 2>&1
sudo apt-get -y purge  > /dev/null 2>&1
sudo apt-get -y autoclean  > /dev/null 2>&1