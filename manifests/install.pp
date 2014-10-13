class openswan::install {
  
package { $openswan::openswan_package:
  ensure => $openswan::ensure,
}
  
}