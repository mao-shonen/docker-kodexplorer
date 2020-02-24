FROM centos:7

EXPOSE 80
VOLUME /usr/share/nginx/html

WORKDIR /usr/share/nginx/html

RUN rm * -rf \
  && yum install -y epel-release yum-utils \
  && yum update -y \
  && (curl --silent --location https://rpm.nodesource.com/setup_12.x | bash -) \
  && yum install nodejs -y \
  && npm i -g pm2 \
  && yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm \
  && yum-config-manager --enable remi-php73 \
  && yum install -y nginx unzip php-fpm php-opcache php-gd php-smbclient php-json php-mbstring php-pdo php-gd php-pecl-msgpack \
     php-gmp php-pecl-zip php-pecl-imagick php-pear php-pecl-memcached php-fedora-autoloader php-pecl-igbinary php-intl \
  && chown -R nginx. /usr/share/nginx/html \
  && mkdir /run/php-fpm

WORKDIR /root
COPY pm2.yml .

CMD [ "pm2", "start", "pm2.yml", "--no-daemon" ]

