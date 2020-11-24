# Bookers

## App Start

```sh
docker-compose up

# production
docker-compose -f docker-compose.prd.yml up -d
```

## Deploy

```sh
# login to ec2
ssh -i /path/to/xxx.pem ec2-user@xxx.xxx.xxx.xxx

# on ec2
cd bookers
git pull
docker-compose down
docker-compose build
docker-compose run app rails assets:precompile RAILS_ENV=production
docker-compose run app rails db:create db:migrate RAILS_ENV=production
docker-compose -f docker-compose.prd.yml up -d
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

# require relogin after exit
exit
```
