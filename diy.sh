#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#


# cp -f ./patch/mt7621_xiaomi_mi-router-cr660x.dts /target/linux/ramips/dts/mt7621_xiaomi_mi-router-cr660x.dts
# cp -f ./patch/02_network /target/linux/ramips/mt7621/base-files/etc/board.d/02_network

# 下载插件
git clone https://github.com/gngpp/luci-theme-design package/luci-theme-design

# 替换argon主题
rm -rf feeds/luci/themes/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git ./feeds/luci/themes/luci-theme-argon
find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f

# 个性化设置
cd package
sed -i "s/OpenWrt /P3N9 build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" lean/default-settings/files/zzz-default-settings
sed -i 's/OpenWrt/AX-1800T/' package/base-files/files/bin/config_generate
#sed -i "/firewall\.user/d" lean/default-settings/files/zzz-default-settings
sed -i 's/192.168.1.1/192.168.2.1/g' base-files/files/bin/config_generate


# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
