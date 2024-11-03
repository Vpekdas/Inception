FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    php php-mysql php-fpm wget ca-certificates

RUN mkdir -p /var/www/html/adminer

# Download the latest version of Adminer.
RUN wget "https://www.adminer.org/latest.php" -O /var/www/html/adminer/index.php

RUN chmod -R 775 /var/www/html/adminer/

COPY tools/init.sh /usr/local/bin/init.sh

RUN chmod +x /usr/local/bin/init.sh

# Set the entrypoint to start PHP-FPM.
ENTRYPOINT ["/usr/local/bin/init.sh"]