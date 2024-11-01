FROM debian:bullseye

# Install necessary packages
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    php php-mysql php-fpm wget ca-certificates

# Create the directory for Adminer
RUN mkdir -p /var/www/html/adminer

# Download the latest version of Adminer
RUN wget "https://www.adminer.org/latest.php" -O /var/www/html/adminer/index.php

# Set the correct permissions
RUN chmod -R 775 /var/www/html/adminer/

# Copy the initialization script
COPY tools/init.sh /usr/local/bin/init.sh

# Make the script executable
RUN chmod +x /usr/local/bin/init.sh

# Set the entrypoint to start PHP-FPM
ENTRYPOINT ["/usr/local/bin/init.sh"]