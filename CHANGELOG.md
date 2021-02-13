# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.3.0] - 2020-06-01
### Dockerfile optimisation
- Migrated from debian:buster -> debian:buster-slim image
- Build steps re-arrange and optimisation

## [0.2.0] - 2020-06-01
### Fix
- Temporary removed arm support
- Changed SSH port to 2222 from 22 to avoid conflict
- Removed minio port expose in docker-compose

## [0.1.3] - 2020-06-01
### Fix
- SSH port availability fix

## [0.1.2] - 2020-05-28
### Fix
- Spell fixes in Dockerfile

## [0.1.1] - 2020-03-30
### Added
- Exposed 22 port in docker image
- SSH port forwarding in docker-compose

## [0.1.0] - 2020-03-30
### Added
- Custom config for nginx
- Custom config for mysql
- Custom config for php-fpm
- Docker-compose for `amd64` arch
- Docker-compose for `arm` arch
- Common Dockerfile to build image
- `GitHub` actions configuration to build images


