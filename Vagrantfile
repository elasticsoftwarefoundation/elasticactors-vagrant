# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

   # Every Vagrant virtual environment requires a box to build off of.
   config.vm.box = "debian/jessie64"

    config.vm.define :cassandra do |cassandra| # [1]
       cassandra.vm.hostname = "cassandra.dev.elasticsoftware.org"
       cassandra.vm.network :private_network, ip: "192.168.56.2"
       # Enable shell provisioning to bootstrap cassandra
       cassandra.vm.provision :shell, :path => "cassandra/bootstrap.sh"
       # VirtualBox Specific Customization
       config.vm.provider :virtualbox do |vb|
            # Use VBoxManage to customize the VM. For example to change memory:
            vb.gui = false 
            vb.customize ["modifyvm", :id, "--memory", "1024"]
            vb.customize ["modifyvm", :id, "--ioapic", "on"]
            vb.customize ["modifyvm", :id, "--cpus", "4"]
       end
    end

    config.vm.define :rabbitmq do |rabbitmq| # [1]
       rabbitmq.vm.hostname = "rabbitmq.dev.elasticsoftware.org"
       rabbitmq.vm.network :private_network, ip: "192.168.56.3"
       # Enable shell provisioning to bootstrap rabbitmq
       rabbitmq.vm.provision :shell, :path => "rabbitmq/bootstrap.sh"
       # VirtualBox Specific Customization
       config.vm.provider :virtualbox do |vb|
            # Use VBoxManage to customize the VM. For example to change memory:
            vb.gui = false 
            vb.customize ["modifyvm", :id, "--memory", "512"]
            vb.customize ["modifyvm", :id, "--ioapic", "on"]
            vb.customize ["modifyvm", :id, "--cpus", "4"]
       end
    end

    config.vm.define :kafka do |kafka| # [1]
       kafka.vm.hostname = "kafka.dev.elasticsoftware.org"
       kafka.vm.network :private_network, ip: "192.168.56.4"
       # Enable shell provisioning to bootstrap kafka
       kafka.vm.provision :shell, :path => "kafka/bootstrap.sh"
       # VirtualBox Specific Customization
       config.vm.provider :virtualbox do |vb|
            # Use VBoxManage to customize the VM. For example to change memory:
            vb.gui = false 
            vb.customize ["modifyvm", :id, "--memory", "2048"]
            vb.customize ["modifyvm", :id, "--ioapic", "on"]
            vb.customize ["modifyvm", :id, "--cpus", "4"]
       end
    end
    
    config.vm.define :activemq do |activemq| # [1]
       activemq.vm.hostname = "activemq.dev.elasticsoftware.org"
       activemq.vm.network :private_network, ip: "192.168.56.5"
       # Enable shell provisioning to bootstrap activemq
       activemq.vm.provision :shell, :path => "activemq/bootstrap.sh"
       # VirtualBox Specific Customization
       config.vm.provider :virtualbox do |vb|
            # Use VBoxManage to customize the VM. For example to change memory:
            vb.gui = false 
            vb.customize ["modifyvm", :id, "--memory", "1536"]
            vb.customize ["modifyvm", :id, "--ioapic", "on"]
            vb.customize ["modifyvm", :id, "--cpus", "4"]
       end
    end


end
