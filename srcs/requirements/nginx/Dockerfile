FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    nginx openssl && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    mkdir -p /etc/nginx/ssl /run/nginx

# Generate SSL certificate.
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out /etc/nginx/ssl/vopekdas.crt \
    -keyout /etc/nginx/ssl/vopekdas.key \
    -subj "/C=FR/ST=Paris/L=Paris/O=42 Paris/OU=vopekdas/CN=vopekdas/"

RUN chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html

COPY conf/nginx.conf /etc/nginx/conf.d/wordpress.conf

# Expose port 443 for HTTPS.
EXPOSE 443

# Run Nginx in the foreground.
CMD ["nginx", "-g", "daemon off;"]