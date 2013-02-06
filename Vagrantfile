Vagrant::Config.run do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  #config.ssh.forward_agent = true

  servers = {
    :es0 => {:network => "44.44.44.220", :nodename => "es0@44.44.44.220", :http_port => 9201, :pbc_port => 9205 },
    :es1 => {:network => "44.44.44.221", :nodename => "es1@44.44.44.221", :http_port => 9202, :pbc_port => 9206 },
    :es2 => {:network => "44.44.44.222", :nodename => "es2@44.44.44.222", :http_port => 9203, :pbc_port => 9207 },
    :es3 => {:network => "44.44.44.223", :nodename => "es3@44.44.44.223", :http_port => 9204, :pbc_port => 9208 }
  }

  servers.each do |name, opts|
    config.vm.define name do |es|
      # uncomment the following line if you want the basebox to start in gui mode
      # es.vm.boot_mode = :gui
      es.vm.network :hostonly, opts[:network]
      es.vm.forward_port(9200, opts[:http_port])
      #es.vm.forward_port(8087, opts[:pbc_port])

      es.vm.provision :puppet, :facter => { "es_node_name" => "es@#{opts[:network]}" } do |puppet|
        puppet.manifests_path = "manifests"
        puppet.manifest_file = "esbox.pp"
        puppet.module_path = ["modules"]
        puppet.options = "--verbose --debug"
      end
    end
  end
end
