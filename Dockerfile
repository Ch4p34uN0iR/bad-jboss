#
# This Dockerfile builds a JBossAS 6.1.0 Server on JDK 6
# This server is *intentionally* vulnerable to java serialization attacks
# This server is intended for use in penetration testing and training
#

#using an old debian
FROM debian:wheezy

MAINTAINER Jonathan Hill <anfechtung@gmail.com>
#can pull zip from
#wget http://download.jboss.org/jbossas/6.1/jboss-as-distribution-6.1.0.Final.zip
ENV JBOSS_FILE=jboss-as-distribution-6.1.0.Final.zip \
    JBOSS_HOME=/opt/jbossas/jboss-6.1.0.Final \
    JAVA_HOME=/usr/lib/jvm/java-6-openjdk-amd64/jre

RUN apt-get update && \
    apt-get install -y wget openjdk-6-jdk unzip && \
    mkdir -p /opt/jbossas && \
    cd /opt/jbossas/ && \
    wget http://download.jboss.org/jbossas/6.1/jboss-as-distribution-6.1.0.Final.zip && \
    unzip /opt/jbossas/$JBOSS_FILE && \
    rm $JBOSS_FILE
   
COPY source/* $JBOSS_HOME/server/default/deployers/jbossws.deployer/META-INF/
 
EXPOSE 8080

CMD $JBOSS_HOME/bin/run.sh -b $HOSTNAME
