#!/bin/sh

brew install mysql
unset TMPDIR
mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp
mysql.server start
mysqladmin -u root password '1qaz2wsx'
mkdir -p ~/Library/LaunchAgents
# cp /usr/local/Cellar/mysql/5.5.19/com.mysql.mysqld.plist ~/Library/LaunchAgents/
# launchctl load -w ~/Library/LaunchAgents/com.mysql.mysqld.plist