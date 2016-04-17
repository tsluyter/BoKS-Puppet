#
# Class to install the RPM and to generate the host record on the BoKS
# master server's side.
#

class boks::install inherits boks {

  package { "${package_name}":
    ensure   => $package_ensure,
    provider => 'rpm',
    source   => "${rpm_source}/${package_file}"
  }

  @@exec { "hostrecord_for_${::hostname}":
    command => "${boks_sbin}/hostadm -a -h ${::fqdn} -i ${::ipaddress} -t UNIXBOKSHOST",
    unless  => "${boks_sbin}/hostadm -Slh ${::fqdn} | /bin/grep ${::fqdn}",
    tag     => "hostrecord",
  }

}
