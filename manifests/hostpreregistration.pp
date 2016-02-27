#

class boks::hostpreregistration () 
inherits boks {

  @@exec { "Hostpreregistration of ${::hostname}":
    command => "${boks_puppet} -m prereg -a -h ${::fqdn} -i ${::ipaddress}",
    unless  => "${boks_puppet} -m prereg -l -h ${::fqdn}",
    tag     => "hostpreregistration",
  }

}
