FROM postgres:11.1-alpine

MAINTAINER vkill <vkill.net@gmail.com>

ENV MYSQL_FDW_VERSION 2.5.1
ENV MYSQL_FDW_DOWNLOAD_URL https://github.com/EnterpriseDB/mysql_fdw/archive/REL-2_5_1.tar.gz
ENV MYSQL_FDW_DOWNLOAD_SHA256 8367ed71e76000d4ec9661cab7e12c3c8d0ecc887d6f677f7d448a5a35bbd96e

RUN set -ex \
  \
  && sed -i 's!dl-cdn.alpinelinux.org!mirrors.aliyun.com!' /etc/apk/repositories \
  \
  && apk add --no-cache --virtual .rundeps \
    postgresql-dev \
    mariadb-dev \
  \
  && apk add --no-cache --virtual .builddeps \
    build-base \
    wget \
  \
  && wget -O mysql_fdw.tar.gz "${MYSQL_FDW_DOWNLOAD_URL}" \
  && echo "${MYSQL_FDW_DOWNLOAD_SHA256} *mysql_fdw.tar.gz" | sha256sum -c - \
  && mkdir -p /opt/mysql_fdw \
  && tar -xzf mysql_fdw.tar.gz -C /opt/mysql_fdw --strip-components=1 \
  && rm mysql_fdw.tar.gz \
  \
  && cd /opt/mysql_fdw \
  && sed -i 's/| RTLD_DEEPBIND//' mysql_fdw.c \
  && make USE_PGXS=1 \
  && make USE_PGXS=1 install \
  \
  && apk del .builddeps
