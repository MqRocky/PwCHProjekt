#!/bin/bash

TODAY=$(date +"Data uruchomienia: %A, %d of %B, %r")
FORCLIENT=$(date +"%A, %d of %B, %r")
IMIE=$"Imie: Krzysztof Ogonek"
> jakiscos.log
> index.html
chmod 777 jakiscos.log
chmod 777 index.html
echo $TODAY >> jakiscos.log
echo $IMIE >> jakiscos.log
netstat -tulpn | grep LISTEN >> jakiscos.log

ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d+(.\d+){3}' >> index.html
echo $FORCLIENT >> index.html
