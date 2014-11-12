# == Class: openswan::config
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
class openswan::config {

  file { $openswan::ipsec_conf:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('openswan/ipsec.erb'),
  }
  file { $openswan::connections_dir:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0744',
    force  => true,
  }

  file { $openswan::ipsec_secrets_conf:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template('openswan/ipsec.secrets.erb'),
  }

  if ! defined (File[$openswan::secrets_dir]) {

    file {$openswan::secrets_dir:
      ensure => directory,
      owner  => 'root',
      group  => 'root',
      mode   => '0744',
      force  => true,
    }

  }

}
