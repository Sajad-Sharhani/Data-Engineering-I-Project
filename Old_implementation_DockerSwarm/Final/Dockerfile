FROM ubuntu:22.04
# dependencies
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y openjdk-11-jdk-headless
RUN apt-get install -y scala
RUN apt-get install -y wget
RUN apt-get install -y screen
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
# hdfs
ADD https://dlcdn.apache.org/hadoop/common/hadoop-3.3.4/hadoop-3.3.4.tar.gz .
RUN tar xvf hadoop-3.3.4.tar.gz
RUN mv hadoop-3.3.4/ /usr/local/hadoop
ENV HADOOP_HOME=/usr/local/hadoop
ENV PATH=${PATH}:$HADOOP_HOME/bin
ADD core-site.xml /usr/local/hadoop/etc/hadoop/core-site.xml
ADD hdfs-site.xml /usr/local/hadoop/etc/hadoop/hdfs-site.xml
# spark
ADD https://archive.apache.org/dist/spark/spark-3.2.3/spark-3.2.3-bin-hadoop3.2.tgz .
RUN tar xvf spark-3.2.3-bin-hadoop3.2.tgz
RUN mv spark-3.2.3-bin-hadoop3.2/ /usr/local/spark
ENV PATH=${PATH}:$SPARK_HOME/bin
ENV SPARK_HOME=/usr/local/spark
ENV SPARK_NO_DAEMONIZE=true
