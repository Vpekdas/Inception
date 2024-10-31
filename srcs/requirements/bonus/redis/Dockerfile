FROM debian:bullseye

# Install dependencies and Redis
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    redis && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create necessary directories
RUN mkdir -p /etc/redis /var/redis

# Copy the initialization script
COPY tools/init-redis-server.sh /etc/init.d/redis_6379

# Make the script executable
RUN chmod +x /etc/init.d/redis_6379

# Expose Redis port
EXPOSE 6379

# Set the entrypoint to start the Redis server
ENTRYPOINT ["/usr/bin/redis-server", "--protected-mode no"]