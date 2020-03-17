#!/bin/bash

sleep 30

/var/www/phabric/phabricator/bin/config set mysql.host $MYSQL_HOST
/var/www/phabric/phabricator/bin/config set mysql.port $MYSQL_PORT
/var/www/phabric/phabricator/bin/config set mysql.user $MYSQL_USER
/var/www/phabric/phabricator/bin/config set mysql.pass $MYSQL_PASSWORD

/var/www/phabric/phabricator/bin/storage upgrade --force

/usr/bin/supervisord -n -c /etc/supervisord.conf