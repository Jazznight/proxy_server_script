#!/bin/sh

echo "y"|cp etc/sysconfig/iptables /etc/sysconfig/
chkconfig iptables on
service iptables restart

echo "y"|cp etc/ppp/chap-secrets /etc/ppp/
echo "y"|cp etc/pptpd.conf /etc/
chkconfig pptpd on
service pptpd restart

cat etc/squid/squid.conf |sed -e "s/@#@TW_NUM@#@/$TW_NUM/g" > /etc/squid/squid.conf
htpasswd -c /etc/squid/passwd squid_user
chkconfig squid on
service squid restart

echo "y"|cp etc/opt/ss5/ss5.* /etc/opt/ss5/
echo "y"|cp etc/init.d/ss5 /etc/init.d/
chmod 750 /etc/opt/ss5/ss5.passwd
chkconfig ss5 on
service ss5 restart

cp etc/init.d/shadowsocks /etc/init.d/
chmod +x /etc/init.d/shadowsocks
#chkconfig shadowsocks on
#service shadowsocks restart

grep "tw_host" /etc/hosts
if [ $? -ne 0 ];
then
    echo "$TW_IP tw_host${TW_NUM}" >> /etc/hosts
    echo "$CN_IP tw_host${CN_NUM}" >> /etc/hosts
    hostname tw_host${TW_NUM}
fi

# grep "$TW_NUM" /etc/iproute2/rt_tables
# if [ $? -ne 0 ];
# then
# 	cat etc/iproute2/rt_tables |sed -e "s/@#@CN_NUM@#@/$CN_NUM/g" -e "s/@#@TW_NUM@#@/$TW_NUM/g" >> /etc/iproute2/rt_tables
# fi
# 
# grep "$TW_IP" /etc/rc.local
# if [ $? -ne 0 ];
# then
# 	cat etc/rc.local|sed -e "s/@#@CN_NUM@#@/$CN_NUM/g" \
#                              -e "s/@#@TW_NUM@#@/$TW_NUM/g" \
#                              -e "s/@#@CN_IP@#@/$CN_IP/g" \
#                              -e "s/@#@TW_IP@#@/$TW_IP/g" \
#                              -e "s/@#@CN_GW@#@/$CN_GW/g" \
#                              -e "s/@#@TW_GW@#@/$TW_GW/g" \
#             >> /etc/rc.local
# fi
