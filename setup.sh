#!/bin/sh

apt-get update && \
	apt-get -y upgrade && \
	apt-get -y dist-upgrade && \
	apt-get -y autoremove && \
	apt-get clean

apt-get -y install apt-transport-https ca-certificates curl software-properties-common && \
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
	add-apt-repository "deb [arch=arm64] https://download.docker.com/linux/ubuntu bionic stable" && \
	apt-get update && \
	apt-get -y install docker-ce


cat <<EOF > /etc/network/interfaces
# ifupdown has been replaced by netplan(5) on this system.  See
# /etc/netplan for current configuration.
# To re-enable ifupdown on this system, you can run:
#    sudo apt install ifupdown
allow-hotplug eth0
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
address 10.40.41.1
netmask 255.255.255.0
network 10.40.41.0
broadcast 10.40.41.255

auto eth2
iface eth2 inet static
address 10.40.42.1
netmask 255.255.255.0
network 10.40.42.0
broadcast 10.40.42.255

auto eth3
iface eth3 inet static
address 10.40.43.1
netmask 255.255.255.0
network 10.40.43.0
broadcast 10.40.43.255
EOF

cat <<EOF >/etc/modules
# /etc/modules: kernel modules to load at boot time.
#
# This file contains the names of kernel modules that should be loaded
# at boot time, one per line. Lines beginning with "#" are ignored.
peak_pci
EOF
