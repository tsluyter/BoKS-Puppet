#
# Do you want to automatically start BoKS at each server boot?
# Of course you do! But if you didn't, you can disable it with
# this class.
#

class boks::service inherits boks {
  if $boks::params::service_manage == true {
    service { $boks::params::service_name:
      ensure    => $boks::params::service_ensure,
      enable    => $boks::params::service_enable,
      subscribe => [ File[$boks::params::bcastaddr_file],
                      File[$boks::params::nodekey_file],
                      File[$boks::params::env_file] ],
      require   => [ Package[$boks::params::package_name],
                      File[$boks::params::nodekey_file] ],
    }
  }
}
