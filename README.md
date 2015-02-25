# puppet-ntp

## Overview

Install, enable and configure the Network Time Protocol daemon.

* `ntp` : Class to install and enable ntpd.

The module also supports changing the logging to go directly to a file instead
of syslog, and creates a logrotate entry for that file (see example below).

## Examples

Basic enabling of ntpd with the default servers :

```puppet
include '::ntp'
```

Advanced example, using only hieradata :

```yaml
classes:
  - '::ntp'
ntp::logfile: '/var/log/ntpd.log'
ntp::server:
  - '0.ntp.example.com'
  - '1.ntp.example.com'
  - '2.ntp.example.com'
ntp::restrict:
  - 'default kod nomodify notrap nopeer noquery'
```

