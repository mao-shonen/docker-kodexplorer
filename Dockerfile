FROM centos:7


RUN yum install -y epel-release yum-utils \
  && yum update -y \
  && yum install -y nginx

RUN yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm \
  && yum-config-manager --enable remi-php73 \
  && yum install -y php-fpm php-opcache php-gd php-smbclient php-json php-mbstring php-pdo php-gd php-pecl-msgpack \
     php-gmp php-pecl-zip php-pecl-imagick php-pear php-pecl-memcached php-fedora-autoloader php-pecl-igbinary php-intl \
  && chown -R nginx. /usr/share/nginx/html \
  && mkdir /run/php-fpm

RUN curl -L -o KodExplorer.tar.gz https://github.com/kalcaddle/KodExplorer/archive/4.39.tar.gz \
  && tar -zxf KodExplorer.tar.gz \
  && rm -f KodExplorer.tar.gz \
  && mv KodExplorer* /opt/KodExplorer

EXPOSE 80
VOLUME /opt/KodExplorer

COPY nginx.conf /etc/nginx/nginx.conf
COPY php.ini /etc/php.ini
COPY php-fpm.conf /etc/php-fpm.d/www.conf
COPY main.sh /root/main.sh

CMD [ "bash", "/root/main.sh" ]

