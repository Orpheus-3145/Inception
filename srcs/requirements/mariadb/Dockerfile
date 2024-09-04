FROM debian:bullseye

EXPOSE 3306

RUN mkdir -p /var/run/mysqld

RUN mkdir -p $HOME/data/mariadb

RUN apt update && \
apt upgrade -y && \
apt install mariadb-server -y

RUN chown -R mysql:mysql /var/run/mysqld

COPY setup_maria.sh /usr/sbin/

RUN chmod 744 /usr/sbin/setup_maria.sh

# make it RUN
ENTRYPOINT ["/usr/sbin/setup_maria.sh"]

CMD ["mysqld"]