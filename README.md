# 购票秒杀系统
本购票秒杀系统基于ThinkPHP实现，分为用户端以及后台管理端两部分，系统功能架构如下：
![Image text](https://github.com/Barbra0613/seckill-system-for-tickets/blob/main/pic/系统功能架构.png)


### 用户端
实现高并发下的秒杀任务，项目存储于client文件夹下，主界面如下图所示：
![Image text](https://github.com/Barbra0613/seckill-system-for-tickets/blob/main/pic/用户端.png)


### 后台管理端
实现购票秒杀系统的后台管理任务，项目存储于background文件夹下，主界面如下图所示：
![Image text](https://github.com/Barbra0613/seckill-system-for-tickets/blob/main/pic/后台管理端.png)

### 部署说明
1. 用户端：
    - Nginx 1.18.0
      MySQL 5.6.50
      PHP 5.6
      Redis 6.0.9
    - 基于ThinkPHP 5.0部署基础站点
    - 将application与public两目录导入站点
    - 在站点目录下，配置安装tp5扩展rabbit mq、jwt
    - 导入mysql.sql数据库信息
    - 配置client/application/database.php中数据库基本信息
2. 后台管理端：
    - 第二项嵌套的第一个元素
    - 第二项嵌套的第二个元素

