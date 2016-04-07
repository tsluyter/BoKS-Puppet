#

class boks::filmon
(
$filmon_set_to = 'on',
$filmon_runhours = '22-06',
$filmon_slowdown = '10',
$filmon_filesystems = '',
)

inherits boks

{

  file_line { 'filmon':
    ensure  => 'present',
    path    => "${env_file}",
    line    => "FILMON=${filmon_set_to}",
    match   => '^FILMON\=',
    require => Package["${package_name}"],
    notify  => Service["boksm"],
  }

  file { "${boks_etc}/filmon.conf":
    ensure   => file,
    owner    => 0,
    group    => 0,
    mode     => '0644',
    require  => Package["${package_name}"],
    content  => template("boks/filmon.erb"),
  }

  file_line { "filmon_runhours":
    ensure  => 'present',
    path    => "${boks_etc}/filmon.conf",
    line    => "runhours ${filmon_runhours}",
    match   => 'runhours ',
    require => File["${boks_etc}/filmon.conf"],
  }

  file_line { "filmon_slowdown":
    ensure  => 'present',
    path    => "${boks_etc}/filmon.conf",
    line    => "slowdown ${filmon_slowdown}",
    match   => 'slowdown ',
    require => File["${boks_etc}/filmon.conf"],
  }

  file_line { "filmon_filesystems":
    ensure  => 'present',
    path    => "${boks_etc}/filmon.conf",
    line    => "filesystems ${filmon_runhours}",
    match   => 'filesystems ',
    require => File["${boks_etc}/filmon.conf"],
  }

}
