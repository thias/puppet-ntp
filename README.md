# puppet-ntp

## Overview

Install, enable and configure the Network Time Protocol daemon.

* `ntp` : Class to install and enable ntpd.

The module also changes the logging to go directly to /var/log/ntpd.log and
adds a logrotate entry for it.

## Examples

Basic enabling of ntpd with the default servers :

    include ntp

Advanced example, using only hieradata :

    classes:
      - ntp
    ntp::server:
      - 0.ntp.example.com
      - 1.ntp.example.com
      - 2.ntp.example.com

