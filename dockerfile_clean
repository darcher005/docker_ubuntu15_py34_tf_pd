FROM ubuntu:15.10

MAINTAINER Daniel darcher005@gmail.com

ENV PYTHONIOENCODING UTF-8
ENV PYTHON_PATH /usr/bin/python3


RUN apt-get clean && apt-get upgrade -y && apt-get update -y --fix-missing

RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq \
        python3 python3-dev python3-setuptools libpython3.4-stdlib libpython3.4-minimal

RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq \
        libatlas-base-dev libatlas-base-dev liblapack-dev gfortran build-essential gcc \
        curl libcurl4-openssl-dev \
        pkg-config libpng-dev libfreetype6 libfreetype6-dev

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
        python3 get-pip.py

RUN pip3 install matplotlib

RUN apt-get clean && apt-get upgrade -y && apt-get update -y --fix-missing

RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq python3-numpy python3-scipy

RUN pip3 install -U wheel six sklearn pandas requests
RUN pip3 install --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.6.0-cp34-none-linux_x86_64.whl

RUN echo "Asia/Shanghai" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq cron vim
RUN apt-get update && apt-get install -y openssh-server

RUN mkdir /var/run/sshd
RUN echo 'root:danielcontainer' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN pip3 install redis elasticsearch pymysql tornado

RUN apt-get clean

EXPOSE 22