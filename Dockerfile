ARG BASE_ARCH=amd64
FROM ${BASE_ARCH}/debian:buster-slim

LABEL maintainer="aliaksandr.shulyak@gmail.com"

EXPOSE 80 443 2222

ENV SSH_PORT 2222

RUN apt-get update -y && \
    apt-get -y install lsb-release apt-transport-https ca-certificates wget git
#downloading phabricator
#install php
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
RUN apt-get update -y && \
    apt-get install -y php7.4 php7.4-mysql php7.4-gd php7.4-curl php7.4-apcu php7.4-cli \
    php7.4-json php7.4-mbstring php7.4-fpm php7.4-zip php-pear nginx supervisor procps python-pygments && \
    rm -rf /var/cache/apt
RUN mkdir -p /var/www/phabric/
RUN git clone https://github.com/phacility/libphutil.git /var/www/phabric/libphutil && \
	git clone https://github.com/phacility/arcanist.git /var/www/phabric/arcanist && \
	git clone https://github.com/phacility/phabricator.git /var/www/phabric/phabricator
#copy nginx config
COPY ./configs/nginx-ph.conf /etc/nginx/sites-available/phabricator.conf
COPY ./configs/nginx.conf /etc/nginx/nginx.conf
RUN ln -s /etc/nginx/sites-available/phabricator.conf /etc/nginx/sites-enabled/phabricator.conf
#copy php config
COPY ./configs/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./configs/php.ini /etc/php/7.4/fpm/php.ini
COPY ./configs/php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf
RUN mkdir -p /run/php && chown www-data:www-data /run/php && mkdir -p /var/repo/
#copy supervisord config
COPY ./configs/supervisord.conf /etc/supervisord.conf
COPY ./scripts/startup.sh /startup.sh
#startup script
ENTRYPOINT [ "/startup.sh" ]
