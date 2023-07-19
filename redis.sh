#install redis
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y

#Enable Redis 6.2 from package streams.
yum module enable redis:remi-6.2 -y

#Install Redis
yum install redis -y


#Update listen address from 127.0.0.1 to 0.0.0.0 in /etc/redis.conf & /etc/redis/redis.conf


#Start & enable redis service

systemctl enable redis
systemctl restart redis
