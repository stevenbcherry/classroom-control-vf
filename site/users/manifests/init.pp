
# ensure fundementals user exists

user { 'fundementals':
  ensure           => 'present',
  # gid              => '10',
  home             => '/home/fundementals',
  # password         => '!!',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  # uid              => '1001',
}


