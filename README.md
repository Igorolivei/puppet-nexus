
# nexus

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with nexus](#setup)
    * [Beginning with nexus](#beginning-with-nexus)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

This module pulls the Nexus3 Docker image, run the container and maintain it running. It is also capable of installing Docker.

## Setup

### Beginning with nexus

Install it using git:

```bash
cd /etc/puppetlabs/code/environment/production/modules
git clone https://github.com/instruct-br/puppet-nexus.git nexus
```

## Usage

The most simple way to use this module is:

```puppet
include nexus
```

You can also declare the class to override the default parameters values:

```puppet
class { 'nexus':
  version             => '3.12.0',
  java_xms            => '1G',
  java_xmx            => '2G',
  java_max_direct_mem => '2G',
  manage_docker       => true,
}
```

## Reference

### Classes

```
nexus
nexus::install (private)
```

### Parameters

#### `version`

Type: String

Version of the Nexus image. Must correspond to a tag of the image "sonatype/nexus". Default to 'latest'.

#### `java_xms`

Type: String

The JVM minimum heap size. Default to '512M'.

#### `java_xmx`

Type: String

The JVM maximum heap size. Default to '1200M'.

#### `java_max_direct_mem`

Type: String

The JVM maximum direct memory size. Default to '2G'.

#### `manage_docker`

Type: Boolean

Whether the module should install Docker or not. Default to 'false'.

## Limitations

This module only pulls versions of the 'nexus' image. Older versions of Nexus can't be installed using it.

If you want to update the Nexus version, you will need to stop and remove the container before applying the class with the new version. But don't worry about the Nexus data, this module creates a Docker volume that will keep the data safe to be used by the new container.

## Development

### My dev environment

This module was developed using

- Puppet 5.5.6
- CentOS 7.4
- Vagrant 2.1.2 + VirtualBox 5.2.10
  - box: centos/7
  - box: debian/jessie64

### Author/Contributors

Igor Oliveira (igor at instruct dot com dot br)
