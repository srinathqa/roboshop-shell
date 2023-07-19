#install Golang

yum install golang -y

#add application user
useradd roboshop

#setup an app diretory
mkdir /app

#download the application code
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip
cd /app
unzip /tmp/dispatch.zip

#download the dependencies & build the software
cd /app
go mod init dispatch
go get
go build

#load the service
systemctl daemon-reload

#enable & restart the service
systemctl enable dispatch
systemctl start dispatch

