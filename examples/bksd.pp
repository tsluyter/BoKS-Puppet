#
# The class boks::bksd has three optional parameters, illustrated
# below. You can call it without any params, to call all defaults.
# You can also disable bksd by setting bksd_set_to to "off". 
#
#class { boks::bksd } 
#
#class { boks::bksd : bksd_set_to  => 'off', }

class { boks::bksd : bksd_set_to  => 'on', 
                     bksd_timeout => 'on',
                     bksd_sleep   => '60', }

