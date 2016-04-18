#
# Class to install the RPM and to generate the host record on the BoKS
# master server's side.
#

class boks::install inherits boks {

  package { $boks::params::package_name:
    ensure   => $boks::params::package_ensure,
    provider => 'rpm',
    source   => "${boks::params::rpm_source}/${boks::params::package_file}"
  }

  @@exec { "hostrecord_for_${::hostname}":
    command => "${boks::params::boks_sbin}/hostadm -a -h ${::fqdn} -i ${::ipaddress} -t UNIXBOKSHOST",
    unless  => "${boks::params::boks_sbin}/hostadm -Slh ${::fqdn} | /bin/grep ${::fqdn}",
    tag     => 'hostrecord',
  }

}
