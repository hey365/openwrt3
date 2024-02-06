#!/bin/bash

# 创建一个与要克隆的仓库同名或不同命的目录
mkdir luci
cd luci

# 初始化一个新的Git仓库
git init

# 添加远程仓库地址
git remote add origin https://github.com/coolsnowwolf/luci.git

# 启用“Sparse Checkout”功能
git config core.sparsecheckout true

# 将要部分克隆的目录相对于仓库根目录的路径写入配置文件
echo "applications/luci-app-kodexplorer" >> .git/info/sparse-checkout
echo "applications/luci-app-argon-config" >> .git/info/sparse-checkout
echo "applications/luci-app-vsftpd" >> .git/info/sparse-checkout

git pull --depth 1 origin master

# 修改权限
find ./applications/ -type f -exec chmod +x {} \;

# 现在把它移动到openwrt的pakcage文件夹下

 mv -f ./applications/* ../openwrt/package/

