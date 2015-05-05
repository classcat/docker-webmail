FROM classcat/ubuntu-supervisord:vivid
MAINTAINER Masashi Okumura <masao@classcat.com>

WORKDIR /opt
ADD assets/cc-init.sh /opt/cc-init.sh

EXPOSE 22

CMD /opt/cc-init.sh; /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
