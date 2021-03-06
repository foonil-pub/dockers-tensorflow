#!/bin/bash
#更换 ubuntu apt 国内中科大软件源，增速下载
cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
apt update

#安装支持软件
sudo apt install -y\
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    lsb-release

#添加docker官方GPG安全密钥
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#添加中科大docker-ce的源
add-apt-repository "deb [arch=amd64] https://mirrors.ustc.edu.cn/docker-ce/linux/ubuntu \
$(lsb_release -cs) stable"
apt update

#安装docker-ce
apt install -y docker-ce docker-ce-cli containerd.io
