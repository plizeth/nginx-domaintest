# == Class: puppetnginxtest
#
# Full description of class puppetnginxtest here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'puppetnginxtest':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2018 Your name here, unless otherwise noted.
#

package { 'epel-release':
  ensure => 'installed',
}

package { 'nginx':
  ensure  => 'installed',
}

service {'nginx':
  ensure => 'stopped',
  enable => 'true',

}

file {'/etc/nginx/ngnix.conf':
  backup => present,
  content => template('nginx/nginx.conf.erb')
  validate_cmd => '/usr/sbin/nginx -t',
}
service {'nginx':
  ensure => 'running',
  enable => 'true',

}

