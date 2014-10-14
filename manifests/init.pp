# Class: openswan
#
# This module manages openswan
#
# Parameters
#
# [*nat_traversal*]
#	  enable NAT traversal support
#	  Default: no
#	  Valid values: no, yes
#
# [*virtual_private*]
#	  specify the networks that are allowed as subnet= for the remote client
#	  Valid values: %v4:a.b.c.d/mm, %v4!:a.b.c.d/mm, %v6:aaaa::bbbb:cccc:dddd:eeee/mm
#
# [*protostack*]
#	  define which protocol stack is going to be used
#	  Valid values: auto, klips, netkey, mast
#
# [*uniqueids*]
#	  Default: yes
#	  Valid values: yes, no
#
# [*connections_dir*]
#   Connections files folder (*.conf)
#   Default: /etc/ipsec.d/connection 
#
# [*secretss_dir*]
#   secrets files folder (*.secrets)
#   Default: /etc/ipsec.d/connection
# 
#
# Requires: see Modulefile
#
# Sample Usage:
#
# class { 'openswan': }
#
class openswan (
  $ensure                   = 'present',
  $openswan_package         = $openswan::params::openswan_pkg,
  $opensewan_service        = $openswan::params::service_name,
  $nat_traversal            = $openswan::params::nat_traversal,
  $virtual_private          = $openswan::params::virtual_private,
  $opportunistic_encryption = $openswan::params::opportunistic_encryption,
  $protostack               = $openswan::params::protostack,
  $uniqueids                = $openswan::params::uniqueids,
  $ipsec_conf               = $openswan::params::ipsec_conf,
  $ipsec_secrets_conf       = $openswan::params::ipsec_secrets_conf,
  $connections_dir          = $openswan::params::connections_dir,
  $secrets_dir              = $openswan::params::secrets_dir  
)inherits openswan::params{

if $ensure == 'present' {
contain openswan::install
contain openswan::config
contain openswan::service

Class['openswan::install'] ->
Class['openswan::config'] ~>
Class['openswan::service']

} else {
contain openswan::install
}




}
