class openswan::config {

## configure openswan 
file { $openswan::ipsec_conf:
  ensure     => file,
  owner      => 'root',
  group      => 'root',
  mode       => '0644',
  content    => template("openswan/ipsec.erb"),
 }
file { $openswan::connections_dir:
	ensure     => directory,
	owner      => 'root',
  group      => 'root',
  mode       => '0744',
	force      => true,
 }

 file { "/etc/ipsec.secrets":
	ensure     => file,
	owner      => 'root',
  group      => 'root',
  mode       => '0644',
	content    => template("openswan/ipsec.secrets.erb"),
 }
  
}
