class nginx{

  package { 'nginx':
    ensure   => present,
  }

  file { default:
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }


 file {[ '/var/www', '/etc/nginx/conf.d' ]:
  ensure => directory,
 }

 file { '/var/www/index.html':
   ensure => file,
   source => 'puppet:///modules/nginx/index.html',
  }

  file { 'nginx config':
    ensure  => file,
    path    => '/etc/nginx/nginx.conf',
    source  =>  'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
    notify  => Service['nginx'],
  }

  file { 'nginx config default':
    ensure  => file,
    path    => '/etc/nginx/conf.d/default.conf',
    source  =>  'puppet:///modules/nginx/default.conf',
  }



  service { 'nginx service':
    name       => 'nginx',
    ensure     => running,
    enable     => true,
  }

}
