#

class boks::master_config ()
inherits boks::params {

  file { $boks_puppet:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0755',
    source  => "puppet:///modules/boks/bokspup",
  }

  file { $prereg_secret:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0400',
    source  => "puppet:///modules/boks/prereg-secret",
  }

}
