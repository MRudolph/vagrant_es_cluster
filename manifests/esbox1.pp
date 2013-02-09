include elasticsearch1

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