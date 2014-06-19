class openswan::service (
  $service_status='running',
  $service_enbale=true
){
  
  service { $openswan::opensewan_service :
    ensure => $service_status,
    enable => $service_enbale,
  }
  
}