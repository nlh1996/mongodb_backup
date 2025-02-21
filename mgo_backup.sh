#!/bin/bash

# 数据库的IP地址
DB_HOST=localhost
# 数据库的端口
DB_PORT=81
# 数据库名
DB_NAME=game
# 用户名
DB_USER=admin
# 用户密码
DB_PWD=xjjxjj
# 备份文件保存的路径(绝对路径)
BACK_UP_DIR=/data/dbBackup
LOG_FILE="${BACK_UP_DIR}/backup.log"

# 检查备份目录是否存在，不存在则创建
if [ ! -d "$BACK_UP_DIR" ]; then
    mkdir -p "$BACK_UP_DIR"
fi

# 设置备份文件名
DATA=$(date +"%Y-%m-%d_%H-%M-%S")
BAK_FILE_NAME="${DATA}_${DB_NAME}"

# 执行备份
if mongodump --host $DB_HOST --port $DB_PORT -d $DB_NAME --username $DB_USER --password $DB_PWD --authenticationDatabase admin -o "${BACK_UP_DIR}/${BAK_FILE_NAME}"; then
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Backup succeeded: ${BAK_FILE_NAME}" >> "$LOG_FILE"
    # 压缩备份文件
    tar -czf "${BACK_UP_DIR}/${BAK_FILE_NAME}.tar.gz" -C "${BACK_UP_DIR}/${BAK_FILE_NAME}" .
    rm -rf "${BACK_UP_DIR}/${BAK_FILE_NAME}"
else
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Backup failed: ${BAK_FILE_NAME}" >> "$LOG_FILE"
fi

# 清理旧备份（保留最近7天的备份）
find "$BACK_UP_DIR" -type f -name "*.tar.gz" -mtime +7 -exec rm -f {} \;

# 设置备份目录和日志文件的权限
chmod 700 "$BACK_UP_DIR"
chmod 600 "$LOG_FILE"