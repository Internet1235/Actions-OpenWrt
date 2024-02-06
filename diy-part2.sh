#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
rm -rf feeds/luci/themes/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/downloads/luci-theme-argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/' feeds/luci/collections/luci/Makefile
git clone https://github.com/riverscn/openwrt-iptvhelper.git package/iptvhelper
git clone https://github.com/sirpdboy/luci-app-advanced.git package/luci-app-advanced
echo " set ra0 up
ip link set rai0 up

# 桥接网卡
brctl addif br-lan ra0
brctl addif br-lan rai0


exit 0

" > package/base-files/etc/files/rc.local

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
