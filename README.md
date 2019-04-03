# 给小白的 Tensorflow 环境
## 初衷
* 在自己的“破”电脑上，3分钟在完成环境的准备，支持Windows、Mac、Linux
* 在昂贵的GPU云服务上，3分钟完成环境的准备，开始模型训练

## 步骤
### 1. 下载、安装官方 Docker 应用
* Windows 用户，点击[此链接](!https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe)下载， 一路 Next 安装完毕。
* Mac 用户，点击[此链接](!https://download.docker.com/mac/stable/Docker.dmg)下载，装载dmg后直接拖到Application完毕。
* Ubuntu 18.04 用户，运行下列命令
```sh
curl https://raw.github.com/foonil-pub/dockers-tensorflow/master/docker-ce-ubuntu1804.sh | sudo bash
```
验证安装是否成功，Windows,Mac,Ubuntu都是在命令行界面，执行：
```sh
docker run hello-world
```

### 2. 下载运行 Tensorflow docker 环境
* 国内初学者用户，命令行运行：
```
docker run -P -d registry.cn-beijing.aliyuncs.com/foonil/tensorflow:cpu-1.12.0-py3
```
* 国外初学者用户，命令行运行:
```
docker run -P -d foonil/tensorflow:cpu-1.12.0-py3
```

### 3. 访问 Tensorflow 的两种方式
* 浏览器
* ssh客户端
