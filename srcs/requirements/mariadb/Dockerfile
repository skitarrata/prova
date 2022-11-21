FROM alpine:3.15

EXPOSE 3306

RUN apk update && apk upgrade && apk add --no-cache
RUN apk add mariadb mariadb-client

COPY /tools/conf.sh /tmp/conf.sh

RUN chmod +x /tmp/conf.sh

ENTRYPOINT ["sh", "/tmp/conf.sh"]
