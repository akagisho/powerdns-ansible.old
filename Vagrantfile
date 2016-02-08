# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :node1 do |node|
    node.vm.box = "ubuntu/trusty64"
    node.vm.network :private_network, ip: "10.200.19.10"
  end

  config.vm.define :node2 do |node|
    node.vm.box = "ubuntu/trusty64"
    node.vm.network :private_network, ip: "10.200.19.11"
  end

  config.vm.define :node3 do |node|
    node.vm.box = "ubuntu/trusty64"
    node.vm.network :private_network, ip: "10.200.19.12"
  end

  config.vm.define :node4 do |node|
    node.vm.box = "ubuntu/trusty64"
    node.vm.network :private_network, ip: "10.200.19.13"
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "site.yml"

    ansible.groups = {
      "master" => ["node1"],
      "slave-bind" => ["node2"],
      "slave-knotdns" => ["node3"],
      "slave-nsd" => ["node4"]
    }

    ansible.extra_vars = "vars/development.yml"
  end

  config.ssh.insert_key = false
end
