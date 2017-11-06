#!/bin/bash
#编译守护进程
cd judged
make
chmod +x judged
#拷贝到可执行文件下
cp judged /usr/bin
#编译编译客户端
cd ../judge_client
make
chmod +x judge_client
cp judge_client /usr/bin
#以下的考试系统用不到，注释掉了
# cd ../sim/sim_2_77
# make fresh
# make exes
# chmod +x sim*
# cp sim_c.exe /usr/bin/sim_c
# cp sim_java.exe /usr/bin/sim_java
# cp sim_pasc.exe /usr/bin/sim_pas
# cp sim_text.exe /usr/bin/sim_text
# cd ..
# cp sim.sh /usr/bin
# chmod +x /usr/bin/sim.sh
# rm /usr/bin/sim_cc /usr/bin/sim_rb /usr/bin/sim_sh
# ln -s /usr/bin/sim_c /usr/bin/sim_cc
# ln -s /usr/bin/sim_text /usr/bin/sim_rb
# ln -s /usr/bin/sim_text /usr/bin/sim_sh
