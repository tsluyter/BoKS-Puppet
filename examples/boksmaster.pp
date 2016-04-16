# Instead of copying lengthy node definitions ad nauseum into site.pp, it's
# better to have pre-defined roles and profiles that take care of all the
# settings in one go!
#
# You may use this file to create a profile for a BoKS master server , which may
# be applied to all BoKS masters in your network. It can be applied to any node
# through your site.pp, through roles, or in other ways.
#

class profile::boksmaster {
  # Data lookups

  # Basic setup
  class { 'boks::master_actions' : }
}

