#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: eSirPlayground
# Youtube Channel: https://goo.gl/fvkdwm 
#=================================================
#1. Modify default IP
sed -i 's/192.168.1.1/192.168.3.5/g' openwrt/package/base-files/files/bin/config_generate
sed -i '160i\set network.$1.gateway='192.168.3.1'\
set network.$1.dns='192.168.3.1 223.5.5.5 8.8.8.8'\
' openwrt/package/base-files/files/bin/config_generate

#2. Clear the login password
#sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' openwrt/package/lean/default-settings/files/zzz-default-settings

#3. Replace with JerryKuKu’s Argon
rm openwrt/package/lean/luci-theme-argon -rf

#4. Modify default dhcp
sed -i '31,33d' openwrt/package/network/services/dnsmasq/files/dhcp.conf
sed -i '30a\option ignore '1'\' openwrt/package/network/services/dnsmasq/files/dhcp.conf
