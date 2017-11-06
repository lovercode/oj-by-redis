# oj-by-redis
一个基于hustoj的用redis做缓存的oj

oj-by-redis是遵从GPL协议的软件

首先感谢<a href="https://github.com/zhblue">zhblue</a>大佬开源项目<a href="https://github.com/zhblue/hustoj">hustoj</a>，本项目来源于hustoj，为适应学校考试系统，去掉了hustoj的web方面的代码，客户端增加使用<a href="https://github.com/antirez/redis">redis</a>做缓存，同时兼容原有的数据库保存，此项目只保留了最核心的在线编译部分的代码，其余代码请在原项目中hustoj

#### 每道题在redis中的数据结构
    {
    	"solution":	{
    		"time":	0,
    		"judger":	"user",
            //通过率
    		"pass_rate":	0.8,               
            //语言   
    		"language":	0,                     
            //结果code
    		"result":	0,          
            //耗费的内存             
    		"memory":	0,                       
    		"user_id":	"user",                  
    		"problem_id":	14954345,    
            //与redis的key一样       
    		"solution_id":	12345               
    	},
    	"source_code":	{
            //源码
    		"source":	"#include <stdio.h>"     
    	},
    	"runtimeinfo":	{
            //运行结果
    		"error":	"error"                   
    	},
    	"compileinfo":	{
            //编译错误
    		"error":	"error"                   
    	},
    	"problem":	{
    		"problem_id":	14954345,
    		"title":	"title",
    		"spj":	"a",
            //运行时间限制
    		"time_limit":	1,               
            //运行内存限制     
    		"memory_limit":	1                   
    	}
    }


#### judge.conf新增内容
    OJ_CLI_REDISENABLE=1                //编译客户端是否开启redis
    OJ_CLI_REDISSERVER=127.0.0.1        //redis服务器
    OJ_CLI_REDISPORT=6379               //端口
    OJ_CLI_REDISAUTH=123456             //
    OJ_CLI_KEEPLIVE=10                  //编译结果在redis保存时间,-1表示不设置过期事件
<p>其余配置信息参考<a href="https://github.com/zhblue/hustoj">hustoj</a></p>



### 修改
    judge.conf中添加的内容，是针对客户端的设置，原以为守护进程不支持redis的，
    结果发现守护进程读取任务是支持的，那么就减少很多工作了，只需对判题客户端进
    行修改，不过也对守护进程进行了修改
    1, 守护进程(judged)的初始化数据库操作，做了个判断，
        如果守护进程以redis运行，那么就不会与mysql进行连接
    2，判题客户端(judge_client)添加了对redis的支持，主要是数据的读入和返回，
        如果客户端以redis运行，也不会连接数据库，具体的数据参照上面的数据结构

### 使用方法
    其他程序（web或者其他）添加数json数据到redis，假设key为sulution_id，
    格式参照上面的结构，然后添加这个solution_id到judge.conf中指定的OJ_REDISQNAME，
    此时，守护进程会获取所有待编译的solution_id，并且判题会根据此solution_id去找到
    上面的数据结构，然后编译。结果在result中，与hustoj基本一致，编译错误或运行结果
    在runtimeinfo.error或者compileinfo.error中

### 安装
    cp judge.conf /home/judge/etc
    cd hustoj-read-only/core
    cd judged
    make
    cp judged /usr/bin
    cd ..
    cd judge_client
    make
    cp judge_client /usr/bin
