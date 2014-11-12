# == Class: openswan::service
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

class openswan::service {

  service { $openswan::opensewan_service :
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }

}
