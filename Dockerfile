FROM classcat/ubuntu-supervisord2:vivid
MAINTAINER ClassCat Co.,Ltd. <support@classcat.com>

########################################################################
# ClassCat/WebMail Dockerfile
#   Maintained by ClassCat Co.,Ltd ( http://www.classcat.com/ )
########################################################################

#--- HISTORY -----------------------------------------------------------
#-----------------------------------------------------------------------


#RUN apt-get update && apt-get install -y mysql-client

WORKDIR /opt
COPY assets/cc-init.sh /opt/cc-init.sh

EXPOSE 22

CMD /opt/cc-init.sh; /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
