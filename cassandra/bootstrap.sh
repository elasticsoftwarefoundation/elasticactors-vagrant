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

echo "Installing Cassandra 2.2 repo for Debian Jessie"

echo "deb http://debian.datastax.com/community stable main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
wget -qO - http://debian.datastax.com/debian/repo_key | sudo apt-key add -
apt-get update

echo "Installing JNA and Cassandra 2.2"

apt-get -y install libjna-java
apt-get -y install dsc22=2.2.4-1 cassandra=2.2.4

# copy the configuration to /etc/cassandra/
echo "Creating cassandra configuration and schema"
# Cassandra is started by the package installer with the wrong parameters
# need to stop and delete the data then restart
/etc/init.d/cassandra stop
rm -rf /var/lib/cassandra/*
cp /vagrant/cassandra/cassandra-2.2.yaml /etc/cassandra/cassandra.yaml
/etc/init.d/cassandra start
sleep 30
cqlsh -f /vagrant/cassandra/elasticactors.cql 192.168.56.2
