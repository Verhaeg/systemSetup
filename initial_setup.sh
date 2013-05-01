#!/usr/bin/bash

echo 'Initializing initial setup\n'
deployDir=`pwd`
cd $deployDir

# Repositories
echo 'Setting up repositories\n'
add-apt-repository ppa:tualatrix/ppa
apt-get update

# Core
echo 'Setting up necessary stuff'
apt-get install -y ubuntu-tweak
apt-get install -y terminator htop
apt-get install -y subversion git-all

# Misc
echo 'Setting up misc stuff\n'
apt-get install -y curl screen
apt-get install -y unrar unzip p7zip
apt-get install -y vlc
apt-get install -y vim vim-runtime
apt-get install -y pidgin pidgin-facebookchat pidgin-themes
# apt-get install -y postfix postfixadmin postfix-pgsql postfix-mysql
apt-get install -y python-pygments

echo 'Setting up utils\n'
apt-get install -y openjdk-7-jre
apt-get install -y graphviz imagemagick

# DB and Server
read -p "Do you want to install Mysql / Postgres / Apache / Sqlite3 / Memcached? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo 'Setting up Apache and DBs (MySQL, Postgres, Sqlite3) and Memcached\n'
    apt-get install -y mysql-server mysql-client mysql-utilities postgresql sqlite3
    apt-get install -y postgresql-9.1-pgmemcache postgresql-contrib-9.1
    apt-get install -y apache2 apache2-utils
    apt-get install -y memcached
fi

# Ruby and NodeJS Stuff
read -p "Do you want to install Ruby and some gems? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo 'Setting up Ruby and NodeJS\n'
    apt-get install -y ruby1.9.3
    gem update --system
    gem install rails
    gem install sass
    gem install compass
    gem install zurb-foundation
    gem install jekyll
fi

read -p "Do you want to install NodeJS and NPM? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    apt-get install nodejs npm
    npm install -g less jshint recess uglify-js
fi

# Misc Commands
echo 'Creating folders\n'
mkdir -p ~/www
mkdir -p ~/workspace

# ZendServer
read -p "Do you want to install ZendServer? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo 'Setting up Zend Server and PHP 5.4\n'
    cd $deployDir
    tar -xzvf ZendServer.tar.gz ZendServer
    ./ZendServer/install_zs.sh 5.4
    apt-get install zend-framework-bin
    # Executables links
    cd /usr/local/bin
    ln -s /usr/local/zend/bin/php
    ln -s /usr/local/zend/bin/pear
    ln -s /usr/local/zend/bin/phpize
    ln -s /usr/local/zend/bin/pecl
    ln -s /usr/local/zend/bin/php-config
    cd $deployDir

    read -p "Do you want to install PHPUnit and similar? " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        # PHPUnit
        echo 'Setting up PHPUnit and Selenium\n'
        pear config-set auto_discover 1
        pear install pear.phpunit.de/PHPUnit
        pear install phpunit/DbUnit
        pear install phpunit/PHPUnit_Selenium
    fi
fi

# Shell
read -p "Do you want to install and setup Bash-it? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo 'Setting up bash-it'
    git clone http://github.com/revans/bash-it.git ~/.bash_it
    ~/.bash_it/install.sh
    cp .bash_profile ~/
fi

echo 'All done, now go configure the necessary stuff you lazy boy\n'
