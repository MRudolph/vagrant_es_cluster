node 'es0' {
	class { elasticsearch: network_host => "44.44.44.220" }

	Package {
	    require  => Exec['apt-get_update']
	  }

	exec { 'apt-get_update':
	    command     => '/usr/bin/apt-get update',
	  }

	package {"curl":
	  ensure => present
	}

	package {"vim": 
	  ensure => present
	}

	package {"git-core":
	  ensure => present
	}

	package {"build-essential":
	  ensure => present
	}

	package {"nfs-kernel-server":
	  ensure => present
    }
}