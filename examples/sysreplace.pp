#
# The class boks::sysreplace has one optional parameters, illustrated
# below. You can call it without any params, to call the default "on".
# You can disable boks security by setting sysreplace_set_to to "off". 
#
#class { boks::sysreplace } 
#
#class { boks::sysreplace : sysreplace_set_to => 'off', }

class { boks::sysreplace : sysreplace_set_to => 'on', }
