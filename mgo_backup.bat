@echo off
rem =====================================================
rem 以下信息需要手动配置修改
rem =====================================================

rem 数据库的IP地址
set DB_HOST=xxx.xxx.xxx.xxx
rem 数据库的端口
set DB_PORT=32768
rem 数据库名
set DB_NAME=xxx
rem 用户名
set DB_USER=xxx
rem 用户密码
set DB_PWD=xxx
rem 数据库的bin目录
set PG_BIN_DIR=C:\Program Files\MongoDB\Server\4.0\bin
rem 备份文件保存的路径
set BACK_UP_DIR=D:\Mongodb\databaseBack

rem =====================================================
rem 以下为批处理逻辑部分,不需要修改
rem =====================================================

set BAK_FILE_NAME=%DB_NAME%_%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%
%PG_BIN_DIR:~0,2%

cd %PG_BIN_DIR%

mongodump --host %DB_HOST% --port %DB_PORT% -d %DB_NAME% --username %DB_USER% --password %DB_PWD% -o %BACK_UP_DIR%\%BAK_FILE_NAME%