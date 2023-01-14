FROM wordpress:latest

RUN apt-get update && apt-get install -y mariadb-server vim

COPY ./run.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/run.sh

EXPOSE  80
EXPOSE  3306

CMD ["run.sh"]