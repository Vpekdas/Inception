#!/bin/bash

FILE=/var/www/wordpress/wp-config.php

# Check if the wp-config.php file does not exist
if [ ! -f "$FILE" ]; then
    mkdir -p /var/www/wordpress
    wp core download --allow-root --path="/var/www/wordpress"

    # Create the wp-config.php file using WP-CLI
    # wp config create --allow-root \
    # --dbname=$SQL_DATABASE \
    # --dbuser=$SQL_USER \
    # --dbpass=$SQL_PASSWORD \
    # --dbhost=mariadb:3306 --path='/var/www/wordpress'

    # # Install WordPress using WP-CLI
    # wp core install --allow-root \
    # --url=$WP_URL \
    # --title="$WP_TITLE" \
    # --admin_user=$WP_ADMIN_USER \
    # --admin_password=$WP_ADMIN_PASSWORD \
    # --admin_email=$WP_ADMIN_EMAIL --path='/var/www/wordpress'

    # wp --allow-root user create guest guest@example.com --user_pass=password123
fi

# Ensure correct permissions
chown -R www-data:www-data /var/www/wordpress

# Start PHP-FPM in the foreground
exec "$@"