cp catalogue.service /etc/systemd/system/catalogue.service
cp mongo.repo /etc/yum.repos.d/mongo.repo

#Setup NodeJS repos
curl -sL https://rpm.nodesource.com/setup_lts.x | bash

#Install NodeJS
yum install nodejs -y

#Add application user
useradd roboshop

#setup an app directory
mkdir /app

#Download the application code to created app directory
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app
unzip /tmp/catalogue.zip

#download the dependencies
cd /app
npm install


yum install mongodb-org-shell -y
#load schema
mongo --host MONGODB-SERVER-IPADDRESS </app/schema/catalogue.js

#LOAD THE SERVICE
systemctl daemon-reload

#Start the service
systemctl enable catalogue
systemctl start catalogue