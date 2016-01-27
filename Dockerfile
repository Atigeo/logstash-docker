# ---- xPatterns zookeeper Docker -------------------------

# ---- Version Control ------------------------------------

FROM xpatterns/java:7u79

ENV LOGSTASH_VERSION 2.1.1


# ---- Set Environmental Variables ------------------------

ENV LOGSTASH_HOME /usr/local/logstash-${LOGSTASH_VERSION}


# ---- Volumes --------------------------------------------

VOLUME /etc/logstash/


# ---- Install Logstash -----------------------------------

RUN wget https://download.elastic.co/logstash/logstash/logstash-${LOGSTASH_VERSION}.tar.gz -P /tmp/
RUN tar xzf /tmp/logstash* -C /usr/local/
COPY conf/sample.conf /etc/logstash/

RUN rm -Rf /tmp/*


# ---- Install run script ---------------------------------
COPY conf/run.sh /usr/bin/run.sh
RUN chmod u+x /usr/bin/run.sh
CMD ["/usr/bin/run.sh"]
