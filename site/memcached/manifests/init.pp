
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
  
  
  service { 'memcached service':
    name       => 'memcached',
    ensure     => running,
    # binary     => # The path to the daemon.  This is only used for...
    # control    => # The control variable used to manage services...
    enable     => true,
    #flags      => # Specify a string of flags to pass to the startup 
    #hasrestart => # Specify that an init script has a `restart...
    #hasstatus  => # Declare whether the service's init script has a...
    #manifest   => # Specify a command to config a service, or a path 
    #path       => # The search path for finding init scripts....
    #pattern    => # The pattern to search for in the process table...
    #provider   => # The specific backend to use for this `service...
    #restart    => # Specify a *restart* command manually.  If left...
    #start      => # Specify a *start* command manually.  Most...
    #status     => # Specify a *status* command manually.  This...
    #stop       => # Specify a *stop* command...
    
}


}

