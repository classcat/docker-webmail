FROM classcat/ubuntu-supervisord2:vivid
MAINTAINER Masashi Okumura <masao@classcat.com>

#RUN apt-get update && apt-get install -y mysql-client

WORKDIR /opt
ADD assets/cc-init.sh /opt/cc-init.sh

EXPOSE 22

CMD /opt/cc-init.sh; /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
