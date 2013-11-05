create database dashboard character set utf8;
create user 'dashboard'@'localhost' identified by 'secret_password';
grant all privileges on dashboard.* to 'dashboard'@'localhost';
exit

