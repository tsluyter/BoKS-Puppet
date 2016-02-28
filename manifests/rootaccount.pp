#

class boks::rootaccount ()
inherits boks {

  @@exec { "Root account of ${::hostname}":
        command => "${boks_puppet} -m root -a -h ${::fqdn}",
        unless  => "${boks_puppet} -m root -l -h ${::fqdn}",
        tag     => "rootaccount",
     }

}
