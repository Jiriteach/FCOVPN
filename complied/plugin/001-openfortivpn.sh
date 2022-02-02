#!/bin/bash

# Get current status of a OpenFortiVPN connection with options to connect/disconnect.
# Commands that require admin permissions should be whitelisted with 'visudo', e.g.:
# YOURUSERNAME ALL=(ALL) NOPASSWD: /usr/local/bin/openfortivpn
# YOURUSERNAME ALL=(ALL) NOPASSWD: /usr/bin/killall -2 openfortivpn
# To use openfortivpn in an easy way you can create file like: /Documents/.fortivpn-config and put your crential in it as following:
#
# host=123.45.678.9
# port=1234
# username=FOO
# password=MYPASSWORDCHARACHTERS
# trusted-cert=MYCERTIFICATECHARACHTERS

# <xbar.title>OpenFortiVPN</xbar.title>
# <xbar.version>v1.0</xbar.version>
# <xbar.author>Emran Mobaraki Novin</xbar.author>
# <xbar.author.github>emranovin</xbar.author.github>
# <xbar.desc>Displays status of a OpenFortiVPN interface with option to connect/disconnect.</xbar.desc>
# <xbar.image>https://i.imgur.com/v2aW5mo.png</xbar.image>

VPN_EXECUTABLE=/usr/local/bin/openfortivpn
VPN_EXECUTABLE_PARAMS="-c$HOME/Documents/.fortivpn-config"

VPN_INTERFACE=ppp0

VPN_CONNECTED="/sbin/ifconfig | egrep -A1 $VPN_INTERFACE | grep inet"
VPN_DISCONNECT_CMD="sudo killall -2 openfortivpn"

EXTERNAL_URL="https://"

INTERNAL_IP_ADDRESSES="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\  -f2"
EXTERNAL_IP_ADDRESSES="curl checkip.amazonaws.com"

TEST_PING="./sbin/ping 1.1.1.1"


case "$1" in
    connect)
        # VPN connection command, should eventually result in $VPN_CONNECTED,
        #sudo "$VPN_EXECUTABLE" "$VPN_EXECUTABLE_PARAMS" &> /dev/null &
        sudo "$VPN_EXECUTABLE" &> /dev/null &

        # Wait for connection so menu item refreshes instantly
        until eval "$VPN_CONNECTED"; do sleep 1; done
        ;;
    disconnect)
        eval "$VPN_DISCONNECT_CMD"
        # Wait for disconnection so menu item refreshes instantly
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
    echo "Ping Internal Server | shell='ping' param1='-c4 172.27.16.204' terminal=true"
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
