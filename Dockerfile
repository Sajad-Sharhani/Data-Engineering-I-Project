FROM ubuntu:22.04
RUN apt-get update
RUN apt-get -y upgrade
RUN apt install -y openjdk-11-jdk-headless
RUN apt install -y scala
RUN apt install -y wget
RUN apt install -y screen
RUN wget https://archive.apache.org/dist/spark/spark-3.2.3/spark-3.2.3-bin-hadoop3.2.tgz
RUN tar xvf spark-3.2.3-bin-hadoop3.2.tgz
RUN mv spark-3.2.3-bin-hadoop3.2/ /usr/local/spark
ENV PATH="${PATH}:$SPARK_HOME/bin"
ENV SPARK_HOME="/usr/local/spark"
ENV SPARK_NO_DAEMONIZE="true"
ENV JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
#EXPOSE 7077