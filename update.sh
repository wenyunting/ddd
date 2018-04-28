#!/bin/bash
echo "欢迎使用网页雷达一键脚本"
echo "请输入交流群号"
read -p "交流群： " qun
echo "请输入你的内网ip" 
read -p "内网ip： " ip
sudo su 
chmod -R 777 /root
cp /root/ddd/restart.sh /root/restart.sh
chmod +x restart.sh
wget --no-check-certificate -O shadowsocks-all.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh
chmod +x shadowsocks-all.sh
./shadowsocks-all.sh 2>&1 | tee shadowsocks-all.log

echo "ss搭建成，请记住连接信息"
read -p "记住了吗？任意键继续" 

yum update -y
yum install -y wget net-tools gcc make gdb python openssh-server tar epel-release ntp openssh-clients tar curl rsync bzip2 tcpdump less telnet lsof sysstat cronie python-setuptools gcc-c++ flex bison which man
wget https://download.libsodium.org/libsodium/releases/LATEST.tar.gz -O /opt/LATEST.tar.gz
cd /opt && tar xvf LATEST.tar.gz && cd libsodium* && ./configure && make && make install && echo /usr/local/lib > /etc/ld.so.conf.d/usr_local_lib.conf && ldconfig
wget http://www.tcpdump.org/release/libpcap-1.8.1.tar.gz -O /opt/libpcap.tar.gz
cd /opt && tar xvf libpcap.tar.gz && cd libpcap* && ./configure && make && make install
curl https://raw.githubusercontent.com/creationix/nvm/v0.13.1/install.sh | bash && source ~/.bash_profile && nvm install v9.8.0 && nvm alias default v9.8.0
npm i -g npm
nvm install v10.0.0

cd /root/ddd
git clone https://github.com/wenyunting/ddd.git
cd /root/ddd
npm i
npm i -g pino
npm install -g forever
forever start index.js sniff eth0 $ip | pino

echo "搭建完成"
