#!/bin/bash
#安装screen并新建名为test的窗口
sudo apt install screen

#创建新窗口
screen -S my_screen -X screen

#切换用户

screen -r my_screen -p 0 -X stuff "su opwrt$(printf \\r)"

#运行audo3.sh

screen -r my_screen -p 0 -X stuff "cd ~ && ./audo3.sh$(printf \\r)"
