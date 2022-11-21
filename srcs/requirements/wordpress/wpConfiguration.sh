#!bin/bash

#Ti crei il file config.php che serve per saltare la pagina di configurazione
#inziale. https://developer.wordpress.org/apis/wp-config-php/.

sleep 5
if [ ! -e /var/www/wordpress/wp-config.php ]; then
# wp-config.php file
    wp config create	--allow-root \
    					--dbname=$WP_DATABASE_NAME \
    					--dbuser=$WP_DATABASE_USR\
    					--dbpass=$WP_DATABASE_PWD \
    					--dbhost=mariadb:3306 --path='/var/www/wordpress'
    echo "asdf"
    sleep 2
    # --allow-root
    wp core install     --allow-root --url=$DOMAIN_NAME \
    					--title=$WP_TITLE \
    					--admin_user=$WP_ADMIN_USR \
                        --admin_password=$WP_DATABASE_PWD \
                        --admin_email=$WP_ADMIN_EMAIL \
                        --path='/var/www/wordpress'
    wp user create      --allow-root $WP_USR $WP_EMAIL \
    					--user_pass=$WP_DATABASE_PWD \
    					--role=author\
                        --path='/var/www/wordpress' >> /log.txt
fi

# foreground
mkdir ./run/php/
/usr/sbin/php-fpm7.3 -F