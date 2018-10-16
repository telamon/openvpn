# OpenVPN via docker

This repository contains OpenVPN inside a docker container, the container is
configured to run with the host's network adapter and thus starting this
container will cause your host machine to use the VPN that this container
connected to.

## Usage

Place your open-vpn provider client-files into a folder `provider/` so that the
file `ovpn` file is located as following `provider/client.ovpn`

Setup (if missing) the connection credentials:

create the file `provider/up.txt` with content:

    username
    passsword


Append thee lines to the bottom of `provider/client.ovpn` if they're missing:

    auth-nocache
    auth-user-pass up.txt

Start the service using:

    $ docker-compose up
