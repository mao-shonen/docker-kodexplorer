# docker-kodexplorer
```bash
docker run -it --restart=always
  -p 80:80 \
  -v {path}/nginx.comf:/etc/nginx/nginx.conf \
  -v {path}/php.ini:/etc/php.ini \
  -v {path}/php-fpm.conf:/etc/php-fpm.d/www.conf \
  q267009886tw/kodexplorer
```
