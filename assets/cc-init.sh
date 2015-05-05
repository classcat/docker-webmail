#!/bin/bash

########################################################################
# ClassCat/Supervisord-SSH Asset files
# maintainer: Masashi Okumura < masao@classcat.com >
########################################################################

### HISTORY ###
# 05-may-15 : Support a public key as well as a password 
#


############
### SSHD ###
############

function change_root_password() {
  if [ -z "$password" ]; then
    echo "Warning >> No password specified."
  else
    echo -e "root:${password}" | chpasswd
    # echo -e "${password}\n${password}" | passwd root
  fi
}


function put_public_key() {
  if [ -z "$public_key" ]; then
    echo "Warning >> No public key specified."
  else
    mkdir -p /root/.ssh
    chmod 0700 /root/.ssh
    echo "${public_key}" > /root/.ssh/authorized_keys
  fi
}


##################
### SUPERVISOR ###
##################
# See http://docs.docker.com/articles/using_supervisord/

function proc_supervisor () {
# removed the followings:
#[supervisord]
#nodaemon=true

  cat > /etc/supervisor/conf.d/supervisord.conf <<EOF
[program:ssh]
command=/usr/sbin/sshd -D

[program:rsyslog]
command=/usr/sbin/rsyslogd -n -c3
EOF
}


change_root_password
put_public_key
proc_supervisor

exit 0


### End of Script ###
