
class memcached{

 #TODO
 
 # manage
 # The memcached package.
 
  package { 'memcached':
    ensure   => present,
    # provider => gem,
  }
  
 # The /etc/sysconfig/memcached configuration file using the
 # example settings provided above.
 # The memcached service

  file { 'memcache config':
    ensure  => file,
    path    => '/etc/sysconfig/memcached',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  =>  'puppet:///modules/memcached/memcached.conf',
  }
  


}

