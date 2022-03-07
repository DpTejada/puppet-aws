#!/bin/bash
sudo -i
hostnamectl set-hostname puppetmaster.example.com
echo "$(hostname -I) puppetmaster.example.com puppet" >> /etc/hosts
rpm -Uvh https://yum.puppet.com/puppet6-release-el-7.noarch.rpm
yum repolist
yum install -y puppetserver
systemctl start puppetserver
ln -s /opt/puppetlabs/bin/puppetserver /usr/bin/puppetserver

#last step is to add the dns entry
#on /etc/hosts for each agent.