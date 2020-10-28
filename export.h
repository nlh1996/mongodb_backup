## 客户端导出数据指令
#/bin/bash
mongoexport --host localhost --port 32768 -d mirGm -c code -f _id,used,giftpackname,start --type=csv -q '{giftpackname:"新手礼包"}' -o ./code.csv
