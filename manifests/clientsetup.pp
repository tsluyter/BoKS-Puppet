
class boks::clientsetup inherits boks {

  exec { "setup_client":
     command => "${boks_sbin}/setup client",
     creates => "${boks_var}/run/boks_init",
     require => [ Package["${package_name}"],
                  File["${prereg_secretfile}"], 
                  File["${boks_cacert}"], ]
  }
}
