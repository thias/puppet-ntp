class ntp::params {

  case $::operatingsystem {
    'Gentoo': {
      $package_name = 'net-misc/ntp'
      $service_name = 'ntpd'
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
    default: {
      $package_name = 'ntp'
      $service_name = 'ntpd'
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

