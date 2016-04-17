# Instead of copying lengthy node definitions ad nauseum into site.pp, it's
# better to have pre-defined roles and profiles that take care of all the 
# settings in one go! I've defined defaults profiles for a BoKS client, replica
# and master (of which only the first and last are now in use). 
#

class profile::boksmaster {
  # Data lookups

  # Basic setup
  class { 'boks::master_actions' : }
}

