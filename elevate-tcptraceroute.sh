#!/bin/bash

read -p $'\e[1;33mMasukkan IP yang ingin Anda tuju\e[0m: ' IP
read -p $'\e[1;33mMasukkan port yang ingin Anda tuju\e[0m: ' port

conf="Tracing"
conf="$conf \e[1;32m$IP\e[0m port \e[1;32m$port\e[0m..."
echo -e $conf
echo
cat config.conf | base64 -d | sudo tcptraceroute $IP $port
echo
echo -e "Jika Anda melihat \e[1;32m<syn,ack>\e[0m pada response, artinya \e[1;32mIP dan port tersebut terbuka\e[0m."
echo -e "Jika Anda melihat \e[1;32m<rst,ack>\e[0m pada response, artinya \e[1;34mIP terbuka namun port tidak terbuka\e[0m."
echo -e "Jika Anda melihat \e[1;32m!H\e[0m pada response, artinya \e[1;31mIP tidak berhasil dicapai\e[0m."
