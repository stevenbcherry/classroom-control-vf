class nginx{

  package { 'nginx':
    ensure   => present,
  }

  file { 'nginx config':
    ensure  => file,
    path    => '/etc/nginx/nginx.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  =>  'puppet:///modules/nginx/nginx.conf',
  }

  file { 'nginx config default':
    ensure  => file,
    path    => '/etc/nginx/nginx.conf.default',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  =>  'puppet:///modules/nginx/default.conf',
  }


  service { 'nginx service':
    name       => 'nginx',
    ensure     => running,
    enable     => true,
  }

}
