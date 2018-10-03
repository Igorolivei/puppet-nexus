# Manages any additional configuration needed to run the container
#
# @summary Manages configurations

class nexus::config {

  firewalld_port { 'Open Nexus container port':
    ensure   => present,
    zone     => 'public',
    port     => 8081,
    protocol => 'tcp',
  }

}
