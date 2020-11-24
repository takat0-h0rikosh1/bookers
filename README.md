# Bookers

## App Start

```sh
docker-compose up
```

## Deploy

```sh
ssh -i path/to/xxx.pem \
    ec2-user@xxx.xxx.xxx.xxx \
    'cd bookers; make service_restart RAILS_ENV=production RAILS_SERVE_STATIC_FILES=true'
```

## Note

### Logging reference

```sh
docker-compose exec app tail -f /app/log/production.log
```

### Docker setup on Amazon Linux

```sh
# docker install & setup
sudo yum install -y docker
sudo systemctl start docker
sudo usermod -a -G docker ec2-user
sudo service docker start

# docker-compose install & seyup
sudo curl -L https://github.com/docker/compose/releases/download/1.27.4/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# require re-login after exit
exit
```
