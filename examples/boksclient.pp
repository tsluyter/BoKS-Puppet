# Instead of copying lengthy node definitions ad nauseum into site.pp, it's
# better to have pre-defined roles and profiles that take care of all the 
# settings in one go! 
#
# You may use this file to create a profile for a BoKS client host, which may
# be applied to all BoKS clients in your network. It can be applied to any node
# through your site.pp, through roles, or in other ways.

class profile::boksclient {
  # Data lookups

  # Basic setup
  include boks
  include ssh

  # Tweaks beyond the defaults
  class { 'boks::boks_sshd' : boks_sshd_set_to => 'off', }
  class { 'boks::filmon' : filmon_set_to => 'off', }
  class { 'boks::bksd' : bksd_set_to => 'on',
                         bksd_timeout => 'on',
                         bksd_sleep => '30', }
  class { 'boks::bokscron' : bokscron_set_to => 'on', }
  class { 'boks::sysreplace' : sysreplace_set_to => 'on', }
  class { 'boks::pswupdate' : boks_pswupdate_set_to => 'on', }
}

