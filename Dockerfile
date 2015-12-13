FROM evarga/jenkins-slave
MAINTAINER mario.zagar@hotmail.com

# install git
RUN apt-get update
RUN apt-get install -y git

# Install Oracle JDK 8
RUN wget --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    http://download.oracle.com/otn-pub/java/jdk/8u66-b17/jdk-8u66-linux-x64.tar.gz  && \
    mkdir /opt/jdk && \
    tar -zxf jdk-8u66-linux-x64.tar.gz -C /opt/jdk && \
    rm jdk-8u66-linux-x64.tar.gz && \
    update-alternatives --install /usr/bin/java  java  /opt/jdk/jdk1.8.0_66/bin/java 100 && \
    update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.8.0_66/bin/javac 100 && \
    update-alternatives --install /usr/bin/jar   jar   /opt/jdk/jdk1.8.0_66/bin/jar 100

# Install maven 3.3.3
RUN wget http://mirrors.sonic.net/apache/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz && \
    tar -zxf apache-maven-3.3.3-bin.tar.gz && \
    mv apache-maven-3.3.3 /usr/local && \
    rm -f apache-maven-3.3.3-bin.tar.gz && \
    ln -s /usr/local/apache-maven-3.3.3/bin/mvn /usr/bin/mvn
