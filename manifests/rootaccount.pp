#

class boks::rootaccount ()
inherits boks {
  $roothome = hiera('boks::roothome')
  $rootshell = hiera('boks::rootshell')
  $rootuserclass = hiera('boks::rootuserclass')
  $rootpasshash = hiera('boks::rootpasshash')

  @@exec { "Root account of ${::hostname}":
    command => "${boks_sbin}/mkbks -l ${::fqdn}:root -u 0 -g 0 -p ${rootpasshash} -h ${roothome} -r \"Superuser managed by Puppet\" -s ${rootshell} -P ${rootuserclass}",
    unless  => "${boks_sbin}/lsbks -l ${::fqdn}:root | /bin/grep \":root\"",
    tag     => "rootaccount",
  }

}
