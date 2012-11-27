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

# DB and Server
echo 'Setting up Apache and DBs (MySQL, Postgres and couchDB) and Memcached\n'
apt-get install -y mysql-server mysql-client mysql-utilities postgresql sqlite3 couchdb
apt-get install -y apache2 apache2-utils
apt-get install -y memcached

# Misc
echo 'Setting up misc stuff\n'
apt-get install -y curl screen
apt-get install -y unrar unzip p7zip
apt-get install -y vlc
apt-get install -y vim vim-runtime
apt-get install -y pidgin pidgin-facebookchat pidgin-themes
apt-get install postfix postfixadmin postfix-pgsql postfix-mysql

# Ruby and NodeJS Stuff
echo 'Setting up Ruby and NodeJS\n'
apt-get install -y nodejs ruby1.9.3 npm
gem update --system
gem install rails
gem install sass
gem install compass
gem install zurb-foundation
npm install -g less jshint recess uglify-js

# Misc Commands
echo 'Creating folders\n'
mkdir -p ~/www
mkdir -p ~/workspace

# ZendServer
echo 'Setting up Zend Server CE and PHP 5.3\n'
cd $deployDir
tar -xzvf ZendServer.tar.gz ZendServer
ret=`./ZendServer/install_zs.sh 5.3 ce`
apt-get install zend-framework-bin
# Executables links
cd /usr/local/bin
ln -s /usr/local/zend/bin/php
ln -s /usr/local/zend/bin/pear
ln -s /usr/local/zend/bin/phpize
ln -s /usr/local/zend/bin/pecl
ln -s /usr/local/zend/bin/php-config
cd $deployDir

# PHPUnit
echo 'Setting up PHPUnit and Selenium\n'
pear config-set auto_discover 1
pear install pear.phpunit.de/PHPUnit
pear install phpunit/DbUnit
pear install phpunit/PHPUnit_Selenium

# Sublime Text
echo 'Setting up Sublime Text 2 v2219 (nightly)\n'
cd $deployDir
cp sublime.desktop ~/.local/share/applications
tar -xjvf SublimeText2.tar.bz2
mv Sublime\ Text\ 2 /opt/

# Shell
#apt-get install -y zsh
#curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
echo 'All done, now go configure the necessary stuff you lazy boy\n'
