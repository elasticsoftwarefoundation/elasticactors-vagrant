#!/usr/bin/env bash
set -e

echo "Installing RabbitMQ repo for Debian Wheezy"

echo "deb http://www.rabbitmq.com/debian/ testing main" | tee -a /etc/apt/sources.list
wget -qO - http://www.rabbitmq.com/rabbitmq-signing-key-public.asc | sudo apt-key add -
apt-get update
apt-get -y install rabbitmq-server
