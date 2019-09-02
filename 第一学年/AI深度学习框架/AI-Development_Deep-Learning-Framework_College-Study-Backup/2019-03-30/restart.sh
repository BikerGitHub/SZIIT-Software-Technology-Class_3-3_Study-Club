#!/home/biker/test
basepath=$(cd `dirname $0`; pwd)
while true

do

procnum=`ps -ef|grep "python"|grep -v grep|wc -l`

if [ "$procnum" -eq 1 ]

then

python MLP.py #启动应用，修改成自己的启动应用脚本或命令

echo -e "\033[1;32;41m                              process has been restarted!                              \033[0m"

fi

sleep 1

done
