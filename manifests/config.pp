#
# Class to load configuration of nodekey and bcastaddr.
# Originally the bcastaddr was loaded as a template, while the
# nodekey was auto-generated during the host pre-registration
# handshake. Both were inellegant, so I've reworked the whole
# process.
#
# Bcastaddr lines can now be fetched from Hiera, which is great!
# Not only can you add or remove replicas easily, you can also
# define separate bcastaddr files for specific domains (which may
# be tied to Hiera hierarchy).
#
# The nodekey is also pulled from Hiera these days. The host prereg
# mechanism was too much hassle and led to some race conditions (if
# I'm using the term correctly). You can now set a per-host nodekey
# in Hiera (which in turn may be encrypted by using hiera-eyaml).
# Please read my paper at www.unixerius.nl for more details.

class boks::config inherits boks {
  # Fetching data
  $bcastaddr = hiera('boks::bcastaddr', $boks::params::bcastaddr)
  $nodekey = hiera('boks::nodekey', $boks::params::nodekey)
  $nodekeycheck = hiera('boks::nodekeycheck', $boks::params::nodekeycheck)

  file { $boks::params::bcastaddr_file:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template('boks/bcastaddr.erb'),
  }

  file { $boks::params::nodekey_file:
    ensure => file,
    owner  => 0,
    group  => 0,
    mode   => '0600',
  }

  exec { "set_nodekey_${::hostname}":
    command => "/bin/echo ${nodekey} | ${boks::params::boks_lib}/hostkey -F",
    unless  => "${boks::params::boks_lib}/hostkey -c | grep ${nodekeycheck}",
  }

  @@exec { "nodekey_of_${::hostname}":
    command => "/bin/echo ${nodekey} | ${boks::params::boks_lib}/hostkey -s -F -h ${::fqdn}",
    unless  => "${boks::params::boks_lib}/hostkey -c | grep ${nodekeycheck}",
    tag     => 'nodekey',
  }

  file { $boks::params::env_file:
    ensure => file,
    owner  => 0,
    group  => 0,
    mode   => '0644',
  }

}
