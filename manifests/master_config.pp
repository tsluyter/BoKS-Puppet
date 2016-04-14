# Class to setup basic configuration of the BoKS master, including the 
# shared secret for host pre-registration. This used to live in params.pp
# but has moved to Hiera.

class boks::master_config ()
inherits boks::params {
  # Data lookups
  $sharedsecret = hiera('boks::sharedsecret')

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
    content => template("boks/prereg-secret-master.erb"),
  }

}
