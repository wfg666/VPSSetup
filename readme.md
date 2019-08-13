# 梯子一键配置脚本
Fuck Gong Fei Wall!

## Require
ubuntu 18.04, kernel >= 4.9

## Usage
>cd VPSSetup
>cp v2ray_config.json.example v2ray_config.json
>cp shadowsocks_config.json.example shadowsocks_config.json
>source setup.sh

source setup.sh -t or source tools.sh to install git, vim, zsh, tmux, trash-cli, nload, curl, wget, axel, python-pip, digitalOcean monitoring agent and set ufw.

## Configuation
| Port | Protocol | Comment |
| ------ | ------ | ------  |
| 35001-35050 | shadowsocks | shadowsocks on v2ray |
| 35051-35070 | shadowsocks | shadowsocks on ssserver |
| 35101 | telegram MTProto  |  |
| 35102 | reverse proxy bridge | https://toutyrater.github.io/app/reverse2.html |
| 35103 | reverse proxy portal    |  |
| 35104 |api | only listen 127.0.0.1|
| 35200-35232 | VMess       | TCP,35200 for dynamic port |
| 35300-35332 | VMess       | mKCP,35300 for dynamic port |
| 35400-35410 | VMess       | mKCP + wechat-video |

## Seafile public uploader
```seafile_public_uploader.sh``` is a complimentary script to help uploading a file to a seafile repo which has public uploading permission.
For example you can download a huge file on your VPS outside the hugging wall, then use this script to upload it to a seafile server like ```cloud.tsinghua.edu.cn```

First you need to create a repo, share an upload link without password, then note the repo_id and the token.
![seafile_screenshot](http://github.com/mhc994/VPSSetup/raw/master/seafile.jpg)
>seafile_public_uploader.sh repo_id token file [filename]

![cmd](http://github.com/mhc994/VPSSetup/raw/master/cmd.png)



