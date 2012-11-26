cd ~/
# Repositories
add-apt-repository ppa:tualatrix/ppa
apt-get update

# Core
apt-get install -y ubuntu-tweak
apt-get install -y terminator htop
apt-get install -y subversion git-all
# DB and Server
apt-get install -y mysql-server mysql-client mysql-utilities postgresql sqlite3 couchdb
apt-get install -y apache2 apache2-utils
apt-get install -y memcached
# Misc
apt-get install -y curl screen
apt-get install -y unrar unzip p7zip
apt-get install -y vlcpidgin-themes
apt-get install -y vim vim-runtime
apt-get install -y pidgin pidgin-facebookchat pidgin-themes
apt-get install postfix postfixadmin postfix-pgsql postfix-mysql
# Ruby and NodeJS Stuff
apt-get install -y nodejs ruby1.9.3 npm
gem update --system
gem install rails
gem install sass
gem install compass
gem install zurb-foundation
npm install -g less jshint recess uglify-js

# Misc Commands
mkdir -p ~/www
mkdir -p ~/workspace

# ZendServer
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
cd ~/

# PHPUnit
pear config-set auto_discover 1
pear install pear.phpunit.de/PHPUnit
pear install phpunit/DbUnit
pear install phpunit/PHPUnit_Selenium

# Shell
#apt-get install -y zsh
#curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
