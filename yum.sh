#!/bin/sh

yum -y update
yum -y install openssh-clients
yum -y install wget
yum -y install git
yum -y install squid
yum -y install httpd-tools

yum install gcc.x86_64 rpm-build.x86_64 openldap-devel.x86_64 pam-devel.x86_64 openssl-devel.x86_64 -y
rpm -ivh ss5-3.8.9-8.x86_64.rpm

yum -y install python-setuptools && easy_install pip
pip install shadowsocks

yum -y install ppp
wget http://poptop.sourceforge.net/yum/stable/rhel6/x86_64/pptpd-1.4.0-1.el6.x86_64.rpm
rpm -ivh pptpd-1.4.0-1.el6.x86_64.rpm
