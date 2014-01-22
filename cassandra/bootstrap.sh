#!/usr/bin/env bash
set -e

echo "Installing Oracle JDK 7"

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

echo "Installing Cassandra 1.2 repo for Debian Wheezy"

echo "deb http://debian.datastax.com/community stable main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
wget -qO - http://debian.datastax.com/debian/repo_key | sudo apt-key add -
apt-get update

echo "Installing JNA and Cassandra 1.2"

apt-get -y install libjna-java
apt-get -y install dsc12=1.2.13-1 cassandra=1.2.13

# copy the configuration to /etc/cassandra/
echo "Creating cassandra configuration and schema"
# Cassandra is started by the package installer with the wrong parameters
# need to stop and delete the data then restart
/etc/init.d/cassandra stop
rm -rf /var/lib/cassandra/*
cp /vagrant/cassandra/cassandra.yaml /etc/cassandra
/etc/init.d/cassandra start
sleep 30
cassandra-cli -h 192.168.56.2 -f /vagrant/cassandra/elasticactors.ddl