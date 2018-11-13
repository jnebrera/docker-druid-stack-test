from ubuntu:latest

RUN apt-get -y update
RUN apt-get install -y wget gettext-base openjdk-8-jre 
RUN wget http://apache.rediris.es/kafka/1.1.0/kafka_2.11-1.1.0.tgz
RUN wget http://static.druid.io/artifacts/releases/druid-0.12.3-bin.tar.gz

RUN tar -xvf kafka_2.11-1.1.0.tgz && tar -xvf druid-0.12.3-bin.tar.gz
RUN cd druid-0.12.3 && rm -f -r conf/ && mv conf-quickstart conf && mkdir -p var/tmp var/druid/tmp

COPY common.runtime.properties /druid-0.12.3/conf/druid/_common/common.runtime.properties
COPY stack-start.sh /stack-start.sh

EXPOSE 8081
EXPOSE 8090
EXPOSE 8082

CMD /stack-start.sh
