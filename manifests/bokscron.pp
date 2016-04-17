#
# BoKS has its own scheduling daemon, to run a number of internal tasks.
# By default this daemon is supposed to be on, but in some edge-cases 
# you might want to disable it. You can do so from a node's profile or
# definition. 
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
    line    => "BOKSCRON=${bokscron_set_to}",
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
