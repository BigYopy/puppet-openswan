class openswan::params {

#openswan deb package: 
case $::operatingsystem {
    debian,ubuntu: {
      $openswan_pkg = 'openswan'
      $service_name = 'ipsec'
    }
default: {fail("\"${module_name}\" provides no config 
           for \"${::operatingsystem}\"")} 
}

#enable Nat traversal
$nat_traversal='yes'

#Virtual Networks
$virtual_private="%v4:10.0.0.0/8,%v4:192.168.0.0/16,%v4:172.16.0.0/12,%v4:25.0.0.0/8,%v6:fd00::/8,%v6:fe80::/10"

#oe is disabed by default
$opportunistic_encryption='off'

#which IPsec stack to use. auto will try netkey, then klips then mast
$protostack='netkey'

##
$uniqueids='yes'

# connection folder
$connections_dir="/etc/ipsec.d/connection"

#secrets folder
$secrets_dir="/etc/ipsec.d/connection"
}
