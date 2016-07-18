FROM 65a6a5f4dbc1

MAINTAINER daniel darcher005@gmail.com

USER root

RUN echo "Asia/Shanghai" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq cron vim

RUN pip3 install redis elasticsearch pymysql tornado

RUN apt-get clean
 

