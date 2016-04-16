#

class boks::master_actions () 
inherits boks::params {
  Exec <<|tag=='hostrecord' |>> ->
  Exec <<|tag=='nodekey' |>> ->
  Exec <<|tag=='rootaccount' |>> ->
  Exec <<|tag=='pswupdate' |>>
}

