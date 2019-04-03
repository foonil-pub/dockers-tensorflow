FROM tensorflow/tensorflow:1.12.0-py3
MAINTAINER foonil <foonil@pm.me>
#修改apt源: 阿里云镜像
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak \
&& echo "deb http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse\n\
deb http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse\n\
deb http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse\n\
deb http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse\n\ 
deb http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse\n\
deb-src http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse\n\
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse\n\
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse\n\
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse\n\
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse\n" >/etc/apt/sources.list \
&& apt update

#修改pip源: 阿里云镜像
RUN mkdir -p /root/.pip \
&&echo "[global]\n\
trusted-host =  mirrors.aliyun.com\n\
index-url = https://mirrors.aliyun.com/pypi/simple\n">/root/.pip/pip.conf

#jupyter扩展插件
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir jupyter_contrib_nbextensions && jupyter contrib nbextension install \
    && pip install --no-cache-dir yapf autopep8 \
    && pip install --no-cache-dir qgrid \
    && jupyter nbextension enable --sys-prefix toc2/main \
    && jupyter nbextension enable --sys-prefix hide_input_all/main \
    && jupyter nbextension enable --sys-prefix highlighter/highlighter \
    && jupyter nbextension enable --sys-prefix execute_time/ExecuteTime \
    && jupyter nbextension enable --sys-prefix code_prettify/code_prettify \
    && jupyter nbextension enable --sys-prefix code_prettify/autopep8 \
    && jupyter nbextension enable --sys-prefix varInspector/main \
    && jupyter nbextension enable --sys-prefix python-markdown/main \
    && jupyter nbextension enable --sys-prefix splitcell/splitcell \
    && jupyter nbextension enable --sys-prefix hinterland/hinterland \
    && jupyter nbextension enable --py --sys-prefix qgrid

#常用开发软件
RUN apt install -y git wget vim \
    && apt-get clean

#ssh服务
RUN apt-get install -y openssh-server \
    && apt-get install -y inetutils-ping iproute net-tools lsof\
    && apt-get clean \
    && mkdir /var/run/sshd \
    && sed -i 's/PermitRootLogin .*/PermitRootLogin yes/g' /etc/ssh/sshd_config
EXPOSE 22

#启动文件(启动命令 docker run -P -d --env PASSWORD=xxxx repo:tag)
RUN echo "#!/bin/bash\n\
if [ -z \"\$PASSWORD\" ]; then export PASSWORD=123456; fi\n\
echo root:\$PASSWORD|chpasswd\n\
/usr/sbin/sshd -D&\n\
jupyter notebook --allow-root" > /init.sh \
&& chmod +x /init.sh
CMD ["/init.sh"]
