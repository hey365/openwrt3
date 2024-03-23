#!/bin/bash

#git clone仓库
git clone --depth 1 https://github.com/openwrt/openwrt -b v23.05.0 openwrt

#添加源
cd openwrt
sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
 sed -i '$a src-git jerryk https://github.com/jerrykuku/openwrt-package' feeds.conf.default 
        
#切换路径并拷贝编译文件
cd ../
mv -f ./luci.mk openwrt/luci.mk
mv -f ./rules.mk openwrt/rules.mk

#添加自定义程序，如luci-app-kodexplorer
chmod +x ./add_lede.sh && ./add_lede.sh
chmod +x ./add_luci.sh && ./add_luci.sh
chmod +x ./add_opwrt.sh && ./add_opwrt.sh
chmod +x ./add_packages.sh && ./add_packages.sh
cd openwrt/package
rm -rf luci-theme-argon && rm -rf luci-app-argon-config
git clone https://github.com/jerrykuku/luci-theme-argon.git
git clone https://github.com/jerrykuku/luci-app-argon-config.git
#下载依赖
cd ../
./scripts/feeds update -a
./scripts/feeds install -a && ./scripts/feeds install -a

#编辑配置文件
cd ../
mv -f default.config openwrt/.config
chmod +x ./customize.sh && ./customize.sh
cd openwrt && make defconfig
make menucofig
