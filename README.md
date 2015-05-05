# Webmail

Run sshd daemon under supervisord in a docker container.

## Overview

Ubuntu Vivid/Trusty SSH images with :

+ supervisord
+ sshd

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
-p 2022:22 -e password=(root password) \  
-e public_key="ssh-rsa xxx" \  
classcat/supervisord-ssh
```

### example)  

```
$ sudo docker run -d --name ssh \  
-p 2022:22 -e password=mypassword classcat/supervisord-ssh
```
```
$ sudo docker run -d --name ssh \
-p 2022:22 -e public_key="ssh-rsa xxx" classcat/supervisord-ssh
```
```
$ sudo docker run -d --name ssh \  
-p 2022:22 -e password=mypassword classcat/supervisord-ssh:trusty
```

## Variables

## Known Issues

## Reference
