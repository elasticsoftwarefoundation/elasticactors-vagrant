elasticactors-vagrant
=====================

Vagrant configuration to easily setup an Elastic Actors cluster on your Development machine

* install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* install [Vagrant](http://www.vagrantup.com/downloads.html)
* create a host-only network on Virtual Box (just leave the defaults)
* clone this project
* cd to the project root
* install debian 8 base box: ```vagrant box add debian/jessie64```
* in the root directory run ```vagrant up```
