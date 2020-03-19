# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  # VM Image - Ubuntu v14.04
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus   = 1
  end

  # Redis
  config.vm.define "redis" do |redis|
      redis.vm.network "private_network", ip: "192.168.10.10"
  end

  # Provision with Ansible
  config.vm.provision "ansible" do |ansible|
      ansible.playbook = "vagrant.yml"
  end

  # SSH Default Configuration
  # # Commented because you shouldn't need to copy them.
  # # config.ssh.username         = "root"
  # # config.ssh.password         = "vagrant"
  # # config.ssh.port             = 22
  # # config.ssh.insert_key       = true
  # # config.ssh.private_key_path = "~/.ssh/id_rsa"
  # # config.ssh.forward_agent    = true
 
end
