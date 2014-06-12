# Class: openswan
#
# This module manages openswan
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class openswan (
  $ensure='present',
  $openswan_package=$openswan::params::openswan_pkg,
  $opensewan_service=$openswan::params::service_name,
  $nat_traversal=$openswan::params::nat_traversal,
  $virtual_private=$openswan::params::virtual_private,
  $opportunistic_encryption=$openswan::params::opportunistic_encryption,
  $protostack=$openswan::params::protostack,
  $uniqueids=$openswan::params::uniqueids,
  $connections_dir=$openswan::params::connections_dir,
  $secrets_dir=$openswan::params::secrets_dir  
)inherits openswan::params{

include openswan::install
include openswan::config
include openswan::service

}
