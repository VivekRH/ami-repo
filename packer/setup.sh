#!/bin/bash


yum install httpd php -y

cp -r /tmp/webapp/* /var/www/html
chown -R apache:apache /var/www/html/*

systemctl restart httpd.service php-fpm.service
systemctl enable httpd.service php-fpm.service




