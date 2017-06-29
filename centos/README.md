# 使用说明

[TOC]

## 修改docker-compose.yml
- 修改services下app为对应项目
- 修改container_name 为对应项目名字
- 修改command 启动命令。文档中为用gunicorn启动flask run.py里的app.run()
- 端口/路径等根据项目自行修改

## 编译docker镜像
- 修改build.sh 中的appname为镜像名 或者手动执行命令

## 添加python库
- 修改requirements.txt添加python库

## Enjoy
- docker-compose up -d
- 放到linux下编译的时候 没有docker-compose 用pip install docker-compose -U更新