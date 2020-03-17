![Docker Image CI](https://github.com/ThelonKarrde/phabricator-docker/workflows/Docker%20Image%20CI/badge.svg)

# phabricator-docker

Add `127.0.0.1 phabricator.local` to your `hosts` file.

To startup test environment use following set of commands:
```
export MYSQL_ROOT_PASSWORD=$some-value
docker-compose up -d
```