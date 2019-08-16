FROM openjdk:8-slim-buster
ENV JENA_VERSION=3.9.0
ENV JENA_HOME=/opt/jena
ENV FUSEKI_HOME=/opt/fuseki
RUN apt-get update && apt-get install -y wget awscli && \
    wget http://archive.apache.org/dist/jena/binaries/apache-jena-${JENA_VERSION}.tar.gz && \
    wget http://archive.apache.org/dist/jena/binaries/apache-jena-fuseki-${JENA_VERSION}.tar.gz && \
    mkdir -p $JENA_HOME && \
    mkdir -p $FUSEKI_HOME && \
    mkdir -p /tdb-build && \
    tar -xzf apache-jena-${JENA_VERSION}.tar.gz -C /opt/jena --strip-components=1 && \
    tar -xzf apache-jena-fuseki-${JENA_VERSION}.tar.gz -C /opt/fuseki --strip-components=1 && \
    rm apache-jena-${JENA_VERSION}.tar.gz && \
    rm apache-jena-fuseki-${JENA_VERSION}.tar.gz && \
    rm -rf /var/lib/apt/lists/*
ENV PATH=$PATH:$FUSEKI_HOME/bin:$JENA_HOME/bin
ENV DATABASE_LOCATION=/tdb-build
WORKDIR /tdb-build
ADD bin/tdb-build $JENA_HOME/bin
