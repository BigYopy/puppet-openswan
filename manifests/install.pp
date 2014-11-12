# == Class: openswan::install
#
#
# === Parameters
#
# This class does not provide any parameters.
#
#
# === Authors
#
# Ayoub Elhamdani <a.elhamdani90@gmail.com>
#
class openswan::install {

  package { $openswan::openswan_package:
    ensure => $openswan::ensure,
  }

}
