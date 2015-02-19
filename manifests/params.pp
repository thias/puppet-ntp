class ntp::params {

  case "${::operatingsystem}-${::operatingsystemmajrelease}" {
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
    /^(RedHat|CentOS)-7$/: {
      $package_name = 'chrony'
      $service_name = 'chronyd'
      $config_file = '/etc/chrony.conf'
      $template = "${module_name}/chrony.conf-rhel.erb"
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

