cp payment.service /etc/systemd/system/payment.service

#install python
yum install python36 gcc python3-devel -y

#Add application user
useradd roboshop

#setup app directory
mkdir /app

#download the application code
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip
cd /app
unzip /tmp/payment.zip

#download the dependencies
cd /app
pip3.6 install -r requirements.txt

#load the service
systemctl daemon-reload

#Enalbe & start the service
systemctl enable payment
systemctl start payment
