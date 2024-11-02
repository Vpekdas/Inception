# Use a lightweight base image
FROM debian:bullseye

# Install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    docker.io \
    && rm -rf /var/lib/apt/lists/*

# Create a directory for Portainer
RUN mkdir -p /opt/portainer

# Download Portainer binary
RUN curl -L https://github.com/portainer/portainer/releases/download/2.21.4/portainer-2.21.4-linux-amd64.tar.gz -o /opt/portainer/portainer.tar.gz

# Extract the Portainer binary
RUN tar -xzf /opt/portainer/portainer.tar.gz -C /opt/portainer --strip-components=1

# Make the Portainer binary executable
RUN chmod +x /opt/portainer/portainer

# Copy the initialization script
COPY tools/init-portainer.sh /usr/local/bin/init-portainer.sh

# Make the script executable
RUN chmod +x /usr/local/bin/init-portainer.sh

# Expose the Portainer port
EXPOSE 9000

# Set the entrypoint to start the initialization script
ENTRYPOINT ["/usr/local/bin/init-portainer.sh"]
CMD [ "/opt/portainer/portainer" ]