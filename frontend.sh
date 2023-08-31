#install nginx
yum install nginx -y
cp roboshop.conf /etc/nginx/default.d/roboshop.conf


#Start & Enable Nginx service
systemctl enable nginx
systemctl restart nginx

#Remove the default content that web server
rm -rf /usr/share/nginx/html/*

#Download the roboshop frontend content
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip

#Extract the frontend content.

cd /usr/share/nginx/html
unzip /tmp/frontend.zip

#Start & Enable Nginx service
systemctl enable nginx
systemctl restart nginx ; tail -f /var/log/messages
#Create Nginx Reverse Proxy Configuration.
#vim /etc/nginx/default.d/roboshop.conf


