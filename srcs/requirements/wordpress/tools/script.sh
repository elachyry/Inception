#!bin/bash


cd /var/www/wordpress

sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = wordpress:9000|" /etc/php/7.4/fpm/pool.d/www.conf
if [ ! -f /var/www/wordpress/wp-config.php ]; then
	wp core download --allow-root 
	wp config create --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=$SQL_HOST --allow-root
	wp core install --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL --skip-email --allow-root
	wp user create --role=author $USER0_LOGIN $USER0_EMAIL --user_pass=$USER0_PASS --allow-root


	sed -i "/^\/\* That.s all, stop editing/ i\
			define('WP_REDIS_HOST', 'redis');\n\
			define('WP_REDIS_PORT', 6379);" wp-config.php

	cd /var/www/wordpress
	wp plugin install redis-cache --activate --allow-root
	wp redis enable --allow-root
fi
chown -R www-data:www-data /var/www/wordpress



php-fpm7.4 -F
