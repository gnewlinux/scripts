#!/bin/bash

# Instalação do Servidor apache2
sudo apt-get install apache2

# Instalação do Servidor Mysql
sudo apt-get install mysql-server php5-mysql

# Instalação do Servidor PHP
sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt


clear

# Reiniciando o serviço do apache
sudo service apache2 restart

echo "Apache2 - MysqlServer - Php || Instalado com sucesso."


# Instalando phpmyadmin

sudo apt-get install phpmyadmin

sudo echo "# Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf

clear

sudo service apache2 restart

echo "PHPMYADMIN Instalado com Sucesso!"
