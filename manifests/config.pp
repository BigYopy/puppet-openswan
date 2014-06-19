class openswan::config {
  
  File { 
    owner => 'root',
    group => 'root',
    mode => '644',
  }
     
 ## configure openswan
  
 file { "/etc/ipsec.conf":
      ensure => $openswan::ensure,
      content => template("openswan/ipsec.erb"),
  }

 file { "/etc/ipsec.d/connection":
	ensure => directory,
 }

 file { "/etc/ipsec.secrets":
	ensure => present,
	content => template("openswan/ipsec.secrets.erb"),
 }
  
}
