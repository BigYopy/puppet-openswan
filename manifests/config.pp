class openswan::config {
  
  File { 
    owner => 'root',
    group => 'root',
    mode => '644',
  }
     
 $conn_dir_ensure = $openswan::ensure ?{
   'absent' => 'absent',  
   default => 'directory',
 }

## configure openswan 
 file { "/etc/ipsec.conf":
  ensure => $openswan::ensure,
  content => template("openswan/ipsec.erb"),
 }

 file { "/etc/ipsec.d/connection":
	ensure => $conn_dir_ensure,
	force => true,
 }

 file { "/etc/ipsec.secrets":
	ensure => $openswan::ensure,
	content => template("openswan/ipsec.secrets.erb"),
 }
  
}
