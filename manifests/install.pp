# Creates container's volume, pulls docker image and run the Nexus container
#
# @summary Configures and runs Nexus3

class nexus::install {

  docker_volume { 'nexus-data':
    ensure => present,
  }

  docker::image { 'sonatype/nexus3':
    image_tag => $nexus::version,
  }

  docker::run { 'nexus3':
    image          => "sonatype/nexus3:${nexus::version}",
    ports          => ['8081:8081'],
    expose         => ['8081'],
    service_prefix => 'docker-',
    volumes        => ['nexus-data:/nexus-data'],
    env            => ["INSTALL4J_ADD_VM_PARAMS=-Xms${nexus::java_xms} -Xmx${nexus::java_xmx} -XX:MaxDirectMemorySize=${nexus::java_max_direct_mem} -Djava.util.prefs.userRoot=nexus-data/javaprefs"], # lint:ignore:140chars
    restart        => 'always',
    require        => [Docker_volume['nexus-data'], Docker::Image['sonatype/nexus3']],
  }

}
