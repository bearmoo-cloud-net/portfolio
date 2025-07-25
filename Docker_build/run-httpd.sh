#!/bin/bash

echo "TRUSTEDDOMAIN"
sed -i "s|TRUSTEDDOMAIN|$TRUSTEDDOMAIN|g" /var/www/html/nextcloud/config/config.php

echo "OVERWRITEURL"
sed -i "s|OVERWRITEURL|$OVERWRITEURL|g"   /var/www/html/nextcloud/config/config.php

echo "DBNAME"
sed -i "s|DBNAME|$DBNAME|g"               /var/www/html/nextcloud/config/config.php

echo "DBHOST"
sed -i "s|DBHOST|$DBHOST|g"               /var/www/html/nextcloud/config/config.php

echo "DBUSER"
sed -i "s|DBUSER|$DBUSER|g"               /var/www/html/nextcloud/config/config.php
sed -i "s|DBPASS|$DBPASS|g"               /var/www/html/nextcloud/config/config.php

echo "S3BUCKET"
sed -i "s|S3BUCKET|$S3BUCKET|g"           /var/www/html/nextcloud/config/config.php
sed -i "s|S3KEY|$S3KEY|g"                 /var/www/html/nextcloud/config/config.php
sed -i "s|S3SECRET|$S3SECRET|g"           /var/www/html/nextcloud/config/config.php
sed -i "s|S3HOSTNAME|$S3HOSTNAME|g"       /var/www/html/nextcloud/config/config.php
sed -i "s|INSTANCEID|$INSTANCEID|g"       /var/www/html/nextcloud/config/config.php
sed -i "s|PASSWORDSALT|$PASSWORDSALT|g"   /var/www/html/nextcloud/config/config.php
sed -i "s|SECRET|$SECRET|g"               /var/www/html/nextcloud/config/config.php
sed -i "s|VERSION|$VERSION|g"             /var/www/html/nextcloud/config/config.php
sed -i "s|LOGLEVEL|$LOGLEVEL|g"           /var/www/html/nextcloud/config/config.php
sed -i "s|MAILSMTPHOST|$MAILSMTPHOST|g"   /var/www/html/nextcloud/config/config.php
sed -i "s|MAILDOMAIN|$MAILDOMAIN|g"       /var/www/html/nextcloud/config/config.php
sed -i "s|REDISPORT|$REDISPORT|g"         /var/www/html/nextcloud/config/config.php
sed -i "s|REDISHOST|$REDISHOST|g"         /var/www/html/nextcloud/config/config.php
sed -i "s|REDISDATABASE|$REDISDATABASE|g" /var/www/html/nextcloud/config/config.php
sed -i "s|MAILFROM|$MAILFROM|g"           /var/www/html/nextcloud/config/config.php

sed -i "s|IntIpAddress|$IntIpAddress|g" /etc/nginx/nginx.conf
sed -i 's|#set_real_ip_from|set_real_ip_from|g' /etc/nginx/nginx.conf

if [ $sessionsave == "enabled" ]; then
  #echo "php_value[session.save_handler] = \"$SESSION_SAVE_HANDLE_TYPE\"" >> /etc/php/php-fpm.ini
  echo "session.save_handler = \"$SESSION_SAVE_HANDLE_TYPE\"" >> /etc/php/8.3/fpm/php.ini
  #echo "php_value[session.save_path] = \"$SESSION_SAVE_HANDLE_SETTING\"" >> /etc/php/php-fpm.ini
  echo "session.save_path = \"$SESSION_SAVE_HANDLE_SETTING\"" >> /etc/php/8.3/fpm/php.ini
fi
