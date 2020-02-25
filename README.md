# docker-kodexplorer
```bash
mkdir /opt/kodexplorer
cd /opt/kodexplorer
wget http://static.kodcloud.com/update/download/kodexplorer4.40.zip
unzip kodexplorer4.40.zip
rm -f kodexplorer4.40.zip
```

```bash
docker run -it -d --restart=always \
  --name kodexplorer \
  -p 80:80 \
  -v $PWD/nginx.conf:/etc/nginx/nginx.conf \
  -v $PWD/php.ini:/etc/php.ini \
  -v $PWD/php-fpm.conf:/etc/php-fpm.d/www.conf \
  -v /opt/kodexplorer:/usr/share/nginx/html \
  q267009886/kodexplorer
```
