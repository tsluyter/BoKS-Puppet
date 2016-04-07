#
# The class boks::pswupdate has one optional parameters, illustrated
# below. You can call it without any params, to call the default "on".
# You can disable boks passwd/shadow updates by setting boks_pswupdate_set_to
# to "off".
#
#class { boks::pswupdate }
#
#class { boks::pswupdate : boks_pswupdate_set_to => 'off', }

class { boks::pswupdate : boks_pswupdate_set_to => 'on', }
