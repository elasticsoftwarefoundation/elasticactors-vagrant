elasticactors-vagrant
=====================

Vagrant configuration to easily setup an Elastic Actors cluster on your Development machine

* install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* install [Vagrant](http://www.vagrantup.com/downloads.html)
* create a host-only network on Virtual Box (just leave the defaults)
* clone this project
* cd to the project root
* download the file: [debian73-base-v2.box](http://goo.gl/azKl70) from Google Drive (it's a two step thing)
* install the box in vagrant```vagrant box add debian73-v2 file:<path-to-downloaded-file>```
* in the root directory run ```vagrant up```
