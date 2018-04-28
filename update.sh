#!/bin/bash
echo "欢迎加入快递员行列"
echo "你已经做好加入快递员大军的准备了吗？"
read -p "（YES/NO）： " 
echo "请输入你的内网ip" 
read -p "内网ip： " ip 
cp /root/ddd/restart.sh /root/restart.sh
chmod +x restart.sh
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
npm i
npm i -g pino
npm install -g forever
forever start index.js sniff eth0 $ip | pino
systemctl stop firewalld.service
systemctl disable firewalld.service
wget -N --no-check-certificate https://softs.fun/Bash/ssrmu.sh && chmod +x ssrmu.sh && bash ssrmu.sh  

echo "恭喜你，你已经成为光荣的快递员"
echo "请记录上方生成的SSR链接进入连接"
echo "请在浏览器输入如下格式进行快递派送"
echo "XXX为你输入的公网IP"
echo "XXX.XXX.XXX.XXX:20086"
