# ==Define: Openswan conection
#
# This define allows you to create vpn connection
#
# ===Parameters:
# [*type*]
#   set the IPsec mode to use
#       Default: tunnel
#       Valid values: tunnel, transport, passthrough
#
# [*authby*]
#       set how the two security gateways should authenticate each other
#       Valid values: secret, rsasig, secret|rsasig, never
#
# [*left*]
#       specify the IP address of openswan server public-network interface
#       Valid values: FQDN, IP address, interface name, %any, %defaultroute,
#                     %opportunistic, %group, %opportunisticgroup
#
# [*leftid*]
#       specify how the left participant should be identified for authentication
#       Default: left
#       Valid values: IP address, @FQDN, %fromcert, %none, %myid
#
# [*leftnexthop*]
#       specify the next-hop gateway IP address for the left server's
#       connection to the public network
#       Default: %direct
#       Valid values: IP address, %direct
#
# [*leftsubnet*]
#       specify private subnet behind the left openswan server
#       Valid values: network/netmask
#
# [*leftsubnets*]
#       specify multiple private subnets behind the left openswan server
#       Valid values: { networkA/netmaskA networkB/netmaskB [...] }
#
#
# [*right*]
#       specify the IP address of openswan server public-network interface
#       Valid values: FQDN, IP address, interface name, %any, %defaultroute,
#               %opportunistic, %group, %opportunisticgroup
#
# [*rightsubnet*]
#       specify private subnet behind the right openswan server
#       Valid values: network/netmask
#
# [*rightsubnets*]
#       specify multiple private subnets behind the right openswan server
#       Valid values: { networkA/netmaskA networkB/netmaskB [...] }
#
# [*pfs*]
#       enable Perfect Forward Secrecy of keys
#       Default: yes
#       Valid values: yes, no
#
# [*auto*]
#       Default: ignore
#       Valid values: start, add, ignore, manual, route
#
# [*psk*]
#       psk key
#
#

define openswan::connection (
$type         = undef,
$authby       = undef,
$left         = undef,
$leftid       = undef,
$leftnexthop  = undef,
$leftsubnet   = undef,
$leftsubnets  = undef,
$right        = undef,
$rightsubnet  = undef,
$rightsubnets = undef,
$pfs          = undef,
$auto         = undef,
$psk          = undef
){

include openswan

File {
  owner => 'root',
  group => 'root',
  mode  => '0644',
  }

file { "${openswan::connections_dir}/${name}.conf" :
  ensure  => file,
  content => template('openswan/connection.erb'),
  require => Class['openswan::config'],
  notify  => Class['openswan::service'],
  }

file { "${openswan::secrets_dir}/${name}.secrets":
  ensure  => file,
  content => "${leftid} ${right} : PSK \"${psk}\" \n",
  require => Class['openswan::config'],
  notify  => Class['openswan::service'],
  }

}