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

  file { $prereg_secretfile:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0400',
  }

  file_line { "master_prereg_secret":
    ensure  => 'present',   
    path    => "${prereg_secretfile}",
    line    => "${prereg_secret}",
    require => File["${prereg_secretfile}"],
    }
}
