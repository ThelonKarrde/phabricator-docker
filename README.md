![Docker Image CI](https://github.com/ThelonKarrde/phabricator-docker/workflows/Docker%20Image%20CI/badge.svg)

# Phabricator-Docker

This is an unofficial Docker image of Phabricator app.  
Application configured as a single image with `supervisord` to control all necessary processes inside one docker container.  

## Docker image available for OS/ARCH
* `linux/amd64` | tag: `latest`
* `linux/arm` | tag: `armv7`

## Configuration

To startup Phabricator with a single command you need configured MySQL/MariaDB and S3 storage (Local server or AWS)

#### Example command to start:
```
docker run \
    --rm -p 80:80 \
    --env MYSQL_HOST=mysqlhost.com \
    --env MYSQL_PORT=3306 \
    --env MYSQL_USER=root \
    --env MYSQL_PASSWORD=changeme \
    --env MINIO_SERVER_ACCESS_KEY=access_key \
    --env MINIO_SERVER_SECRET_KEY=secret_key \
    --env BASE_URI=yourdomain.com \
    -v /your/repo/folder:/var/repo
    rivshiell/phabricator-docker:latest
```


### To launch all components of Phabricator using `docker-compose` use following set of commands:
#### `amd64` arch:
```
export BASE_URI=yourdomain.com
export MYSQL_ROOT_PASSWORD=changeme
docker-compose up -d
```

#### `arm` arch:
```
export BASE_URI=yourdomain.com
export MYSQL_ROOT_PASSWORD=changeme
docker-compose -f docker-compose.armv7.yml up -d
```

## Links
[Docker hub](https://hub.docker.com/repository/docker/rivshiell/phabricator-docker)