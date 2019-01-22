from ubuntu:latest

RUN apt-get -y update
RUN apt-get install -y wget gettext-base openjdk-8-jre 
RUN wget http://apache.rediris.es/kafka/2.1.0/kafka_2.12-2.1.0.tgz
RUN wget http://apache.uvigo.es/incubator/druid/0.13.0-incubating/apache-druid-0.13.0-incubating-bin.tar.gz

RUN tar -xvf kafka_2.12-2.1.0.tgz && tar -xvf apache-druid-0.13.0-incubating-bin.tar.gz
RUN cd apache-druid-0.13.0-incubating && rm -f -r conf/ && mv quickstart/tutorial/conf conf && mkdir -p var/tmp var/druid/tmp

COPY common.runtime.properties /apache-druid-0.13.0-incubating/conf/druid/_common/common.runtime.properties
COPY stack-start.sh /stack-start.sh

EXPOSE 8081
EXPOSE 8090
EXPOSE 8082

CMD /stack-start.sh
