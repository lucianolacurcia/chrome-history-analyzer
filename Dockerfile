FROM docker.elastic.co/logstash/logstash:6.8.18

RUN /usr/share/logstash/bin/logstash-plugin install logstash-filter-aggregate

RUN /usr/share/logstash/bin/logstash-plugin install logstash-filter-mutate

COPY ./toContainerBuild/sqlite-jdbc-3.36.0.1.jar /usr/share/logstash/logstash-core/lib/jars/sqlite-connector-java.jar
COPY ./toContainerBuild/logstash.conf /usr/share/logstash/pipeline/logstash.conf

ENV  XPACK_MONITORING_ENABLED=false
