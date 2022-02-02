#!/bin/bash

# Commands that require admin permissions should be whitelisted with 'visudo' - example:
# YOURUSERNAME ALL=(ALL) NOPASSWD: /usr/local/bin/openfortivpn
# YOURUSERNAME ALL=(ALL) NOPASSWD: /usr/bin/killall -2 openfortivpn

# Configuration for openfortivpn
# To use openfortivpn in an easy way you can create file like: /Documents/.fortivpn-config and put your crential in it as following:
#
# host=123.45.678.9
# port=1234
# username=username
# password=password
# trusted-cert=certificate

# <xbar.title>FCOVPN</xbar.title>
# <xbar.version>v1.0</xbar.version>
# <xbar.author>Original - Emran Mobaraki Novin. Customised - Jithen Singh</xbar.author>
# <xbar.author.github>Original - emranovin. Customised - jiriteach</xbar.author.github>
# <xbar.desc>FCOVPN</xbar.desc>
# <xbar.image>https://i.imgur.com/v2aW5mo.png</xbar.image>

VPN_EXECUTABLE=/usr/local/bin/openfortivpn #location of openfortivpn
VPN_EXECUTABLE_PARAMS="-c$HOME/Documents/.fortivpn-config" #location of openfortivpn configuration file

VPN_INTERFACE=ppp0 #vpn interface on MacOS

VPN_CONNECTED="/sbin/ifconfig | egrep -A1 $VPN_INTERFACE | grep inet"
VPN_DISCONNECT_CMD="sudo killall -2 openfortivpn"

EXTERNAL_URL="https://" #url of VPN server

INTERNAL_IP_ADDRESSES="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\  -f2"
EXTERNAL_IP_ADDRESSES="curl checkip.amazonaws.com"

TEST_PING="./sbin/ping 1.1.1.1"


case "$1" in
    connect)
        sudo "$VPN_EXECUTABLE" &> /dev/null &

        until eval "$VPN_CONNECTED"; do sleep 1; done
        ;;
    disconnect)
        eval "$VPN_DISCONNECT_CMD"

        until [ -z "$(eval "$VPN_CONNECTED")" ]; do sleep 1; done
        ;;
esac


if [ -n "$(eval "$VPN_CONNECTED")" ]; then
    echo "FCO - :vertical_traffic_light: - Connected"
    echo "---"
    echo "Disconnect | bash='$0' param1=disconnect terminal=false refresh=true"
    echo "---"
    echo "Status - Connected | color=#02b001"
    echo "Internal Addresses - "
    echo "$(eval "$INTERNAL_IP_ADDRESSES")"
    echo "External Address - "
    echo "$(eval "$EXTERNAL_IP_ADDRESSES")"
    echo "---"
    echo "Ping Internal Server | shell='ping' param1='-c4 172.27.16.204' terminal=true" #IP address on the VPN network to test connectivity
    echo "Refresh ... | refresh=true"
    exit
else
    echo "FCO - :traffic_light:"
    echo "---"
    echo "Connect | bash='$0' param1=connect terminal=false refresh=true"
    echo '---'
    echo "Status - Disconnected | color=#c5324b"
    echo "Internal Addresses - "
    echo "$(eval "$INTERNAL_IP_ADDRESSES")"
    echo "External Address - "
    echo "$(eval "$EXTERNAL_IP_ADDRESSES")"
    echo '---'
    echo "VPN Portal | href=${EXTERNAL_URL}"
    echo '---'
    echo "Ping Cloudflare (Over WAN) | shell='ping' param1='-c4 1.1.1.1' terminal=true"
    echo "Refresh ... | refresh=true"
    exit
fi
