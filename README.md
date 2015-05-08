# Webmail

Run roundcube under the control of supervisor daemon in a docker container.

## Overview

Ubuntu Vivid/Trusty roundcube images with :

+ supervisord
+ sshd
+ roundcube

built on the top of the formal Ubuntu images.

## TAGS

+ latest - vivid
+ vivid
+ trusty

## Pull Image

```
$ sudo docker pull classcat/webmail
```

## Usage

```
$ sudo docker run -d --name (container name) \  
-p 2022:22 -p 80:80 \
--link (mysql container name):mysql \  
-e ROOT_PASSWORD=(root password) \  
-e SSH_PUBLIC_KEY="ssh-rsa xxx" \  
-e MYSQL_ROOT_PASSWORD=(mysql root password)
classcat/webmail
```

### example)  

```
$ sudo docker run -d --name webmail \  
-p 2022:22 -p 80:80 --link mysql:mysql \  
-e ROOT_PASSWORD=root_password \  
-e MYSQL_ROOT_PASSWORD=mysql_password \  
classcat/webmail
```
```
$ sudo docker run -d --name webmail \  
-p 2022:22 -p 80:80 --link mysql:mysql \  
-e SSH_PUBLIC_KEY="ssh-rsa xxx" \  
-e MYSQL_ROOT_PASSWORD=mysql_password \  
classcat/webmail:trusty
```

## Variables

## Known Issues

## Reference
