FROM debian:bullseye

# Install dependencies and Node.js from NodeSource
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    git \
    ca-certificates \
    curl && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Clone the repository and build the application
RUN git clone https://github.com/Vpekdas/Vpekdas.github.io && cd Vpekdas.github.io \
    && npm install && npm run build

RUN mkdir /server
COPY server/index.js /server
COPY server/package.json /server

# Install server dependencies
RUN cd /server && npm install

EXPOSE 8080

WORKDIR /server

# Start the application
CMD ["node", "index.js"]