cp mongo.repo /etc/yum.repos.d/mongo.repo

# Update listen address from 127.0.0.1 to 0.0.0.0 in /etc/mongod.conf

#Install MongoDB
yum install mongodb-org -y

#Start & Enable MongoDB Service

systemctl enable mongod
systemctl restart mongod

