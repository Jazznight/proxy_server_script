#!/bin/sh

yum -y update
yum -y install openssh-clients
yum -y install wget
yum -y install git
yum -y install squid
yum -y install httpd-tools
yum -y install python-setuptools && easy_install pip
pip install shadowsocks

yum -y install ppp
wget http://poptop.sourceforge.net/yum/stable/rhel6/x86_64/pptpd-1.4.0-1.el6.x86_64.rpm
rpm -ivh pptpd-1.4.0-1.el6.x86_64.rpm
