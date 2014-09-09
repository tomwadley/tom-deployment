# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu1404-server"

  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  config.ssh.forward_agent = true

  config.vm.synced_folder ".", "/vagrant"

  config.vm.provision "shell",
    inline: "cp ~vagrant/.ssh/authorized_keys ~root/.ssh/authorized_keys"

  config.vm.provision "ansible" do |ansible|
    ansible.inventory_path = "inventory"
    ansible.limit = "local"
    ansible.playbook = "local.yml"
    ansible.raw_ssh_args = ['-o UserKnownHostsFile=/dev/null']
  end

end
