#!/bin/bash


#更新
sudo apt update -y
sudo apt full-upgrade -y
sudo apt install -y ack antlr3 aria2 asciidoc autoconf automake autopoint binutils bison build-essential bzip2 ccache cmake cpio
sudo apt install -y clang curl device-tree-compiler ecj fastjar flex gawk gettext gcc-multilib \
g++-multilib git gnutls-dev gperf haveged help2man intltool lib32gcc-s1 libc6-dev-i386 libelf-dev \
libglib2.0-dev libgmp3-dev libltdl-dev libmpc-dev libmpfr-dev libncurses5-dev libncursesw5 \
libncursesw5-dev libpython3-dev libreadline-dev libssl-dev libtool lld llvm lrzsz mkisofs msmtp \
nano ninja-build p7zip p7zip-full patch pkgconf python3 python2.7 python3-setuptools python3-pip python3-ply \
python-docutils python3-pyelftools qemu-utils re2c rsync scons squashfs-tools subversion swig \
texinfo uglifyjs upx-ucl unzip vim wget xmlto xxd zlib1g-dev

#创建用户,先赋予sudo权限
sudo sed -i '20a opwrt      ALL=(ALL:ALL) ALL' /etc/sudoers
#创建opwrt用户组
groupadd opwrt
#创建opwrt用户并设置密码为"Q%sdt854%",要记住密码！！！
sudo useradd -g opwrt -d /home/opwrt -s /bin/bash -m opwrt && echo 'opwrt:Q%sdt854%' | sudo chpasswd

#把文件移动到opwrt用户的主目录下
mv audo1.sh ../ && mv audo2.sh ../
mv ./* /home/opwrt/ && sudo chown -R opwrt /home/opwrt/

#重启
reboot
