FROM debian:jessie
RUN apt-get update && \
    apt-get install -y openjdk-7-jre wget
ENV JAVA_HOME /usr/lib/jvm/java-6-openjdk-amd64
RUN (cd /tmp && \
    wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.0.tar.gz -O pkg.tar.gz && \
    tar zxf pkg.tar.gz && mv elasticsearch-* /Public/elasticsearch &&\
    rm -rf /tmp/*)
COPY elasticsearch.yml /Public/elasticsearch/config/elasticsearch.yml
EXPOSE 9200
EXPOSE 9300
VOLUME /Public/elasticsearch/data
ENTRYPOINT ["/Public/elasticsearch/bin/elasticsearch"]
CMD []
