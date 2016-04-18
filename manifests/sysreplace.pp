#
# Aside from its run-state (on or off), BoKS also has two protection
# states: enabled or disabled. When BoKS is disabled, it will not perform
# any access control; it will only log and monitor. Only when BoKS is
# enabled, will it perform access control. By default it gets enabled.
#

class boks::sysreplace
(
$sysreplace_set_to = 'on',
)

inherits boks

{

  if $sysreplace_set_to == 'on' {
    exec { 'sysreplace_on':
      command => "${boks::params::boks_lib}/sysreplace replace",
      unless  => "/bin/grep -i \"SSM_ACTIVE=true\" ${boks::params::env_file}",
      require => Package[$boks::params::package_name],
    }
  }
  else {
    exec { 'sysreplace_off':
      command => "${boks::params::boks_lib}/sysreplace restore",
      onlyif  => "/bin/grep -i \"SSM_ACTIVE=true\" ${boks::params::env_file}",
      require => Package[$boks::params::package_name],
    }
  }

}
