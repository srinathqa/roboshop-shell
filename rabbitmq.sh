#configure repo for rabbitmq
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash

curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash

#install rabbitmq
yum install rabbitmq-server -y


#create user for application

rabbitmqctl add_user roboshop roboshop123
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"


#Start mq service
systemctl enable rabbitmq-server
systemctl restart rabbitmq-server