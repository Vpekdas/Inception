#!/bin/bash

FILE=/var/www/wordpress/wp-config.php

redis-server --protected-mode no &

# Check if the wp-config.php file does not exist
if [ ! -f "$FILE" ]; then

    mkdir -p /var/www/wordpress
    wp core download --allow-root --path="/var/www/wordpress"

    # SInce CLI doest not work, we are finding and repacll
    cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
    sed -i -e "s/database_name_here/$SQL_DATABASE/g" /var/www/wordpress/wp-config.php
    sed -i -e "s/username_here/$SQL_USER/g" /var/www/wordpress/wp-config.php
    sed -i -e "s/password_here/$SQL_PASSWORD/g" /var/www/wordpress/wp-config.php
    sed -i -e "s/localhost/mariadb/g" /var/www/wordpress/wp-config.php

    # Install WordPress using WP-CLI
    wp core install --allow-root \
    --url=$WP_URL \
    --title="$WP_TITLE" \
    --admin_user=$WP_ADMIN_USER \
    --admin_password=$WP_ADMIN_PASSWORD \
    --admin_email=$WP_ADMIN_EMAIL --path='/var/www/wordpress'

    wp --allow-root user create guest guest@example.com --user_pass=password123 --path='/var/www/wordpress'

    wp config set WP_REDIS_HOST redis --allow-root --path='/var/www/wordpress'
    wp config set WP_REDIS_PORT 6379 --raw --allow-root --path='/var/www/wordpress'
    wp config set WP_CACHE_KEY_SALT $WP_URL --allow-root --path='/var/www/wordpress'
    wp config set WP_REDIS_CLIENT phpredis --allow-root --path='/var/www/wordpress'
    
	wp plugin install redis-cache --activate --allow-root --path='/var/www/wordpress'
    wp plugin update --all --allow-root --path='/var/www/wordpress'
	wp redis enable --allow-root --path='/var/www/wordpress'


fi

# Ensure correct permissions
chown -R www-data:www-data /var/www/wordpress

# Start PHP-FPM in the foreground
exec "$@"