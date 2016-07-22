FROM kushalchawda/tensorflow-pandas-quandl-numpy:latest

MAINTAINER daniel darcher005@gmail.com

RUN echo "Asia/Shanghai" > /etc/timezone

RUN dpkg-reconfigure -f noninteractive tzdata

RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq cron vim

RUN apt-get update && apt-get install -y openssh-server

RUN mkdir /var/run/sshd

RUN echo 'root:danielcontainer' | chpasswd

RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN pip3 install scipy redis elasticsearch pymysql tornado

RUN apt-get clean

EXPOSE 22

