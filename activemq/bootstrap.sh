#!/usr/bin/env bash
set -e

echo "Installing Oracle JDK 8"

apt-get -y install python-software-properties
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
apt-get -q -y update

echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections

apt-get -y install oracle-java8-installer

echo -e "\n\nJAVA_HOME=/usr/lib/jvm/java-8-oracle" >> /etc/environment;
export JAVA_HOME=/usr/lib/jvm/java-8-oracle/

echo "Installing ActiveMQ Artemis 1.2.0"

apt-get -y install libaio1

wget https://archive.apache.org/dist/activemq/activemq-artemis/1.2.0/apache-artemis-1.2.0-bin.tar.gz
cd /usr/share
tar -zxvf /home/vagrant/apache-artemis-1.2.0-bin.tar.gz
cd /var/lib
/usr/share/apache-artemis-1.2.0/bin/artemis create activemq --user admin --password vagrant --role administrator --require-login

/var/lib/activemq/bin/artemis-service start
