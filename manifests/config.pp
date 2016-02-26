
class boks::config inherits boks {

  file { $bcastaddr_file:
   ensure   => file,
   owner    => 0,
   group    => 0,
   mode     => '0644',
   source   => "puppet:///modules/boks/bcastaddr",
   require  => Package["${package_name}"],
  }

  file { $nodekey_file:
   ensure  => file,
   owner   => 0,
   group   => 0,
   mode    => '0600',
   require => Package["${package_name}"],
  }

  file { $env_file:
   ensure  => file,
   owner   => 0,
   group   => 0,
   mode    => '0644',
   require => Package["${package_name}"],
  }

}
