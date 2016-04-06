## site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition. (The default node can be omitted
# if you use the console and don't define any other nodes in site.pp. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.)

## Active Configurations ##

# PRIMARY FILEBUCKET
# This configures puppet agent and puppet inspect to back up file contents when
# they run. The Puppet Enterprise console needs this to display file contents
# and differences.

# Disable filebucket by default for all File resources:
File { backup => false }

# Randomize enforcement order to help understand relationships
ini_setting { 'random ordering':
  ensure  => present,
  path    => "${settings::confdir}/puppet.conf",
  section => 'agent',
  setting => 'ordering',
  value   => 'title-hash',
}

# DEFAULT NODE
# Node definitions in this file are merged with node data from the console. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.

# The default node definition matches any node lacking a more specific node
# definition. If there are no other nodes in this file, classes declared here
# will be included in every node's catalog, *in addition* to any classes
# specified in the console for that node.

node default {

  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }

  # notify { "Hello from inside default node, my name is ${::hostname} ": }
  

  # notify{ "OSFAMILY ${::osfamily} \n":  }
  
  #file { 'motd':
  #  ensure  => file,
  #  path    => '/etc/motd',
  #  owner   => 'root',
  #  group   => 'root',
  #  mode    => '0644',
  #  content => "Hey, Puppet is fun! I leanred about puppet gitflow and puppet site.pp files! Ooo. ",
  #}

  package { 'cowsay':
    ensure   => present,
    provider => gem,
  }

  exec { 'seed motd':
    command     => 'cowsay "Welcome to the terrordome." > /etc/motd' ,
    path        => '/usr/local/bin',
    # umask       => 022,
    user        => root,
    creates     => '/etc/motd',
  

  }




  # include users
  # include skeleton
  include memcached
  include nginx


  #notify { "Hello from outside default node, my name is ${::hostname} ": }
  
  if $::is_virtual {

    $vmname = capitalize($::virtual);
    
    notify { "This is a VM, my name is ${::hostname} ${vmname}": }
    # This is where we'd upper case this variable 
    ## $operatingsystem
    # can't do this until we're able to install
    # https://forge.puppetlabs.com/puppetlabs/stdlib
    
  }
  else {
  #  # include ntp
      #warning('This is not a virutal machine.')
      notify { "This is not a VM, my name is ${::hostname} ": }
  }


}



