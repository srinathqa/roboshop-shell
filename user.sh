cp user.service /etc/systemd/system/user.service
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
curl -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
cd /app
unzip /tmp/user.zip

#download the dependencies
cd /app
npm install


yum install mongodb-org-shell -y
#load schema
mongo --host MONGODB-SERVER-IPADDRESS </app/schema/user.js

#LOAD THE SERVICE
systemctl daemon-reload

#Start the service
systemctl enable user
systemctl restart user