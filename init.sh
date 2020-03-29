#!/bin/bash

set -ux

apt-get update
apt-get -y install php7.4 php7.4-mysql mysql-server mysql-client

cat << EOS | sudo tee -a /etc/apache2/envvars
export DB_HOST=127.0.0.1
export DB_NAME=shop
export DB_USER=phper
export DB_PASS=secret
EOS

systemctl restart apache2

cat << EOS | sudo tee /etc/my.cnf
[mysqld]
# 文字コード設定/照合順序設定
character_set_server = utf8mb4 # 文字コード
collation_server = utf8mb4_ja_0900_as_cs # 照合順序
EOS

systemctl restart mysql

mysqld --initialize-insecure

mysql -u root << EOT
CREATE DATABASE shop;
CREATE USER phper@'%' IDENTIFIED WITH mysql_native_password BY 'secret';
GRANT ALL PRIVILEGES on shop.* to phper@'%';
SELECT Host, User FROM mysql.user;

CREATE TABLE shop.items (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(30) COMMENT '商品名',
  stock INT DEFAULT 0 COMMENT '在庫数'
) COMMENT='商品テーブル';

INSERT INTO shop.items (name, stock) VALUE ("Golden Apple", 12345);
EOT

echo "インストール完了！"
