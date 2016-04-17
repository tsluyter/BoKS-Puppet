#
# The various sub-classes that are run on the BoKS client nodes
# will generate four types of exported resources. These are all
# gathered on the master server to create host records, node keys,
# root accounts and to determine whether the node's passwd/shadow
# should be managed.
#

class boks::master_actions () 
inherits boks::params {
  Exec <<|tag=='hostrecord' |>> ->
  Exec <<|tag=='nodekey' |>> ->
  Exec <<|tag=='rootaccount' |>> ->
  Exec <<|tag=='pswupdate' |>>
}

