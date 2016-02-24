
class boks::service inherits boks {
  if $service_manage == "true" {
    service { "${service_name}":
      ensure => $service_ensure,
      enable => $service_enable,
      subscribe => [ File["${bcastaddr_file}"],
                     File["${nodekey_file}"] ]
    }
  }
}
