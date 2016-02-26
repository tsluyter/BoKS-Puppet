#

class boks::bksd
(
$bksd_set_to = 'on',
$bksd_timeout = 'on',
$bksd_sleep = '30',
)

inherits boks

{
  file_line { 'bksd_set_to':
    ensure  => 'present',
    path    => "${env_file}",
    line    => "BKSD=${bksd_set_to}",
    match   => '^BKSD\=',
    require => Package["${package_name}"],
    notify  => Service["boksm"],
  }

  file_line { 'bksd_timeout':
    ensure  => 'present',
    path    => "${env_file}",
    line    => "BKSD_TIMEOUT=${bksd_timeout}",
    match   => '^BKSD_TIMEOUT\=',
    require => Package["${package_name}"],
    notify  => Service["boksm"],
  }

  file_line { 'bksd_sleep':
    ensure  => 'present',
    path    => "${env_file}",
    line    => "BKSD_SLEEP=${bksd_sleep}",
    match   => '^BKSD_SLEEP\=',
    require => Package["${package_name}"],
    notify  => Service["boksm"],
  }

}
