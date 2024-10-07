FROM debian:bullseye

EXPOSE 3306

RUN mkdir -p /run/mysqld

# volume mount point
RUN mkdir -p /var/lib/mysql

RUN apt update && \
    apt upgrade -y && \
    apt install mariadb-server -y

RUN chown -R mysql:mysql /run/mysqld

COPY conf/inception.cnf /etc/mysql/mariadb.conf.d/60-inception-server.cnf

COPY setup/setup_maria.sh /usr/sbin/

RUN chmod 744 /usr/sbin/setup_maria.sh

ENTRYPOINT [ "/usr/sbin/setup_maria.sh" ]

CMD ["mysqld"]
