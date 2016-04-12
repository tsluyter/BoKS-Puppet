
class boks::install inherits boks {
  package { "${package_name}":
    ensure   => $package_ensure,
    provider => 'rpm',
    source   => "${rpm_source}/${package_file}"
  }

  file { $prereg_secretfile:
    ensure => file,
    owner  => 0,
    group  => 0,
    mode   => '0400',
  }

  file_line { "client_prereg_secret":
    ensure  => 'present',
    path    => "${prereg_secretfile}",
    line    => "SECRET=${prereg_secret}",
    match   => 'SECRET=',
    require => File["${prereg_secretfile}"],
  }

  file { $boks_cacert:
    ensure => file,
    owner  => 0,
    group  => 0,
    mode   => '0400',
    source => "puppet:///modules/boks/master.broehaha.nl-ca.pem",
  }

}
