#install ngnix
yum install nginx -y

#Start & Enable Nginx service
systemctl enable nginx
systemctl start nginx

#Remove the default content that web server is serving
rm -rf /usr/share/nginx/html/*

#Download the roboshop frontend content
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip

#Extract the frontend content.

cd /usr/share/nginx/html
unzip /tmp/frontend.zip

#Create Nginx Reverse Proxy Configuration.
#vim /etc/nginx/default.d/roboshop.conf


