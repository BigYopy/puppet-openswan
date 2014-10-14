class openswan::service {

service { $openswan::opensewan_service :
  ensure => running,
  enable => true,
  }
 
}