#!/bin/bash

# 数据库的IP地址
DB_HOST=localhost
# 数据库的端口
DB_PORT=32768
# 数据库名
DB_NAME=xxx

# 用户名
DB_USER=xxx
# 用户密码
DB_PWD=xxx
# 数据库的bin目录(配置过环境变量，可不配)

# 备份文件保存的路径(绝对路径)
BACK_UP_DIR=/home/nlh/databaseBack
DATA=`date +"%Y-%m-%d %H-%M-%S"`
BAK_FILE_NAME="${DATA}_${DB_NAME}"

mongodump --host $DB_HOST --port $DB_PORT -d $DB_NAME --username $DB_USER --password $DB_PWD -o "${BACK_UP_DIR}/${BAK_FILE_NAME}"
