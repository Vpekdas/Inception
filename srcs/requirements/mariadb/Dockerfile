FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    mariadb-server && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /run/mysqld/ && chown mysql:mysql /run/mysqld && chmod 777 /run/mysqld

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY tools/initialize-db.sh /usr/local/bin/initialize-db.sh

RUN chmod +x /usr/local/bin/initialize-db.sh

# Expose port 3306 for MySQL
EXPOSE 3306

# Run the initialization script and then start the MySQL server.
ENTRYPOINT [ "bash", "/usr/local/bin/initialize-db.sh"]
CMD ["mariadbd"]
