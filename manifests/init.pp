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
  $package_name = $::ntp::params::package_name,
  $service_name = $::ntp::params::service_name,
  $config_file  = $::ntp::params::config_file,
  $template     = $::ntp::params::template,
  $tinker       = [],
  $server       = $::ntp::params::server,
  $restrict     = $::ntp::params::restrict,
  $logfile      = false,
) inherits ::ntp::params {

  # Main package and service it provides
  package { $package_name: ensure => installed }
  service { $service_name:
    enable    => true,
    ensure    => running,
    hasstatus => true,
    require   => Package[$package_name],
  }

  # Main configuration file
  file { $config_file:
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($template),
    notify  => Service[$service_name],
  }

  if $logfile != false and $service_name == 'ntpd' {
    # Logrotate for our custom log file
    file { '/etc/logrotate.d/ntpd':
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template("${module_name}/ntpd-logrotate.erb"),
    }
  }

}

