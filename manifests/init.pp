# Installs docker, configures and run Nexus3 in a container
#
# @example
#   include nexus
class nexus (
  String $version             = 'latest',
  String $java_xms            = '512M',
  String $java_xmx            = '1200M',
  String $java_max_direct_mem = '2G',
  Boolean $manage_docker      = false,
) {

  if $manage_docker {
    include docker
  }

  include nexus::install
  include nexus::config

  Class['nexus::install']
  ~>Class['nexus::config']

}
