FROM debian:bullseye

EXPOSE 3306

# to define an env variable known at building time
# ARG V_NAME
# ENV V_NAME=$V_NAME
# also if compose is used add to 'build'  context
# args:
#     V_NAME: ${V_NAME}

RUN mkdir -p /run/mysqld

RUN mkdir -p /var/lib/mysql

RUN apt update && \
apt upgrade -y && \
apt install mariadb-server -y

RUN chown -R mysql:mysql /run/mysqld

COPY inception.cnf /etc/mysql/mariadb.conf.d/60-inception-server.cnf

COPY setup_maria.sh /usr/sbin/

RUN chmod 744 /usr/sbin/setup_maria.sh

ENTRYPOINT [ "/usr/sbin/setup_maria.sh" ]

CMD ["mysqld"]
