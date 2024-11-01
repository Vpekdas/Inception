#!/bin/sh

# Comment out the bind to localhost to allow connections from any IP address
sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g" /etc/redis/redis.conf

# Set the maxmemory policy to allkeys-lru
sed -i "s|# maxmemory-policy noeviction|maxmemory-policy allkeys-lru|g" /etc/redis/redis.conf