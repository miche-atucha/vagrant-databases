# -*- mode: ruby -*-
# vi: set ft=ruby :

unless Vagrant.has_plugin?('vagrant-vbguest')
  puts 'Installing vagrant-vbguest Plugin...'
  system('vagrant plugin install vagrant-vbguest')
end

Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/bionic64'

  config.vm.network 'private_network', ip: '1.1.1.10'
  config.vm.network 'public_network', ip: '192.168.0.50'
  config.vm.network 'forwarded_port', guest: 27017, host: 27017
  config.vm.network 'forwarded_port', guest: 6379, host: 6379
  config.vm.network 'forwarded_port', guest: 3306, host: 3306
  config.vm.network 'forwarded_port', guest: 5432, host: 5432
  
  config.vm.provider 'virtualbox' do |virtualbox|
    virtualbox.name = 'databases'
    virtualbox.memory = 2048
    virtualbox.cpus = 2
  end

  config.vbguest.auto_update = true

  config.vm.provision 'shell', path: 'shell/apt-update.sh'
  config.vm.provision 'shell', path: 'shell/tools-installation.sh'
  config.vm.provision 'shell', path: 'shell/mongodb-installation.sh'
  config.vm.provision 'shell', path: 'shell/redis-installation.sh'
  config.vm.provision 'shell', path: 'shell/mysql-installation.sh'
  config.vm.provision 'shell', path: 'shell/postgres-installation.sh'

  config.vm.provision 'shell', path: 'shell/on-start.sh', run: 'always'
end
