# Class to load configuration of nodekey and bcastaddr

class boks::config inherits boks {
  # Fetching data
  $bcastaddr = hiera('boks::bcastaddr')

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

  file { $env_file:
   ensure  => file,
   owner   => 0,
   group   => 0,
   mode    => '0644',
  }

}
