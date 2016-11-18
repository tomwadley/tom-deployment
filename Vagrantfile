# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.synced_folder ".", "/vagrant"

  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~ubuntu/authorized_keys"

  config.vm.provision "shell",
    inline: "cp ~ubuntu/authorized_keys ~root/.ssh/authorized_keys"

end
