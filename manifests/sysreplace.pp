#

class boks::sysreplace
(
$sysreplace_set_to = 'on',
)

inherits boks

{

  if ${sysreplace_set_to} == "on" {
    exec { "sysreplace_on":
      command => '${boks_lib}/sysreplace replace',
      unless  => 'grep -i "SSM_ACTIVE=true" $env_file',
      require => Package["${package_name}"],
    }
  }
  else {
    exec { "sysreplace_off":
      command => '${boks_lib}/sysreplace restore',
      onlyif  => 'grep -i "SSM_ACTIVE=true" $env_file',
      require => Package["${package_name}"],
    }
  }

}
