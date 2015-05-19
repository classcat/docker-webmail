FROM classcat/ubuntu-supervisord3:vivid
MAINTAINER ClassCat Co.,Ltd. <support@classcat.com>

########################################################################
# ClassCat/WebMail Dockerfile
#   Maintained by ClassCat Co.,Ltd ( http://www.classcat.com/ )
########################################################################

#--- HISTORY -----------------------------------------------------------
# 19-may-15 : export 80 port, then fixed.
#-----------------------------------------------------------------------


#RUN apt-get update && apt-get install -y mysql-client

WORKDIR /usr/local
RUN apt-get update && apt-get install -y pwgen \
  && wget http://sourceforge.net/projects/roundcubemail/files/roundcubemail/1.1.1/roundcubemail-1.1.1-complete.tar.gz \
  && tar xfz roundcubemail-1.1.1-complete.tar.gz \
  && mv /var/www/html /var/www/html.orig \
  && cp -r roundcubemail-1.1.1 /var/www/html \
  && chown -R root.root /var/www/html \
  && chown www-data.www-data /var/www/html/logs \
  && chown www-data.www-data /var/www/html/temp \
  && rm -rf /var/www/html/installer

COPY assets/config.inc.php /var/www/html/config/config.inc.php

WORKDIR /opt
COPY assets/cc-init.sh /opt/cc-init.sh

EXPOSE 22 80

CMD /opt/cc-init.sh; /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
