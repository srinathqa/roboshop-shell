cp shipping.sh /etc/systemd/system/shipping.service
#install maven

yum install maven -y

#Add application user
useradd roboshop

#Setup app directory
mkdir /app


#download the application code
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip
cd /app
unzip /tmp/shipping.zip

#download the dependencies & build the application
cd /app
mvn clean package
mv target/shipping-1.0.jar shipping.jar

#install mysql client to load the schema
yum install mysql -y
mysql -h <MYSQL-SERVER-IPADDRESS> -uroot -pRoboShop@1 < /app/schema/shipping.sql


#load the service
systemctl daemon-reload

#Enable & start the service
systemctl enable shipping
systemctl restart shipping

