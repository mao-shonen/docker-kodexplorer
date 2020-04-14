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
  -p 8080:80 \
  q267009886/kodexplorer
```
