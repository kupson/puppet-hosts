# Class: hosts
#
# This module manages /etc/hosts file, exports and gathers host resources
#   from all nodes in environment.
#
# Parameters:
#   [*puppet_ip*] - puppet IP address (extlookup)
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
#   include hosts
#
class hosts {
    include hosts::params

    file {
        '/etc/hosts':
            ensure => file,
            owner  => 'root',
            group  => 'root',
            mode   => 0644;
    }

    @@host {
        $::fqdn:
            ip           => $::ipaddress,
            host_aliases => [ $::hostname ],
            tag          => "for-env-${::environment}";
    }

    Host <<| tag == "for-env-${::environment}" |>> {
        ensure  => present,
        require => File['/etc/hosts'],
    }

    if $::hosts_managed != $hosts::params::tmpl_version {
        
        File['/etc/hosts'] {
            content => template('hosts/hosts.erb'),
        }

    }
}
