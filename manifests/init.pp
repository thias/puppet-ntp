# Define: 
# Class: ntp
#
# Install, enable and configure the Network Time Protocol daemon.
#
# Parameters:
#  $server:
#    Array of servers to use for sync. Defaults to RHEL pool from ntp.org.
#
# Sample Usage :
#  include ntp
#
class ntp (
  $server = [
    '0.rhel.pool.ntp.org',
    '1.rhel.pool.ntp.org',
    '2.rhel.pool.ntp.org',
  ],
  $restrict = [
    'default kod nomodify notrap nopeer noquery',
    '-6 default kod nomodify notrap nopeer noquery',
  ],
) {

  # Main package and service it provides
  package { 'ntp': ensure => installed }
  service { 'ntpd':
    enable    => true,
    ensure    => running,
    hasstatus => true,
    require   => Package['ntp'],
  }

  # Main configuration file
  file { '/etc/ntp.conf':
    content => template("${module_name}/ntp.conf.erb"),
    notify  => Service['ntpd'],
  }

  # Logrotate for our custom log file
  file { '/etc/logrotate.d/ntpd':
    source => "puppet:///modules/${module_name}/ntpd-logrotate",
  }

}

