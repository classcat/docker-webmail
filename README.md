# Webmail

Run webmail under supervisord in a docker container.

## Overview

Ubuntu Vivid/Trusty webmail images with :

+ supervisord
+ sshd
+ webmail

built on the top of the formal Ubuntu images.

## TAGS

+ latest - vivid
+ vivid
+ trusty

## Pull Image

```
$ sudo docker pull classcat/supervisord-ssh
```

## Usage

```
$ sudo docker run -d --name (container name) \  
-p 2022:22  \
--link (mysql container name):mysql \  
-e ROOT_PASSWORD=(root password) \  
-e SSH_PUBLIC_KEY="ssh-rsa xxx" \  
-e MYSQL_ROOT_PASSWORD=(mysql root password)
classcat/webmail
```

### example)  

```
$ sudo docker run -d --name ssh \  
-p 2022:22 -e ROOT_PASSWORD=mypassword classcat/supervisord-ssh
```
```
$ sudo docker run -d --name ssh \
-p 2022:22 -e SSH_PUBLIC_KEY="ssh-rsa xxx" classcat/supervisord-ssh
```
```
$ sudo docker run -d --name ssh \  
-p 2022:22 -e ROOT_PASSWORD=mypassword classcat/supervisord-ssh:trusty
```

## Variables

## Known Issues

## Reference
