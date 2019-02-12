#!/bin/bash 

# check root privilege
[ "$EUID" -ne '0' ] && echo "This script must be run as root. Exiting..." && exit 1

echo "***** enabel BBR congestion control *****"
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf

echo "***** install v2ray *****"
bash <(curl -L -s https://install.direct/go.sh)
cp v2ray_config.json /etc/v2ray/config.json
service v2ray start

echo "***** install shadowsocks *****"
apt install -y git python-pip
# pip install shadowsocks
pip install --upgrade git+https://github.com/shadowsocks/shadowsocks.git@master
cp shadowsocks_config.json /etc/shadowsocks.json
cp shadowsocks.service /etc/init.d/shadowsocks
chmod +x /etc/init.d/shadowsocks
systemctl daemon-reload
service shadowsocks start
sudo update-rc.d shadowsocks defaults

for i in "$@"; do
    if [ $i = "-t" ]
    then
    	echo "*****  call tools.sh  *****"
    	source tools.sh
    	break
    fi
done

echo "*****  Finish. Fuck GFW🍺 *****"