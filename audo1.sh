#!/bin/bash

#删除原始文件
sudo rm -rf \
/usr/share/dotnet \
/etc/mysql \
/etc/php
sudo -E apt-get -y purge \
azure-cli \
ghc* \
zulu* \
hhvm \
llvm* \
firefox \
google* \
dotnet* \
powershell \
openjdk* \
mysql* \
php*

#更新
sudo -E apt-get update
sudo -E apt-get -y install ack antlr3 aria2 asciidoc autoconf automake autopoint binutils bison build-essential bzip2 ccache cmake cpio curl device-tree-compiler fastjar flex gawk gettext gcc-multilib g++-multilib git gperf haveged help2man intltool libc6-dev-i386 libelf-dev libglib2.0-dev libgmp3-dev libltdl-dev libmpc-dev libmpfr-dev libncurses5-dev libncursesw5-dev libreadline-dev libssl-dev libtool lrzsz mkisofs msmtp nano ninja-build p7zip p7zip-full patch pkgconf python2.7 python3 python3-pip libpython3-dev qemu-utils rsync scons squashfs-tools subversion swig texinfo uglifyjs upx-ucl unzip vim wget xmlto xxd zlib1g-dev
sudo apt install -y ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential \
bzip2 ccache clang cmake cpio curl device-tree-compiler ecj fastjar flex gawk gettext gcc-multilib \
g++-multilib git gnutls-dev gperf haveged help2man intltool lib32gcc-s1 libc6-dev-i386 libelf-dev \
libglib2.0-dev libgmp3-dev libltdl-dev libmpc-dev libmpfr-dev libncurses5-dev libncursesw5 \
libncursesw5-dev libpython3-dev libreadline-dev libssl-dev libtool lld llvm lrzsz mkisofs msmtp \
nano ninja-build p7zip p7zip-full patch pkgconf python2.7 python3 python3-pip python3-ply \
python-docutils python3-pyelftools qemu-utils re2c rsync scons squashfs-tools subversion swig \
texinfo uglifyjs upx-ucl unzip vim wget xmlto xxd zlib1g-dev
sudo -E apt-get -y autoremove --purge
sudo -E apt-get clean

#创建用户,先赋予sudo权限
sudo sed -i '20a opwrt      ALL=(ALL:ALL) ALL' /etc/sudoers
#创建opwrt用户组
groupadd opwrt
#创建opwrt用户并设置密码为"psswrd!!!"
sudo useradd -g opwrt -d /home/opwrt -s /bin/bash -m opwrt && echo 'opwrt:psswrd!!!' | sudo chpasswd
#重启
reboot
