
class boks::params {
  $package_ensure    = 'installed'
  $package_name      = 'boks-client-7.0-1.el6.x86_64'
  $package_file      = "${package_name}.rpm"
  $rpm_source        = 'http://10.211.55.43/packages'
  $service_enable    = 'true'
  $service_ensure    = 'running'
  $service_manage    = 'true'
  $service_name      = 'boksm'
  $boks_etc          = '/etc/opt/boksm'
  $boks_opt          = '/opt/boksm'
  $boks_var          = '/var/opt/boksm'
  $boks_bin          = "${boks_opt}/bin"
  $boks_sbin         = "${boks_opt}/sbin"
  $boks_lib          = "${boks_opt}/lib"
  $env_file          = "${boks_etc}/ENV"
  $nodekey_file      = "${boks_etc}/nodekey"
  $bcastaddr_file    = "${boks_etc}/bcastaddr"
  $boks_master       = '10.211.55.60'
  $boks_replicas     = ['10.211.55.61', '10.211.56.61']
}

