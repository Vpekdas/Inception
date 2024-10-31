FROM debian:bullseye

# Update, upgrade, install packages, and clean up in a single RUN command
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    wget \
    ca-certificates \
    php \
    php-fpm \
    php-mysql \
    mariadb-client \
    mariadb-server && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Download and extract WordPress
RUN wget https://wordpress.org/latest.tar.gz -P /var/www && \
    cd /var/www && \
    tar -xzf latest.tar.gz && \
    rm latest.tar.gz && \
    chown -R www-data:www-data /var/www/wordpress && mkdir -p /var/run/php/

# Copy the PHP-FPM configuration file
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

# Ensure the PHP-FPM run directory exists
RUN mkdir -p /run/php && chown -R www-data:www-data /run/php

# Download and set up WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Copy the WordPress initialization script
COPY tools/init-wordpress.sh /usr/local/bin/init-wordpress.sh

# Make the script executable
RUN chmod +x /usr/local/bin/init-wordpress.sh
RUN mkdir -p /run/php

ENTRYPOINT ["/usr/local/bin/init-wordpress.sh"]
