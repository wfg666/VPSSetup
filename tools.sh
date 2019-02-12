echo "***** install utilities *****"
apt update
apt upgrade -y 
apt install -y git vim zsh tmux trash-cli nload curl wget axel python-pip

# check Digital Ocean
read sys_vendor < /sys/devices/virtual/dmi/id/bios_vendor
if [ "$sys_vendor" = "DigitalOcean" ]
then
	echo "***** install dogital ocean monitoring tool *****"
	curl -sSL https://agent.digitalocean.com/install.sh | sh
fi

# ufw
ufw allow 22
ufw allow 35001:35070/tcp
ufw allow 35101
ufw allow 35102
ufw allow 35103
ufw allow 35200:35232/tcp
ufw allow 35300:35332/udp
ufw allow 35400:35432/udp
ufw --force enable 

# zsh
chsh -s /bin/zsh
echo "***** install oh-my-zsh *****"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"




