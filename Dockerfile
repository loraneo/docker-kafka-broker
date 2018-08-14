FROM loraneo/docker-java:10.0.2a

WORKDIR /opt

ENV KAFKA_HOME /opt/kafka

RUN cd /tmp &&\
	curl -o kafka.tgz -L http://www-eu.apache.org/dist/kafka/2.0.0/kafka_2.12-2.0.0.tgz &&\
	tar -xvf kafka.tgz -C /opt &&\
	ln -s /opt/kafka* $KAFKA_HOME



COPY kafka/server.properties $KAFKA_HOME/config/server.properties

EXPOSE 9092
CMD $KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties

