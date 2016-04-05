class skeleton {

  # add resources: 
  
  # directory /etc/skel
 
  file{ 'skel':
    ensure => directory,
    path  => '/etc/skel',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',    
  }
  
  # file /etc/skel/.bashrc
  
  file { 'bashrc':
    ensure  => file,
    path    => '/etc/skel/.bashrc',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    # content => "# test bashrc file ! Ooo. ",
    source  =>  'file:/skeleton/files/.bashrc',
  }
  
  

}
