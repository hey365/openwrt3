#!/bin/bash
#把文件移动到opwrt用户的主目录下
mv -f openwrt3/* /home/opwrt/
#切换用户为opwrt
su -l opwrt

#git clone仓库
git clone --depth 1 https://github.com/openwrt/openwrt -b v23.05.0 openwrt

#添加源
cd openwrt
sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
        
#切换路径并拷贝编译文件
cd ../
mv -f ./luci.mk openwrt/luci.mk
mv -f ./rules.mk openwrt/rules.mk

#添加自定义程序，如luci-app-kodexplorer
chmod +x ./addapp*.sh && ./addapp*.sh

#下载依赖
cd openwrt
./scripts/feeds update -a
./scripts/feeds install -a && ./scripts/feeds install -a

#编辑配置文件
cd ../
mv -f ./.config openwrt/.config
chmod +x ./customize.sh && ./customize.sh
cd openwrt && make defconfig
make menucofig
