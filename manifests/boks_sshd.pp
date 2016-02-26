#
# This is a tricky one! Enabling the BoKS SSHD will most likely
# collide with the system-default SSHD. Thus BoKS SSHD will only
# start if the service { 'sshd': ... } is set to ensure=>'stopped'. 
# But we can honestly NOT do that over here in this sub-class! 
# This must be specified in the host's definition.
#

class boks::boks_sshd
(
$boks_sshd_set_to = 'on'
)

inherits boks

{

  file_line { 'boks_sshd':
    ensure  => 'present',
    path    => "${env_file}",
    line    => "BOKS_SSHD=${boks_sshd_set_to}",
    match   => '^BOKS_SSHD\=',
    require => Package["${package_name}"],
    notify  => Service["boksm"],
  }

}
