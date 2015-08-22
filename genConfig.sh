#!/bin/sh



CN_IP=`ifconfig|grep "inet addr"|sed -e 's/.*inet addr://g' -e 's/  Bcast.*//g'|head -n 1`
CN_NUM=`echo $CN_IP|cut -d. -f4`
CN_GW=`echo $CN_IP|sed -e 's/\.[0-9]*$//g'`

TW_IP=`ifconfig|grep "inet addr"|sed -e 's/.*inet addr://g' -e 's/  Bcast.*//g'|head -n 2|tail -n 1`
TW_NUM=`echo $TW_IP|cut -d. -f4`
TW_GW=`echo $TW_IP|sed -e 's/\.[0-9]*$//g'`

echo "" > set.hostenv
echo "export CN_NUM=$CN_NUM" >> set.hostenv
echo "export CN_IP=$CN_IP" >> set.hostenv
echo "export CN_GW=$CN_GW" >> set.hostenv
echo "export TW_NUM=$TW_NUM" >> set.hostenv
echo "export TW_IP=$TW_IP" >> set.hostenv
echo "export TW_GW=$TW_GW" >> set.hostenv
