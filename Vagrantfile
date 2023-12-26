# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos/7"
  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.ssh.insert_key = false

  config.vm.provider :virtualbox do |v|
    v.memory = 4096
    v.cpus = 2
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  # ELK server.
  config.vm.define "logs" do |logs|
    logs.vm.hostname = "logs.test"
    logs.vm.network :private_network, ip: "192.168.56.90"
#add for root ssh access
    logs.vm.provision "shell", path: "root.sh"
    logs.trigger.after :up do |trigger|
      trigger.info = "Provision logs server"
      trigger.run = {path: "logs.sh"}
    end

#    logs.vm.provision :ansible do |ansible|
#      ansible.playbook = "provisioning/elk/main.yml"
#      ansible.inventory_path = "provisioning/elk/inventory"
#      ansible.become = true
#    end
  end

  # Web server.
  config.vm.define "web" do |web|
    web.vm.hostname = "web.test"
    web.vm.network :private_network, ip: "192.168.56.91"
    web.vm.provision "shell", path: "root.sh"
    web.trigger.after :up do |trigger|
      trigger.info = "Provision web server"
      trigger.run = {path: "web.sh"}
    end

    web.vm.provider :virtualbox do |v|
      v.memory = 512
      v.cpus = 1
    end

#    web.vm.provision :ansible do |ansible|
#      ansible.playbook = "provisioning/web/main.yml"
#      ansible.inventory_path = "provisioning/web/inventory"
#      ansible.become = true
#    end
  end

end
