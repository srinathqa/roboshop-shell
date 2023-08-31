cp mysql.repo /etc/yum.repos.d/mysql.repo
yum module disable mysql -y

#install mysql server
yum install mysql-community-server -y

#Start mysql service
systemctl enable mysqld
systemctl restart mysqld

#change the default root password to RoboShop@1
mysql_secure_installation --set-root-pass RoboShop@1

#check for working or not
mysql -uroot -pRoboShop@1