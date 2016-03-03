#
# The class boks::filmon has four optional parameters, illustrated
# below. You can call it without any params, to call all defaults.
#
#class { boks::filmon }
#
#class { boks::filmon : bksd_set_to => 'off', }
#
# class {boks::filmon : filmon_set_to   => 'on',
#                       filmon_filesystems => 'nfs' }

class { boks::filmon : filmon_set_to      => 'on',
                       filmon_runhours    => '21-05',
                       filmon_slowdown    => '5',
                       filmon_filesystems => 'nfs', }

