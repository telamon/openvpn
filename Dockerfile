# An openvpn-client in an Alpine Linux container
#
# docker run -it 
# -v /provider/hacktheplanet.ovpn:/etc/openvpn/hacktheplanet.ovpn \
# --net=host --device /dev/net/tun:/dev/net/tun --cap-add=NET_ADMIN \
# cdrage/openvpn-client hacktheplanet.ovpn
#
# go check your public ip online and you'll see you're connected to the VPN :)

#FROM hypriot/rpi-alpine-scratch
FROM alpine

VOLUME /provider

RUN apk update \
  && apk add openvpn curl \
  && rm -rf /var/cache/apk/*

COPY openvpn_run.sh /bin/openvpn_run
COPY healthcheck.sh /bin/healthcheck

HEALTHCHECK --interval=5m --timeout=5s \
  CMD /bin/healthcheck

WORKDIR /provider

CMD ["/bin/openvpn_run"]
