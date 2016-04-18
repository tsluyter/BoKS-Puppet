#

include boks
include ssh

class { 'boks::boks_sshd' : boks_sshd_set_to => 'off', }
class { 'boks::filmon' : filmon_set_to => 'off', }
class { 'boks::bksd' : bksd_set_to => 'on',
                        bksd_timeout => 'on',
                        bksd_sleep => '30', }
class { 'boks::bokscron' : bokscron_set_to => 'on', }
class { 'boks::sysreplace' : sysreplace_set_to => 'on', }
class { 'boks::pswupdate' : boks_pswupdate_set_to => 'on', }

