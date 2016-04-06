
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

}

