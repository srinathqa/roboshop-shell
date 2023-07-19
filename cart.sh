cp cart.service /etc/systemd/system/cart.service

#Setup NodeJS repos
curl -sL https://rpm.nodesource.com/setup_lts.x | bash

#Install NodeJS
yum install nodejs -y

#Add application user
useradd roboshop

#setup an app directory
mkdir /app

#Download the application code to created app directory
curl -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip
cd /app
unzip /tmp/cart.zip

#download the dependencies
cd /app
npm install

#LOAD THE SERVICE
systemctl daemon-reload

#Start the service
systemctl enable user
systemctl restart user