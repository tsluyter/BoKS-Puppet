#
# This is a tricky one! Enabling the BoKS SSHD will most likely
# collide with the system-default SSHD. Thus BoKS SSHD will only
# start if the service { 'sshd': ... } is set to ensure=>'stopped'. 
# But we can honestly NOT do that over here in this sub-class! 
# This must be specified in the host's definition.
#
# The class boks::boks_sshd has one optional parameter, illustrated
# below. It defaults to OFF because it may collide with the vanilla
# SSH daemon on a host.
#
#class { boks::boks_sshd : boks_sshd_set_to => 'on', }

class { boks::boks_sshd } 

