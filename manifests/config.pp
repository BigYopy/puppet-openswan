class openswan::config {
  
  File { 
    owner => 'root',
    group => 'root',
    mode => '644',
  }
## configure openswan 

 file { "/etc/ipsec.conf":
  ensure => present,
  content => template("openswan/ipsec.erb"),
 }

 file { "/etc/ipsec.d/connection":
	ensure => directory,
	force => true,
 }

 file { "/etc/ipsec.secrets":
	ensure => present,
	content => template("openswan/ipsec.secrets.erb"),
 }
  
}
