FROM	debian:buster

WORKDIR /var/www/html/wordpress

RUN		apt-get -y update &&\
		apt-get -y upgrade
RUN		apt-get -y install php7.3\
		php-fpm\
		php-mysql\
		mariadb-client\
		wget\
		curl

# wordpress https://wordpress.org/support/article/how-to-install-wordpress/#detailed-instructions
RUN		wget https://wordpress.org/latest.tar.gz -P /var/www
RUN		cd /var/www &&\
		tar -xzvf latest.tar.gz &&\
		rm latest.tar.gz

#  config file 
COPY	./wordpress.conf			/etc/php/7.3/fpm/pool.d

#a cosa serve sta roba?
RUN		chown -R root:root /var/www/wordpress

# wordpress-client https://wp-cli.org/
RUN 	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    	chmod +x wp-cli.phar && \
		mv wp-cli.phar /usr/local/bin/wp

COPY	wpConfiguration.sh /var/www/wpConfiguration.sh
ENTRYPOINT ["bash", "var/www/wpConfiguration.sh"]