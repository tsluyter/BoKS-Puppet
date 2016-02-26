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
# Examples
# --------
#
# * < none yet >
# I still need to expand upon the functionality of this module.
#
# Authors
# -------
#
# Thomas Sluyter <thomas.sluyter@unixerius.nl>
#
# Copyright
# ---------
#
# Copyright 2016 Thomas Sluyter, Unixerius
#

class boks () inherits boks::params {
  class{'boks::install': } ->
  class{'boks::config': } ->
  class{'boks::service': } ->
#class{'boks::boks_sshd': } ->
  Class["boks"]
}

