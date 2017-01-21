#!/bin/bash
docker run -it --rm \
  -v $PWD/Bahnhof-OpenVPN_v3:/etc/openvpn/ \
  --net=host \
  --device /dev/net/tun:/dev/net/tun \
  --cap-add=NET_ADMIN \
  alpovpn client.ovpn


