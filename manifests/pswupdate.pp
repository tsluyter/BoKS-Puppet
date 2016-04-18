#
# By default, BoKS will automatically create and remove user accounts
# in the local /etc/passwd, shadow and groups. In some edge-cases you
# might not want this, so I've given you the option to disable this
# mechanism.
#

class boks::pswupdate
(
$boks_pswupdate_set_to = 'on',
)

inherits boks

{

  if $boks_pswupdate_set_to == 'on' {
    @@exec { "pswupdate_on on ${::hostname}":
      command => "${boks_sbin}/hostadm -D nopswupdate -h ${::fqdn}",
      unless  => "${boks_sbin}/hostadm -lh ${::fqdn} | /bin/grep \"Update passwd file:      Yes\"",
      tag     => 'pswupdate',
    }
  }
  else {
    @@exec { "pswupdate_off on ${::hostname}":
      command => "${boks_sbin}/hostadm -A nopswupdate -h ${::fqdn}",
      onlyif  => "${boks_sbin}/hostadm -lh ${::fqdn} | /bin/grep \"Update passwd file:      Yes\"",
      tag     => 'pswupdate',
    }
  }

}
