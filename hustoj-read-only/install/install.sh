#!/bin/bash
#before install check DB setting in
#	judge.conf
#	and down here
#and run this with root

APACHEUSER=www-data



#创建用户
sudo  /usr/sbin/useradd -m -u 1536 judge

#编译安装编译系统
cd hustoj-read-only/core/
sudo ./make.sh
cd ../..


#创建工作目录等
sudo    mkdir /home/judge
sudo    mkdir /home/judge/etc
sudo    mkdir /home/judge/data
sudo    mkdir /home/judge/log
sudo    mkdir /home/judge/run0
sudo    mkdir /home/judge/run1
sudo    mkdir /home/judge/run2
sudo    mkdir /home/judge/run3
#复制配置文件
sudo cp java0.policy  judge.conf /home/judge/etc
#改变文件所属关系
sudo chown -R judge /home/judge
sudo chgrp -R $APACHEUSER /home/judge/data
sudo chgrp -R root /home/judge/etc /home/judge/run?
sudo chmod 775 /home/judge /home/judge/data /home/judge/etc /home/judge/run?
#安装mysql C语言连接库
sudo apt-get install libmysqlclient-dev
#启动守护进程
#设置开机自启
sudo cp judged /etc/init.d/judged
sudo chmod +x  /etc/init.d/judged
sudo ln -s /etc/init.d/judged /etc/rc3.d/S93judged
sudo ln -s /etc/init.d/judged /etc/rc2.d/S93judged
sudo /etc/init.d/judged start
sudo /etc/init.d/apache2 restart
sudo /etc/init.d/httpd restart
