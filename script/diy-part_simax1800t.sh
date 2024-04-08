#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# 说明：
# 除了第一行的#!/bin/bash不要动，其他的设置，前面带#表示不起作用，不带的表示起作用了（根据你自己需要打开或者关闭）
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# 修改openwrt登陆地址,把下面的192.168.123.1修改成你想要的就可以了
sed -i 's/192.168.6.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# 修改主机名字，把ImmortalWrt修改你喜欢的就行（不能纯数字或者使用中文）
sed -i 's/ImmortalWrt/SIM-AX18T/g' package/base-files/files/bin/config_generate

# 修改闭源驱动2G wifi名称
sed -i 's/SSID1=CR660X_2.4G/SSID1=AX1800T/g' package/emortal/mtkhqos_util/files/mt7615.1.2G.dat

# 修改闭源驱动5G wifi名称
sed -i 's/SSID1=Openwrt_5G/SSID1=AX1800T-5G/g' package/emortal/mtkhqos_util/files/mt7615.1.5G.dat

# 修改闭源驱动5G wifi信道
sed -i 's/Channel=44/Channel=149/g' package/emortal/mtkhqos_util/files/mt7615.1.5G.dat

# 添加个性信息
#sed -i 's/22.5.5/22.5.5 by nanchuci/g' ./package/lean/default-settings/files/zzz-default-settings

# fix luci-app-easymesh
#sed -i 's/kmod-batman-adv +wpad-openssl/kmod-batman-adv +wpad-basic-wolfssl/g' feeds/luci/applications/luci-app-easymesh/Makefile

# 修改banne文件（banne文件在根目录）（不要修改此行代码,怕弄的diy-lede.sh文件全失效,不需要的话前面加#，或者全行代码删除了）
#rm -rf ./package/base-files/files/etc/banne && cd .. && cp -f ./banner openwrt/package/base-files/files/etc/ && cd openwrt

# 更改时区
sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

#修正连接数
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf

