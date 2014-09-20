class openswan::service {
  service { $openswan::opensewan_service :
    ensure => $openswan::service_ensure,
    enable => $openswan::service_enable,
  }
  
}