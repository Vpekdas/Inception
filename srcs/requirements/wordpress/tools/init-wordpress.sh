#!/bin/bash

FILE=/var/www/html/wp-config.php

# Check if the wp-config.php file does not exist.
if [ ! -f "$FILE" ]; then

    # Create a directory for the WordPress installation.
    mkdir -p /var/www/html
    wp core download --allow-root --path="/var/www/html"

    # Copy the sample configuration file and replace placeholders with actual data.
    cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
    sed -i -e "s/database_name_here/$SQL_DATABASE/g" /var/www/html/wp-config.php
    sed -i -e "s/username_here/$SQL_USER/g" /var/www/html/wp-config.php
    sed -i -e "s/password_here/$SQL_PASSWORD/g" /var/www/html/wp-config.php
    sed -i -e "s/localhost/mariadb/g" /var/www/html/wp-config.php

    # Install WordPress using WP-CLI.
    wp core install --allow-root \
    --url=$WP_URL \
    --title="$WP_TITLE" \
    --admin_user=$WP_ADMIN_USER \
    --admin_password=$WP_ADMIN_PASSWORD \
    --admin_email=$WP_ADMIN_EMAIL --path='/var/www/html'

    # Install and activate the custom theme.
    wp theme install "gamers-studio" --allow-root --path='/var/www/html'
    wp theme activate gamers-studio --allow-root --path='/var/www/html'


    # Create a guest user using WP-CLI.
    wp --allow-root user create $WP_GUEST_USER $WP_GUEST_EMAIL --user_pass=$WP_GUEST_PASSWORD --path='/var/www/html'

    # Configure Redis caching settings.
    wp config set WP_REDIS_HOST redis --allow-root --path='/var/www/html'
    wp config set WP_REDIS_PORT 6379 --raw --allow-root --path='/var/www/html'
    wp config set WP_CACHE_KEY_SALT $WP_URL --allow-root --path='/var/www/html'
    wp config set WP_REDIS_CLIENT phpredis --allow-root --path='/var/www/html'
    
	wp plugin install redis-cache --activate --allow-root --path='/var/www/html'
    wp plugin update --all --allow-root --path='/var/www/html'
	wp redis enable --allow-root --path='/var/www/html'


fi

# Set correct ownership and permissions for the WordPress files.
chown -R www-data:www-data /var/www/html

# Start PHP-FPM service in the foreground.
exec "$@"