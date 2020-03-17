FROM debian:buster

LABEL maintainer="aliaksandr.shulyak@gmail.com"

EXPOSE 80

RUN apt-get update -y
RUN apt-get -y install lsb-release apt-transport-https ca-certificates wget git
RUN mkdir -p /var/www/phabric/
RUN git clone https://github.com/phacility/libphutil.git /var/www/phabric/libphutil
RUN git clone https://github.com/phacility/arcanist.git /var/www/phabric/arcanist
RUN git clone https://github.com/phacility/phabricator.git /var/www/phabric/phabricator
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
RUN apt-get update -y
RUN apt-get install -y php7.4 php7.4-mysql php7.4-gd php7.4-curl php7.4-apcu php7.4-cli php7.4-json php7.4-mbstring php7.4-fpm 
RUN apt-get install -y nginx supervisor
COPY ./configs/nginx.conf /etc/nginx/sites-availaible/phabricator.conf
COPY ./configs/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./configs/supervisord.conf /etc/supervisord.conf
RUN ln -s /etc/nginx/sites-availaible/phabricator.conf /etc/nginx/sites-enabled/phabricator.conf

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]