# Class: boks
# ===========================
#
# This Puppet module was built as a proof-of-concept, by Unixerius in
# association with Fox Technologies (http://www.foxt.com).
#
# The module will install a BoKS client system and it will configure
# certain key files. Finally it'll ensure that the daemons get started 
# and that BoKS is enabled. 
#
# Parameters
# ----------
#
# Document parameters here.
#
# * < none yet >
# I still need to expand upon the functionality of this module.
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * < none yet >
# I still need to expand upon the functionality of this module.
#
# The init class of the BoKS module is used to perform the basic
# installation of a BoKS client host. Software is installed, the 
# client is configured, the service is set to automatically run. 
# Aside from that exported resources are generated which will be 
# run on the BoKS master server, to create host records, node keys
# and root accounts.
# 

class boks () inherits boks::params {
  class{'boks::install': } ->
  class{'boks::config': } ->
  class{'boks::service': } ->
  class{'boks::rootaccount': } ->
  Class['boks']
}

