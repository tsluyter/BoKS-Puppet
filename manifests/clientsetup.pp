
class boks::clientsetup inherits boks {
  Class[boks::install]->Class[boks::clientsetup]

  exec { "setup_client":
     command => "${boks_sbin}/setup -a -v -A FILE=${prereg_secretfile} -A MASTER=${boks_master} -A CACERT=${boks_cacert} -A USER=puppet -A HOST=${::fqdn} client",
     creates => "${boks_var}/run/boks_init",
     require => [ Package["${package_name}"],
     File["${prereg_secretfile}"], 
     File["${boks_cacert}"], ]
  }
}
