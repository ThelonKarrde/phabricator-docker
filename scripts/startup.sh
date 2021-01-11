#!/bin/bash

sleep 30

#DB configuration
/var/www/phabric/phabricator/bin/config set mysql.host $MYSQL_HOST
/var/www/phabric/phabricator/bin/config set mysql.port $MYSQL_PORT
/var/www/phabric/phabricator/bin/config set mysql.user $MYSQL_USER
/var/www/phabric/phabricator/bin/config set mysql.pass $MYSQL_PASSWORD
#Large file storage configuration
/var/www/phabric/phabricator/bin/config set amazon-s3.secret-key $MINIO_SERVER_SECRET_KEY
/var/www/phabric/phabricator/bin/config set amazon-s3.access-key $MINIO_SERVER_ACCESS_KEY
/var/www/phabric/phabricator/bin/config set amazon-s3.endpoint ph-storage:9000
/var/www/phabric/phabricator/bin/config set amazon-s3.region us-west-1
#SSH config
/var/www/phabric/phabricator/bin/config set diffusion.ssh-port $SSH_PORT
# Update base uri
/var/www/phabric/phabricator/bin/config set phabricator.base-uri "http://$BASE_URI/"
sed "s/  server_name phabricator.local;/  server_name $BASE_URI;/g" /etc/nginx/sites-available//phabricator.conf > /etc/nginx/sites-available//phabricator.conf
#sed "s/    return 301 \$scheme:\/\/phabricator.local$request_uri;"
#general parameters configuration
/var/www/phabric/phabricator/bin/config set storage.s3.bucket minio-storage
/var/www/phabric/phabricator/bin/config set pygments.enabled true
#setup db in not exists
/var/www/phabric/phabricator/bin/storage upgrade --force
#start supervisord
/usr/bin/supervisord -n -c /etc/supervisord.conf