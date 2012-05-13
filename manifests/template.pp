# Class: hosts::template
#
# Versioned template /etc/hosts file.
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
#   include hosts::template
class hosts::template {
    include hosts::params

    file {
        '/etc/hosts':
            ensure => file,
            owner  => 'root',
            group  => 'root',
            mode   => 0644;
    }

    if $::hosts_managed != $hosts::params::tmpl_version {
        
        File['/etc/hosts'] {
            content => template('hosts/hosts.erb'),
        }

    }
}
