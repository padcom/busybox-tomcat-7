FROM padcom/busybox-java:8u121
MAINTAINER Matthias Hryniszak <padcom@gmail.com>

RUN opkg-install curl

RUN mkdir -p /usr/lib/jvm && \
    curl http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.75/bin/apache-tomcat-7.0.75.tar.gz -L -k | gzip -dc | tar -xf - -C /opt && \
    ln -s /opt/apache-tomcat-7.0.75 /opt/tomcat && \
    rm -rf /opt/tomcat/webapps/*

CMD [ "/opt/tomcat/bin/catalina.sh", "run" ]

EXPOSE 8080
