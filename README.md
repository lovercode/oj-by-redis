# oj-by-redis
一个基于hustoj的用redis做缓存的oj

oj-by-redis是遵从GPL协议的软件

首先感谢<a href="https://github.com/zhblue">zhblue</a>大佬开源项目<a href="https://github.com/zhblue/hustoj">hustoj</a>，本项目来源于hustoj，为适应学校考试系统，去掉了hustoj的web方面的代码，并且增加使用<a href="https://github.com/antirez/redis">redis</a>做缓存，只保留了最核心的在线编译部分的代码

#### 每道题在redis中的数据结构
    {
    	"solution":	{
    		"time":	0,
    		"judger":	"user",
    		"pass_rate":	0.8,
    		"language":	0,
    		"result":	0,
    		"memory":	0,
    		"user_id":	"user",
    		"problem_id":	14954345,
    		"solution_id":	12345
    	},
    	"source_code":	{
    		"source":	"#include <stdio.h>"
    	},
    	"runtimeinfo":	{
    		"error":	"error"
    	},
    	"compileinfo":	{
    		"error":	"error"
    	},
    	"problem":	{
    		"problem_id":	14954345,
    		"title":	"title",
    		"spj":	"a",
    		"time_limit":	1,
    		"memory_limit":	1
    	}
    }
# 开发中。。。
