FROM gcr.io/bearmoo-cloud-net/nginx-base:14

ENV VERSION 28.0.14

#configure for nextcloud
COPY build/install_nextcloud.sh /bin/
COPY build/config.php /var/www/html/nextcloud/config/
RUN bash /bin/install_nextcloud.sh
COPY build/nextcloud.conf /etc/nginx/sites-enabled/nextcloud.conf
COPY build/run-httpd.sh /bin/
RUN chmod a+x /bin/run-httpd.sh

#configure php to increase upload size
RUN sed -i "s/post_max_size = 8M/post_max_size = 10000M/g" /etc/php/php-fpm.ini && \ 
    sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 10000M/g" /etc/php/php-fpm.ini && \
    sed -i "s/output_buffering = 4096/output_buffering = 0/g" /etc/php/php-fpm.ini

RUN sed -i "s/session.save_handler/;session.save_handler/g" /etc/php/php-fpm.ini
#check if nginx config is correct
RUN nginx -t

EXPOSE 80
CMD /bin/run-httpd.sh && /etc/init.d/php-fpm start && nginx -g "daemon off;"
