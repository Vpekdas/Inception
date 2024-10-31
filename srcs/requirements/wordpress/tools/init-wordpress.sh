#!/bin/bash

# Define the path to the wp-config.php file
FILE=/var/www/wordpress/wp-config.php

# Wait for the database service to be ready
sleep 10

# Check if the wp-config.php file does not exist
if [ ! -f "$FILE" ]; then
    # Create the wp-config.php file using WP-CLI
    wp config create --allow-root \
    --dbname=$SQL_DATABASE \
    --dbuser=$SQL_USER \
    --dbpass=$SQL_PASSWORD \
    --dbhost=mariadb:3306 --path='/var/www/wordpress'

    # Install WordPress using WP-CLI
    wp core install --allow-root \
    --url=$WP_URL \
    --title="$WP_TITLE" \
    --admin_user=$WP_ADMIN_USER \
    --admin_password=$WP_ADMIN_PASSWORD \
    --admin_email=$WP_ADMIN_EMAIL --path='/var/www/wordpress'
fi

# Ensure correct permissions
chown -R www-data:www-data /var/www/wordpress

# Start PHP-FPM and MariaDB services
service php7.4-fpm start
service mariadb start