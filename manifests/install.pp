# Class to install the RPM and to setup the shared secret for host
# pre-registration. Originally the shared secret was stored in params.pp
# but we're moving it to Hiera.

class boks::install inherits boks {
  # Data lookups
  $sharedsecret = hiera('boks::sharedsecret')

  package { "${package_name}":
    ensure   => $package_ensure,
    provider => 'rpm',
    source   => "${rpm_source}/${package_file}"
  }

  file { $prereg_secretfile:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0400',
    content => template("boks/prereg-secret-client.erb"),
  }

  file { $boks_cacert:
    ensure => file,
    owner  => 0,
    group  => 0,
    mode   => '0400',
    source => "puppet:///modules/boks/master.broehaha.nl-ca.pem",
  }

  @@exec { "hostrecord_for_${::hostname}":
    command => "${boks_sbin}/hostadm -a -h ${::fqdn} -i ${::ipaddress} -t UNIXBOKSHOST",
    unless  => "${boks_sbin}/hostadm -Slh ${::fqdn} | /bin/grep ${::fqdn}",
    tag     => "hostrecord",
  }

}
