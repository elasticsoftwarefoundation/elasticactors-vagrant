#!/usr/bin/env bash
set -e

echo "Installing Apache Kafka for Debian Wheezy"

echo "Installing Oracle JDK 7"

apt-get update

apt-get -y install python-software-properties
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
apt-get -q -y update

echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections

apt-get -y install oracle-java7-installer

echo -e "\n\nJAVA_HOME=/usr/lib/jvm/java-7-oracle" >> /etc/environment;
export JAVA_HOME=/usr/lib/jvm/java-7-oracle/

echo "Installing Kafka Binaries"

wget https://archive.apache.org/dist/kafka/0.8.2-beta/kafka_2.10-0.8.2-beta.tgz

cd /usr/local/kafka/
tar -zxvf /root/kafka_2.10-0.8.2-beta.tgz


