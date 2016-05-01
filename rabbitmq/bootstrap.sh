#!/usr/bin/env bash
set -e

echo "Installing RabbitMQ repo for Debian Jessie"

echo "deb http://packages.erlang-solutions.com/debian jessie contrib" | tee -a /etc/apt/sources.list
wget -qO - http://packages.erlang-solutions.com/debian/erlang_solutions.asc | sudo apt-key add -
echo "deb http://www.rabbitmq.com/debian/ testing main" | tee -a /etc/apt/sources.list
wget -qO - http://www.rabbitmq.com/rabbitmq-signing-key-public.asc | sudo apt-key add -
apt-get update
apt-get -y install erlang-base-hipe rabbitmq-server
rabbitmq-plugins enable rabbitmq_management
cp /vagrant/rabbitmq/rabbitmq.config /etc/rabbitmq/
/etc/init.d/rabbitmq-server restart
