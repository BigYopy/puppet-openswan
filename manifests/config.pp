class openswan::config {
  require openswan::install
  
  #Enable ipv4 forward
   
  sysctl {'net.ipv4.ip_forward':
    ensure => present,
    value => '1',
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
