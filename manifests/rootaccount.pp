#
# This class is used on a BoKS client, to pull the required per-host
# configuration from Hiera. It then generates an exported resource,
# which will be collected by the BoKS master server, to create the
# root account.
#

class boks::rootaccount ()
inherits boks {
  $roothome = hiera('boks::roothome', $boks::params::roothome)
  $rootshell = hiera('boks::rootshell', $boks::params::rootshell)
  $rootuserclass = hiera('boks::rootuserclass', $boks::params::rootuserclass)
  $rootpasshash = hiera('boks::rootpasshash', $boks::params::rootpasshash)

  @@exec { "Root account of ${::hostname}":
    command => "${boks::params::boks_sbin}/mkbks -l ${::fqdn}:root -u 0 -g 0 -p \"${rootpasshash}\" -h \"${roothome}\" -r \"Superuser managed by Puppet\" -s \"${rootshell}\" -P ${rootuserclass}",
    unless  => "${boks::params::boks_sbin}/lsbks -l ${::fqdn}:root | /bin/grep \":root\"",
    tag     => 'rootaccount',
  }

}
