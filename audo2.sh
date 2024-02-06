#!/bin/bash
#安装screen并新建名为test的窗口
sudo apt install screen && screen -dmR test bash-c 'su - opwrt'
exit
