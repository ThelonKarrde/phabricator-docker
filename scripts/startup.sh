#!/bin/bash

sleep 30

/var/www/phabric/phabricator/bin/config set mysql.host $MYSQL_HOST
/var/www/phabric/phabricator/bin/config set mysql.port $MYSQL_PORT
/var/www/phabric/phabricator/bin/config set mysql.user $MYSQL_USER
/var/www/phabric/phabricator/bin/config set mysql.pass $MYSQL_PASSWORD
/var/www/phabric/phabricator/bin/config set phabricator.base-uri "http://$BASE_URI/"
/var/www/phabric/phabricator/bin/config set amazon-s3.access-key $MINIO_SERVER_ACCESS_KEY
/var/www/phabric/phabricator/bin/config set amazon-s3.secret-key $MINIO_SERVER_SECRET_KEY
/var/www/phabric/phabricator/bin/config set amazon-s3.region us-west-1
/var/www/phabric/phabricator/bin/config set amazon-s3.endpoint ph-storage:9000
/var/www/phabric/phabricator/bin/config set storage.s3.bucket minio-storage
/var/www/phabric/phabricator/bin/config set pygments.enabled true


/var/www/phabric/phabricator/bin/storage upgrade --force


/usr/bin/supervisord -n -c /etc/supervisord.conf