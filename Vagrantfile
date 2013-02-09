Vagrant::Config.run do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.ssh.forward_agent = true

  servers = {
    :es0 => {:network => "44.44.44.220", :http_port => 9201 },
    :es1 => {:network => "44.44.44.221", :http_port => 9202 },
    #:es2 => {:network => "44.44.44.222" :http_port => 9203 },
  }


  config.vm.define :es0 do |es0|
    # uncomment the following line if you want the basebox to start in gui mode
    # es.vm.boot_mode = :gui
    opts = servers[:es0]
    es0.vm.host_name = 'es0'
    es0.vm.customize ["modifyvm", :id, "--memory", 1024]
    es0.vm.network :hostonly, opts[:network]
    es0.vm.forward_port(9200, opts[:http_port])
    es0.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file = "esbox.pp"
      puppet.module_path = ["modules"]
      puppet.options = "--verbose --debug"
    end
  end

  config.vm.define :es1 do |es1|
    # uncomment the following line if you want the basebox to start in gui mode
    # es.vm.boot_mode = :gui
    opts = servers[:es1]
    es1.vm.host_name = 'es1'
    es1.vm.customize ["modifyvm", :id, "--memory", 1024]
    es1.vm.network :hostonly, opts[:network]
    #es1.vm.forward_port(9200, opts[:http_port])
    es1.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file = "esbox1.pp"
      puppet.module_path = ["modules"]
      puppet.options = "--verbose --debug"
    end
  end

end
