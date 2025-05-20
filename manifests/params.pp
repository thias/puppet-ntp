# Trivial parameters class inherited from the main class.
#
class ntp::params {

  case "${facts['os']['family']}-${facts['os']['release']['major']}" {
    /^Gentoo/: {
      $package_name = 'net-misc/ntp'
      $service_name = 'ntpd'
      $config_file = '/etc/ntp.conf'
      $template = "${module_name}/ntp.conf-gentoo.erb"
      $server = [
        '0.gentoo.pool.ntp.org',
        '1.gentoo.pool.ntp.org',
        '2.gentoo.pool.ntp.org',
        '3.gentoo.pool.ntp.org',
      ]
      $restrict = [
        'default nomodify nopeer',
      ]
    }
    'RedHat-7': {
      $package_name = 'chrony'
      $service_name = 'chronyd'
      $config_file = '/etc/chrony.conf'
      $template = "${module_name}/chrony.conf-rhel7.erb"
      $server = [
        '0.rhel.pool.ntp.org iburst',
        '1.rhel.pool.ntp.org iburst',
        '2.rhel.pool.ntp.org iburst',
        '3.rhel.pool.ntp.org iburst',
      ]
      $restrict = undef
    }
    'RedHat-8': {
      $package_name = 'chrony'
      $service_name = 'chronyd'
      $config_file = '/etc/chrony.conf'
      $template = "${module_name}/chrony.conf-rhel8.erb"
      $server = [
        '0.rhel.pool.ntp.org iburst',
        '1.rhel.pool.ntp.org iburst',
        '2.rhel.pool.ntp.org iburst',
        '3.rhel.pool.ntp.org iburst',
      ]
      $restrict = undef
    }
    'RedHat-9': {
      $package_name = 'chrony'
      $service_name = 'chronyd'
      $config_file = '/etc/chrony.conf'
      $template = "${module_name}/chrony.conf-rhel9.erb"
      $server = [
        '0.rhel.pool.ntp.org iburst',
        '1.rhel.pool.ntp.org iburst',
        '2.rhel.pool.ntp.org iburst',
        '3.rhel.pool.ntp.org iburst',
      ]
      $restrict = undef
    }
    'RedHat-10': {
      $package_name = 'chrony'
      $service_name = 'chronyd'
      $config_file = '/etc/chrony.conf'
      $template = "${module_name}/chrony.conf-rhel10.erb"
      $server = [
        '0.rhel.pool.ntp.org iburst',
        '1.rhel.pool.ntp.org iburst',
        '2.rhel.pool.ntp.org iburst',
        '3.rhel.pool.ntp.org iburst',
      ]
      $restrict = undef
    }
    default: {
      $package_name = 'ntp'
      $service_name = 'ntpd'
      $config_file = '/etc/ntp.conf'
      $template = "${module_name}/ntp.conf-rhel.erb"
      $server = [
        '0.rhel.pool.ntp.org',
        '1.rhel.pool.ntp.org',
        '2.rhel.pool.ntp.org',
      ]
      $restrict = [
        'default kod nomodify notrap nopeer noquery',
        '-6 default kod nomodify notrap nopeer noquery',
      ]
    }
  }

}
