* Require package for conf files, to better order initial setup.

#### 2015-02-25 - 1.1.6
* Fix for undef variable under strict mode (#7 @robinbowes).
* Change to using osfamily fact (#8 @robinbowes).
* Stop and disable ntpd when using chronyd (#5).

#### 2014-11-11 - 1.1.5
* Add support for CentOS 7 (@level99).

#### 2014-04-29 - 1.1.4
* Add support for RHEL7 (chrony).

#### 2014-01-29 - 1.1.3
* Add support for tinker options.
* Add missing owner, group and mode for files.

#### 2013-10-01 - 1.1.2
* Fix missing @ prefix in the templates.

#### 2013-10-01 - 1.1.0
* Update README to scope class name and quote string parameters.
* Add support for Gentoo, using its own ntp.conf template.
* No longer default to changing the logfile, stick to original defaults.

#### 2013-05-31 - 1.0.0
* Initial module release, reinvent the wheel, but with hiera in mind.

