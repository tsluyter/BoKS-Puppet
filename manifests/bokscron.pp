#

class boks::bokscron
(
$bokscron_set_to = 'on',
)

inherits boks

{

  file_line { 'bokscron':
    ensure  => 'present',
    path    => "${env_file}",
    line    => "BOKSCRON=${filmon_set_to}",
    match   => '^BOKSCRON\=',
    require => Package["${package_name}"],
    notify  => Service["boksm"],
  }

  file { "${boks_etc}/bokscron.conf":
    ensure   => file,
    owner    => 0,
    group    => 0,
    mode     => '0644',
    require  => Package["${package_name}"],
    content  => template("boks/bokscron.erb"),
  }
}
