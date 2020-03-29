Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.network "forwarded_port", guest: 80, host: 8000
  config.vm.synced_folder "./shop", "/var/www/html"
  config.vm.provision :init, type: "shell", path: "init.sh"
end
