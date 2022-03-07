#!/bin/bash
sudo -i
hostnamectl set-hostname puppetagent02.example.com
echo "$(hostname -I) puppetagent02.example.com" >> /etc/hosts
rpm -Uvh https://yum.puppet.com/puppet6-release-el-7.noarch.rpm
yum repolist
yum install -y puppet-agent
echo "[main]" >> /etc/puppetlabs/puppet/puppet.conf
echo "certname = puppetagent02.example.com" >> /etc/puppetlabs/puppet/puppet.conf
echo "server = puppetmaster.example.com" >> /etc/puppetlabs/puppet/puppet.conf 
systemctl start puppet
ln -s /opt/puppetlabs/bin/puppet /usr/bin/puppet

#last step is to add the dns entry
#on /etc/hosts for each agent and the puppetmaster
#restart puppet service
