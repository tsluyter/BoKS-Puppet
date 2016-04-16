# Class to load configuration of nodekey and bcastaddr

class boks::config inherits boks {
  # Fetching data
  $bcastaddr = hiera('boks::bcastaddr')
  $nodekey = hiera('boks::nodekey')
  $nodekeycheck = hiera('boks::nodekeycheck')

  file { $bcastaddr_file:
   ensure  => file,
   owner   => 0,
   group   => 0,
   mode    => '0644',
   content => template("boks/bcastaddr.erb"),
  }

  file { $nodekey_file:
   ensure  => file,
   owner   => 0,
   group   => 0,
   mode    => '0600',
  }

  exec { "set_nodekey_${::hostname}":
    command => "/bin/echo $nodekey | ${boks_lib}/hostkey -F",
    unless  => "${boks_lib}/hostkey -c | grep $nodekeycheck",
  }

  @@exec { "nodekey_of_${::hostname}":
    command => "/bin/echo $nodekey | ${boks_lib}/hostkey -s -F -h ${::fqdn}",
    unless  => "${boks_lib}/hostkey -c | grep $nodekeycheck",
    tag     => "nodekey",
  }

  file { $env_file:
   ensure  => file,
   owner   => 0,
   group   => 0,
   mode    => '0644',
  }

}
