FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    wget \
    ca-certificates \
    php \
    php-fpm \
    php-mysql \
    redis \
	php-redis \
    mariadb-client \
    mariadb-server && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

# Ensure the PHP-FPM run directory exists.
RUN mkdir -p /run/php && chown -R www-data:www-data /run/php

# Download and set up WP-CLI.
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY tools/init-wordpress.sh /usr/local/bin/init-wordpress.sh

# Make the script executable.
RUN chmod +x /usr/local/bin/init-wordpress.sh
RUN mkdir -p /run/php

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/init-wordpress.sh"]

# Launch PHP-FPM in the foreground after executing the script.
CMD [ "php-fpm7.4", "-F" ]