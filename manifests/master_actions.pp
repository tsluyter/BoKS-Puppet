#

class boks::master_actions () 
inherits boks::params {

  Exec <<| tag=='hostpreregistration' |>>
  Exec <<|tag=='rootaccount' |>>

}

