# Vagrant handson

## Require for mac

- Install [Homebrew](https://brew.sh/index_ja)
- Install [VirtualBox](https://www.virtualbox.org)
- Install [Vagrant](https://www.vagrantup.com)
- Install Vagrant Plugins
  - [vagrant-share](https://www.vagrantup.com/docs/share)
  - [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest)

```
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
$ brew cask install virtualbox vagrant
$ vagrant plugin install vagrant-share vagrant-vbguest
```

## Build

```
$ git clone https://github.com/ucan-lab/infra-handson-vagrant.git
$ git clone https://github.com/ucan-lab/infra-handson-shop.git infra-handson-vagrant/shop
$ cd infra-handson-vagrant
$ vagrant up
```

http://127.0.0.1:8000

## Clear

```
$ vagrant destroy -f
```
