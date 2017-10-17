FROM openjdk:8-jdk-alpine


ARG kafka_version=0.11.0.1
ARG scala_version=2.11
ARG kafka_mirror="http://mirror.jax.hugeserver.com/apache/kafka/0.11.0.1/kafka_2.11-0.11.0.1.tgz"

MAINTAINER scotthaleen

RUN apk add --no-cache --quiet \
    bash \
    curl \
    wget \
    supervisor \
    openssl

ENV KAFKA_VERSION=$kafka_version SCALA_VERSION=$scala_version

RUN mkdir /config

RUN wget ${kafka_mirror} -O /tmp/kafka.tgz

RUN tar xfz /tmp/kafka.tgz -C /srv

RUN ln -s /srv/kafka_${SCALA_VERSION}-${KAFKA_VERSION} /srv/kafka

VOLUME ["/kafka"]


ENV KAFKA_HOME /srv/kafka
ENV PATH ${PATH}:${KAFKA_HOME}/bin

EXPOSE 2181 9092

ADD ./start-kafka.sh /usr/bin/start-kafka.sh
RUN chmod a+x /usr/bin/start-kafka.sh

# Supervisor config
ADD supervisord/kafka.ini supervisord/zookeeper.ini /etc/supervisor.d/

ADD ./config/server.properties /config/server.properties


CMD ["supervisord", "-n"]