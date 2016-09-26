FROM nginx

# SUPERVISOR
RUN apt-get update \
    && apt-get install -y supervisor apt-utils vim \
    && mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# PHP
ENV PHP_FPM_USER=www-data

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 14AA40EC0831756756D7F66C4F4EA0AAE5267A6C \
 && echo "deb http://ppa.launchpad.net/ondrej/php5-5.6/ubuntu trusty main" >> /etc/apt/sources.list \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y php5-fpm php5-cli php5-curl php5-gd \
 && sed 's/;daemonize = yes/daemonize = no/' -i /etc/php5/fpm/php-fpm.conf \
 && rm -rf /var/lib/apt/lists/*


# NGINX
COPY nginx.conf /etc/nginx/conf.d/default
RUN sed -i 's|user  nginx;|user nginx www-data;|' /etc/nginx/nginx.conf

# GRAV
RUN rm /usr/share/nginx/html/*
COPY ./grav /usr/share/nginx/html
RUN cd /usr/share/nginx/html && bash perms.sh

# Finish
CMD ["/usr/bin/supervisord"]
