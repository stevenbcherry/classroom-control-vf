
class users{
  # ensure fundementals user exists
  user { 'fundamentals':
    ensure => present,
  }
}
