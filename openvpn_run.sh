#!/bin/sh

echo $(curl 'https://api.ipify.org' -s) > /tmp/orgip

exec openvpn  $OVPN_FILE
